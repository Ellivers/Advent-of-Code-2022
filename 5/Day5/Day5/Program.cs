using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Day5
{
    class Program
    {
        static void Main(string[] args)
        {
            int part = 0;
            foreach (string s in args) {
                if (s == "--part1")
                {
                    part = 1;
                    break;
                }
                if (s == "--part2")
                {
                    part = 2;
                    break;
                }
            }
            if (part == 0)
            {
                Console.WriteLine("Please enter the argument --part1 or --part2");
                return;
            }

            List<Stack<char>> stacks = new List<Stack<char>>();

            if (part == 1) part1(stacks);
            else if (part == 2) part2(stacks);

            Console.WriteLine("");
            foreach (Stack<char> stack in stacks)
            {
                if (stack.Count > 0) Console.Write(stack.Peek());
            }
        }

        private static void part1(List<Stack<char>> stacks)
        {
            Regex boxLine = new Regex("(\\s*\\[[A-Z]\\])+\\s*");
            bool rearranged = false;
            foreach (string line in System.IO.File.ReadLines(@"input.txt"))
            {
                if (line == "") continue;

                if (line.StartsWith("move"))
                {
                    if (!rearranged) foreach (Stack<char> stack in stacks)
                        {
                            char[] stack2 = stack.ToArray();
                            stack.Clear();
                            foreach (char c in stack2)
                            {
                                stack.Push(c);
                            }
                        }
                    rearranged = true;

                    Match match = new Regex("^move (\\d+) from (\\d+) to (\\d+)$").Match(line);

                    int numToMove = int.Parse(match.Groups[1].Value);
                    int fromStack = int.Parse(match.Groups[2].Value) - 1;
                    int toStack = int.Parse(match.Groups[3].Value) - 1;

                    for (int i = 0; i < numToMove; i++)
                    {
                        if (stacks[fromStack].Count == 0) break;
                        stacks[toStack].Push(stacks[fromStack].Pop());
                    }

                }
                else if (boxLine.IsMatch(line))
                {
                    int spaces = 0;
                    int currentStack = 0;
                    Regex boxName = new Regex("[A-Z]");
                    for (int i = 0; i < line.Length; i++)
                    {
                        char c = line[i];
                        if (c != ' ')
                        {
                            if (c == '[')
                            {
                                spaces = 0;
                            }
                            else if (boxName.IsMatch(c.ToString()))
                            {
                                while (stacks.Count < currentStack + 1) stacks.Add(new Stack<char>());
                                stacks[currentStack].Push(c);
                                currentStack++;
                            }
                        }
                        else
                        {
                            spaces++;
                            if (i == 0) spaces++;
                            if (spaces == 4)
                            {
                                currentStack++;
                                spaces = 0;
                            }
                        }
                    }
                }
            }
        }


        private static void part2(List<Stack<char>> stacks)
        {
            Regex boxLine = new Regex("(\\s*\\[[A-Z]\\])+\\s*");
            bool rearranged = false;
            foreach (string line in System.IO.File.ReadLines(@"input.txt"))
            {
                if (line == "") continue;

                if (line.StartsWith("move"))
                {
                    if (!rearranged) foreach (Stack<char> stack in stacks)
                        {
                            char[] stack2 = stack.ToArray();
                            stack.Clear();
                            foreach (char c in stack2)
                            {
                                stack.Push(c);
                            }
                        }
                    rearranged = true;

                    Match match = new Regex("^move (\\d+) from (\\d+) to (\\d+)$").Match(line);

                    int numToMove = int.Parse(match.Groups[1].Value);
                    int fromStack = int.Parse(match.Groups[2].Value) - 1;
                    int toStack = int.Parse(match.Groups[3].Value) - 1;

                    Stack<char> temp = new Stack<char>();

                    for (int i = 0; i < numToMove; i++)
                    {
                        if (stacks[fromStack].Count == 0) break;
                        temp.Push(stacks[fromStack].Pop());
                    }

                    for (int i = 0; i < numToMove; i++)
                    {
                        if (temp.Count == 0) break;
                        stacks[toStack].Push(temp.Pop());
                    }

                }
                else if (boxLine.IsMatch(line))
                {
                    int spaces = 0;
                    int currentStack = 0;
                    Regex boxName = new Regex("[A-Z]");
                    for (int i = 0; i < line.Length; i++)
                    {
                        char c = line[i];
                        if (c != ' ')
                        {
                            if (c == '[')
                            {
                                spaces = 0;
                            }
                            else if (boxName.IsMatch(c.ToString()))
                            {
                                while (stacks.Count < currentStack + 1) stacks.Add(new Stack<char>());
                                stacks[currentStack].Push(c);
                                currentStack++;
                            }
                        }
                        else
                        {
                            spaces++;
                            if (i == 0) spaces++;
                            if (spaces == 4)
                            {
                                currentStack++;
                                spaces = 0;
                            }
                        }
                    }
                }
            }
        }
    }
}
