package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.master.DistrictServices;
import com.finalproject.walktogetherapi.service.master.ProvinceServices;
import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.service.master.SubDistrictServices;
import com.finalproject.walktogetherapi.util.QrCodeGenerator;
import com.finalproject.walktogetherapi.util.RandomNumberUser;

import java.util.HashMap;

import static com.finalproject.walktogetherapi.util.Constant.PATH_QR_CODE_CARETAKER;
import static com.finalproject.walktogetherapi.util.Constant.PATH_QR_CODE_PATIENT;

public class PatientMapping {

    private static PatientMapping instance;

    public static PatientMapping getInstance() {
        if (instance == null) {
            instance = new PatientMapping();
        }
        return instance;
    }

    public Patient getPatient(HashMap<String, Object> data,
                              CaretakerService caretakerService,
                              PatientService patientService,
                              SexServices sexServices,
                              ProvinceServices provinceServices,
                              DistrictServices districtServices,
                              SubDistrictServices subDistrictServices,
                              Patient patient,
                              Boolean isCreate) {


        if (data.get("userName") != null)
            if (patientService.findByUserName(data.get("userName").toString()) == null &&
                    caretakerService.findByUserName(data.get("userName").toString()) == null)
                patient.setUserName(data.get("userName").toString());
            else {
                patient.setUserName(null);
                return patient;
            }
        if (data.get("password") != null)
            patient.setPassword(data.get("password").toString());
        if (data.get("titleName") != null)
            patient.setTitleName(data.get("titleName").toString());
        if (data.get("firstName") != null)
            patient.setFirstName(data.get("firstName").toString());
        if (data.get("lastName") != null)
            patient.setLastName(data.get("lastName").toString());
        if (data.get("sexId") != null)
            patient.setSex(sexServices.findById(Long.parseLong(data.get("sexId").toString())));
        if (data.get("dob") != null)
            patient.setDob(data.get("dob").toString());
        if (data.get("address") != null)
            patient.setAddress(data.get("address").toString());
        if (data.get("provinceId") != null)
            patient.setProvince(provinceServices.findById(Long.parseLong(data.get("provinceId").toString())));
        if (data.get("districtId") != null)
            patient.setDistrict(districtServices.findById(Long.parseLong(data.get("districtId").toString())));
        if (data.get("subDistrictId") != null)
            patient.setSubDistrict(subDistrictServices.findById(Long.parseLong(data.get("subDistrictId").toString())));
        if (data.get("occupation") != null)
            patient.setOccupation(data.get("occupation").toString());
        if (data.get("email") != null)
            if (patientService.findByEmail(data.get("email").toString()) == null &&
                    caretakerService.findByEmail(data.get("email").toString()) == null)
                patient.setEmail(data.get("email").toString());
            else {
                patient.setEmail(null);
                return patient;
            }
        if (data.get("tell") != null)
            if (patientService.findByTell(data.get("tell").toString()) == null &&
                    caretakerService.findByTell(data.get("tell").toString()) == null)
                patient.setTell(data.get("tell").toString());
            else {
                patient.setTell(null);
                return patient;
            }
        return patient;
    }

    public Patient createPatient(Patient patient) {
        patient.setPatientNumber(RandomNumberUser.getInstance().getNumberPatient());
        patient = generatorQrCode(patient);
        return patient;
    }

    private Patient generatorQrCode(Patient patient) {
        String pathString = PATH_QR_CODE_PATIENT
                + "/"
                + patient.getPatientNumber()
                + "/";
        patient.setQrCode(QrCodeGenerator.getInstance().generatorQrCode(pathString, patient.getPatientNumber()));
        return patient;
    }
}
