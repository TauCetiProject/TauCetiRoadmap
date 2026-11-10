module

public import Mathlib
public import TauCeti.Algebra.Lie.HighestWeight.Weyl.Dimension
public import TauCeti.LinearAlgebra.SymmetricAlgebra.LieModule
public import TauCeti.LinearAlgebra.SymmetricAlgebra.Homogeneous
public import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Homogeneous
public import TauCeti.Algebra.Lie.Presentation.Serre.Killing
public import TauCeti.Algebra.Octonion.Serre
public import TauCeti.Algebra.AlbertAlgebra.Basic
public import TauCeti.LinearAlgebra.SymmetricPower.Basic
public import TauCeti.Algebra.Lie.UniversalEnveloping.Prod
public import TauCeti.Algebra.Lie.UniversalEnveloping.Abelian
public import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Finite
public import TauCeti.Algebra.Lie.UniversalEnveloping.Rees.ZeroFiber
public import TauCeti.Algebra.CayleyDickson.Quaternion
public import TauCeti.Algebra.Lie.GeneralLinear.Carrier
public import TauCeti.Algebra.Lie.Multiplicity
public import TauCeti.Combinatorics.Young.LittlewoodRichardson.Basic
public import TauCeti.LinearAlgebra.RootSystem.Weyl.Affine.Alcove

/-!
# Lie highest weights: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline
theorems against the pinned APIs: the normalized polynomial/symmetric-power comparison, the
central-monic finiteness adapter, the first-order bracket on the zero fibre of the PBW Rees
algebra, normalized PBW symmetrization, the invariant-form symmetry sign, the split Serre
presentation, the exceptional split identifications G2, F4, E8 and E6/E7, the compact real
form of G2 on the division octonions and its complexification, the Littlewood-Richardson
multiplicities of the general linear Lie algebra, the normalized center of an abelian direct
product, and uniqueness of closed-alcove representatives under the affine Weyl group.
The central-monic finiteness adapter retains its arbitrary-field coefficient subalgebra.
The native highest-weight classification, Weyl formulas, complete reducibility, rank-one
spectrum and dimensions, general-linear classification, the minuscule and dual-standard
Pieri rules, the Lie and Weyl invariants with the Killing-orthogonal restriction and
Chevalley's restriction theorem, the Harish-Chandra isomorphisms with the
central-character orbit theorem, the PBW Rees algebra with its fibres at zero and one, the
Cayley-Dickson double with the real division octonions, the affine and extended affine Weyl
groups with the fundamental alcove, and the differentiation of rational representations of
the general linear group are supplier contracts in README.md, consumed by name and not
restated here.

The following headlines are not statable at the pins. The formally real Albert algebra and
the compact form of F4 lack the Albert carrier over the division octonions: the pinned
`TauCeti.AlbertAlgebra` is the split one. The Vinberg E8 and Freudenthal E6/E7 model
comparisons lack their constructed brackets and modules; the dimensions of the native Serre
algebras are stated below. The polynomial derivative comparison of the zero-fibre bracket
with the linear Poisson formula needs that bracket as a constructed map; the pin has the
zero-fibre specialization but no bracket, so only its existence and defining equation are
stated. Category-O linkage lacks its category and integral block carriers. None is replaced
here by admitted data.

The rational Weyl and finite Fourier identities are adapters of the native character
theorem and Fourier orthogonality; the generic distributional reconstruction belongs to
TensorProductCombinatorics §1.6. The type-A identification of a rational irreducible
GL_n-character with the determinant-shifted Schur polynomial is the headline of
ClassicalGroups Layer 4 and is not restated.
-/

@[expose] public section

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

/-- On the zero fibre of the PBW Rees algebra of a free Lie algebra over a commutative ring,
the commutator divided by the central parameter is a well-defined bilinear bracket on the
symmetric algebra: whenever `a * b - b * a = ħ * c` in the Rees algebra, the bracket of the
zero-fibre classes of `a` and `b` is the class of `c`. -/
theorem exists_reesZeroFiberBracket (R : Type u) [CommRing R]
    (L : Type v) [LieRing L] [LieAlgebra R L] [Module.Free R L] :
    ∃ B : SymmetricAlgebra R L →ₗ[R] SymmetricAlgebra R L →ₗ[R] SymmetricAlgebra R L,
      ∀ a b c : TauCeti.UniversalEnvelopingAlgebra.reesAlgebra R L,
        a * b - b * a = TauCeti.UniversalEnvelopingAlgebra.reesParameter R L * c →
        B (TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero R L a)
            (TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero R L b) =
          TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero R L c := sorry

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

/-! ## Layer 5: the invariant-form symmetry sign -/

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

end General

/-! ## Layer 7: the split Serre presentation -/

section Serre
variable {K : Type*} [Field K] [CharZero K]
variable {L : Type u} [LieRing L] [LieAlgebra K L] [LieAlgebra.IsKilling K L]
  [FiniteDimensional K L]
variable {H : LieSubalgebra K L} [H.IsCartanSubalgebra] [IsTriangularizable K H L]

