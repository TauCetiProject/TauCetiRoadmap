import Mathlib
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic

/-!
# Formal algebraic connections, loop gauge groupoids and opers: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions (with real bodies) that they need.

Stated here:

* F2.4: regular formal connections over `R⟦t⟧` for a `ℚ`-algebra `R` are classified by their
  fibre at `t = 0`: gauge isomorphisms correspond bijectively to their constant terms
  (`regularGauge_constantCoeff_bijective`).
* F3A.2: for a connected reductive complex group `G` and every commutative `ℂ`-algebra `R`,
  every formal loop factors as a polynomial loop times a positive formal loop
  (`formalLoop_eq_polynomial_mul_positive`), the surjectivity half of
  `G(R[t,t⁻¹])/G(R[t]) ≃ G(R((t)))/G(R⟦t⟧)`.
* F6.2: the cyclic-vector theorem: over a differential field of characteristic zero with
  nonzero derivation, every finite-dimensional differential module has a vector whose iterates
  under the connection form a basis (`exists_cyclicVector`, with the Leibniz predicate
  `IsDifferentialModuleMap`).

Not statable at the pins, and therefore not stated:

* F2.1/F2.3, equivalence of zero curvature with the bracket identity `∇_[ξ,η] = [∇_ξ, ∇_η]`
  when `Ω¹_{A/k}` is finite projective: the ordinary form connection with its curvature
  `M → M ⊗ Ω²` (CrystallineCohomology CR.1.3) is not a carrier at the pins.
* F4.3, Drinfeld–Sokolov canonical form and the Chevalley–Kostant restriction
  `S(𝔤*)^G ≃ S(𝔥*)^W`: neither the Lie algebra of a pinned split group over `R((t))` with its
  principal grading nor the Weyl-group action on `Sym(𝔥*)` exists at the pins.
* F4–F5, intrinsic opers and the classification of continuous characters of `Fun Op(D×)`:
  opers (connections with a transverse Borel reduction) are not a carrier at the pins.
* F6.1 and F6.5, the Frenkel–Zhu theorem that every flat `G`-bundle on the punctured formal disc
  has an oper structure, and triviality of `G`-torsors over `ℂ((t))`: flat principal bundles over
  `ℂ((t))`, torsors under group schemes and opers are not carriers at the pins.
* F7–F8, the Drinfeld–Sokolov Poisson structure, the Miura screening-kernel description and the
  isomonodromy Lie algebroid: these need the completed function algebra of opers and its
  continuous cotangent module, which are not carriers at the pins.
-/

namespace TauCetiRoadmap.FormalConnectionsOpers

noncomputable section

universe u v

/-! ## Layer 2 (F2): regular formal connections -/

section RegularConnections

open PowerSeries

/-- The left gauge action on connection matrices `d + A dt` over `R⟦t⟧`:
`gauge(g, A) = g A g⁻¹ - (dg/dt) g⁻¹`, so that `gauge(h, gauge(g, A)) = gauge(h g, A)`. -/
def regularGauge (R : Type u) [CommRing R] (n : Type) [Fintype n] [DecidableEq n]
    (g : Matrix.GeneralLinearGroup n R⟦X⟧) (A : Matrix n n R⟦X⟧) : Matrix n n R⟦X⟧ :=
  (g : Matrix n n R⟦X⟧) * A * ((g⁻¹ : Matrix.GeneralLinearGroup n R⟦X⟧) : Matrix n n R⟦X⟧) -
    (g : Matrix n n R⟦X⟧).map (fun f => PowerSeries.derivative (R := R) f) *
      ((g⁻¹ : Matrix.GeneralLinearGroup n R⟦X⟧) : Matrix n n R⟦X⟧)

