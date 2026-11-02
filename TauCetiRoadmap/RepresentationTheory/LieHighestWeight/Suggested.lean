import Mathlib
import TauCeti.Algebra.Lie.HighestWeight.CentralCharacter.DotOrbit
import TauCeti.Algebra.Lie.HighestWeight.Minuscule
import TauCeti.Algebra.Lie.HighestWeight.Tensor
import TauCeti.Algebra.Lie.HighestWeight.Weyl.Dimension
import TauCeti.LinearAlgebra.SymmetricAlgebra.AdjointAction
import TauCeti.LinearAlgebra.SymmetricAlgebra.Homogeneous
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Homogeneous
import TauCeti.Algebra.Lie.Presentation.Serre.Killing
import TauCeti.Algebra.Lie.GeneralLinear.Carrier
import TauCeti.Algebra.Octonion.Derivation
import TauCeti.Algebra.AlbertAlgebra.Basic
import TauCeti.LinearAlgebra.SymmetricPower.Basic
import TauCeti.Algebra.Lie.UniversalEnveloping.Prod
import TauCeti.Algebra.Lie.UniversalEnveloping.Abelian
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Finite

/-!
# Lie highest weights: target signatures

The roadmap is README.md; this file is not the roadmap. It states the remaining headline
theorems against the pinned APIs: the normalized polynomial/symmetric-power comparison, normalized PBW symmetrization, minuscule tensor products,
the invariant-form symmetry sign, Chevalley restriction, filtered Harish-Chandra,
central-character orbits, the split Serre presentation, exceptional split identifications,
the general-linear Pieri rule, and the normalized center of an abelian direct product.
The central-monic finiteness adapter retains its arbitrary-field coefficient subalgebra.
The native highest-weight classification, Weyl formulas, complete reducibility, rank-one
spectrum and dimensions, and general-linear classification are supplier contracts in README.md.

The compact real-form comparisons lack the positive division-octonion and formally real
Albert carriers. The Vinberg E8 and Freudenthal E6/E7 model comparisons lack their constructed
brackets and modules; the dimensions of the native Serre algebras are statable below.
The closed-alcove headline lacks the constructed affine Weyl action, and the compact-center
headline lacks a compact Lie group's maximal torus and its period lattice. The LR
application lacks the Littlewood-Richardson tableau carrier. The Rees special-fibre and
first-order Poisson comparison lack the constructed filtered Rees algebra and its fibre
maps. The Weyl-character Fourier-boundary application lacks the common-chamber series ring,
smooth torus test-density dual and directional spline/Todd operators supplied by
TensorProductCombinatorics §§1.6 and 2.6. The polynomial/PBW comparison with
LieGroupoidsPoisson G4.6A lacks the supplied smooth Poisson carrier. Category-O linkage lacks its category and integral
block carriers. None is replaced here by admitted data.

The type-A identification of a rational irreducible GL_n-character with the
determinant-shifted Schur polynomial is statable, but it is the headline of ClassicalGroups
Layer 4; this roadmap gives an independent Haar-measure proof of it and does not restate it.
The regular extension of unitary representations, the torus period lattice, the compact
Frobenius-Schur criterion and the skew Littlewood-Richardson rule are supplier gaps named in
README.md, not headlines of this roadmap.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight

open scoped Classical DirectSum TensorProduct
open LieModule LieAlgebra Module

universe u v

/-! ## Layer 0: polynomial and symmetric-tensor normalization -/

/-- The polynomial/symmetric-power dictionary sends each standard symmetric monomial
back to the corresponding polynomial with coefficient one, fixing every degree and its unit. -/
theorem exists_polynomialSymmetric (d : ℕ) :
    ∃ e : MvPolynomial.homogeneousSubmodule (Fin 2) ℂ d ≃ₗ[ℂ]
        SymmetricPower ℂ (Fin d) (Fin 2 → ℂ),
      ∀ i : Fin (d + 1),
        (e.symm (SymmetricPower.tprod ℂ (fun k : Fin d =>
          Pi.single (if k.val < i.val then (1 : Fin 2) else 0) (1 : ℂ))) :
          MvPolynomial (Fin 2) ℂ) =
        MvPolynomial.X 0 ^ (d - i.val) * MvPolynomial.X 1 ^ i.val := sorry

/-! ## Layer 3: normalized PBW symmetrization -/

