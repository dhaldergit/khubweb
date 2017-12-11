package com.ibm.khub.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class Connection_members
 */
public class Connection_members extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
String email = null;
       
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    	
    	{
    		
		// TODO Auto-generated method stub
		
    	try{	
    		PrintWriter pw = response.getWriter();
    		StringBuffer response1 = new StringBuffer();
    		
    		JSONArray jsonArray = new JSONArray();
    		
    		BufferedReader in = null;
    		
    		
    		String[] name = {"nirmalya.goswami@in.ibm.com","ujjwal.kumar@in.ibm.com","susmita.gupta@in.ibm.com","taruntiwari@in.ibm.com","kundkau@in.ibm.com","arijit.debbarman@in.ibm.com","sudidasg@in.ibm.com" ,"neeverm1@in.ibm.com","sanjukta.kundu@in.ibm.com","satrajit.thakur@in.ibm.com","sutapdas@in.ibm.com","amitavgu@in.ibm.com","sanjbau@in.ibm.com"};

    		String url = "http://dpev390.innovate.ibm.com/fastlist/resources/bplookup/";
    		for(int i = 0 ; i<name.length;i++)
    		{
	    		URL url1 = new URL(url+name[i]);
	    		HttpURLConnection con = (HttpURLConnection) url1.openConnection();
	    	
	    		int responseCode = con.getResponseCode();
	    		System.out.println("\nSending 'GET' request to URL : " + url1);
	    		System.out.println("Response Code : " + responseCode);
	
	    		in = new BufferedReader(
	    		        new InputStreamReader(con.getInputStream()));
	    		String inputLine;
	
	    		while ((inputLine = in.readLine()) != null) {
	    			System.out.println("The reponse  is (1):"+inputLine);
	    			
	    			//String abc = inputLine.valueOf(2);
	    			//System.out.println("value is ---"+abc);
	    			
	    			JSONParser parser = new JSONParser();
	    			JSONObject jsonObj  = (JSONObject) parser.parse(inputLine.toString());
	    			
	    			jsonArray.add(jsonObj);
	    		}

	    		
	
	    		//print result
	    		System.out.println("The response is (2):"+jsonArray.toJSONString());
    		}
    		
    		pw.print(jsonArray.toJSONString());
    		in.close();
    	}
    	catch(Exception e)
    	{
    		System.out.println("The error " +e);

    	}
	}
    	
    	
    	
    	}

