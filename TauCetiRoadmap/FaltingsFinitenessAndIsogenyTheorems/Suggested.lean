import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.BaseChange
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Ring
import TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois

/-!
# FaltingsFinitenessAndIsogenyTheorems: representative target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It records the
definitions and theorem signatures of the roadmap that can be stated against the pinned Mathlib and
Tau Ceti APIs. These are suggested forms, not an exhaustive checklist. Every theorem
is proved by `sorry`; the definitions have real bodies.

Design choices made explicit here:

* Faltings' degree of a metrized line bundle on `Spec 𝓞 K` is recorded on fractional ideals with
  archimedean scalars, `‖x‖_v = c v * v x`; the weight of an infinite place is `InfinitePlace.mult`
  (`2` at a complex place), which is what makes the degree independent of the chosen section.
* Zarhin's quaternion matrix is the matrix of right multiplication by `a + b i + c j + d k`; only the
  identity `v * vᵀ = (a² + b² + c² + d²) • 1` is used.
* `V ^ 4` is `Fin 4 → V` and `V ^ 8` is `(Fin 4 → V) × (Fin 4 → V)`; a `4 × 4` matrix acts through
  the coefficients (`matAct`), commuting with any group acting diagonally.
* Elliptic curves are Mathlib Weierstrass curves with `IsElliptic`; their homomorphism groups are Tau
  Ceti's `TauCeti.Isogeny.Hom`, and "`K`-isogenous" means a nonzero element of that group.

The enriched carriers for abelian varieties with Tate modules, polarizations and semiabelian models
are not available at the pins, so their finiteness theorems are README targets; the closing comment
lists them. The worked rational-points application in the README states its geometric hypotheses explicitly.
-/

namespace TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

open NumberField Polynomial
open scoped nonZeroDivisors Matrix TensorProduct WeierstrassCurve

/-! ## Milestones on pinned carriers -/

open scoped Classical in
/-- The rational Tate representation of an elliptic curve, obtained from its integral
Galois action by extension of scalars (R28.6.2). -/
noncomputable def ellipticRationalRepresentation {K : Type*} [Field K]
    (W : WeierstrassCurve K) [W.IsElliptic] (l : ℕ) [Fact l.Prime] :
    Representation ℚ_[l] (Field.absoluteGaloisGroup K)
      (ℚ_[l] ⊗[ℤ_[l]] TauCeti.TateModule l (W⁄(AlgebraicClosure K)).toAffine.Point) :=
  (Module.End.baseChangeHom ℤ_[l] ℚ_[l] _).toMonoidHom.comp
    (W.tateModuleGaloisRepresentation (K := AlgebraicClosure K) l)

