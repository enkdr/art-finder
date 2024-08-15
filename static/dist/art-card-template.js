const t=`
  <style>
    :host {
      display: block;
      border: 1px solid #ccc;
      padding: 10px;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
    h2 {
      color: #333;
    }
  </style>
  <div class='art-card'>
    <h2>Art Card</h2>
    <p><slot name="content">default slot content from artCardTemplate</slot></p>
  </div>
`;export{t as a};
