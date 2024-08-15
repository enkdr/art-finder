import { artCardTemplate } from './art-card-template.js';
customElements.define("art-card", class extends HTMLElement {

    constructor() {
        super();
        this.attachShadow({mode:'open'});
    }
        
    connectedCallback() {
        console.log("art-card");
        this.render();
    }

    render() {

        const template = document.createElement('template');

        template.innerHTML = artCardTemplate;
        
        const templateContent = template.content.cloneNode(true);

        this.shadowRoot.appendChild(templateContent);

    }
    
    
});