/-- Central monic relations on a finite ordered Lie basis make the enveloping algebra
finite over that same central coefficient subalgebra, over an arbitrary field. -/
theorem module_finite_of_central_monic_relations (K : Type u) [Field K]
    (L : Type v) [LieRing L] [LieAlgebra K L]
    {κ : Type v} [Fintype κ] [LinearOrder κ] (b : Basis κ K L)
    (R : Subalgebra K (UniversalEnvelopingAlgebra K L))
    (hR : R ≤ Subalgebra.center K (UniversalEnvelopingAlgebra K L))
    (hmonic : ∀ i : κ, ∃ (d : ℕ) (c : Fin d → R), 0 < d ∧
      (UniversalEnvelopingAlgebra.ι K (b i)) ^ d +
        ∑ j : Fin d, (c j : UniversalEnvelopingAlgebra K L) *
          (UniversalEnvelopingAlgebra.ι K (b i)) ^ (j : ℕ) = 0) :
    Module.Finite R (UniversalEnvelopingAlgebra K L) := sorry

/-- Over a characteristic-zero field, PBW symmetrization is the unique linear
comparison whose value on every symmetric monomial is the average of all ordered words.
The empty word maps to one; the map need not preserve multiplication. -/
theorem exists_pbwSymmetrization (K : Type u) [Field K] [CharZero K]
    (L : Type v) [LieRing L] [LieAlgebra K L] :
    ∃ e : SymmetricAlgebra K L ≃ₗ[K] UniversalEnvelopingAlgebra K L,
      (∀ l : List L, e ((l.map (SymmetricAlgebra.ι K L)).prod) =
        ((l.length.factorial : K)⁻¹) •
          ∑ sigma : Equiv.Perm (Fin l.length),
            (List.ofFn (fun i => UniversalEnvelopingAlgebra.ι K (l.get (sigma i)))).prod) ∧
      (∀ (x : L) (p : SymmetricAlgebra K L), e ⁅x, p⁆ =
        UniversalEnvelopingAlgebra.ι K x * e p - e p * UniversalEnvelopingAlgebra.ι K x) ∧
      (∀ n : ℕ, ∀ p : SymmetricAlgebra K L,
        p ∈ (⨆ k ≤ n, TauCeti.SymmetricAlgebra.homogeneousSubmodule K L k) ↔
        e p ∈ TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n) := sorry

section General
variable {K : Type*} [Field K] [CharZero K] [algClosedK : IsAlgClosed K]
variable {L : Type u} [LieRing L] [LieAlgebra K L] [LieAlgebra.IsKilling K L]
  [FiniteDimensional K L]
variable {H : LieSubalgebra K L} [H.IsCartanSubalgebra] [IsTriangularizable K H L]

include algClosedK

/-! ## Layer 6: minuscule tensor multiplicities -/

