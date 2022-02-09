const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row .seat:not(.occupied)');
const count = document.getElementById('count');
const total = document.getElementById('total');
const seatsSelect = document.getElementById('seatsCategory');
var seatsCategory = document.getElementById('category');
let ticketPrice = +seatsSelect.value;

function updateSelectedCount() {
    const selectedSeats = document.querySelectorAll('.row .seat.selected');
    const selectedSeatsCount = selectedSeats.length;
    count.value = selectedSeatsCount;
    total.value = selectedSeatsCount * ticketPrice;
    var randomChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var randomNumber = '0123456789';
    var result = '';
    for (var i = 0; i < selectedSeatsCount; i++) {
        result += randomChars.charAt(Math.floor(Math.random() * randomChars.length)) + randomNumber.charAt(Math.floor(Math.random() * randomChars.length));
        document.getElementById("ticketNumber").value = result;
    }
}
seatsSelect.addEventListener('change', (e) => {
    ticketPrice = +e.target.value;
    updateSelectedCount();
});
container.addEventListener('click', (e) => {
    if (e.target.classList.contains('seat') && !e.target.classList.contains('occupied')) {
        e.target.classList.toggle('selected');
        updateSelectedCount();
    }
});

function check() {
    const fclassPrice = document.getElementById('checkFclass');
    const SclassPrice = document.getElementById('checkSclass');
    if (seatsSelect.options[seatsSelect.selectedIndex].value == fclassPrice.value) {
        seatsCategory.value = "First Class";
    } else if (seatsSelect.options[seatsSelect.selectedIndex].value == SclassPrice.value) {
        seatsCategory.value = "Second Class";
    }
}
const mathcInfo = document.querySelector('.mathcInfo');
const {
    width,
    height
} = mathcInfo.getBoundingClientRect();
mathcInfo.addEventListener('mousemove', (event) => {
    const {
        offsetX,
        offsetY
    } = event;
    mathcInfo.style.setProperty('--x-pos', (offsetX / width) - 0.5);
    mathcInfo.style.setProperty('--y-pos', (offsetY / height) - 0.5);
});