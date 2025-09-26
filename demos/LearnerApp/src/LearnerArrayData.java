public class LearnerArrayData {

    private String[] learnerNames = new String[26];

    public void assignLearnerNames() {
        learnerNames[0] = "Aadhil Ahamed Meeran";
        learnerNames[1] = "Abhishek Tripathi";
        learnerNames[2] = "Anjali Bharti";
        learnerNames[3] = "Arthika L";
        learnerNames[4] = "Arulmozhivarman Senthilkumar";
        learnerNames[5] = "Charishma M";
        learnerNames[6] = "Gagan Saraswat";
        learnerNames[7] = "Gedela Swapna";
        learnerNames[8] = "Hariharan S";
        learnerNames[9] = "Ishant Bansal";
        learnerNames[10] = "KARNATI SURYA REDDY";
        learnerNames[11] = "Karthik T";
        learnerNames[12] = "Kaviya H R";
        learnerNames[13] = "Khyati Gondaliya";
        learnerNames[14] = "Mohamed Maheen";
        learnerNames[15] = "MOKSHANA M R";
        learnerNames[16] = "Molabanti Amulya";
        learnerNames[17] = "PRIYA P";
        learnerNames[18] = "Saripudi Mavya";
        learnerNames[19] = "Shanjeevi M";
        learnerNames[20] = "Shilpa S";
        learnerNames[21] = "Shiyam Raj J";
        learnerNames[22] = "Soundarya K";
        learnerNames[23] = "Suvham Patro";
        learnerNames[24] = "Vishranthi A";
    }

    // print all the learner names
    public void printLearnerNames() {
        System.out.println(learnerNames);
    //    for(int i=0; i<learnerNames.length; i++) {
    //        System.out.println(learnerNames[i]);
    //    }
       for(String name : learnerNames) {
           System.out.println(name);
       }
    }
}
