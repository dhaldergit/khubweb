package com.ibm.khub.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ibm.khub.service.ContentService;



/**
 * Servlet implementation class BulkContentUploadServlet
 */
public class BulkContentUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 21;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 20;
ContentService contentService = new ContentService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BulkContentUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		/*List<FileItem> itemz;
		try {
			itemz = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			System.out.println(itemz.size());
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		// Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);
        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                   // String filePath = uploadFolder + File.separator + fileName;
                   // File uploadedFile = new File(filePath);
                    System.out.println(fileName);
                    contentService.saveBulkContent(item);
                    // saves the file to upload directory
                   // item.write(uploadedFile);
                }
            }

            // displays done.jsp page after upload finished
           /* getServletContext().getRequestDispatcher("/ContentUpdate.jsp").forward(
                    request, response);*/
response.sendRedirect("/success.jsp");
        }  catch (Exception ex) {
            throw new ServletException(ex);
        }

	}

}
