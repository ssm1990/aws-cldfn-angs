import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: false,
  template: `
    <div>
      <h1>Welcome to Angular Static App</h1>
      <p>This app is deployed using AWS CodePipeline, CodeBuild, S3, and CloudFront.</p>
    </div>
  `,
  styles: [`
    div {
      text-align: center;
      padding: 50px;
    }
    h1 {
      color: #333;
    }
  `]
})
export class AppComponent {
  title = 'angular-static-app';
}