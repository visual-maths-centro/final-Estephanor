
ArrayList<Cell> cells;


void setup() {
  size(1000, 1000);



  cells = new ArrayList<Cell>();

  // Se agrega la primer celula que va en el centro
  Cell centerCell = new Cell(width / 2.0, height / 2.0, 10, width / 2.0, height / 2.0);
  cells.add(centerCell);
}
int tiempo = 0;
void draw() {
  
  background(0);

  if (tiempo > 2) {
    addNewCell();
    tiempo = 60;
  }

  Cells();

  tiempo++;
}
//------

/**
 * Este metodo agrega una nueva celula al coral.
 */
void addNewCell() {

  // 1. Se crea una nueva celula con posicion y radio aleatorio
  PVector randomPos = new PVector(random(width), random(height));
  PVector newPos = new PVector();
  PVector cCell = new PVector();
  float cCellR = 2;
  float cRadius = random(1, 11);
  float cellDis = width + height;


  

  for (int i = 0; i < cells.size(); i++) {
    
    Cell cellL = cells.get(i);
    PVector lastPos = new PVector(cellL.position.x, cellL.position.y);
    float newDist = lastPos.dist(randomPos)*1.5;
    if (newDist < cellDis) {
      cellDis = newDist;
      cCell.x = lastPos.x;
      cCell.y = lastPos.y;
      cCellR = cellL.radius;
      
    }
  }

  newPos = randomPos.copy();
  newPos.sub(cCell);
  float TRadius = cRadius + cCellR;
  float spCells = TRadius/cellDis;
  cells.add(new Cell(cCell.x+newPos.x*spCells, cCell.y+newPos.y*spCells*random(2), cRadius, cCell.x, cCell.y));
}

void Cells() {
  for (Cell aCell : cells) {
    aCell.render();
  }
}

