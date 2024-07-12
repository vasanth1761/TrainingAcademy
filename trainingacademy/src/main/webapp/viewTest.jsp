<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.trainingacademy.model.Questions"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Online Exam</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #e0f7fa;
    padding: 20px;
    color: #0d47a1;
}

.question {
    background-color: #ffffff;
    border: 1px solid #90caf9;
    padding: 20px;
    margin-bottom: 15px;
    border-radius: 5px;
}

.question p {
    margin: 15px 0;
}

.question input[type="radio"] {
    margin-right: 10px;
}

button, #submitBtn {
    background-color: #1e88e5;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-top: 10px;
    cursor: pointer;
    border-radius: 5px;
}

button:hover, #submitBtn:hover {
    background-color: #1565c0;
}

#timer {
    background-color: transparent;
    padding: 20px;
    margin-bottom: 15px;
    float: right;
    font-size: 20px;
}

#timer #time {
    font-weight: bold;
    color: #0d47a1;
}

.selected-answer {
    background-color: #e0ffe0;
}
</style>
</head>
<body>
    <form id="quizForm" action="/checkResult" method="post" onsubmit="return validateForm();">
        <div id="examName">
            <h2>Questions</h2>
        </div>

        <div id="timer">
            Time Left: <span id="time">1:00</span>
        </div>

        <%
        List<Questions> questions = (List<Questions>) request.getAttribute("viewQuestion");
        if (questions != null) {
            int questionIndex = 0;
            for (Questions question : questions) {
        %>
        
        <div class="question" style="<%=(questionIndex == 0) ? "" : "display: none;"%>">
            <p><strong><%=++questionIndex%></strong>. <%=question.getQuestion()%></p>
            <input type="hidden" name="examId" value="<%=question.getId()%>">
            <p class="option">
                <input type="radio" name="answer<%=question.getId()%>" value="A" onclick="highlightAnswer(this)">
                <%=question.getOptionA()%>
            </p>
            <p class="option">
                <input type="radio" name="answer<%=question.getId()%>" value="B" onclick="highlightAnswer(this)">
                <%=question.getOptionB()%>
            </p>
            <p class="option">
                <input type="radio" name="answer<%=question.getId()%>" value="C" onclick="highlightAnswer(this)">
                <%=question.getOptionC()%>
            </p>
            <p class="option">
                <input type="radio" name="answer<%=question.getId()%>" value="D" onclick="highlightAnswer(this)">
                <%=question.getOptionD()%>
            </p>
        </div>
        <%
            }
        }
        %>
        <button type="button" onclick="previousQuestion()" style="display: none;">Previous Question</button>
        <button type="button" onclick="nextQuestion()">Next Question</button>
        <input id="submitBtn" type="submit" style="display: none;" value="Submit">
    </form>
    <script>
        var currentQuestion = 0;
        var totalQuestions = <%=questions.size()%>;
        var examDuration = 1 * 60; 

        function startTimer(duration, display) {
            var timer = duration, minutes, seconds;
            var timerInterval = setInterval(function() {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    clearInterval(timerInterval);
                    alert("Time's up! Your answers will be submitted.");
                    document.getElementById('quizForm').submit();
                }
            }, 1000);
        }

        window.onload = function() {
            var display = document.querySelector('#time');
            startTimer(examDuration, display);
        };

        function nextQuestion() {
            if (currentQuestion < totalQuestions - 1) {
                document.getElementsByClassName('question')[currentQuestion].style.display = 'none';
                currentQuestion++;
                document.getElementsByClassName('question')[currentQuestion].style.display = 'block';
            }
            toggleButtons();
        }

        function previousQuestion() {
            if (currentQuestion > 0) {
                document.getElementsByClassName('question')[currentQuestion].style.display = 'none';
                currentQuestion--;
                document.getElementsByClassName('question')[currentQuestion].style.display = 'block';
            }
            toggleButtons();
        }

        function toggleButtons() {
            if (currentQuestion === 0) {
                document.getElementById('submitBtn').style.display = 'none';
                document.getElementsByTagName('button')[0].style.display = 'none';
                document.getElementsByTagName('button')[1].style.display = 'inline-block';
            } else if (currentQuestion === totalQuestions - 1) {
                document.getElementById('submitBtn').style.display = 'inline-block';
                document.getElementsByTagName('button')[0].style.display = 'inline-block';
                document.getElementsByTagName('button')[1].style.display = 'none';
            } else {
                document.getElementById('submitBtn').style.display = 'none';
                document.getElementsByTagName('button')[0].style.display = 'inline-block';
                document.getElementsByTagName('button')[1].style.display = 'inline-block';
            }
        }

        function highlightAnswer(selectedOption) {
            var options = selectedOption.closest('.question').getElementsByClassName('option');
            for (var i = 0; i < options.length; i++) {
                options[i].classList.remove('selected-answer');
            }
            selectedOption.parentElement.classList.add('selected-answer');
        }
    </script>
</body>
</html>
