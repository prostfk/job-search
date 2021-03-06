<%@ page import="java.util.List" %>
<%@ page import="by.prostrmk.dao.VacancyDao" %>
<%@ page import="by.prostrmk.model.entity.Resume" %>
<%@ page import="by.prostrmk.model.entity.Vacancy" %>
<%@ page import="by.prostrmk.model.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: prostrmk
  Date: 15.6.18
  Time: 19.59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<%
    VacancyDao vacancyDao = new VacancyDao();
    User user = (User)session.getAttribute("user");
    List<Vacancy> vacancies = (List<Vacancy>)vacancyDao.getByStringParamList("username", user.getUsername(),Vacancy.class);
    List<Resume> resumes = (List<Resume>)vacancyDao.getByStringParamList("username", user.getUsername(), Resume.class);
    if (!vacancies.isEmpty()){
        for (Vacancy vacancy : vacancies) {
            out.println("vacancies");
            out.println(vacancy.toJspString());
            out.println("<form action='/me/removeVacancy/id="+ vacancy.getId() +"' method='post'>");
            out.println("<button>Delete</button>");
            out.println("</form>");
        }
    }
    if (!resumes.isEmpty()){
        for (Resume resume : resumes) {
            out.println("resumes");
            out.println(resume.toJspString());
            out.println("<form action='/me/removeResume/id="+ resume.getId() +"' method='post'>");
            out.println("<button>Delete</button>");
            out.println("</form>");
        }
    }

%>


</body>
</html>
