<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%
    try {
        JSONArray jsonResponse = new JSONArray();
        JSONObject obj = new JSONObject();

        String msg = "";
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");

        PreparedStatement pst = conn.prepareStatement("select * from users where username =? and passwaord=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();


        if (rs.next()) {
            HttpSession sess = request.getSession();
            
            sess.setAttribute("username", username);
            sess.setAttribute("password", password);
            msg = "1";
            obj.put("msg", msg);
            jsonResponse.add(obj);

        } else {
            msg = "3";
            obj.put("msg", msg);
            jsonResponse.add(obj);
        }

        out.println(jsonResponse.toJSONString());
        out.flush();
    } catch (Exception ecx) {
        ecx.printStackTrace();
        throw new ServletException(ecx.getMessage());
    }
%>