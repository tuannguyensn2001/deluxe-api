import { createApp } from 'vue'
import App from './App.vue'
import routes  from "./routes";
import firebase from "firebase";


const app = createApp(App);

const firebaseConfig = {
    apiKey: "AIzaSyB4dcns0eKub_bUJ1hcbtc2AsTp_XY6eLU",
    authDomain: "projectandroid-8d413.firebaseapp.com",
    databaseURL: "https://projectandroid-8d413.firebaseio.com",
    projectId: "projectandroid-8d413",
    storageBucket: "projectandroid-8d413.appspot.com",
    messagingSenderId: "536347918349",
    appId: "1:536347918349:web:2e8a36a04e6a96ab6d1544",
    measurementId: "G-W4B12B9E0G"
};

firebase.initializeApp(firebaseConfig);


app.use(routes);
app.mount("#app");
