import Mathlib

/-!
# Wach lattices over the cyclotomic tower: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about crystalline `E`-representations `V` of the absolute Galois
group `G_F` of a finite unramified extension `F/ℚ_p` (`p` odd, `E` containing the images of the
embeddings of `F(ζ_p)`), their Hodge–Tate weights labelled by
the embeddings of `F` into `E`, and the Wach lattice `N(T)` of a `G_F`-stable `O_E`-lattice `T`
inside Fontaine's étale `(φ,Γ)`-module `D(T)` over `O_E ⊗ A_F` (PadicPeriodRings §§4.1–4.2,
PhiGammaModulesAndIwasawaCohomology §§1.0, 6.0). Neither Mathlib nor Tau Ceti has these carriers at
the pins. Mathlib has the absolute Galois group `Field.absoluteGaloisGroup`, continuous group
cohomology (`ContinuousCohomology`), Witt vectors with `WittVector.fontaineTheta` and isocrystals
`WittVector.Isocrystal`, the de Rham period rings `BDeRhamPlus` and `BDeRham`, and power and Laurent
series; Tau Ceti has the local cyclotomic character `TauCeti.continuousLocalCyclotomicCharacter`.
None of these gives the crystalline period ring `B_cris` and the functor `D_cris`, crystalline
representations and their Hodge–Tate weights, the ring `A_F` with its Frobenius
`φ(π) = (1 + π)^p − 1` and its `Γ_F`-action `γ(π) = (1 + π)^{χ(γ)} − 1`, the functor `D`, or Wach
modules.

* The reduction of Wach lattices modulo `λ` and the crystallinity criterion (6.4, 6.5): if
  `HT_i(V) ⊂ [−a_i, b_i]`, the reduced invariant Wach lattice `N̄(T)`, the `Γ_F^{tor}`-invariants
  of `N(T)/λ`, is a family of free `k[[X]]`-lattices of rank `dim V` with
  `φ_i^*N̄_{i−1} ⊂ X^{−a_i}N̄_i`, `X^{b_i}N̄_i ⊂ φ_i^*N̄_{i−1}` and `(γ − 1)N̄_i ⊂ XN̄_i`, on which
  `X^{−1}(γ − 1)` has characteristic polynomial `∏_{u∈HT_i(V)}(Y − ū)` modulo `X`; conversely a
  spanning finite free `O_E ⊗ A_F^+`-submodule of `D(T)` with the height and `Γ` conditions forces
  `V` to be crystalline and is its Wach lattice. It lacks crystalline representations with
  labelled Hodge–Tate weights, the ring `O_E ⊗ W(k_F)[[π]]` with its Frobenius and `Γ_F`-action, the
  functor `D`, the Wach lattice `N(T)`, and the field `k((X))` as the `Γ_F^{tor}`-invariants of
  `k((π))` with the induced `φ` and `γ`.
* The residual bound for admissible classes (6.9 (3)): for position data in position, the classes
  `z ∈ H¹(G_F, (T₀/λ)(χ̄_1^{−1}))` whose extension of `k(χ̄_1)` by `T₀/λ` is admissible form a
  subspace of dimension at most `d = Σ_i #{u ∈ U_i : u < w_i}`. It lacks, besides these, crystalline
  characters with prescribed labelled weights, the full representations and the admissible
  modules they define (lattices in sums of crystalline representations with prescribed weights and
  residual characteristic polynomials), and the models of admissible modules.
* The annihilators of the cokernel of Wach lattices (6.10 (1)–(3)): for a surjection
  `f : T₁ ↠ T₂` of stable lattices in crystalline representations with `HT_i(T₁) ⊂ [−M_i, h_i]`
  and `H = max_i(M_i + h_i)`, each `e_iN(T₂)/f(e_iN(T₁))` is killed by `π^H` and by `p^{e_W}`,
  `e_W = ⌊Hp/(p − 1)² + 3 + log_p(H + 1)⌋`. It lacks the Wach lattices `N(T₁)`, `N(T₂)` and the map
  between them that `f` induces.
* The carries of rank-one subquotients (6.11): for a filtration of `T/λT` with `t` graded pieces
  `k(χ̄_s)`, the lattices induced by `N̄(T)` are `X^{c_s(i)}N̄(O_E(χ_s))_i` with
  `0 ≤ w_{i,s} + p·c_s(i − 1) − c_s(i) ≤ h`, `(p − 1)|c_s(i)| ≤ h`, and a lower bound for the sum of
  the exponents by the `t` smallest weights. It lacks, besides the reduced Wach lattice, the exact
  functor `D̄` from finite `k[G_F]`-modules to étale `(φ,γ)`-modules over `k((X))` and the lattices
  it induces on subquotients.

The semilinear algebra of lattice families over `k((X))` (6.6) is statable in Mathlib for any
commuting endomorphisms `φ`, `γ` of `LaurentSeries k` as in 6.6, with semilinear maps and
`Module.End.maxGenEigenspace`; it is a step of the route to the residual bound, not a headline,
and it is not stated here. The counting theorem 6.8 and the `ψ`-statements of 6.7 are stated over
the cyclotomic ring `k((π))^{Γ_F^{tor}}` and need, besides, the Herr complex of a family and polar
Herr pairs; they are steps of the same route and are not stated here. The descent lemma
6.10 (2), a statement about an algebra over `ℤ_p` with an automorphism `γ′`, is statable in
Mathlib; it is a step of the route to the cokernel bound, not a headline, and it is not stated
here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.WachLatticesOverTheCyclotomicTower

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.WachLatticesOverTheCyclotomicTower
