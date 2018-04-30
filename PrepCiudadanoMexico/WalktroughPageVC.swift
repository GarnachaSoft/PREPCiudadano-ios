import UIKit

class WalktroughPageVC: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllersList:[UIViewController] = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let wtPage1 = storyBoard.instantiateViewController(withIdentifier: "wtPage1")
        let wtPage2 = storyBoard.instantiateViewController(withIdentifier: "wtPage2")
        let wtPage3 = storyBoard.instantiateViewController(withIdentifier: "wtPage3")
        
        return [wtPage1,wtPage2,wtPage3]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstPage = viewControllersList.first{
            
            self.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    //Esta funcion espera retornar el VC anterior al que le diste al PVC y esta en pantalla. Nil si no existe uno anterior
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //El Index del VC anterior al que esta en pantalla.
        guard let index = viewControllersList.index(of: viewController)else{return nil}
        
        let previousIndex = index - 1
        
        //Si el Index anterior es menor a 0 regresa nil a la funcion
        guard previousIndex >= 0 else {return nil}
        
        //Si la cantidad de VC es menor al index anterior regresa nil a la funcion
        guard viewControllersList.count > previousIndex else {return nil}
        
        
        return viewControllersList[previousIndex ]
        
    }
    
    //Esta funcion espera retornar el VC posterior al que le diste al PVC y esta en pantalla. Nil si no existe uno posterior
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        guard let index = viewControllersList.index(of: viewController)else{return nil}
        
        let nextIndex = index + 1
        
        guard viewControllersList.count > nextIndex || viewControllersList.count != nextIndex else {return nil}
        
        return viewControllersList[nextIndex ]
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

