package egovframework.example.server.validation;

import org.apache.commons.validator.Field;
import org.apache.commons.validator.ValidatorAction;
import org.springframework.validation.Errors;
import org.springmodules.validation.commons.FieldChecks;

import egovframework.example.server.service.ServerSideVO;

public class ServerFieldChecks extends FieldChecks {

	/**
	 * serialVersion UID
	 * 
	 */
	private static final long serialVersionUID = 1464366203986823392L;
	
	/**
	 * 아이디와 비밀번호 중복 체크
	 * 
	 * @param bean
	 * @param va
	 * @param field
	 * @param errors
	 * @return
	 */
	public static boolean validatePasswordOverlap(Object bean, ValidatorAction va, Field field, Errors errors) {

		String id = (bean instanceof ServerSideVO) ? ((ServerSideVO) bean).getMberId() : "";
		String password = FieldChecks.extractValue(bean, field);
		
		 try {
             int overlap = Integer.parseInt(field.getVarValue("overlap"));

             if (!ServerValidator.isValidPasswordOverlap(id, password, overlap)) {
            	 
                 FieldChecks.rejectValue(errors, field, va);
                 return false;
                 
             } else {
            	 
            	 return true;
             }
         }
         catch (Exception e) {
        	 
             FieldChecks.rejectValue(errors, field, va);
             return false;
         }
	}
	
	/**
	 * 비밀번호 확인 유효성 체크
	 *
	 * @param bean
	 * @param va
	 * @param field
	 * @param errors
	 * @return
	 */
	public static boolean validatePasswordCheck(Object bean, ValidatorAction va, Field field, Errors errors) {

		String password = (bean instanceof ServerSideVO) ? ((ServerSideVO) bean).getPassword() : "";
		String passwordCheck = FieldChecks.extractValue(bean, field);
		
		if (!ServerValidator.isValidPasswordCheck(password, passwordCheck)) {
			
			FieldChecks.rejectValue(errors, field, va);
			return false;
			
		} else {
			
			return true;
		}
	}
}
