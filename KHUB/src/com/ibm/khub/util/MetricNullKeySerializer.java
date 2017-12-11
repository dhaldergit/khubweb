package com.ibm.khub.util;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

public class MetricNullKeySerializer extends JsonSerializer<Object> {
	
 
    
     
   
	

	@Override
	public void serialize(Object arg0, JsonGenerator arg1, SerializerProvider arg2)
			throws IOException, JsonProcessingException {
		// TODO Auto-generated method stub
		arg1.writeFieldName("");
		
	}
}
