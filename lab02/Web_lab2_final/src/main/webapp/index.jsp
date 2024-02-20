<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.Point"%>
<%@ page import="beans.PointsArray" %>

<!DOCTYPE HTML>
<html lang="ru-RU">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="author" content="Гайдеров Ярослав">
    <meta name="description" content="Веб-программирование: Лабораторная работа №2">

    <!-- Библиотека компиляции less -->
    <link rel="stylesheet/less" type="text/css" href="styles/styles.less" />
    <script src="https://cdn.jsdelivr.net/npm/less" ></script>

    <!-- Библиотека SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <!-- Библиотека jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="scripts/CanvasPrinter.js"></script>
    <script src="scripts/Validator.js"></script>
    <script src="scripts/onetime.js"></script>
    <script src="scripts/updater.js"></script>

    <link rel="icon" type="image/jpg" href="images/itmo_vt.jpg">

    <%
        PointsArray pointsArray = (PointsArray) request.getServletContext().getAttribute("dots");
        if (pointsArray == null) pointsArray = new PointsArray();
    %>
    <title>Лабораторная работа №2 | Веб-программирование</title>
</head>
<body>
<header>
    <h1>Гайдеров Ярослав. P3231 Вариант 775368</h1>
</header>
    <div id="main-container">
        <div id="form-container">
            <form novalidate onsubmit="parseForm()">
                <div class="input-container" id="X-input-container">
                    <label class="form-label">Введите X:</label>
                    <table id="X-input-table">
                        <tr>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="-2">-2</label></td>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="-1.5">-1.5</label></td>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="-1">-1</label></td>
                        </tr>
                        <tr>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="-0.5">-0.5</label></td>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="0">0</label></td>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="0.5">0.5</label></td>
                        </tr>
                        <tr>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="1">1</label></td>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="1.5">1.5</label></td>
                            <td><label><input name="X-button-group" class="X-button" type="checkbox" value="2">2</label></td>
                        </tr>
                    </table>
                </div>
                <div class="input-container" id="Y-input-container">
                    <label for="Y-input" class="form-label">Введите Y:</label>
                    <input id="Y-input" name="Y-input" type="text" value="0" maxlength="5">
                </div>
                <div class="input-container" id="R-input-container">
                    <label for="R-input-container" class="form-label" id="R-input-label">Введите R:</label>
                    <input type="radio" name="R-radio-group" value="1" id="R-radio-1"><label class="R-radio-labels" for="R-radio-1">1</label>
                    <input type="radio" name="R-radio-group" value="1.5" id="R-radio-1.5"><label class="R-radio-labels" for="R-radio-1.5">1.5</label>
                    <input type="radio" name="R-radio-group" value="2" id="R-radio-2"><label class="R-radio-labels" for="R-radio-2">2</label>
                    <input type="radio" name="R-radio-group" value="2.5" id="R-radio-2.5"><label class="R-radio-labels" for="R-radio-2.5">2.5</label>
                    <input type="radio" name="R-radio-group" value="3" id="R-radio-3"><label class="R-radio-labels" for="R-radio-3">3</label>
                </div>
                <div class="input-container" id="buttons-container">
                    <input id='check' class="main-button" name='check' type='submit' value='Проверить'>
                </div>
            </form>
        </div>
            <div id="graph-container">
                <canvas id="graph" width="300" height="300"></canvas>
            </div>
        <div>
            <table id="results">
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Результат</th>
                    <th class="hide-me">Текущее время</th>
                    <th class="hide-me">Время работы программы (мкс)</th>
                </tr>
                <% for(Point point: pointsArray.getPoints()){ %>
                    <tr>
                        <td><%=point.getX() %></td>
                        <td><%=point.getY() %></td>
                        <td><%=point.getR() %></td>
                        <td class="<%= point.getHTMLClass() %>"><%=point.getStringStatus() %></td>
                        <td class="hide-me"><%=point.getTime()%></td>
                        <td class="hide-me"><%=point.getScriptTime() %></td>
                    </tr>
                <%}%>
            </table>
        </div>
    </div>
</body>
</html>