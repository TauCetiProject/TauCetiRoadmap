import Mathlib
import TauCeti.RepresentationTheory.Quiver.Representation.Projective.EulerForm

/-!
# DG and A-infinity algebra: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations below suggest Lean forms for a few load-bearing milestones and
acceptance tests, so contributors and reviewers can converge on conventions. Discharging every
declaration here finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned
roadmap library: these are targets, not implementations.

The signatures deliberately expose both descriptions fixed by the roadmap. The implementation
stores the degree-one coderivation on the reduced tensor coalgebra of the degree-`-1` suspension;
users see unsuspended operations `m n` of degree `2-n` satisfying Keller's
`(-1)^(r+s*t)` identities. The helper `insertOperation` includes the Koszul sign produced when a
degree-`(2-s)` inner operation crosses the first `r` homogeneous inputs. Thus `stasheffSum` is an
element-level spelling of the map identity, not a second sign convention.
-/

namespace TauCetiRoadmap.DGAInfinity

open CategoryTheory
open scoped BigOperators DirectSum MonoidalCategory

universe u v w

/-! ## Signed graded operations and the first `A∞` interface -/

/-- A total module together with a genuine internal `ℤ`-grading. The planned public API also has
the equivalent `CategoryTheory.GradedObject` presentation. -/
structure InternalGrading (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A] where
  piece : ℤ → Submodule k A
  isInternal : DirectSum.IsInternal piece

namespace InternalGrading

variable {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]

/-- Membership in the degree-`p` summand. -/
def IsHomogeneous (G : InternalGrading k A) (p : ℤ) (x : A) : Prop :=
  x ∈ G.piece p

end InternalGrading

/-- Degree of a linear map between internally graded total modules. -/
def LinearHasDegree {k A B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup B] [Module k B]
    (GA : InternalGrading k A) (GB : InternalGrading k B) (q : ℤ)
    (f : A →ₗ[k] B) : Prop :=
  ∀ p x, GA.IsHomogeneous p x → GB.IsHomogeneous (p + q) (f x)

