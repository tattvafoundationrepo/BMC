package digit.web.models;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.validation.annotation.Validated;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * User
 */
@Validated
@jakarta.annotation.Generated(value = "org.egov.codegen.SpringBootCodegen", date = "2022-08-16T15:34:24.436+05:30")

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
        @JsonProperty("id")
        private Long id = null;

        @JsonProperty("uuid")
        private String uuid = null;

        @JsonProperty("userName")
        private String userName = null;

        @JsonProperty("password")
        private String password = null;

        @JsonProperty("salutation")
        private String salutation = null;

        @JsonProperty("name")
        private String name = null;

        @JsonProperty("gender")
        private String gender = null;

        @JsonProperty("mobileNumber")
        private String mobileNumber = null;

        @JsonProperty("emailId")
        private String emailId = null;

        @JsonProperty("altContactNumber")
        private String altContactNumber = null;

        @JsonProperty("pan")
        private String pan = null;

        @JsonProperty("aadhaarNumber")
        private String aadhaarNumber = null;

        @JsonProperty("permanentAddress")
        private String permanentAddress = null;

        @JsonProperty("permanentCity")
        private String permanentCity = null;

        @JsonProperty("permanentPincode")
        private String permanentPincode = null;


        @JsonProperty("roles")
        @Valid
        private List<Role> roles = null;@JsonProperty("correspondenceCity")
        private String correspondenceCity = null;

        @JsonProperty("correspondencePincode")
        private String correspondencePincode = null;

        @JsonProperty("correspondenceAddress")
        private String correspondenceAddress = null;

        @JsonProperty("active")
        private Boolean active = null;

        @JsonProperty("locale")
        private String locale = null;

        @JsonProperty("type")
        private String type = null;

        @JsonProperty("signature")
        private String signature = null;

        @JsonProperty("accountLocked")
        private Boolean accountLocked = null;


        @JsonProperty("bloodGroup")
        private String bloodGroup = null;

        @JsonProperty("identificationMark")
        private String identificationMark = null;

        @JsonProperty("photo")
        private String photo = null;

        @JsonProperty("createdBy")
        private Long createdBy = null;

        @JsonProperty("lastModifiedBy")
        private Long lastModifiedBy = null;

        @JsonProperty("otpReference")
        private String otpReference = null;

        @JsonProperty("tenantId")
        private String tenantId = null;


        public User addRolesItem(Role rolesItem) {
                if (this.roles == null) {
                        this.roles = new ArrayList<>();
                }
                this.roles.add(rolesItem);
                return this;
        }

}