/-- **Regular formal connections are determined by their fibre at `t = 0`** (README F2.4): over
a `ℚ`-algebra `R`, possibly nonreduced, for any two connection matrices `A`, `B` over `R⟦t⟧`,
taking the constant term is a bijection from gauge transformations carrying `A` to `B` onto
`GL_n(R)`. With `B = 0` this is the existence and uniqueness of a horizontal frame with
prescribed value at `t = 0`. The proof is the coefficient recursion
`(j + 1) g_(j+1) = Σ_(i ≤ j) (g_i A_(j-i) - B_(j-i) g_i)`, which divides by `j + 1`. -/
theorem regularGauge_constantCoeff_bijective (R : Type u) [CommRing R] [Algebra ℚ R]
    (n : Type) [Fintype n] [DecidableEq n] (A B : Matrix n n R⟦X⟧) :
    Function.Bijective
      (fun g : {g : Matrix.GeneralLinearGroup n R⟦X⟧ // regularGauge R n g A = B} =>
        Matrix.GeneralLinearGroup.map (PowerSeries.constantCoeff (R := R)) g.1) := by
  sorry

end RegularConnections

/-! ## Layer 3A (F3A): polynomial and formal loops -/

section PolynomialLoops

/-- Laurent series over a `k`-algebra `R` carry the coefficientwise `k`-algebra structure. This
selects it over the structure routed through `R⟦t⟧`, so that the coefficient maps below are
`k`-algebra maps for one fixed structure. -/
local instance (priority := high) laurentSeriesCoefficientAlgebra (k R : Type u) [CommRing k]
    [CommRing R] [Algebra k R] : Algebra k (LaurentSeries R) :=
  HahnSeries.instAlgebra

/-- The formal parameter `t` as a unit of `R((t))`. -/
def formalParameterUnit (R : Type u) [CommRing R] : (LaurentSeries R)ˣ where
  val := HahnSeries.single 1 1
  inv := HahnSeries.single (-1) 1
  val_inv := by simp [HahnSeries.single_mul_single]
  inv_val := by simp [HahnSeries.single_mul_single]

/-- The coefficient inclusion `R[t, t⁻¹] → R((t))`, sending `T 1` to `t`. -/
def laurentPolynomialToLaurentSeries (R : Type u) [CommRing R] :
    LaurentPolynomial R →ₐ[R] LaurentSeries R :=
  { LaurentPolynomial.eval₂ (algebraMap R (LaurentSeries R)) (formalParameterUnit R) with
    commutes' := fun r => LaurentPolynomial.eval₂_C _ _ r }

section CoefficientMaps

variable (k : Type u) [CommRing k] (H : Type u) [CommRing H] [HopfAlgebra k H]
  (R : Type u) [CommRing R] [Algebra k R]

/-- Polynomial loops `G(R[t,t⁻¹]) → G(R((t)))`, by post-composition on native Hopf points. -/
def polynomialLoopToFormal :
    TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentPolynomial R)) →*
      TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentSeries R)) :=
  TauCeti.AlgHom.mapValue (H := H) ((laurentPolynomialToLaurentSeries R).restrictScalars k)

/-- Positive formal loops `G(R⟦t⟧) → G(R((t)))`, by post-composition on native Hopf points. -/
def positiveLoopToFormal :
    TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (PowerSeries R)) →*
      TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k (LaurentSeries R)) :=
  TauCeti.AlgHom.mapValue (H := H) (HahnSeries.ofPowerSeriesAlg ℤ k)

end CoefficientMaps

/-- **Polynomial factorization of formal loops** (README F3A.2; Česnavičius, *The affine
Grassmannian as a presheaf quotient*, Theorem 19, with the `ℙ¹` input of Česnavičius–Fedorov,
Theorem 4.2): for a connected reductive group `G = Spec H` over `ℂ` and every commutative
`ℂ`-algebra `R`, including nonreduced ones, `G(R((t))) = G(R[t,t⁻¹]) · G(R⟦t⟧)`. Reductivity is
Tau Ceti's `reductiveCommHopfAlgProperty` (smooth, geometrically connected, trivial geometric
unipotent radical); over `ℂ` such a group is split, hence totally isotropic, which is the
hypothesis of the cited theorem. -/
theorem formalLoop_eq_polynomial_mul_positive
    (H : TauCeti.FiniteTypeCommHopfAlgCat ℂ) (hG : TauCeti.reductiveCommHopfAlgProperty ℂ H)
    (R : Type) [CommRing R] [Algebra ℂ R]
    (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of ℂ (LaurentSeries R))) :
    ∃ (p : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of ℂ (LaurentPolynomial R)))
      (q : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of ℂ (PowerSeries R))),
      g = polynomialLoopToFormal ℂ H R p * positiveLoopToFormal ℂ H R q := by
  sorry

end PolynomialLoops

/-! ## Layer 6 (F6): cyclic vectors -/

section CyclicVectors

open scoped Differential

/-- A differential module over the differential field `F` (Mathlib's `Differential F`: a field
with a chosen derivation `f ↦ f′`): an additive map `D : V → V` on an `F`-vector space obeying
the Leibniz rule `D (f • v) = f′ • v + f • D v`. -/
def IsDifferentialModuleMap (F : Type u) [Field F] [Differential F] {V : Type v}
    [AddCommGroup V] [Module F V] (D : V →+ V) : Prop :=
  ∀ (f : F) (v : V), D (f • v) = f′ • v + f • D v

/-- **Cyclic-vector theorem** (Deligne, *Équations différentielles à points singuliers
réguliers*, LNM 163, Ch. II, Lemme 1.3; README F6.2): over a differential field of
characteristic zero whose derivation is not zero, every finite-dimensional differential module
`(V, D)` has a vector `v` whose iterates `v, D v, …, D^(n-1) v`, `n = dim_F V`, are linearly
independent, hence a basis. Both hypotheses are needed: `D = 0` on `F²` over a field with the
zero derivation has no cyclic vector, and `∂ = d/dt` on `𝔽_p(t)` has `∂^p = 0`. -/
theorem exists_cyclicVector (F : Type u) [Field F] [Differential F] [CharZero F]
    (hd : (Differential.deriv : Derivation ℤ F F) ≠ 0) {V : Type v} [AddCommGroup V]
    [Module F V] [FiniteDimensional F V] (D : V →+ V) (hD : IsDifferentialModuleMap F D) :
    ∃ v : V, LinearIndependent F (fun i : Fin (Module.finrank F V) => (⇑D)^[i] v) := by
  sorry

end CyclicVectors

end

end TauCetiRoadmap.FormalConnectionsOpers
