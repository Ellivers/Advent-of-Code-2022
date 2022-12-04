import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        ArrayList<String> input = new ArrayList<>();

        try {
            File file = new File("input.txt");
            Scanner reader = new Scanner(file);
            while (reader.hasNextLine()) {
                input.add(reader.nextLine());
            }
        }
        catch (FileNotFoundException e) {
            System.out.println("input.txt not found.");
            e.printStackTrace();
        }

        if (!input.isEmpty()) {
            if (Arrays.asList(args).contains("--part1")) part1(input);
            else if (Arrays.asList(args).contains("--part2")) part2(input);
            else System.out.println("Please use the --part1 or --part2 argument");
        }
    }

    private static void part1(ArrayList<String> input) {
        ArrayList<Character> sameItems = new ArrayList<>();

        for (String line : input) {
            ArrayList<Character> compartment1 = new ArrayList<>();
            ArrayList<Character> compartment2 = new ArrayList<>();

            for (int i = 0; i < line.length(); i++) {
                char c = line.charAt(i);

                if (i < line.length()/2) compartment1.add(c);
                else compartment2.add(c);
            }

            for (char c : compartment1) {
                if (compartment2.contains(c)) {
                    sameItems.add(c);
                    break;
                }
            }
        }

        int priority = getPriorityTotal(sameItems);

        System.out.println(sameItems);
        System.out.println("Priority: " + priority);
    }

    private static int getPriorityTotal(ArrayList<Character> chars) {
        int priority = 0;
        for (char c : chars) {
            if (Character.isLowerCase(c)) {
                priority += Character.getNumericValue(c) - 9;
            }
            else if (Character.isUpperCase(c)) {
                priority += Character.getNumericValue(c) + 17;
            }
        }

        return priority;
    }

    private static void part2(ArrayList<String> input) {
        ArrayList<Character> sameItems = new ArrayList<>();

        boolean found;
        for (int i = 2; i < input.size(); i+=3) {
            found = false;
            for (char c1 : input.get(i-2).toCharArray()) {
                for (char c2 : input.get(i-1).toCharArray()) {
                    for (char c3 : input.get(i).toCharArray()) {
                        if (Objects.equals(c1, c2) && Objects.equals(c1, c3)) {
                            sameItems.add(c1);
                            found = true;
                            break;
                        }
                    }
                    if (found) break;
                }
                if (found) break;
            }
        }

        int priority = getPriorityTotal(sameItems);

        System.out.println(sameItems);
        System.out.println("Priority: " + priority);
    }
}