/-- The rational Tate module of an elliptic curve over a number field is semisimple
(R28.6.2 `elliptic_semisimple`, Faltings' Satz 3 in dimension one). -/
theorem elliptic_semisimple {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) [W.IsElliptic] (l : ℕ) [Fact l.Prime] :
    IsSemisimpleModule (MonoidAlgebra ℚ_[l] (Field.absoluteGaloisGroup K))
      (ellipticRationalRepresentation W l).asModule := by
  sorry

open scoped Classical in
/-- The canonical integral Tate Hom comparison for elliptic curves over a number field
is an isomorphism, characterized on pure tensors by the induced point map (R28.6.3). -/
theorem elliptic_tate_hom_iso {K : Type*} [Field K] [NumberField K]
    (W W' : WeierstrassCurve K) [W.IsElliptic] [W'.IsElliptic]
    (l : ℕ) [Fact l.Prime] :
    let ρ := W.tateModuleGaloisRepresentation (K := AlgebraicClosure K) l
    let ρ' := W'.tateModuleGaloisRepresentation (K := AlgebraicClosure K) l
    ∃ e : (ℤ_[l] ⊗[ℤ] TauCeti.Isogeny.Hom W.toAffine W'.toAffine) ≃ₗ[ℤ_[l]]
        Representation.IntertwiningMap ρ ρ',
      ∀ (f : TauCeti.Isogeny.Hom W.toAffine W'.toAffine)
        (x : TauCeti.TateModule l (W⁄(AlgebraicClosure K)).toAffine.Point),
        e (1 ⊗ₜ[ℤ] f) x = TauCeti.TateModule.mapLinearMap
          (f.map (algebraMap K (AlgebraicClosure K))).pointMapHom x := by
  sorry

/-- Two elliptic curves over a number field are isogenous exactly when their rational
Tate representations are isomorphic (the Tate-module equivalence in R28.6.4). -/
theorem elliptic_isogenous_iff_rationalTateModule {K : Type*} [Field K] [NumberField K]
    (W W' : WeierstrassCurve K) [W.IsElliptic] [W'.IsElliptic]
    (l : ℕ) [Fact l.Prime] :
    (∃ f : TauCeti.Isogeny.Hom W.toAffine W'.toAffine, f ≠ 0) ↔
      Nonempty ((ellipticRationalRepresentation W l).asModule ≃ₗ[
        MonoidAlgebra ℚ_[l] (Field.absoluteGaloisGroup K)]
          (ellipticRationalRepresentation W' l).asModule) := by
  sorry

/-- An abelian variety over any field has finitely many direct factors up to isomorphism
(R28.5.12 `finite_directFactors`, Milne I Theorem 15.3). -/
theorem finite_directFactors {k : Type*} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) :
    ∃ S : Finset (TauCeti.AlgebraicGeometry.AbelianVariety k),
      ∀ B C : TauCeti.AlgebraicGeometry.AbelianVariety k,
        Nonempty (CategoryTheory.Iso A (B.prod C)) →
        ∃ B' ∈ S, Nonempty (CategoryTheory.Iso B B') := by
  sorry

/-! ## Layer R28.1: Semiabelian models, modular heights and finiteness of bounded height -/

section Degree

variable {K : Type*} [Field K] [NumberField K]

/-- Faltings' degree (§3, pp. 353–354) of the metrized line bundle on `Spec 𝓞 K` given by the
nonzero fractional ideal `I`, with positive `c v` and norm `‖x‖_v = c v * v x` at the infinite place `v`:
`deg = log #(I / 𝓞 K • p) − Σ_v ε_v log ‖p‖_v` for any nonzero `p ∈ I`, which equals
`− log N(I) − Σ_v ε_v log (c v)` (see `fracIdealDegree_eq_of_mem`). This is
ArakelovGeometryAndAbelianHeights' `HermitianBundle.arakelovDegree` of `(I, c_v|·|_v)`
(R28.1.5). -/
noncomputable def fracIdealDegree (I : FractionalIdeal (𝓞 K)⁰ K) (c : InfinitePlace K → ℝ) : ℝ :=
  -Real.log (FractionalIdeal.absNorm I : ℝ) - ∑ v : InfinitePlace K, (v.mult : ℝ) * Real.log (c v)

/-- Independence of the section: computing the degree with any nonzero `p ∈ I` gives the same
value (the product formula, with the weights `InfinitePlace.mult`). -/
theorem fracIdealDegree_eq_of_mem (I : FractionalIdeal (𝓞 K)⁰ K) (c : InfinitePlace K → ℝ)
    (hc : ∀ v, 0 < c v) {p : K} (hp : p ∈ I) (hp0 : p ≠ 0) :
    fracIdealDegree I c =
      Real.log ((FractionalIdeal.absNorm (FractionalIdeal.spanSingleton (𝓞 K)⁰ p) : ℝ) /
          (FractionalIdeal.absNorm I : ℝ)) -
        ∑ v : InfinitePlace K, (v.mult : ℝ) * Real.log (c v * v p) := by
  sorry

/-- Rescaling every archimedean norm by `t` changes the degree by `− [K : ℚ] log t`: the weights
`InfinitePlace.mult` sum to `[K : ℚ]`. A definition with weight `1` at complex places fails this. -/
theorem fracIdealDegree_smul (I : FractionalIdeal (𝓞 K)⁰ K) (c : InfinitePlace K → ℝ)
    (hc : ∀ v, 0 < c v) {t : ℝ} (ht : 0 < t) :
    fracIdealDegree I (fun v => t * c v) =
      fracIdealDegree I c - (Module.finrank ℚ K : ℝ) * Real.log t := by
  sorry

end Degree

/-! ## Layer R28.4: Semisimplicity and the Tate conjecture -/

section Quaternion

/-- The matrix of right multiplication by `a + b i + c j + d k` in the basis `1, i, j, k`, as in
Zarhin's trick (R28.4.2). -/
def quatMatrix {R : Type*} [CommRing R] (a b c d : R) : Matrix (Fin 4) (Fin 4) R :=
  !![a, -b, -c, -d; b, a, d, -c; c, -d, a, b; d, c, -b, a]

/-- The quaternion matrix times its transpose is the sum of the four squares times the
identity (R28.4.2). -/
theorem quatMatrix_mul_transpose {R : Type*} [CommRing R] (a b c d : R) :
    quatMatrix a b c d * (quatMatrix a b c d)ᵀ = (a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) • 1 := by
  sorry

/-- The transpose times the quaternion matrix has the same scalar value (R28.4.2). -/
theorem quatMatrix_transpose_mul {R : Type*} [CommRing R] (a b c d : R) :
    (quatMatrix a b c d)ᵀ * quatMatrix a b c d = (a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) • 1 := by
  sorry

/-- `−1` is a sum of four squares in `ℤ_l` for every prime `l`, `l = 2` included (R28.4.1). -/
theorem exists_sum_four_squares_eq_neg_one (l : ℕ) [Fact l.Prime] :
    ∃ a b c d : ℤ_[l], a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = -1 := by
  sorry

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

open scoped Matrix.Module in
/-- The `k`-linear map of Mathlib's scoped `Matrix.Module.matrixModule` action of
`4 × 4` matrices on `V ^ 4 = Fin 4 → V` (R28.4.2). -/
def matAct (v : Matrix (Fin 4) (Fin 4) k) : (Fin 4 → V) →ₗ[k] (Fin 4 → V) where
  toFun x := v • x
  map_add' := smul_add v
  map_smul' r x := by
    ext i
    simp [Matrix.Module.smul_apply, Finset.smul_sum, smul_smul, mul_comm]

/-- The orthogonal-sum form on `V ^ 8 = V ^ 4 × V ^ 4` induced by a form `B` on `V`.
It evaluates Tau Ceti's `LinearMap.BilinForm.prod` on the two coordinatewise sums over
`Fin 4`; those coordinatewise forms have no dedicated pinned carrier (R28.4.2). -/
def sumForm (B : LinearMap.BilinForm k V) (x y : (Fin 4 → V) × (Fin 4 → V)) : k :=
  ∑ i, B (x.1 i) (y.1 i) + ∑ i, B (x.2 i) (y.2 i)

/-- An alternating form has alternating orthogonal sum on the eight copies of `V`
(R28.4.2). -/
theorem sumForm_isAlt (B : LinearMap.BilinForm k V) (hB : B.IsAlt)
    (x : (Fin 4 → V) × (Fin 4 → V)) : sumForm B x x = 0 := by
  sorry

/-- Within each block the form is the sum of the four pairings, and distinct blocks
are orthogonal (R28.4.2). -/
theorem sumForm_block (B : LinearMap.BilinForm k V) (x y : Fin 4 → V) :
    sumForm B (x, 0) (y, 0) = ∑ i, B (x i) (y i) ∧
      sumForm B (0, x) (0, y) = ∑ i, B (x i) (y i) ∧
      sumForm B (x, 0) (0, y) = 0 ∧ sumForm B (0, x) (y, 0) = 0 := by
  sorry

namespace QuaternionIsotropic

/-- Zarhin's subspace `W₁ = {(x, v x) : x ∈ W⁴} ⊕ {(y, −v y) : y ∈ (W^⊥)⁴}` of `V ^ 8` (R28.4.2). -/
def subspace (B : LinearMap.BilinForm k V) (v : Matrix (Fin 4) (Fin 4) k) (W : Submodule k V) :
    Submodule k ((Fin 4 → V) × (Fin 4 → V)) :=
  (Submodule.pi Set.univ fun _ => W).map (LinearMap.prod LinearMap.id (matAct v)) ⊔
    (Submodule.pi Set.univ fun _ => B.orthogonal W).map (LinearMap.prod LinearMap.id (-matAct v))

/-- `W₁` is isotropic for the orthogonal-sum form when `B` is alternating and `v vᵀ = −1`. -/
theorem subspace_isotropic (B : LinearMap.BilinForm k V) (hB : B.IsAlt)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1) (W : Submodule k V)
    {x y : (Fin 4 → V) × (Fin 4 → V)} (hx : x ∈ subspace B v W) (hy : y ∈ subspace B v W) :
    sumForm B x y = 0 := by
  sorry

/-- `dim W₁ = 4 · dim V = ½ · dim V ^ 8`, so `W₁` is maximal isotropic. -/
theorem finrank_subspace [CharZero k] [FiniteDimensional k V] (B : LinearMap.BilinForm k V)
    (hB : B.IsAlt) (hnd : B.Nondegenerate) (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1)
    (W : Submodule k V) :
    Module.finrank k (subspace B v W) = 4 * Module.finrank k V := by
  sorry

/-- A group acting on `V` by similitudes of `B` and preserving `W` preserves `W₁` (acting
diagonally on `V ^ 8`). -/
theorem subspace_invariant {G : Type*} [Group G] (ρ : Representation k G V)
    (B : LinearMap.BilinForm k V) (χ : G → k) (hρ : ∀ g x y, B (ρ g x) (ρ g y) = χ g * B x y)
    (hχ : ∀ g, χ g ≠ 0) (v : Matrix (Fin 4) (Fin 4) k) (W : Submodule k V)
    (hW : ∀ g, ∀ x ∈ W, ρ g x ∈ W) (g : G) {x : (Fin 4 → V) × (Fin 4 → V)}
    (hx : x ∈ subspace B v W) : ((fun i => ρ g (x.1 i)), (fun i => ρ g (x.2 i))) ∈ subspace B v W := by
  sorry

/-- The recovery map `(s, t) ↦ ½ (s + v⁻¹ t)` sends `W₁` onto `W⁴`. -/
theorem map_recover_subspace [CharZero k] (B : LinearMap.BilinForm k V) (hB : B.IsAlt)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1) (W : Submodule k V) :
    (subspace B v W).map
        ((1 / 2 : k) • (LinearMap.fst k _ _ + (matAct (-vᵀ)).comp (LinearMap.snd k _ _))) =
      Submodule.pi Set.univ fun _ => W := by
  sorry

/-- The quaternion subspace has half the ambient dimension over every field of
characteristic different from two (R28.4.2). -/
theorem finrank_subspace_of_two_ne_zero (h2 : (2 : k) ≠ 0) [FiniteDimensional k V]
    (B : LinearMap.BilinForm k V) (hB : B.IsAlt) (hnd : B.Nondegenerate)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1) (W : Submodule k V) :
    Module.finrank k (subspace B v W) = 4 * Module.finrank k V := by
  sorry

/-- The recovery map sends the quaternion subspace onto `W⁴` whenever two is invertible
(R28.4.2). -/
theorem map_recover_subspace_of_two_ne_zero (h2 : (2 : k) ≠ 0)
    (B : LinearMap.BilinForm k V) (hB : B.IsAlt)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * vᵀ = -1) (W : Submodule k V) :
    (subspace B v W).map
        ((1 / 2 : k) • (LinearMap.fst k _ _ + (matAct (-vᵀ)).comp (LinearMap.snd k _ _))) =
      Submodule.pi Set.univ fun _ => W := by
  sorry

