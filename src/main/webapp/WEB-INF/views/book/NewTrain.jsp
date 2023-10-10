<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>솔레일 열차 예약 확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1a1a1a;
            color: #f0f0f0;
        }
        h1, h2 {
            color: #f0f0f0;
        }
        form {
            margin: 20px;
            padding: 20px;
            background-color: #333333;
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #333;
            color: #f0f0f0;
        }
        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        #details {
            margin: 20px;
            padding: 20px;
            background-color: #333333;
            border-radius: 5px;
        }
        .container {
            display: flex;
            justify-content: space-between;
        }
        .left, .right {
            width: 45%;
        }
    </style>    
</head>
<body>
    <h1>솔레일 열차 예약 확인</h1>
    <div class="container">
        <div class="left">
            <form id="reservationForm" action="processReservation.jsp" method="post">
                <label for="trainType">열차 종류:</label><br>
                <select id="trainType" name="trainType">
                    <option value="KTX">KTX</option>
                    <option value="SRT">SRT</option>
                </select><br>
                <label for="trainNumber">열차번호:</label><br>
                <input type="text" id="trainNumber" name="trainNumber" pattern="^[1-9][0-9]{0,3}$" title="1~9999 사이의 숫자를 입력해주세요."><br>
                <label for="departure">출발역:</label><br>
                <select id="departure" name="departure"></select><br>
                <label for="destination">도착역:</label><br>
                <select id="destination" name="destination"></select><br>
                <label for="date">날짜:</label><br>
                <input type="date" id="date" name="date"><br>
                <label for="seatType">좌석 종류:</label><br>
                <select id="seatType" name="seatType">
                    <option value="special">특/우등석</option>
                    <option value="standard">일반석</option>
                </select><br>
                <input type="submit" value="확인하기">
            </form>
        </div>
        <div class="right">
            <h2>예약내역:</h2>
            <p id="details"></p>
        </div>
    </div>
    <script>
        var stations = {
            "KTX": ["경산", "경주", "계룡", "곡성", "공주", "광명", "광주송정", "구례구", "구포", "김제", "김천", "나주", "남원", "논산", "대전", "동대구", "마산", "목포", "밀양", "부산", "서대구", "서대전", "서울", "수원", "순천", "여수엑스포", "여천", "영등포", "오송", "용산", "울산", "익산", "장성", "전주", "정읍", "진영", "진주", "창원", "창원중앙", "천안아산", "포항", "행신"],
            "SRT": ["수서", "동탄", "평택지제", "천안아산", "오송", "공주", "익산", "정읍", "광주송정", "나주", "목포", "전주", "남원", "곡성", "구례구", "순천", "여천", "여수엑스포", "대전", "김천", "서대구", "동대구", "밀양", "진영", "창원중앙", "창원", "마산", "진주", "포항", "신경주", "울산", "부산"]
        };

        function updateStations(selectElement, selectedStation) {
            var selectedTrainType = document.getElementById('trainType').value;
            selectElement.innerHTML = '';
            stations[selectedTrainType].forEach(function(station) {
                var option = document.createElement('option');
                option.value = station;
                option.text = station;
                if (station !== selectedStation) {
                    selectElement.appendChild(option);
                }
            });
        }

        document.getElementById('trainType').addEventListener('change', function() {
            updateStations(document.getElementById('departure'), document.getElementById('destination').value);
            updateStations(document.getElementById('destination'), document.getElementById('departure').value);
        });

        document.getElementById('departure').addEventListener('change', function() {
            updateStations(document.getElementById('destination'), this.value);
        });

        document.getElementById('destination').addEventListener('change', function() {
            updateStations(document.getElementById('departure'), this.value);
        });

        document.getElementById('trainType').dispatchEvent(new Event('change'));

        document.getElementById('reservationForm').addEventListener('submit', function(event) {
            var trainNumber = document.getElementById('trainNumber').value;
            var date = document.getElementById('date').value;
            var departure = document.getElementById('departure').value;
            var destination = document.getElementById('destination').value;
            var seatType = document.getElementById('seatType').value;

            if (!trainNumber) {
                alert('열차번호를 확인해주세요');
                event.preventDefault();
                return;
            }

            if (!date) {
                alert('예약 날짜를 확인해주세요');
                event.preventDefault();
                return;
            }

            // 예약 내역을 화면에 표시
            var details = document.getElementById('details');
            details.innerHTML = '열차 종류: ' + document.getElementById('trainType').options[document.getElementById('trainType').selectedIndex].text +
                                '<br>열차 번호: ' + trainNumber +
                                '<br>출발역: ' + departure +
                                '<br>도착역: ' + destination +
                                '<br>날짜: ' + date +
                                '<br>좌석 종류: ' + document.getElementById('seatType').options[document.getElementById('seatType').selectedIndex].text;
            event.preventDefault();
        });
    </script>
</body>
</html>
