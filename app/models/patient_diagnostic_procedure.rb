class PatientDiagnosticProcedure < ApplicationRecord
  belongs_to :patient
  belongs_to :diagnostic_procedure
end