/-- The identity graph has nonzero pairing on a symplectic pair in characteristic
different from two, showing why the negative norm identity is essential (R28.4.2). -/
theorem not_isotropic_identity (h2 : (2 : k) ≠ 0)
    (B : LinearMap.BilinForm k V) (u w : V) (huw : B u w = 1) :
    sumForm B (Pi.single 0 u, Pi.single 0 u) (Pi.single 0 w, Pi.single 0 w) ≠ 0 := by
  sorry

end QuaternionIsotropic

end Quaternion

/-! ## Layer R28.5: Finiteness of isogeny classes and the Shafarevich conjecture -/

section WeilPolynomials

/-- Finitely many monic integer polynomials of degree `n` have all complex roots of absolute
value `r` (R28.5.1), a specialization of `Polynomial.finite_mahlerMeasure_le` to fixed root radius
through `Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots` with bound `(max 1 r) ^ n`.
With `r = q ^ (w / 2)` these are the Weil `q`-polynomials of weight `w`. -/
theorem finite_weilPolynomials (r : ℝ) (n : ℕ) :
    {P : ℤ[X] | P.Monic ∧ P.natDegree = n ∧
      ∀ z ∈ (P.map (Int.castRingHom ℂ)).roots, ‖z‖ = r}.Finite := by
  sorry

