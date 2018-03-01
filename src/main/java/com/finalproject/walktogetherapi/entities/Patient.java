package com.finalproject.walktogetherapi.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.finalproject.walktogetherapi.entities.evaluation.HistoryEvaluationTest;
import com.finalproject.walktogetherapi.entities.master.*;
import com.finalproject.walktogetherapi.entities.mission.HistoryMission;
import com.finalproject.walktogetherapi.util.DateTimeManager;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Patient")
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String patientNumber;
    private String userName;
    private String password;
    private String titleName;
    private String firstName;
    private String lastName;
    @ManyToOne
    private Sex sex;
    @ManyToOne
    private Education education;
    private String dob;
    private String address;
    @ManyToOne
    private Province province;
    @ManyToOne
    private District district;
    @ManyToOne
    private SubDistrict subDistrict;
    private String tell;
    private String occupation;
    private String level;
    private String frequency;
    private String email;
    private String image;
    private String qrCode;

    @OneToMany(mappedBy = "patient", cascade = {CascadeType.ALL})
    private List<HistoryEvaluationTest> historyEvaluationTests;

    @OneToMany(mappedBy = "patient", cascade = {CascadeType.ALL})
    private List<HistoryMission> historyMissions;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTitleName() {
        return titleName;
    }

    public void setTitleName(String titleName) {
        this.titleName = titleName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex sex) {
        this.sex = sex;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    @JsonIgnore
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @JsonIgnore
    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    @JsonIgnore
    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    @JsonIgnore
    public SubDistrict getSubDistrict() {
        return subDistrict;
    }

    public void setSubDistrict(SubDistrict subDistrict) {
        this.subDistrict = subDistrict;
    }

    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public void setPatientNumber(String patientNumber) {
        this.patientNumber = patientNumber;
    }

    public String getPatientNumber() {
        return patientNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAge() {
        if (getDob() != null) {
            String age = DateTimeManager.getInstance().birthDayToAge(getDob());
            return age;
        }
        return "";
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @JsonIgnore
    public List<HistoryEvaluationTest> getHistoryEvaluationTests() {
        return historyEvaluationTests;
    }

    public void setHistoryEvaluationTests(List<HistoryEvaluationTest> historyEvaluationTests) {
        this.historyEvaluationTests = historyEvaluationTests;
    }

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public Education getEducation() {
        return education;
    }

    public void setEducation(Education education) {
        this.education = education;
    }

    public List<HistoryMission> getHistoryMissions() {
        return historyMissions;
    }

    public void setHistoryMissions(List<HistoryMission> historyMissions) {
        this.historyMissions = historyMissions;
    }
}
