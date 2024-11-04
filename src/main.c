#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#include <gint/display.h>
#include <gint/keyboard.h>
#include <gint/clock.h>

#define UP 1
#define DOWN 2
#define LEFT 3
#define RIGHT 4


int game_loop() {
    // 19 x 11 Game Screen
    int snake_x[209] = { 3, 4, 5, 6 };
    int snake_y[209] = { 5, 5, 5, 5 };
    int snake_size = 4;
    int direction = RIGHT;
    int timeout = 32;

    int score = 0;

    // Draws border around game screen
    drect(15, 3, 111, 59, C_BLACK);
    srand(time(NULL));
    int apple_x = 12;
    int apple_y = 5;
    bool ate_apple = false;

    while (true) {
        // Gets user input
        int key = getkey_opt(GETKEY_DEFAULT & ~GETKEY_REP_ARROWS, &timeout).key;
        // Clears game screen
        drect(16, 4, 110, 58, C_WHITE);

        timeout = -snake_size/15 + 32;

        // Detects user input to change `direction`
        switch (key) {
        case KEY_UP:
        case KEY_8:
            if (direction != DOWN) {
                direction = UP;
            }
            break;
        case KEY_DOWN:
        case KEY_2:
            if (direction != UP) {
                direction = DOWN;
            }
            break;
        case KEY_LEFT:
        case KEY_4:
            if (direction != RIGHT) {
                direction = LEFT;
            }
            break;
        case KEY_RIGHT:
        case KEY_6:
            if (direction != LEFT) {
                direction = RIGHT;
            }
            break;
        }

        // Snake movement, display, and growth
        int new_head_x = snake_x[snake_size - 1];
        int new_head_y = snake_y[snake_size - 1];

        // Calculate new head position
        switch (direction) {
        case UP:
            new_head_y--;
            break;
        case DOWN:
            new_head_y++;
            break;
        case LEFT:
            new_head_x--;
            break;
        case RIGHT:
            new_head_x++;
            break;
        }

        // Move body first
        if (!ate_apple) {
            for (int i = 0; i < snake_size - 1; i++) {
                snake_x[i] = snake_x[i + 1];
                snake_y[i] = snake_y[i + 1];
            }
            snake_x[snake_size - 1] = new_head_x;
            snake_y[snake_size - 1] = new_head_y;
        }
        else {
            // Grow snake
            snake_x[snake_size] = new_head_x;
            snake_y[snake_size] = new_head_y;
            snake_size++;
            ate_apple = false;
            // Generate new apple position and change score
            bool valid_position = false;
            while (!valid_position) {
                apple_x = rand() % 19;
                apple_y = rand() % 11;
                valid_position = true;
                for (int i = 0; i < snake_size; i++) {
                    if (snake_x[i] == apple_x && snake_y[i] == apple_y) {
                        valid_position = false;
                        break;
                    }
                }
            }
            score += 10;
        }

        // Check for collisions with body
        for (int i = 0; i < snake_size - 1; i++) {
            if (new_head_x == snake_x[i] && new_head_y == snake_y[i]) {
                dclear(C_WHITE);
                return score;
            }
        }

        // Draw snake
        for (int i = 0; i < snake_size; i++) {
            drect(5 * snake_x[i] + 16, 5 * snake_y[i] + 4,
                5 * snake_x[i] + 20, 5 * snake_y[i] + 8, C_BLACK);
        }

        // Check for apple collision
        if (new_head_x == apple_x && new_head_y == apple_y) {
            ate_apple = true;
        }

        // Draws apple
        dpixel(5 * apple_x + 18, 5 * apple_y + 5, C_BLACK);
        dpixel(5 * apple_x + 19, 5 * apple_y + 6, C_BLACK);
        dpixel(5 * apple_x + 18, 5 * apple_y + 7, C_BLACK);
        dpixel(5 * apple_x + 17, 5 * apple_y + 6, C_BLACK);

        // Detects if snake is out of bounds
        if (new_head_x < 0 || new_head_x > 18 || new_head_y < 0 || new_head_y > 10) {
            dclear(C_WHITE);
            return score;
        }

        dupdate();
        sleep_ms(timeout * 10);
    }
}

int main(void)
{
    dtext_opt(64, 20, C_BLACK, C_NONE, DTEXT_CENTER, DTEXT_MIDDLE, "Press any");
    dtext_opt(64, 32, C_BLACK, C_NONE, DTEXT_CENTER, DTEXT_MIDDLE, "Key to start");
    dupdate();
    getkey();

    while (true) {
        dclear(C_WHITE);
        int score = game_loop();
        char text1[16];
        char text2[25];
        char text3[10];

        if (score == 1800) {
            strcpy(text1, "Congratulations");
            strcpy(text2, "You got the highest score");
            strcpy(text3, "possible!");
        }
        else {
            strcpy(text1, "Game Over");
            sprintf(text2, "Your score was %d", score);
            strcpy(text3, "");
        }
        dtext_opt(64, 20, C_BLACK, C_NONE, DTEXT_CENTER, DTEXT_MIDDLE, text1);
        dtext_opt(64, 32, C_BLACK, C_NONE, DTEXT_CENTER, DTEXT_MIDDLE, text2);
        dtext_opt(64, 44, C_BLACK, C_NONE, DTEXT_CENTER, DTEXT_MIDDLE, text3);
        dupdate();
        getkey();
    }
    return 1;
}