end WeilPolynomials

section Lattices

variable (l : ℕ) [Fact l.Prime]

/-- Finitely many stable lattices up to isomorphism in a semisimple `ℚ_l`-representation
(R28.5.9): there is a finite set of stable lattices such that every stable lattice is the image of
one of them under a `G`-equivariant automorphism of `V`. -/
theorem finite_stableLattices {G V : Type*} [Group G] [AddCommGroup V] [Module ℚ_[l] V]
    [FiniteDimensional ℚ_[l] V] [Module ℤ_[l] V] [IsScalarTower ℤ_[l] ℚ_[l] V]
    (ρ : Representation ℚ_[l] G V)
    (hss : ∀ W : Submodule ℚ_[l] V, (∀ g, ∀ x ∈ W, ρ g x ∈ W) →
      ∃ W' : Submodule ℚ_[l] V, IsCompl W W' ∧ ∀ g, ∀ x ∈ W', ρ g x ∈ W')
    (hexists : ∃ Λ : Submodule ℤ_[l] V, Submodule.IsLattice ℚ_[l] Λ ∧
      ∀ g, ∀ x ∈ Λ, ρ g x ∈ Λ) :
    ∃ F : Finset (Submodule ℤ_[l] V),
      (∀ Λ ∈ F, Submodule.IsLattice ℚ_[l] Λ ∧ ∀ g, ∀ x ∈ Λ, ρ g x ∈ Λ) ∧
      ∀ Λ : Submodule ℤ_[l] V, Submodule.IsLattice ℚ_[l] Λ →
      (∀ g, ∀ x ∈ Λ, ρ g x ∈ Λ) →
      ∃ Λ' ∈ F, ∃ φ : V ≃ₗ[ℚ_[l]] V, (∀ g x, φ (ρ g x) = ρ g (φ x)) ∧ ∀ x, x ∈ Λ ↔ φ x ∈ Λ' := by
  sorry

