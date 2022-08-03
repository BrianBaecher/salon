#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
    echo -e "Welcome to My Salon, how can I help you?\n"

    echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
    read SERVICE_ID_SELECTED

    case $SERVICE_ID_SELECTED in
    1) CUT_PRC ;;
    2) COLOR_PRC ;;
    3) PERM_PRC ;;
    4) STYLE_PRC ;;
    5) TRIM_PRC ;;
    *) MAIN_MENU ;;
    esac
}

CUT_PRC() {
    SERVICE='cut'
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$SERVICE'")

    #get phone number
    echo -e "\n What's your phone number?"
    read CUSTOMER_PHONE
    GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #check phone against records
    #if no record ask for name
    if [[ -z $GET_CUSTOMER_NAME ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name , phone) VALUES ('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
        echo -e "\nWhat time would you like your $SERVICE,$CUSTOMER_NAME?"
        read SERVICE_TIME
        #get custmer id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        #insert appointment (for cut)
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        #message to confirm apt type and time
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME"
    else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME,$CUSTOMER_NAME"

    fi

}
COLOR_PRC(){
  SERVICE='color'
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$SERVICE'")
    echo -e "\n What's your phone number?"
    read CUSTOMER_PHONE
    GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $GET_CUSTOMER_NAME ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name , phone) VALUES ('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
        echo -e "\nWhat time would you like your $SERVICE,$CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME"
    else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME,$CUSTOMER_NAME"

    fi
}
PERM_PRC(){
  SERVICE='perm'
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$SERVICE'")
    echo -e "\n What's your phone number?"
    read CUSTOMER_PHONE
    GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $GET_CUSTOMER_NAME ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name , phone) VALUES ('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
        echo -e "\nWhat time would you like your $SERVICE,$CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME"
    else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME,$CUSTOMER_NAME"

    fi
}
STYLE_PRC(){
  SERVICE='style'
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$SERVICE'")
    echo -e "\n What's your phone number?"
    read CUSTOMER_PHONE
    GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $GET_CUSTOMER_NAME ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name , phone) VALUES ('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME"
    else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME"

    fi
}
TRIM_PRC(){
  SERVICE='trim'
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$SERVICE'")
    echo -e "\n What's your phone number?"
    read CUSTOMER_PHONE
    GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $GET_CUSTOMER_NAME ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name , phone) VALUES ('$CUSTOMER_NAME' , '$CUSTOMER_PHONE')")
        echo -e "\nWhat time would you like your $SERVICE,$CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME"
    else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        echo -e "\nWhat time would you like your $SERVICE,$CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_CUT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME,$CUSTOMER_NAME"

    fi
}
MAIN_MENU
