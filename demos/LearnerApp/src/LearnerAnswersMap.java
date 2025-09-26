import java.util.*;

public class LearnerAnswersMap {
    TreeMap<String,String> learnerAnswersMap = new TreeMap<String,String>();
    public void assignLearnerAnswers() {
       learnerAnswersMap.put("Maheen", "Private variables cannot be accessed outside the class");
       learnerAnswersMap.put("Gagan", "The main method should always be main, otherwise we will not be able to run the program");
       learnerAnswersMap.put("Khyati", "The HashMap belongs to the java.util package");
       learnerAnswersMap.put("Mavya", "Identified the objects in a program");
       learnerAnswersMap.put("Anjali", "Identified the classes in the program");
        learnerAnswersMap.put("Khyati", "System defined classes : HashMap");
        learnerAnswersMap.put("Charisma", "The String class");
        learnerAnswersMap.put("Vishranthi", "Ordering : Unordered, Insertion Order, Sort Order");
        learnerAnswersMap.put("Swapna", "Fetch the key and value!");
    }

    public void displayLearnerAnswers() {
        System.out.println(learnerAnswersMap);
//        System.out.println("Maheen's answer: " + learnerAnswersMap.get("Maheen"));
//        System.out.println("Gagan's answer: " + learnerAnswersMap.get("Gagan"));
//        System.out.println("Khyati's answer: " + learnerAnswersMap.get("Khyati"));
     // Provided key display value
        Set<String> learnersSet =  learnerAnswersMap.keySet();
        System.out.println(learnersSet);
        Collection<String> learnerValues = learnerAnswersMap.values();
        System.out.println(learnerValues);
        // String swapnaAnswer = learnerAnswersMap.get("Swapna");
        // System.out.println(swapnaAnswer);
        // Search for a key and display value
        if(learnerAnswersMap.containsKey("Khyati")) {
            System.out.println("Khyati's answer: " + learnerAnswersMap.get("Khyati"));
        } else {
            System.out.println("Khyati has not answered yet");
        }
    }
}
