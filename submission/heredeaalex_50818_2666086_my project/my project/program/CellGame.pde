class CellGame {
    class Answer {
        private boolean correct;
        private String text;
        
        Answer(boolean correct, String text) {
            this.correct = correct;
            this.text = text;
        }
        
        /*
        * Returns whether or not this specific answer is correct.
        */
        public boolean isCorrect() {
            return this.correct;
        }

        /*
        * Returns the text of the answer.
        */        
        public String getText() {
            return this.text;
        }

        @Override
        public String toString() {
            return String.format("Answer{correct=%s,text=%s}", this.correct, this.text);
        }
    }
    class Question {
        private String text;
        private ArrayList<Answer> answers;
        
        Question(String text, String answersString) {
            this.text = text;
            this.answers = new ArrayList();
            for (String s : answersString.split("\n")) {
                answers.add(new Answer(s.endsWith(".c"), s.replace(".c", "")));
            }
        }
        
        /*
        * Returns the text of the question.
        */
        public String getText() {
            return this.text;
        }
        
        /*
        * Returns the answer at the given index.
        */
        public Answer getAnswerAt(int index) {
            return answers.get(index);
        }
        
        /*
        * Returns whether or not the answer at the given index is correct.
        */
        public boolean isAnswerAtCorrect(int index) {
            //println(answers.get(index));
            return answers.get(index).isCorrect();
        }
    }
    
    PImage backgroundImage;
    private ArrayList<Question> questions;
    int currentQuestion;
    int correctAnswers;

    /*
    * Initializes all the data used by this object.
    */
    void init() {
        backgroundImage = loadImage("assets/cell_quiz.png");
        surface.setSize(backgroundImage.width, backgroundImage.height);
        state = 7;
        questions = new ArrayList();
        
        questions.add(new Question("Who was the character that defeated Cell in Dragon Ball Kai series?", "Gohan.c\n" +
            "Goku\n" + 
            "Vegeta"));
        questions.add(new Question("If Cell from Dragon Ball Kai series would fight with Ultra Instinct Goku from Dragon Ball Super, who would win?", 
            "Cell\nGoku.c\nTrick question: no one."));
        questions.add(new Question("How much is 9+3*5-4+5*2?", "30.c\n∞\nThe mitochondria is the powerhouse of the cell."));
        questions.add(new Question("Who is stronger, Goku in the stage of a god(red haird Goku) or Cell in Dragon Ball Kai at full power?", 
            "Vegeta\nCell\nGoku.c"));
        currentQuestion = 0;
        correctAnswers = 0;
    }
    
    /*
    * Draws the questions and answers to the screen.
    */ 
    void draw() {
        background(backgroundImage);
        if (currentQuestion < questions.size()) {
            fill(0, 0, 0, 255);
            textSize(24);
            text(questions.get(currentQuestion).getText(), 161, 48);
            text(questions.get(currentQuestion).getAnswerAt(0).getText(), 100, 150);
            text(questions.get(currentQuestion).getAnswerAt(1).getText(), 100, 250);
            text(questions.get(currentQuestion).getAnswerAt(2).getText(), 100, 350);
            fill(255, 0, 0, 25);
            rect(0, 100, width, 100);
            rect(0, 200, width, 100);
            rect(0, 300, width, 100);
        } else {
            fill(0, 0, 0, 255);
            textSize(48);
            switch(correctAnswers) {
                case 0: {
                    text("D: You should start reading!", 601, 230);
                    break;
                }
                case 1: {
                    text("C: At least you got one.", 601, 230);
                    break;
                }
                case 2: {
                    text("B: Are you even trying?", 601, 230);
                    break;
                }
                case 3: {
                    text("A: You can do better!", 601, 230);
                    break;
                }
                case 4: {
                    text("S: Good job!", 601, 230);
                    break;
                }
            }
        }
    }
    
    /*
    * Handles button presses, checking which answer has been clicked.
    */
    void mousePressed() {
        if (currentQuestion < questions.size()) {
            if (mouseY >= 100 && mouseY <= 200) {
                if (questions.get(currentQuestion++).isAnswerAtCorrect(0)) {
                    ++correctAnswers;
                }
            } else if (mouseY >= 200 && mouseY <= 300) {
                if (questions.get(currentQuestion++).isAnswerAtCorrect(1)) {
                    ++correctAnswers;
                }
            } else if (mouseY >= 300 && mouseY <= 400) {
                if (questions.get(currentQuestion++).isAnswerAtCorrect(2)) {
                    ++correctAnswers;
                }
            }
        }
    }
    
    /*
    * Handles key presses, returning to the main menu if ESC is detected.
    */
    void keyPressed() {
        switch (key) {
            case ESC: {
                key = 0;
                reset();
                break;
            }
        }
    }
}