/-- A multilinear map has degree `q` when it adds `q` to the sum of the input degrees. -/
def MultilinearHasDegree {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    {n : ℕ} (G : InternalGrading k A) (q : ℤ)
    (f : MultilinearMap k (fun _ : Fin n ↦ A) A) : Prop :=
  ∀ (x : Fin n → A) (d : Fin n → ℤ),
    (∀ i, G.IsHomogeneous (d i) (x i)) →
      G.IsHomogeneous ((∑ i, d i) + q) (f x)

/-! ## The stored tensor-coalgebra representation -/

/-- The coaugmented tensor-word module `⊕_{n≥0} A^{⊗n}`.  The bar construction uses its
positive-length coideal below. -/
abbrev TensorWords (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A] :=
  ⨁ n : ℕ, TensorPower k n A

/-- The reduced tensor-word module `⊕_{n≥1} A^{⊗n}`. -/
abbrev ReducedTensorWords (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A] :=
  ⨁ n : {n : ℕ // 0 < n}, TensorPower k n.1 A

/-- Internal total-degree grading on reduced tensor words, induced from the grading of `A`. -/
noncomputable def reducedTensorWordsGrading {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] (G : InternalGrading k A) : InternalGrading k (ReducedTensorWords k A) := sorry

/-- Total grading on a fixed tensor power. -/
noncomputable def tensorPowerGrading {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] (G : InternalGrading k A) (n : ℕ) : InternalGrading k (TensorPower k n A) := sorry

/-- Total grading on a tensor product. -/
noncomputable def tensorProductGrading {k A B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup B] [Module k B]
    (GA : InternalGrading k A) (GB : InternalGrading k B) :
    InternalGrading k (TensorProduct k A B) := sorry

/-- The degree-`-1` suspension grading on the same total carrier. -/
noncomputable def suspensionGrading {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] (G : InternalGrading k A) : InternalGrading k A := sorry

/-- Deconcatenation on positive tensor words.  In tensor length `n` it sums over the `n-1`
nontrivial cuts. -/
noncomputable def deconcatenation {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A] :
    ReducedTensorWords k A →ₗ[k]
      TensorProduct k (ReducedTensorWords k A) (ReducedTensorWords k A) := sorry

/-- The signed endomorphism `D⊗1 + 1⊗D` on a tensor square.  The second term uses the Koszul
sign for a degree-`q` map crossing the first homogeneous tensor factor. -/
noncomputable def tensorCoderivationAction {k C : Type*} [CommRing k] [AddCommGroup C]
    [Module k C] (G : InternalGrading k C) (q : ℤ) (D : C →ₗ[k] C) :
    TensorProduct k C C →ₗ[k] TensorProduct k C C := sorry

/-- A homogeneous coderivation of the reduced tensor coalgebra.  The co-Leibniz equation is an
actual map equality, rather than a placeholder predicate. -/
structure TensorCoderivation (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A]
    (G : InternalGrading k A) (q : ℤ) where
  toLinearMap : ReducedTensorWords k A →ₗ[k] ReducedTensorWords k A
  degree : LinearHasDegree (reducedTensorWordsGrading G) (reducedTensorWordsGrading G) q toLinearMap
  coLeibniz : deconcatenation.comp toLinearMap =
    (tensorCoderivationAction (reducedTensorWordsGrading G) q toLinearMap).comp deconcatenation

/-- Projection of a coderivation to tensor length one after restriction to length `n`. -/
noncomputable def TensorCoderivation.taylor {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] {G : InternalGrading k A} {q : ℤ} (D : TensorCoderivation k A G q)
    (n : ℕ) (hn : 0 < n) :
    TensorPower k n A →ₗ[k] A := sorry

/-- A family of positive-arity Taylor components in tensor-power form. -/
structure SuspendedTaylorData (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A] where
  component : (n : ℕ) → 0 < n → TensorPower k n A →ₗ[k] A

/-- Cofreeness extends Taylor components uniquely to a coderivation. -/
noncomputable def extendTaylor {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (G : InternalGrading k A) (b : SuspendedTaylorData k A)
    (hdegree : ∀ n hn,
      LinearHasDegree (tensorPowerGrading G n) G 1 (b.component n hn)) :
    TensorCoderivation k A G 1 := sorry

theorem extendTaylor_taylor {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (G : InternalGrading k A) (b : SuspendedTaylorData k A)
    (hdegree : ∀ n hn,
      LinearHasDegree (tensorPowerGrading G n) G 1 (b.component n hn))
    (n : ℕ) (hn : 0 < n) :
    (extendTaylor G b hdegree).taylor n hn = b.component n hn := sorry

/-- The unsuspended Taylor components of an uncurved `A∞` algebra. `m 0 = 0` records the absence
of curvature, rather than leaving arity zero implicit. -/
structure AInfinityOperations (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A] where
  grading : InternalGrading k A
  m : (n : ℕ) → MultilinearMap k (fun _ : Fin n ↦ A) A
  m_zero : m 0 = 0
  m_degree : ∀ n : ℕ, MultilinearHasDegree grading (2 - (n : ℤ)) (m n)

/-- Suspend an unsuspended operation using the fixed degree-`-1` suspension and its Koszul sign. -/
noncomputable def suspendedTaylor {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (ops : AInfinityOperations k A) (n : ℕ) (hn : 0 < n) :
    TensorPower k n A →ₗ[k] A := sorry

/-- Substitute `m_s` after the first `r` inputs into `m_{n-s+1}`. Evaluation uses the tensor-map
rule `(f⊗g)(x⊗y)=(-1)^(|g||x|)f(x)⊗g(y)`, so this helper carries the degree-dependent Koszul sign
in addition to the scalar Stasheff sign used by `stasheffSum`. -/
noncomputable def insertOperation {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (ops : AInfinityOperations k A) {n : ℕ} (r s : ℕ) (_hrs : r + s ≤ n)
    (x : Fin n → A) : A := sorry

/-- The evaluated arity-`n` Keller/Getzler--Jones relation
`Σ_{r+s+t=n} (-1)^(r+s*t) m_{r+1+t}(1^r⊗m_s⊗1^t)`. -/
noncomputable def stasheffSum {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (ops : AInfinityOperations k A) (n : ℕ) (x : Fin n → A) : A :=
  ∑ r ∈ Finset.range n, ∑ s ∈ Finset.Icc 1 (n - r),
    if hrs : r + s ≤ n then
      ((-1 : k) ^ (r + s * (n - r - s))) • insertOperation ops r s hrs x
    else 0

/-- An uncurved `A∞` algebra stores the square-zero suspended bar coderivation and an explicit
comparison of its Taylor components with the unsuspended public operations. -/
structure AInfinityAlgebra (k A : Type*) [CommRing k] [AddCommGroup A] [Module k A] where
  operations : AInfinityOperations k A
  barCoderivation : TensorCoderivation k A (suspensionGrading operations.grading) 1
  bar_taylor : ∀ (n : ℕ) (hn : 0 < n),
    barCoderivation.taylor n hn = suspendedTaylor operations n hn
  bar_square_zero : barCoderivation.toLinearMap.comp barCoderivation.toLinearMap = 0

/-- The unsuspended Stasheff identities are derived from the stored equation `b²=0`. -/
theorem AInfinityAlgebra.stasheff {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (𝒜 : AInfinityAlgebra k A) (n : ℕ) (hn : 0 < n) (x : Fin n → A) :
    stasheffSum 𝒜.operations n x = 0 := sorry

namespace AInfinityAlgebra

variable {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]

/-- The unary operation `m₁`. -/
def unary (𝒜 : AInfinityAlgebra k A) (x : A) : A :=
  𝒜.operations.m 1 (fun _ ↦ x)

/-- The binary operation `m₂`, with no Seidel-style sign twist. -/
def binary (𝒜 : AInfinityAlgebra k A) (x y : A) : A :=
  𝒜.operations.m 2 ![x, y]

def ternary (𝒜 : AInfinityAlgebra k A) (x y z : A) : A :=
  𝒜.operations.m 3 ![x, y, z]

def quaternary (𝒜 : AInfinityAlgebra k A) (x y z w : A) : A :=
  𝒜.operations.m 4 ![x, y, z, w]

/-- Cycles for the `m₁` differential. -/
def IsCycle (𝒜 : AInfinityAlgebra k A) (x : A) : Prop :=
  𝒜.unary x = 0

/-- Tensor lengths one through four of `b²=0` become these executable element equations after
unsuspension. -/
theorem stasheff_arity_one (𝒜 : AInfinityAlgebra k A) (x : A) :
    𝒜.unary (𝒜.unary x) = 0 := sorry

theorem stasheff_arity_two (𝒜 : AInfinityAlgebra k A) (x y : A) (p : ℤ)
    (hx : 𝒜.operations.grading.IsHomogeneous p x) :
    𝒜.unary (𝒜.binary x y) =
      𝒜.binary (𝒜.unary x) y + (((p.negOnePow : ℤ) : k) • 𝒜.binary x (𝒜.unary y)) := sorry

theorem stasheff_arity_three (𝒜 : AInfinityAlgebra k A) (a b c : A) (p q : ℤ)
    (ha : 𝒜.operations.grading.IsHomogeneous p a)
    (hb : 𝒜.operations.grading.IsHomogeneous q b) :
    𝒜.unary (𝒜.ternary a b c) + 𝒜.binary (𝒜.binary a b) c -
      𝒜.binary a (𝒜.binary b c) + 𝒜.ternary (𝒜.unary a) b c +
      (((p.negOnePow : ℤ) : k) • 𝒜.ternary a (𝒜.unary b) c) +
      ((((p + q).negOnePow : ℤ) : k) • 𝒜.ternary a b (𝒜.unary c)) = 0 := sorry

theorem stasheff_arity_four (𝒜 : AInfinityAlgebra k A) (a b c d : A) (p q r : ℤ)
    (ha : 𝒜.operations.grading.IsHomogeneous p a)
    (hb : 𝒜.operations.grading.IsHomogeneous q b)
    (hc : 𝒜.operations.grading.IsHomogeneous r c) :
    𝒜.unary (𝒜.quaternary a b c d) - 𝒜.binary (𝒜.ternary a b c) d -
      (((p.negOnePow : ℤ) : k) • 𝒜.binary a (𝒜.ternary b c d)) +
      𝒜.ternary (𝒜.binary a b) c d - 𝒜.ternary a (𝒜.binary b c) d +
      𝒜.ternary a b (𝒜.binary c d) - 𝒜.quaternary (𝒜.unary a) b c d -
      (((p.negOnePow : ℤ) : k) • 𝒜.quaternary a (𝒜.unary b) c d) -
      ((((p + q).negOnePow : ℤ) : k) • 𝒜.quaternary a b (𝒜.unary c) d) -
      ((((p + q + r).negOnePow : ℤ) : k) • 𝒜.quaternary a b c (𝒜.unary d)) = 0 := sorry

/-- A strict unit in the Keller convention: ordinary left and right multiplication, and every
higher operation containing the unit vanishes away from arity two. -/
structure StrictUnit (𝒜 : AInfinityAlgebra k A) (e : A) : Prop where
  degree_zero : 𝒜.operations.grading.IsHomogeneous 0 e
  unary_eq_zero : 𝒜.unary e = 0
  binary_left : ∀ x, 𝒜.binary e x = x
  binary_right : ∀ x, 𝒜.binary x e = x
  higher : ∀ (n : ℕ), n ≠ 2 → ∀ x : Fin n → A,
    (∃ i, x i = e) → 𝒜.operations.m n x = 0

/-- A chain representative of a unit on cohomology. The witnesses on the last two lines make the
left and right unit equations hold modulo explicit `m₁`-boundaries; this is not silently promoted
to a strict unit. -/
structure CohomologicalUnit (𝒜 : AInfinityAlgebra k A) (e : A) : Prop where
  degree_zero : 𝒜.operations.grading.IsHomogeneous 0 e
  cycle : 𝒜.IsCycle e
  left_unit : ∀ x, 𝒜.IsCycle x → ∃ y, 𝒜.unary y = 𝒜.binary e x - x
  right_unit : ∀ x, 𝒜.IsCycle x → ∃ y, 𝒜.unary y = 𝒜.binary x e - x

end AInfinityAlgebra

/-! ## Suspended right modules and bimodules -/

/-- The cofree right bar comodule `sM ⊗ Tᶜ(sA)`, including tensor length zero. -/
abbrev BarRightComodule (k M A : Type*) [CommRing k]
    [AddCommGroup M] [Module k M] [AddCommGroup A] [Module k A] :=
  TensorProduct k M (TensorWords k A)

noncomputable def tensorWordsGrading {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] (G : InternalGrading k A) : InternalGrading k (TensorWords k A) := sorry

noncomputable def barRightComoduleGrading {k M A : Type*} [CommRing k]
    [AddCommGroup M] [Module k M] [AddCommGroup A] [Module k A]
    (GM : InternalGrading k M) (GA : InternalGrading k A) :
    InternalGrading k (BarRightComodule k M A) :=
  tensorProductGrading (suspensionGrading GM) (tensorWordsGrading (suspensionGrading GA))

/-- Deconcatenation coaction on the cofree right bar comodule. -/
noncomputable def barRightCoaction {k M A : Type*} [CommRing k]
    [AddCommGroup M] [Module k M] [AddCommGroup A] [Module k A] :
    BarRightComodule k M A →ₗ[k]
      TensorProduct k (BarRightComodule k M A) (TensorWords k A) := sorry

/-- Extend the reduced bar coderivation by zero on tensor length zero. -/
noncomputable def coaugmentedBarDifferential {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] (𝒜 : AInfinityAlgebra k A) : TensorWords k A →ₗ[k] TensorWords k A := sorry

/-- The signed action `b^M⊗1 + 1⊗b` on the target of the right coaction. -/
noncomputable def rightComoduleCoderivationAction {k M A : Type*} [CommRing k]
    [AddCommGroup M] [Module k M] [AddCommGroup A] [Module k A]
    (bM : BarRightComodule k M A →ₗ[k] BarRightComodule k M A)
    (bA : TensorWords k A →ₗ[k] TensorWords k A) :
    TensorProduct k (BarRightComodule k M A) (TensorWords k A) →ₗ[k]
      TensorProduct k (BarRightComodule k M A) (TensorWords k A) := sorry

/-- Restrict a bar-comodule endomorphism to `sM⊗(sA)^{⊗(n-1)}` and project to `sM`. -/
noncomputable def rightTaylor {k M A : Type*} [CommRing k]
    [AddCommGroup M] [Module k M] [AddCommGroup A] [Module k A]
    (bM : BarRightComodule k M A →ₗ[k] BarRightComodule k M A) (n : ℕ) (hn : 0 < n) :
    TensorProduct k M (TensorPower k (n - 1) A) →ₗ[k] M := sorry

/-- A right `A∞` module stored as a square-zero coderivation over the algebra bar differential. -/
structure AInfinityRightModule (k A M : Type*) [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    (𝒜 : AInfinityAlgebra k A) where
  grading : InternalGrading k M
  barDifferential : BarRightComodule k M A →ₗ[k] BarRightComodule k M A
  degree_one : LinearHasDegree (barRightComoduleGrading grading 𝒜.operations.grading)
    (barRightComoduleGrading grading 𝒜.operations.grading) 1 barDifferential
  coderivation_over : barRightCoaction.comp barDifferential =
    (rightComoduleCoderivationAction barDifferential
      (coaugmentedBarDifferential 𝒜)).comp barRightCoaction
  square_zero : barDifferential.comp barDifferential = 0

/-- Unsuspended public module operation, of arity `n` with one module input and `n-1` algebra
inputs.  It is obtained by unsuspending `rightTaylor`. -/
noncomputable def AInfinityRightModule.m {k A M : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    {𝒜 : AInfinityAlgebra k A} (N : AInfinityRightModule k A M 𝒜)
    (n : ℕ) (hn : 0 < n) :
    TensorProduct k M (TensorPower k (n - 1) A) →ₗ[k] M := sorry

/-- Unsuspended module operations have degree `2-n`. -/
theorem AInfinityRightModule.m_degree {k A M : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    {𝒜 : AInfinityAlgebra k A} (N : AInfinityRightModule k A M 𝒜)
    (n : ℕ) (hn : 0 < n) :
    LinearHasDegree
      (tensorProductGrading N.grading (tensorPowerGrading 𝒜.operations.grading (n - 1)))
      N.grading (2 - (n : ℤ)) (N.m n hn) := sorry

/-- The cofree two-sided bar bicomodule `Tᶜ(sA) ⊗ sM ⊗ Tᶜ(sB)`. -/
abbrev BarBicomodule (k A M B : Type*) [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B] :=
  TensorProduct k (TensorWords k A) (TensorProduct k M (TensorWords k B))

noncomputable def barBicomoduleGrading {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B]
    (GA : InternalGrading k A) (GM : InternalGrading k M) (GB : InternalGrading k B) :
    InternalGrading k (BarBicomodule k A M B) := sorry

noncomputable def barBicomoduleLeftCoaction {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B] :
    BarBicomodule k A M B →ₗ[k]
      TensorProduct k (TensorWords k A) (BarBicomodule k A M B) := sorry

noncomputable def barBicomoduleRightCoaction {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B] :
    BarBicomodule k A M B →ₗ[k]
      TensorProduct k (BarBicomodule k A M B) (TensorWords k B) := sorry

/-- Signed coderivation action on the left coaction, combining `b^A` and `b^M`. -/
noncomputable def bicomoduleLeftAction {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B]
    (bA : TensorWords k A →ₗ[k] TensorWords k A)
    (bM : BarBicomodule k A M B →ₗ[k] BarBicomodule k A M B) :
    TensorProduct k (TensorWords k A) (BarBicomodule k A M B) →ₗ[k]
      TensorProduct k (TensorWords k A) (BarBicomodule k A M B) := sorry

/-- Signed coderivation action on the right coaction, combining `b^M` and `b^B`. -/
noncomputable def bicomoduleRightAction {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B]
    (bM : BarBicomodule k A M B →ₗ[k] BarBicomodule k A M B)
    (bB : TensorWords k B →ₗ[k] TensorWords k B) :
    TensorProduct k (BarBicomodule k A M B) (TensorWords k B) →ₗ[k]
      TensorProduct k (BarBicomodule k A M B) (TensorWords k B) := sorry

/-- An `(A,B)` `A∞` bimodule stored by its square-zero bicomodule coderivation.  Its Taylor
components are the suspended `b_{i,j}` of the roadmap. -/
structure AInfinityBimodule (k A M B : Type*) [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B]
    (𝒜 : AInfinityAlgebra k A) (𝒝 : AInfinityAlgebra k B) where
  grading : InternalGrading k M
  barDifferential : BarBicomodule k A M B →ₗ[k] BarBicomodule k A M B
  degree_one : LinearHasDegree
    (barBicomoduleGrading 𝒜.operations.grading grading 𝒝.operations.grading)
    (barBicomoduleGrading 𝒜.operations.grading grading 𝒝.operations.grading) 1 barDifferential
  left_coderivation : barBicomoduleLeftCoaction.comp barDifferential =
    (bicomoduleLeftAction (coaugmentedBarDifferential 𝒜) barDifferential).comp
      barBicomoduleLeftCoaction
  right_coderivation : barBicomoduleRightCoaction.comp barDifferential =
    (bicomoduleRightAction barDifferential (coaugmentedBarDifferential 𝒝)).comp
      barBicomoduleRightCoaction
  square_zero : barDifferential.comp barDifferential = 0

/-- The suspended Taylor component `b_{i,j}` of a bimodule coderivation. -/
noncomputable def AInfinityBimodule.b {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B]
    {𝒜 : AInfinityAlgebra k A} {𝒝 : AInfinityAlgebra k B}
    (N : AInfinityBimodule k A M B 𝒜 𝒝) (i j : ℕ) :
    TensorProduct k (TensorPower k i A) (TensorProduct k M (TensorPower k j B)) →ₗ[k] M := sorry

/-- The unsuspended `(i,j)` operation has degree `1-i-j`; its signs are obtained by the fixed
unsuspension rather than by a module-over-a-tensor-product shortcut. -/
noncomputable def AInfinityBimodule.m {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B]
    {𝒜 : AInfinityAlgebra k A} {𝒝 : AInfinityAlgebra k B}
    (N : AInfinityBimodule k A M B 𝒜 𝒝) (i j : ℕ) :
    TensorProduct k (TensorPower k i A) (TensorProduct k M (TensorPower k j B)) →ₗ[k] M := sorry

/-- Unsuspended bimodule operations have degree `1-i-j`. -/
theorem AInfinityBimodule.m_degree {k A M B : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup M] [Module k M]
    [AddCommGroup B] [Module k B]
    {𝒜 : AInfinityAlgebra k A} {𝒝 : AInfinityAlgebra k B}
    (N : AInfinityBimodule k A M B 𝒜 𝒝) (i j : ℕ) :
    LinearHasDegree
      (tensorProductGrading (tensorPowerGrading 𝒜.operations.grading i)
        (tensorProductGrading N.grading (tensorPowerGrading 𝒝.operations.grading j)))
      N.grading (1 - (i : ℤ) - (j : ℤ)) (N.m i j) := sorry

/-! ## DG algebras and the strict/higher bridge -/

/-- A cohomologically graded DG algebra. Multiplication and the differential are stated directly
on homogeneous elements, including the executable Koszul sign. -/
structure DGAlgebra (k A : Type*) [CommRing k] [Ring A] [Algebra k A] where
  grading : InternalGrading k A
  one_degree : grading.IsHomogeneous 0 1
  mul_degree : ∀ p q x y, grading.IsHomogeneous p x → grading.IsHomogeneous q y →
    grading.IsHomogeneous (p + q) (x * y)
  d : A →ₗ[k] A
  d_degree : LinearHasDegree grading grading 1 d
  d_sq : d.comp d = 0
  leibniz : ∀ p q x y, grading.IsHomogeneous p x → grading.IsHomogeneous q y →
    d (x * y) = d x * y + ((p.negOnePow : ℤ) : k) • (x * d y)

namespace DGAlgebra

variable {k A : Type*} [CommRing k] [Ring A] [Algebra k A]

/-- In the DG subcase Keller's algebraic MC variable satisfies `dα-α²=0`; negating it gives
the twisted-object matrix convention `dδ+δ²=0`. -/
theorem dgMaurerCartan_negation (D : DGAlgebra k A) (α : A) :
    D.d α - α * α = 0 ↔ D.d (-α) + (-α) * (-α) = 0 := sorry

/-- A DG algebra is an `A∞` algebra with `m₁=d`, `m₂=μ`, and all higher operations zero. -/
noncomputable def toAInfinity (D : DGAlgebra k A) : AInfinityAlgebra k A := sorry

@[simp] theorem toAInfinity_unary (D : DGAlgebra k A) (x : A) :
    D.toAInfinity.unary x = D.d x := sorry

@[simp] theorem toAInfinity_binary (D : DGAlgebra k A) (x y : A) :
    D.toAInfinity.binary x y = x * y := sorry

@[simp] theorem toAInfinity_m_high (D : DGAlgebra k A) (n : ℕ) (hn : 3 ≤ n)
    (x : Fin n → A) : D.toAInfinity.operations.m n x = 0 := sorry

theorem toAInfinity_strictUnit (D : DGAlgebra k A) :
    D.toAInfinity.StrictUnit 1 := sorry

end DGAlgebra

/-- Missing prerequisite: the symmetric monoidal structure on unbounded cochain complexes of
`k`-modules, constructed by coproduct totalization with `ComplexShape.up ℤ` signs. -/
noncomputable def cochainComplexMonoidal (k : Type u) [CommRing k] :
    MonoidalCategory (CochainComplex (ModuleCat k) ℤ) := sorry

/-- The Koszul braiding for the preceding monoidal structure. -/
noncomputable def cochainComplexSymmetric (k : Type u) [CommRing k] :
    letI := cochainComplexMonoidal k
    SymmetricCategory (CochainComplex (ModuleCat k) ℤ) := sorry

/-- Missing prerequisite: the `k`-linear Hom complex.  Mathlib's current `HomComplex` is instead
valued in `AddCommGrpCat`. -/
noncomputable def linearHomComplex (k : Type u) [CommRing k]
    (X Y : CochainComplex (ModuleCat k) ℤ) : CochainComplex (ModuleCat k) ℤ := sorry

/-- Closed degree-zero composition of `k`-linear Hom complexes. -/
noncomputable def linearHomComposition (k : Type u) [CommRing k]
    [MonoidalCategory (CochainComplex (ModuleCat k) ℤ)]
    (X Y Z : CochainComplex (ModuleCat k) ℤ) :
    (linearHomComplex k X Y ⊗ linearHomComplex k Y Z) ⟶ linearHomComplex k X Z := sorry

/-- The primary strict DG-category representation reuses Mathlib enrichment in cochain complexes;
the roadmap asks for an equivalence with Keller-ordered explicit Hom-complex data, using the
symmetric braiding and its `(-1)^(|f||g|)` comparison sign, not a competing structure. The monoidal
instance is an explicit prerequisite because unbounded `ℤ`-totalization requires the coproduct and
tensor-preservation infrastructure built in Layer 0. -/
abbrev DGCategory (k : Type u) [CommRing k]
    [MonoidalCategory (CochainComplex (ModuleCat k) ℤ)] (Obj : Type v) :=
  CategoryTheory.EnrichedCategory (CochainComplex (ModuleCat k) ℤ) Obj

/-- Two complexes and a closed degree-zero arrow, used to test a genuine two-object DG category
rather than replacing it by a matrix algebra. -/
structure TwoObjectComplexArrow (k : Type u) [CommRing k] where
  X : CochainComplex (ModuleCat.{u} k) ℤ
  Y : CochainComplex (ModuleCat.{u} k) ℤ
  f : X ⟶ Y

def TwoObjectComplexArrow.obj {k : Type u} [CommRing k] (D : TwoObjectComplexArrow k) :
    Fin 2 → CochainComplex (ModuleCat.{u} k) ℤ := ![D.X, D.Y]

/-- The full two-object DG subcategory of complexes on `X,Y`, with Hom objects supplied by
`linearHomComplex`. -/
noncomputable def TwoObjectComplexArrow.enrichment {k : Type u} [CommRing k]
    (D : TwoObjectComplexArrow k) :
    letI := cochainComplexMonoidal k
    CategoryTheory.EnrichedCategory (CochainComplex (ModuleCat.{u} k) ℤ) (Fin 2) := sorry

/-- The cone triangle of the closed arrow is distinguished in the `H⁰`/homotopy category.  The
twisted-envelope comparison must identify its matrix cone with this Mathlib triangle. -/
example {k : Type u} [CommRing k] (D : TwoObjectComplexArrow k) :
    CochainComplex.mappingCone.triangleh D.f ∈
      distTriang (HomotopyCategory (ModuleCat.{u} k) (ComplexShape.up ℤ)) :=
  HomotopyCategory.mappingCone_triangleh_distinguished D.f

variable {k A : Type*} [CommRing k] [Ring A] [Algebra k A]

/-- On raw underlying maps in `Hom(X[r],Y[s])`, the shifted Hom differential is
`(-1)^s d_Hom`. -/
def shiftedHomDifferential (D : DGAlgebra k A) (targetShift : ℤ) (f : A) : A :=
  (((targetShift.negOnePow : ℤ) : k) • D.d f)

/-- Under the normalized identification `Hom(X[r],Y[s]) ≅ Hom(X,Y)[s-r]`, composition with a
degree-`q` second map has this sign. -/
def shiftedCompositionSign (sourceShift targetShift q : ℤ) : ℤ :=
  ((targetShift - sourceShift) * q).negOnePow

/-! ## Homological transfer and its finite nonformal acceptance example -/

/-- A normalized contraction `(H,0) ⇄ (A,d)`. The homotopy degree is recorded against the two
internal gradings; all side conditions needed by the finite tree formulas are explicit. -/
structure CohomologyContraction (k A H : Type*) [CommRing k]
    [AddCommGroup A] [Module k A] [AddCommGroup H] [Module k H]
    (GA : InternalGrading k A) (GH : InternalGrading k H) (d : A →ₗ[k] A) where
  i : H →ₗ[k] A
  p : A →ₗ[k] H
  h : A →ₗ[k] A
  i_degree : LinearHasDegree GH GA 0 i
  p_degree : LinearHasDegree GA GH 0 p
  h_degree : LinearHasDegree GA GA (-1) h
  p_i : p.comp i = LinearMap.id
  i_p : i.comp p = LinearMap.id - (d.comp h + h.comp d)
  d_i : d.comp i = 0
  p_d : p.comp d = 0
  h_i : h.comp i = 0
  p_h : p.comp h = 0
  h_sq : h.comp h = 0

/-- Finite planar-tree transfer from a DG algebra to a normalized contraction. -/
noncomputable def transfer {k A H : Type*} [Field k] [Ring A] [Algebra k A]
    [AddCommGroup H] [Module k H] (D : DGAlgebra k A) (GH : InternalGrading k H)
    (c : CohomologyContraction k A H D.grading GH D.d) : AInfinityAlgebra k H := sorry

theorem transfer_minimal {k A H : Type*} [Field k] [Ring A] [Algebra k A]
    [AddCommGroup H] [Module k H] (D : DGAlgebra k A) (GH : InternalGrading k H)
    (c : CohomologyContraction k A H D.grading GH D.d) (x : H) :
    (transfer D GH c).unary x = 0 := sorry

theorem transfer_binary {k A H : Type*} [Field k] [Ring A] [Algebra k A]
    [AddCommGroup H] [Module k H] (D : DGAlgebra k A) (GH : InternalGrading k H)
    (c : CohomologyContraction k A H D.grading GH D.d) (x y : H) :
    (transfer D GH c).binary x y = c.p (c.i x * c.i y) := sorry

/-- The eight-dimensional exterior DG algebra in the acceptance test:
`Λ(a,b,c)`, all generators in degree one, with `dc=ab`. -/
abbrev HeisenbergDGA (k : Type*) [CommRing k] := ExteriorAlgebra k (Fin 3 → k)

/-- The six chosen cohomology representatives `1,a,b,ac,bc,abc`. -/
abbrev HeisenbergCohomology (k : Type*) := Fin 6 → k

noncomputable def heisenbergDG (k : Type*) [Field k] : DGAlgebra k (HeisenbergDGA k) := sorry

noncomputable def heisenbergCohomologyGrading (k : Type*) [Field k] :
    InternalGrading k (HeisenbergCohomology k) := sorry

noncomputable def heisenbergContraction (k : Type*) [Field k] :
    CohomologyContraction k (HeisenbergDGA k) (HeisenbergCohomology k)
      (heisenbergDG k).grading (heisenbergCohomologyGrading k) (heisenbergDG k).d := sorry

/-- The coordinate vector representing `[a]`, and similarly below. -/
noncomputable def heisenbergA (k : Type*) [Field k] : HeisenbergCohomology k := Pi.single 1 1
noncomputable def heisenbergB (k : Type*) [Field k] : HeisenbergCohomology k := Pi.single 2 1
noncomputable def heisenbergAC (k : Type*) [Field k] : HeisenbergCohomology k := Pi.single 3 1

/-- The finite transfer acceptance calculation. The characteristic hypothesis is used in the
exterior-algebra normal form, and the result is a genuinely nonzero higher product. -/
theorem heisenberg_transfer_m3 (k : Type*) [Field k] (hchar : (2 : k) ≠ 0) :
    (transfer (heisenbergDG k) (heisenbergCohomologyGrading k)
      (heisenbergContraction k)).operations.m 3
      ![heisenbergA k, heisenbergA k, heisenbergB k] = heisenbergAC k ∧
      heisenbergAC k ≠ 0 := sorry

/-! ## Controlled Maurer--Cartan twisting -/

/-- Repeated input used by a nilpotent Maurer--Cartan sum. -/
def repeatedInput {A : Type*} (α : A) (n : ℕ) : Fin n → A := fun _ ↦ α

/-- The pure tensor representing `(sα)^{⊗n}` on the suspended carrier. -/
noncomputable def pureTensorPower {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (α : A) (n : ℕ) : TensorPower k n A := sorry

/-- Keller's unsuspended Maurer--Cartan sum for the degree-`-1` suspension convention. -/
noncomputable def unsuspendedMaurerCartanSum {k A : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] (𝒜 : AInfinityAlgebra k A) (α : A) (cutoff : ℕ) : A :=
  ∑ n ∈ Finset.Ico 1 cutoff,
    ((-1 : k) ^ (n * (n - 1) / 2)) • 𝒜.operations.m n (repeatedInput α n)

/-- The same finite Maurer--Cartan sum in the sign-free suspended Taylor language. -/
noncomputable def suspendedMaurerCartanSum {k A : Type*} [CommRing k]
    [AddCommGroup A] [Module k A] (𝒜 : AInfinityAlgebra k A) (α : A) (cutoff : ℕ) : A :=
  ∑ n ∈ Finset.Ico 1 cutoff, if hn : 0 < n then
    suspendedTaylor 𝒜.operations n hn (pureTensorPower α n) else 0

/-- A Maurer--Cartan element whose defining sum is finite for a recorded reason. This is the
direct-sum/nilpotent branch; the roadmap separately asks for complete filtered convergence. -/
structure NilpotentMaurerCartan {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (𝒜 : AInfinityAlgebra k A) (α : A) where
  degree_one : 𝒜.operations.grading.IsHomogeneous 1 α
  cutoff : ℕ
  cutoff_pos : 0 < cutoff
  above_cutoff : ∀ n, cutoff ≤ n → 𝒜.operations.m n (repeatedInput α n) = 0
  equation : unsuspendedMaurerCartanSum 𝒜 α cutoff = 0

/-- The alternating triangular sign in the unsuspended equation is exactly the Koszul sign of
`s^{⊗n}`; consequently it is equivalent to the sign-free bar Maurer--Cartan equation. -/
theorem maurerCartan_iff_bar_equation {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] (𝒜 : AInfinityAlgebra k A) (α : A) (cutoff : ℕ) :
    unsuspendedMaurerCartanSum 𝒜 α cutoff = 0 ↔
      suspendedMaurerCartanSum 𝒜 α cutoff = 0 := sorry

theorem NilpotentMaurerCartan.bar_equation {k A : Type*} [CommRing k] [AddCommGroup A]
    [Module k A] {𝒜 : AInfinityAlgebra k A} {α : A} (h : NilpotentMaurerCartan 𝒜 α) :
    suspendedMaurerCartanSum 𝒜 α h.cutoff = 0 :=
  (maurerCartan_iff_bar_equation 𝒜 α h.cutoff).mp h.equation

/-- The summand in the twisted `n`-ary operation with exactly `t` insertions of `α`, summed over
all `n+1` gaps and carrying the pinned Koszul signs. -/
noncomputable def twistedOperationTerm {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (𝒜 : AInfinityAlgebra k A) (α : A) (n t : ℕ) (x : Fin n → A) : A := sorry

/-- Uniform local nilpotence strong enough to make every twisted operation a finite sum, not just
the Maurer--Cartan equation on the pure tensor `α^⊗n`. -/
structure FiniteTwistingDatum {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (𝒜 : AInfinityAlgebra k A) where
  α : A
  mc : NilpotentMaurerCartan 𝒜 α
  insertionCutoff : ℕ
  insertionCutoff_pos : 0 < insertionCutoff
  insertion_vanishes : ∀ n t, insertionCutoff ≤ t → ∀ x : Fin n → A,
    twistedOperationTerm 𝒜 α n t x = 0

/-- Twist by a uniformly nilpotent MC element using the finite sum of insertion terms. -/
noncomputable def twist {k A : Type*} [CommRing k] [AddCommGroup A] [Module k A]
    (𝒜 : AInfinityAlgebra k A) (τ : FiniteTwistingDatum 𝒜) :
    AInfinityAlgebra k A := sorry

/-! ## Finite twisted objects -/

variable {k A : Type*} [CommRing k] [Ring A] [Algebra k A]

/-- Differential transported to the shifted Hom component from summand `j` to summand `i`.
The implementation proves this agrees with the cochain-shift functor and records its sign. -/
def shiftedMatrixDifferential {ι : Type*} (D : DGAlgebra k A)
    (shift : ι → ℤ) (δ : Matrix ι ι A) : Matrix ι ι A :=
  fun i j ↦ ((((shift i - shift j).negOnePow : ℤ) : k) • D.d (δ i j))

/-- Composition transported through the same shifted-Hom identification.  This is not raw matrix
multiplication when the shifts contribute signs. -/
noncomputable def shiftedMatrixMul {ι : Type*} [Fintype ι] (_D : DGAlgebra k A)
    (shift : ι → ℤ) (leftDegree : ℤ) (x y : Matrix ι ι A) : Matrix ι ι A :=
  fun i j ↦ ∑ r, ((((shift r - shift j) * leftDegree).negOnePow : ℤ) : k) • (x i r * y r j)

/-- A finite shifted free twisted object over a DG algebra. The shift convention makes a
degree-one component from summand `j` to summand `i` have unshifted degree
`1 + shift i - shift j`. Upper triangularity gives finite Maurer--Cartan sums. -/
structure FiniteTwistedFree (D : DGAlgebra k A) (ι : Type*) [Fintype ι] [LinearOrder ι] where
  shift : ι → ℤ
  δ : Matrix ι ι A
  upper : ∀ i j, ¬ i < j → δ i j = 0
  entry_degree : ∀ i j, D.grading.IsHomogeneous (1 + shift i - shift j) (δ i j)
  mc : shiftedMatrixDifferential D shift δ + shiftedMatrixMul D shift 1 δ δ = 0

/-- The two-term cone matrix. For `shift ![0]=0`, `shift ![1]=1`, its sole off-diagonal entry
is the closed degree-zero arrow `f`, so it is a degree-one twisting matrix. -/
noncomputable def twoTermCone (D : DGAlgebra k A) (f : A)
    (hf0 : D.grading.IsHomogeneous 0 f) (hclosed : D.d f = 0) :
    FiniteTwistedFree D (Fin 2) := sorry

theorem twoTermCone_mc (D : DGAlgebra k A) (f : A)
    (hf0 : D.grading.IsHomogeneous 0 f) (hclosed : D.d f = 0) :
    shiftedMatrixDifferential D (twoTermCone D f hf0 hclosed).shift
        (twoTermCone D f hf0 hclosed).δ +
      shiftedMatrixMul D (twoTermCone D f hf0 hclosed).shift 1
        (twoTermCone D f hf0 hclosed).δ (twoTermCone D f hf0 hclosed).δ = 0 :=
  (twoTermCone D f hf0 hclosed).mc

/-- A nonclosed homogeneous entry in nonzero shifts checks the transported differential sign,
which a closed cone arrow cannot detect. -/
theorem shiftedMatrixDifferential_nonzero_shift (D : DGAlgebra k A) (a : A)
    (p : ℤ) (_ha : D.grading.IsHomogeneous p a) :
    (shiftedMatrixDifferential D ![0, p] (!![0, 0; a, 0])) 1 0 =
      (((p.negOnePow : ℤ) : k) • D.d a) := by
  simp [shiftedMatrixDifferential]

/-! ## Serre/Euler acceptance identity -/

/-- Finite-dimensional Hom-cohomology data together with the degree-reversing dimension equality
that is induced by a genuine bifunctorial Serre duality.  The later categorical layer constructs
this data from `RHom(X,Y)^∗ ≅ RHom(Y,SX)`; the Euler identity is not stored as an axiom. -/
structure ProperSerreHomData (Obj : Type*) where
  serre : Obj → Obj
  homDim : Obj → Obj → ℤ → ℕ
  support : Obj → Obj → Finset ℤ
  vanishes : ∀ X Y i, i ∉ support X Y → homDim X Y i = 0
  duality_dim : ∀ X Y i, homDim X Y i = homDim Y (serre X) (-i)

/-- Finite Euler characteristic of a proper Hom complex. -/
def ProperSerreHomData.euler {Obj : Type*} (E : ProperSerreHomData Obj) (X Y : Obj) : ℤ :=
  ∑ i ∈ E.support X Y, i.negOnePow * (E.homDim X Y i : ℤ)

/-- The Serre Euler identity is proved by reindexing the finite duality sum. -/
theorem ProperSerreHomData.euler_serre {Obj : Type*} (E : ProperSerreHomData Obj) (X Y : Obj) :
    E.euler X Y = E.euler Y (E.serre X) := sorry

/-- At the Hom-cohomology level, a right `d`-Calabi--Yau identification says the Serre object has
the cohomology dimensions of the cochain shift `[d]`. -/
def ProperSerreHomData.IsRightCY {Obj : Type*} (E : ProperSerreHomData Obj) (d : ℤ) : Prop :=
  ∀ X Y i, E.homDim Y (E.serre X) i = E.homDim Y X (i + d)

/-- Signed symmetry is therefore a consequence of Serre duality, finite support, and the right
Calabi--Yau shift comparison. -/
theorem ProperSerreHomData.signed_symmetry {Obj : Type*} (E : ProperSerreHomData Obj)
    (d : ℤ) (hCY : E.IsRightCY d) (X Y : Obj) :
    E.euler X Y = d.negOnePow * E.euler Y X := sorry

/-! ## Reuse of landed Tau Ceti Euler APIs -/

section TauCetiEuler

variable (Q : Type v) [Quiver.{w} Q] [Fintype Q] [∀ a b : Q, Fintype (a ⟶ b)]
  (k : Type u) [Field k]

/-- The perfect-DG Euler comparison is required to recover this landed projective computation,
not introduce a private copy of the quiver Euler form. -/
example (i : Q) [∀ a : Q, Finite (Quiver.Path i a)] (N : TauCeti.QuiverRep k Q) :
    TauCeti.eulerForm Q
        (fun v ↦ (TauCeti.dimVector (TauCeti.indecProjRep k Q i) v : ℤ))
        (fun v ↦ (TauCeti.dimVector N v : ℤ))
      = (Module.finrank k (TauCeti.indecProjRep k Q i ⟶ N) : ℤ) :=
  TauCeti.eulerForm_dimVector_indecProjRep_eq_finrank_hom Q k i N

end TauCetiEuler

end TauCetiRoadmap.DGAInfinity
