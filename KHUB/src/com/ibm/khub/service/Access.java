/*  1:   */ package com.ibm.khub.service;
/*  2:   */ 
/*  3:   */ import com.box.sdk.BoxAPIConnection;
/*  4:   */ import java.io.IOException;
/*  5:   */ import java.net.URL;
/*  6:   */ import javax.servlet.ServletException;
/*  7:   */ import javax.servlet.http.HttpServlet;
/*  8:   */ import javax.servlet.http.HttpServletRequest;
/*  9:   */ import javax.servlet.http.HttpServletResponse;
/* 10:   */ 
/* 11:   */ public class Access
/* 12:   */   extends HttpServlet
/* 13:   */ {
/* 14:   */   private static final long serialVersionUID = 1L;
/* 15:22 */   BoxAPIConnection boxapi = new BoxAPIConnection("873jlyl0g66qbtx6qho4ec5t2q3f2q5h", "7w9l7zep9BMWwKvMLKO6j3rM2fjtWZc6");
/* 16:   */   
/* 17:   */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/* 18:   */     throws ServletException, IOException
/* 19:   */   {
/* 20:27 */     URL url1 = new URL("https://api.box.com/oauth2/authorize?response_type=code&client_id=&state=authenticated&redirect_uri=https://localhost:8080");
/* 21:   */   }
/* 22:   */ }


/* Location:           C:\Users\IBM_ADMIN\workspaceJ2EE\KHUB\ImportedClasses\
 * Qualified Name:     com.ibm.khub.service.Access
 * JD-Core Version:    0.7.0.1
 */