package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.master.DistrictServices;
import com.finalproject.walktogetherapi.service.master.ProvinceServices;
import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.service.master.SubDistrictServices;
import com.finalproject.walktogetherapi.util.RandomNumberUser;

import java.util.HashMap;

public class CaretakerMapping {

    private static CaretakerMapping instance;

    public static CaretakerMapping getInstance() {
        if (instance == null) {
            instance = new CaretakerMapping();
        }
        return instance;
    }

    public Caretaker getCaretaker(HashMap<String, Object> data,
                                  CaretakerService caretakerService,
                                  PatientService patientService,
                                  SexServices sexServices,
                                  ProvinceServices provinceServices,
                                  DistrictServices districtServices,
                                  SubDistrictServices subDistrictServices,
                                  Caretaker caretaker,
                                  Boolean isCreate) {

        if (isCreate)
            caretaker.setCaretakerNumber(RandomNumberUser.getInstance().getNumberCaretaker());
        if (data.get("userName") != null)
            if (caretakerService.findByUserName(data.get("userName").toString()) == null
                    && patientService.findByUserName(data.get("userName").toString()) == null) {
                caretaker.setUserName(data.get("userName").toString());
            } else {
                caretaker.setUserName(null);
                return caretaker;
            }
        if (data.get("password") != null)
            caretaker.setPassword(data.get("password").toString());
        if (data.get("titleName") != null)
            caretaker.setTitleName(data.get("titleName").toString());
        if (data.get("firstName") != null)
            caretaker.setFirstName(data.get("firstName").toString());
        if (data.get("lastName") != null)
            caretaker.setLastName(data.get("lastName").toString());
        if (data.get("sexId") != null)
            caretaker.setSex(sexServices.findById(Long.parseLong(data.get("sexId").toString())));
        if (data.get("dob") != null)
            caretaker.setDob(data.get("dob").toString());
        if (data.get("address") != null)
            caretaker.setAddress(data.get("address").toString());
        if (data.get("provinceId") != null)
            caretaker.setProvince(provinceServices.findById(Long.parseLong(data.get("provinceId").toString())));
        if (data.get("districtId") != null)
            caretaker.setDistrict(districtServices.findById(Long.parseLong(data.get("districtId").toString())));
        if (data.get("subDistrictId") != null)
            caretaker.setSubDistrict(subDistrictServices.findById(Long.parseLong(data.get("subDistrictId").toString())));
        if (data.get("occupation") != null)
            caretaker.setOccupation(data.get("occupation").toString());
        if (data.get("email") != null)
            if (caretakerService.findByEmail(data.get("email").toString()) == null &&
                    patientService.findByEmail(data.get("email").toString()) == null) {
                caretaker.setEmail(data.get("email").toString());
            } else {
                caretaker.setEmail(null);
                return caretaker;
            }
        if (data.get("tell") != null)
            if (caretakerService.findByTell(data.get("tell").toString()) == null
                    && patientService.findByTell(data.get("tell").toString()) == null) {
                caretaker.setTell(data.get("tell").toString());
            } else {
                caretaker.setTell(null);
                return caretaker;
            }
        return caretaker;
    }

}