/-- The normalized simple-root Serre lift of a split Killing-semisimple Lie algebra is
injective over every characteristic-zero field. Its coroots and generating raising/lowering families are fixed in the hypotheses. -/
theorem serreLift_injective_of_base
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {e f : ↥base.support → L}
    (hS : TauCeti.IsSerreSystem K base.cartanMatrix.transpose
      (fun i ↦ (((LieAlgebra.IsKilling.rootSystem H).coroot i : H) : L)) e f)
    (hspan : LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f) = ⊤) :
    Function.Injective (TauCeti.serreLift hS) := sorry
end Serre

/-! ## Layer 8: exceptional split identifications -/

/-- The normalized native Serre map from split G2 to derivations of the split Zorn
 octonions is injective; together with its native surjectivity this identifies the two algebras. -/
theorem octonionSerreLift_injective (K : Type*) [Field K] [CharZero K] :
    Function.Injective (TauCeti.Octonion.g₂ToDerivationLieAlgebra (R := K)) := sorry

/-- The derivations of the native split Albert product are the split Serre algebra F4. -/
theorem nonempty_derivationAlbert_equiv_f4 (K : Type*) [Field K] [CharZero K] :
    Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K) ≃ₗ⁅K⁆
      LieAlgebra.f₄ (R := K)) := sorry

/-- The split exceptional Serre algebra E8 has dimension 248. -/
theorem finrank_e8 (K : Type*) [Field K] [CharZero K] :
    Module.finrank K (LieAlgebra.e₈ (R := K)) = 248 := sorry

/-- The split exceptional Serre algebras E6 and E7 have dimensions 78 and 133. -/
theorem finrank_e6_e7 (K : Type*) [Field K] [CharZero K] :
    Module.finrank K (LieAlgebra.e₆ (R := K)) = 78 ∧
      Module.finrank K (LieAlgebra.e₇ (R := K)) = 133 := sorry

/-- The complexification of the real division octonions is the split complex octonion
algebra: a complex-linear equivalence preserving the unit and the nonassociative product. -/
theorem exists_complexified_divisionOctonion_equiv :
    ∃ e : ℂ ⊗[ℝ] TauCeti.DivisionOctonionReal ≃ₗ[ℂ] TauCeti.Octonion ℂ,
      e 1 = 1 ∧ ∀ x y, e (x * y) = e x * e y := sorry

/-- The derivations of the real division octonions form the compact real form of G2: the
algebra has dimension 14 and its Killing form is negative definite. -/
theorem compact_g2_derivation_divisionOctonion :
    Module.finrank ℝ (TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal) = 14 ∧
      ∀ D : TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal, D ≠ 0 →
        killingForm ℝ (TauCeti.derivationLieAlgebra ℝ TauCeti.DivisionOctonionReal) D D < 0 :=
  sorry

/-! ## Layer 9: Littlewood-Richardson multiplicities and the normalized product center -/

section GeneralLinear

attribute [local instance 100] LieRing.ofAssociativeRing

/-- For Young diagrams with at most `n` rows, the multiplicity of the irreducible
`gl_n(ℂ)`-module of highest weight `ν` in the tensor product of those of highest weights `λ`
and `μ` is the number of Littlewood-Richardson tableaux of shape `ν/λ` and content `μ`. -/
theorem isotypicMultiplicity_tensor_glIrreducible_eq_card_lrTableau (n : ℕ)
    (lam mu nu : YoungDiagram) (hlam : lam.colLen 0 ≤ n) (hmu : mu.colLen 0 ≤ n)
    (hnu : nu.colLen 0 ≤ n) :
    LieModule.isotypicMultiplicity ℂ (Matrix (Fin n) (Fin n) ℂ)
        (TauCeti.glIrreducible n (fun i : Fin n => (lam.rowLen i : ℂ)) ⊗[ℂ]
          TauCeti.glIrreducible n (fun i : Fin n => (mu.rowLen i : ℂ)))
        (TauCeti.glIrreducible n (fun i : Fin n => (nu.rowLen i : ℂ))) =
      Nat.card (TauCeti.LRTableau lam nu mu) := sorry

end GeneralLinear

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

/-! ## Layer 10: closed-alcove representatives -/

/-- Two points of the closed fundamental alcove in one orbit of the affine Weyl group are
equal: with the native covering theorem, every orbit meets the closed alcove exactly once. -/
theorem eq_of_mem_closedFundamentalAlcove_of_mem_affineWeylGroup
    {ι R M N : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R] [Archimedean R]
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (P : RootPairing ι R M N) (b : P.Base) [Finite ι] [Nonempty ι]
    [P.IsCrystallographic] [P.IsReduced] [P.IsIrreducible] (x : N)
    (hx : x ∈ RootPairing.closedFundamentalAlcove P b) (f : N ≃ᵃ[R] N)
    (hf : f ∈ P.affineWeylGroup) (hfx : f x ∈ RootPairing.closedFundamentalAlcove P b) :
    f x = x := sorry

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight
