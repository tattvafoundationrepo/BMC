package digit.bmc.model.workflow;

import java.util.ArrayList;
import java.util.List;

import org.springframework.validation.annotation.Validated;

import com.fasterxml.jackson.annotation.JsonProperty;

import io.swagger.annotations.ApiModel;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Size;
import lombok.EqualsAndHashCode;

/**
 * A Object holds the basic data of state
 */
@ApiModel(description = "A Object holds the basic data of state")
@Validated
@jakarta.annotation.Generated(value = "org.egov.codegen.SpringBootCodegen", date = "2018-12-04T11:26:25.532+05:30")



@EqualsAndHashCode(of = {"tenantId","businessServiceId","state"})
public class State   {

        @Size(max=256)
        @JsonProperty("uuid")
        private String uuid;

        @Size(max=256)
        @JsonProperty("tenantId")
        private String tenantId;

        @Size(max=256)
        
        @JsonProperty("businessServiceId")
        private String businessServiceId;

        @JsonProperty("sla")
        private Long sla;

        @Size(max=256)
        @JsonProperty("state")
        private String state;

        @Size(max=256)
        @JsonProperty("applicationStatus")
        private String applicationStatus;

        @JsonProperty("docUploadRequired")
        private Boolean docUploadRequired;

        @JsonProperty("isStartState")
        private Boolean isStartState;

        @JsonProperty("isTerminateState")
        private Boolean isTerminateState;

        @JsonProperty("isStateUpdatable")
        private Boolean isStateUpdatable;

        @JsonProperty("actions")
        @Valid
        private List<Action> actions;

        private org.egov.common.contract.models.AuditDetails auditDetails;


        public State addActionsItem(Action actionsItem) {
                if (this.actions == null) {
                        this.actions = new ArrayList<>();
                }
                this.actions.add(actionsItem);
                return this;
        }

}
