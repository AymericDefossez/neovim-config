const PI: number = 3.14;
const E = 2.71;
let x: number = 10;

export function add(a: number, b: number): number {
  return a + b;
}

export class Functions {
  public title: string = 'Calculator';

  private readonly _version: string = '1.0.0';

  public multiply(a: number, b: number): number {
    return a * b;
  }

  substract(a: number, b: number): number {
    return a - b;
  }

  divide(a: number, b: number) {
    return a / b;
  }

  public static square(a: number) {
    return a * a;
  }
}
