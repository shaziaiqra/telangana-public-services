

        <%

        try {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("the username is " + username);
        System.out.println("the password is " + password);

        if ((username.equals("admin") ) && (password.equals("admin"))) {

        response.sendRedirect("adminhome.jsp?msg=Success");

        } else {

        response.sendRedirect("admin.jsp?m1=Failed");
        }

        } catch (Exception e) {
          e.printStackTrace();
        }

        %>
