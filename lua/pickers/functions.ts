export function add(a: number, b: number): number {
  return a + b;
}
export class Functions {
  public title: string = 'Calculator';
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
