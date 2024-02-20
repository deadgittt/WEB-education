const validator = new Validator();
window.onload = function () {
    const canvasPrinter = new CanvasPrinter();
    canvasPrinter.drawStartImage()
    const checkboxes = document.querySelectorAll('input[type=checkbox]')
    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener("click", () => {
            validator.lastClickedX = checkbox.value;
            checkboxes.forEach((c) => {
                if (c !== checkbox) {
                    c.checked = false;
                }
            });
        });
    });

    document.querySelector("input[type=text]")
        .addEventListener("focusout", validator.validateY);

    document.querySelectorAll('input[name="R-radio-group"]').forEach(radio => {
        radio.addEventListener('click', () => {
            validator.lastClickedR = radio.value;
            canvasPrinter.redrawAll(radio.value)
        })
    })

    canvasPrinter.canvas.addEventListener('click', function(event) {
        canvasPrinter.parseClick(event)
    });
    // Not auto update page after form submit
    $('form').submit(function(e) {
        e.preventDefault();
    })
}