end Lattices

namespace IntegralOrder

/-- Integral idempotents in an order in a semisimple rational algebra have finitely many
conjugacy classes under its units (R28.5.12, Milne I Proposition 15.4). -/
theorem finite_idempotentConjugacyClasses {O : Type*} [Ring O]
    [Module.Finite ℤ O] [Module.Free ℤ O] [IsSemisimpleRing (ℚ ⊗[ℤ] O)] :
    ∃ F : Finset O, (∀ e ∈ F, e * e = e) ∧
      ∀ e : O, e * e = e → ∃ r ∈ F, ∃ u : Oˣ, (u : O) * e * (↑(u⁻¹) : O) = r := by
  sorry

end IntegralOrder

/-! ## Layer R28.6: Elliptic curves and the integral commutant -/

section Elliptic

open TauCeti.Isogeny

/-- R28.6.6: if `E'` has only integer endomorphisms and `E` maps nontrivially to `E'`, then
`Hom(E, E')` is infinite cyclic. -/
theorem hom_isogenous_cyclic {F : Type*} [Field F] [CharZero F]
    {W W' : WeierstrassCurve.Affine F} [W.IsElliptic] [W'.IsElliptic]
    (hEnd : ∀ f : Hom W' W', ∃ n : ℤ, f = n • Hom.id W')
    (hne : ∃ f : Hom W W', f ≠ 0) :
    ∃ f₀ : Hom W W', f₀ ≠ 0 ∧ ∀ f : Hom W W', ∃! n : ℤ, f = n • f₀ := by
  sorry

/-- R28.6.5: the `K`-isogeny class of an elliptic curve over a number field contains only
finitely many curves up to `K`-isomorphism (Satz 6 for `g = d = 1`). -/
theorem finite_ellipticIsogenyClass {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) [W.IsElliptic] :
    ∃ S : Finset (WeierstrassCurve K), ∀ W' : WeierstrassCurve K, W'.IsElliptic →
      (∃ f : Hom W.toAffine W'.toAffine, f ≠ 0) →
      ∃ W'' ∈ S, ∃ C : WeierstrassCurve.VariableChange K, C • W' = W'' := by
  sorry

end Elliptic

section Centralizers

/-- The dual-number action by `lE₁₂` has a nonsurjective centralizer reduction map:
`diag(1,0)` modulo `l` has no commuting integral lift (R28.6.7). -/
theorem order_centralizer_reduce_counterexample (l : ℕ) [Fact l.Prime] :
    let N : Matrix (Fin 2) (Fin 2) ℤ_[l] := !![0, (l : ℤ_[l]); 0, 0]
    N.map (PadicInt.toZMod : ℤ_[l] →+* ZMod l) = 0 ∧
      ¬ ∃ B : Matrix (Fin 2) (Fin 2) ℤ_[l], B * N = N * B ∧
        B.map PadicInt.toZMod = !![1, 0; 0, 0] := by
  sorry

end Centralizers

/-!
The README states the remaining interfaces, including supplied aliases, with their hypotheses and sources.
They use abelian varieties with Tate modules, polarizations, semiabelian models, heights, or
arithmetic Frobenius data without pinned interfaces. By layer:

* R28.1: `hodgeLine_picard`, `SemiabelianModel.unique`, `CorrespondenceStack`,
  `StablePicard.lie_iso_firstDirectImage`, `StableCurve.relativeSerreDuality`,
  `modular_hodge_commensurable`, `metrizedDegree`, `modularHeight`, `HermitianMetric.HasLogSingularities`,
  `hodgeMetric_hasLogSingularities`, `northcott_logSingular` (the fixed-field specialization of
  ArakelovGeometryAndAbelianHeights §5.2, using the positive maximum of section norms and
  comparing normalized degree with `Projectivization.logHeight x / [K : ℚ]`),
  `hermiteMinkowski` (the fixed-degree, fixed-algebraic-closure adapter to
  ArithmeticGaloisDuality R02.3.1 `RestrictedRamification.finite_unramifiedOutside_of_finrank_le`;
  its ramification-support library interface is
  `TauCeti.NumberField.finite_of_finrank_le_of_ramifiedSupport_subset`, from Tau Ceti
  revision `4e9057a126044e69f54ed3b475fd1386de3b14cf`),
  `finite_forms_semiabelian`, `finite_ppav_bounded_height`, `Polarization.kernelPairing`,
  `Polarization.descend`, `principalReduction_uniform`.
* R28.2: `height_isogeny`, `height_isogeny_padicVal_bounds`, `inertia_trivial_quotient`,
  `card_invDiff_level`, `det_hodgeTate_local`, `ladicChar_eq_cyclotomic_pow_mul_finite`,
  `det_induced_at_l`, `frobenius_weights_induced`, `sum_local_dims_eq`.
* R28.3: `closure_tower_lDivisible` (specialized from
  FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.21, with the quotient of R07.1.20a),
  `toric_intersection_lDivisible`, `card_invDiff_shifted`,
  `height_stationary`, `PolarizationReduction`, `ppav_pow`, `tate_invariance`,
  `exists_isomorphic_quotients`.
* R28.4: `QuaternionIsotropic.subspace_tateModule`, `exists_idempotent_image_of_isotropic`, `exists_idempotent_image`, `tate_semisimple`,
  `tate_end_iso`, `tate_hom_iso`, `isogenous_iff_localFactors`, `finite_of_tateModules_iso`.
* R28.5: `frobeniusTestSet`, `finite_isogenyClasses`, `auxBound`, `auxPoly_spec`, `twistedDet_unramified`,
  `modl_char_cyclotomic`, `raynaud_determinant`, `height_eq_of_large_prime_isogeny`,
  `finite_padicVal_heightQuotient`, `shafarevich`, `zarhinTrick` (supplied by
  PadicDifferentialEquationsAndRigidCohomology RD.5.116), `maximalOrder_lattices_iso`,
  `IntegralOrder.finite_closedConjugacyOrbits`, `shafarevich_unpolarized`, `jacobianCanonicalPolarization`,
  `rationalTorelli`, `finite_curves_goodReduction`.
* R28.6: `ellipticBridge`,
  `elliptic_isogenous_iff_ap`, `quotient_torsion_image`, `order_centralizer_reduce`, `commutant_almostAll`.
-/

end TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems
