class PatientsController < ApplicationController
  def index
    @facilities = Facility.ordered
  end

  def list
    if params[:facility_id]
      facility = Facility.find_by(id: params[:facility_id])
      @patients = facility.patients if facility
    else
      @patients = Patient
    end

    @patients = @patients.includes(:facility).ordered.limit(100)
  end

  def transfer
    patient = Patient.with_everything(params[:id])
    facility = patient.facility

    @path = "#{Rails.root}/templates"
    @template = 'form_34L-D.html'
    @data = { patient: patient, facility: facility }

    render layout: 'print'
  end
end