/-- For dominant integral highest weights, tensoring with a minuscule module has
multiplicity one precisely at the dominant translates of its weights. -/
theorem minuscule_pieri (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    {lam mu : Module.Dual K H} (hlam : TauCeti.IsDominantIntegral base lam)
    (hmu : TauCeti.IsMinuscule base mu) (nu : Module.Dual K H)
    (hnu : TauCeti.IsDominantIntegral base nu) :
    TauCeti.tensorMultiplicity base lam mu nu =
      if genWeightSpace (TauCeti.irreducibleQuotient base mu) ⇑(nu - lam) ≠ ⊥
      then 1 else 0 := sorry

/-- On an irreducible self-dual highest-weight module, the invariant form has symmetry
sign given by the parity of the pairing with the sum of the positive coroots. -/
theorem invariantForm_isSymm_iff_tits_sign
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    (hlam : TauCeti.IsDominantIntegral base lam)
    [FiniteDimensional K (TauCeti.irreducibleQuotient base lam)]
    (B : LinearMap.BilinForm K (TauCeti.irreducibleQuotient base lam)) (hB : B ≠ 0)
    (hinv : ∀ (x : L) (v w : TauCeti.irreducibleQuotient base lam),
      B ⁅x, v⁆ w + B v ⁅x, w⁆ = 0) :
    ((∀ v w, B v w = B w v) ↔
      (-1 : ℤˣ) ^ (∑ i : {j : H.root // base.IsPos j}, TauCeti.coweightPairing lam i) = 1) ∧
    ((∀ v w, B v w = - B w v) ↔
      (-1 : ℤˣ) ^ (∑ i : {j : H.root // base.IsPos j}, TauCeti.coweightPairing lam i) = -1) := sorry

/-! ## Layer 7: Chevalley restriction, Harish-Chandra and Serre -/

/-- The symmetric-algebra elements of degree at most n. -/
def symmetricDegreeLE (n : ℕ) : Submodule K (SymmetricAlgebra K H) :=
  ⨆ k ≤ n, TauCeti.SymmetricAlgebra.homogeneousSubmodule K H k

/-- Ordinary Weyl invariance, expressed by evaluation on the Cartan dual. -/
noncomputable def linearInvariants : Subalgebra K (SymmetricAlgebra K H) where
  carrier := {p | ∀ (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup)
    (lam : Module.Dual K H), SymmetricAlgebra.lift (w • lam) p = SymmetricAlgebra.lift lam p}
  mul_mem' hp hq := by intro w lam; simp only [map_mul, hp w lam, hq w lam]
  add_mem' hp hq := by intro w lam; simp only [map_add, hp w lam, hq w lam]
  algebraMap_mem' r := by intro w lam; simp
  zero_mem' := by intro w lam; simp
  one_mem' := by intro w lam; simp

/-- Lie invariants in the symmetric algebra for the native adjoint derivation action. -/
noncomputable def lieInvariantSymmetricAlgebra
    {K : Type*} [Field K] [CharZero K] {L : Type u} [LieRing L] [LieAlgebra K L] :
    Subalgebra K (SymmetricAlgebra K L) where
  carrier := {p | ∀ x : L, ⁅x, p⁆ = 0}
  mul_mem' hp hq := by
    intro x
    simp only [TauCeti.SymmetricAlgebra.lie_eq_adjointDerivation] at hp hq ⊢
    rw [Derivation.leibniz, hp x, hq x]
    simp
  add_mem' hp hq := by intro x; rw [lie_add, hp x, hq x]; simp
  algebraMap_mem' r := by intro x; simp [TauCeti.SymmetricAlgebra.lie_eq_adjointDerivation]
  zero_mem' := by intro x; simp
  one_mem' := by intro x; simp [TauCeti.SymmetricAlgebra.lie_eq_adjointDerivation]

/-- Restriction along the Killing-orthogonal projection from L to its Cartan subalgebra. -/
noncomputable def lieCartanRestriction : SymmetricAlgebra K L →ₐ[K] SymmetricAlgebra K H :=
  SymmetricAlgebra.map K
    ((LieAlgebra.IsKilling.cartanEquivDual H).symm.toLinearMap.comp
      (H.subtype.dualMap.comp
        ((killingForm K L).toDual
          (LieAlgebra.IsKilling.killingForm_nondegenerate K L)).toLinearMap))

/-- Chevalley restriction is the graded algebra equivalence induced by the actual
Killing-orthogonal restriction map, not an unspecified algebra isomorphism. -/
theorem exists_lieChevalleyRestrictionIso :
    ∃ e : lieInvariantSymmetricAlgebra (K := K) (L := L) ≃ₐ[K]
        linearInvariants (K := K) (H := H),
      (∀ p, (e p : SymmetricAlgebra K H) = lieCartanRestriction p) ∧
      ∀ (n : ℕ) (p : lieInvariantSymmetricAlgebra (K := K) (L := L)),
        (p : SymmetricAlgebra K L) ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K L n ↔
        (e p : SymmetricAlgebra K H) ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K H n := sorry

/-- The raw triangular PBW projection induces a filtered Harish-Chandra isomorphism
onto dot invariants. Both directions of the filtration comparison are part of the conclusion. -/
theorem exists_harishChandraIso (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    ∃ e : Subalgebra.center K (UniversalEnvelopingAlgebra K L) ≃ₐ[K] TauCeti.dotInvariants base,
      (∀ z, (e z : SymmetricAlgebra K H) = TauCeti.hcProjection base z) ∧
      ∀ (n : ℕ) (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)),
        (z : UniversalEnvelopingAlgebra K L) ∈ TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n ↔
        (e z : SymmetricAlgebra K H) ∈ symmetricDegreeLE n := sorry

/-- Two Verma central characters agree exactly on a Weyl dot orbit; this does not
assert the stronger composition-factor linkage theorem of category O. -/
theorem centralCharacter_eq_iff_dotOrbit (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) :
    TauCeti.vermaCentralCharacter base lam = TauCeti.vermaCentralCharacter base mu ↔
      ∃ w : (LieAlgebra.IsKilling.rootSystem H).weylGroup,
        mu = TauCeti.dotAction (LieAlgebra.IsKilling.rootSystem H) base w lam := sorry

end General

section Serre
variable {K : Type*} [Field K] [CharZero K]
variable {L : Type u} [LieRing L] [LieAlgebra K L] [LieAlgebra.IsKilling K L]
  [FiniteDimensional K L] [LieAlgebra.IsSimple K L]
variable {H : LieSubalgebra K L} [H.IsCartanSubalgebra] [IsTriangularizable K H L]

/-- The normalized simple-root Serre lift is injective over every characteristic-zero
split field. Its coroots and generating raising/lowering families are fixed in the hypotheses. -/
theorem serreLift_injective_of_base
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {e f : ↥base.support → L}
    (hS : TauCeti.IsSerreSystem K base.cartanMatrix.transpose
      (fun i ↦ (((LieAlgebra.IsKilling.rootSystem H).coroot i : H) : L)) e f)
    (hspan : LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f) = ⊤) :
    Function.Injective (TauCeti.serreLift hS) := sorry
end Serre

/-! ## Layer 8: exceptional split identifications -/

/-- The derivations of the native split Zorn octonions are the split Serre algebra G2. -/
theorem derivationOctonion_equiv_g2 (K : Type*) [Field K] [CharZero K] :
    Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.Octonion K) ≃ₗ⁅K⁆
      LieAlgebra.g₂ (R := K)) := sorry

/-- The derivations of the native split Albert product are the split Serre algebra F4. -/
theorem derivationAlbert_equiv_f4 (K : Type*) [Field K] [CharZero K] :
    Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K) ≃ₗ⁅K⁆
      LieAlgebra.f₄ (R := K)) := sorry

/-- The split exceptional Serre algebra E8 has dimension 248. -/
theorem finrank_e8 (K : Type*) [Field K] [CharZero K] :
    Module.finrank K (LieAlgebra.e₈ (R := K)) = 248 := sorry

/-- The split exceptional Serre algebras E6 and E7 have dimensions 78 and 133. -/
theorem finrank_e6_e7 (K : Type*) [Field K] [CharZero K] :
    Module.finrank K (LieAlgebra.e₆ (R := K)) = 78 ∧
      Module.finrank K (LieAlgebra.e₇ (R := K)) = 133 := sorry

/-! ## Layer 9: the general-linear Pieri rule -/

attribute [local instance 100] LieRing.ofAssociativeRing

/-- Tensoring the native general-linear highest-weight module with the dual standard
module gives one copy of each dominant weight obtained by subtracting a coordinate vector. -/
theorem gl_dual_standard_pieri {K : Type*} [Field K] [CharZero K] [IsAlgClosed K]
    {n : ℕ} (mu : Fin n → K) (hmu : TauCeti.IsGlDominantIntegral mu) :
    Nonempty (TensorProduct K (Module.Dual K (Fin n → K)) (TauCeti.glIrreducible n mu)
        ≃ₗ⁅K, Matrix (Fin n) (Fin n) K⁆
      ⨁ t : {t : Fin n // TauCeti.IsGlDominantIntegral (mu - Pi.single t 1)},
        TauCeti.glIrreducible n (mu - Pi.single (t : Fin n) 1)) := sorry

section ReductiveCenter
variable (K : Type u) [Field K]
variable (Z : Type v) [LieRing Z] [LieAlgebra K Z] [IsLieAbelian Z]
variable (S : Type*) [LieRing S] [LieAlgebra K S]

/-- The native enveloping-product comparison followed by the abelian symmetric-algebra
comparison, with the order of the factors fixed. -/
noncomputable def productEnveloping :
    UniversalEnvelopingAlgebra K (Z × S) ≃ₐ[K]
      SymmetricAlgebra K Z ⊗[K] UniversalEnvelopingAlgebra K S :=
  (TauCeti.UniversalEnvelopingAlgebra.prodEquivTensor K Z S).trans
    (Algebra.TensorProduct.congr
      (TauCeti.UniversalEnvelopingAlgebra.symmetricAlgebraEquiv K Z).symm
      (AlgEquiv.refl : UniversalEnvelopingAlgebra K S ≃ₐ[K] _))

/-- The center of the enveloping algebra of an abelian-by-direct-product Lie algebra
is the tensor product of the abelian symmetric factor and the other enveloping center;
the equivalence commutes with their actual inclusions into the product enveloping algebra. -/
theorem exists_productCenterEquiv :
    ∃ e : Subalgebra.center K (UniversalEnvelopingAlgebra K (Z × S)) ≃ₐ[K]
        SymmetricAlgebra K Z ⊗[K] Subalgebra.center K (UniversalEnvelopingAlgebra K S),
      ∀ z, Algebra.TensorProduct.map (AlgHom.id K (SymmetricAlgebra K Z))
        (Subalgebra.center K (UniversalEnvelopingAlgebra K S)).val (e z) =
          productEnveloping K Z S (z : UniversalEnvelopingAlgebra K (Z × S)) := sorry
end ReductiveCenter

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight
