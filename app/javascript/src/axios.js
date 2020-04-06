import axios from 'axios';

const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const instance = axios.create({
    headers: {
        'X-CSRF-Token': token,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
    }
});

export default instance;
