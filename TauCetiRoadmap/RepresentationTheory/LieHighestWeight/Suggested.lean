module

public import Mathlib
public import TauCeti.Algebra.Lie.HighestWeight.Weyl.Dimension
public import TauCeti.LinearAlgebra.SymmetricAlgebra.LieModule
public import TauCeti.LinearAlgebra.SymmetricAlgebra.Homogeneous
public import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Homogeneous
public import TauCeti.Algebra.Lie.Presentation.Serre.Killing
public import TauCeti.Algebra.Octonion.Serre
public import TauCeti.Algebra.AlbertAlgebra.Basic
public import TauCeti.Algebra.Lie.UniversalEnveloping.Prod
public import TauCeti.Algebra.Lie.UniversalEnveloping.Abelian
public import TauCeti.Algebra.Lie.UniversalEnveloping.Rees.ZeroFiber
public import TauCeti.Algebra.CayleyDickson.Quaternion
public import TauCeti.Algebra.Lie.GeneralLinear.Carrier
public import TauCeti.Algebra.Lie.Multiplicity
public import TauCeti.Combinatorics.Young.LittlewoodRichardson.Basic
public import TauCeti.LinearAlgebra.RootSystem.Weyl.Affine.Alcove

/-!
# Lie highest weights: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline
theorems against the pinned APIs: the normalized orthogonal polynomial tensor basis with
its determinant-twisted GL2 action, the first-order bracket on the zero fibre of the PBW Rees
algebra and its evaluation by the linear Poisson formula, normalized PBW symmetrization, the
invariant-form symmetry sign, the split Serre
presentation, the split identifications G2 and F4, the dimensions of the split Serre algebras
E6, E7 and E8, the compact real form of G2 on the division octonions and its
complexification, the Littlewood-Richardson multiplicities of the general linear Lie algebra,
the normalized center of an abelian direct product, and uniqueness of closed-alcove
representatives under the affine Weyl group.
The native highest-weight classification, Weyl formulas, complete reducibility, rank-one
spectrum and dimensions, general-linear classification, the minuscule and dual-standard
Pieri rules, the polynomial/symmetric-power dictionary, the Lie and Weyl invariants with the
Killing-orthogonal restriction and Chevalley's restriction theorem, the Harish-Chandra
isomorphisms with the central-character orbit theorem, the weight theory of the algebra
presented by Serre's relations with its simple-reflection automorphisms, the split Lie
algebras of the Dynkin types with their Serre surjections, the PBW Rees algebra with its
fibres at zero and one, the Cayley-Dickson double with the real division octonions, the
affine and extended affine Weyl groups with the fundamental alcove, and the differentiation
of rational representations of the general linear group are supplier contracts in
README.md, consumed by name and not restated here.

The following headlines are not statable at the pins. The formally real Albert algebra and
the compact form of F4 lack the Albert carrier over the division octonions: the pinned
`TauCeti.AlbertAlgebra` is the split one. The Vinberg E8 and Freudenthal E6/E7 model
comparisons lack their constructed brackets and modules; the dimensions of the native Serre
algebras are stated below. None is replaced here by admitted data.

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

/-! ## Layer 0: normalized rank-one tensor comparisons -/

/-- The degree-d monomial x^(d-i)y^i, extended by zero for i > d. -/
noncomputable def polynomialMonomial (d i : ℕ) : MvPolynomial (Fin 2) ℂ :=
  if i ≤ d then MvPolynomial.X 0 ^ (d - i) * MvPolynomial.X 1 ^ i else 0

/-- The polynomial operator X_a ∂_b; (a,b) = (0,1) raises and (1,0) lowers. -/
noncomputable def polynomialOperator (a b : Fin 2) :
    Module.End ℂ (MvPolynomial (Fin 2) ℂ) :=
  (MvPolynomial.X a : MvPolynomial (Fin 2) ℂ) • (MvPolynomial.pderiv (R := ℂ) b).toLinearMap

/-- The sum of X_a ∂_b on the two polynomial tensor factors. -/
noncomputable def tensorPolynomialOperator (a b : Fin 2) :
    Module.End ℂ (MvPolynomial (Fin 2) ℂ ⊗[ℂ] MvPolynomial (Fin 2) ℂ) :=
  TensorProduct.map (polynomialOperator a b) LinearMap.id +
    TensorProduct.map LinearMap.id (polynomialOperator a b)

/-- The standard-vector substitution X_i ↦ ∑_j g_ji X_j, restricted to GL2. -/
noncomputable def polynomialAction (g : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
    Module.End ℂ (MvPolynomial (Fin 2) ℂ) :=
  (MvPolynomial.aeval fun i : Fin 2 =>
    ∑ j : Fin 2, (g : Matrix (Fin 2) (Fin 2) ℂ) j i • MvPolynomial.X j).toLinearMap

/-- The highest vector (x₁y₂-y₁x₂)^r x₁^(m-r)x₂^(n-r), in the polynomial tensor product. -/
noncomputable def polynomialTensorHighest (m n : ℕ) (r : Fin (min m n + 1)) :
    MvPolynomial (Fin 2) ℂ ⊗[ℂ] MvPolynomial (Fin 2) ℂ :=
  ∑ j ∈ Finset.range (r.val + 1), ((-1 : ℂ) ^ j * (r.val.choose j : ℂ)) •
    (polynomialMonomial m j ⊗ₜ[ℂ] polynomialMonomial n (r.val - j))

/-- The k-th string vector is (N-k)!/N! times the k-th lowering of the highest
vector, where N=m+n-2r; it is zero outside 0 ≤ k ≤ N. -/
noncomputable def polynomialTensorString (m n : ℕ) (r : Fin (min m n + 1)) (k : ℕ) :
    MvPolynomial (Fin 2) ℂ ⊗[ℂ] MvPolynomial (Fin 2) ℂ :=
  let N := m + n - 2 * r.val
  if k ≤ N then
    (((N - k).factorial : ℂ) / (N.factorial : ℂ)) •
      ((tensorPolynomialOperator 1 0 ^ k) (polynomialTensorHighest m n r))
  else 0

/-- The coefficient of x^(m-i)y^i ⊗ x^(n-j)y^j in a polynomial tensor. -/
noncomputable def polynomialTensorCoefficient (m n : ℕ) (i : Fin (m + 1))
    (j : Fin (n + 1)) :
    (MvPolynomial (Fin 2) ℂ ⊗[ℂ] MvPolynomial (Fin 2) ℂ) →ₗ[ℂ] ℂ :=
  TensorProduct.lift
    ((MvPolynomial.lcoeff ℂ (Finsupp.single 0 (m - i.val) + Finsupp.single 1 i.val)).smulRight
      (MvPolynomial.lcoeff ℂ (Finsupp.single 0 (n - j.val) + Finsupp.single 1 j.val)))

/-- The coefficient pairing with monomial squared norms 1/(choose(m,i)choose(n,j)),
conjugate-linear in its first variable; its restriction to bidegree (m,n) is positive definite. -/
noncomputable def polynomialTensorPairing (m n : ℕ)
    (u v : MvPolynomial (Fin 2) ℂ ⊗[ℂ] MvPolynomial (Fin 2) ℂ) : ℂ :=
  ∑ i : Fin (m + 1), ∑ j : Fin (n + 1),
    star (polynomialTensorCoefficient m n i j u) * polynomialTensorCoefficient m n i j v /
      ((m.choose i.val : ℂ) * (n.choose j.val : ℂ))

/-- The normalized polynomial strings form an orthogonal basis of P_m ⊗ P_n.
Their Gram matrix has the factorial normalization, and each string intertwines
with det^r ⊗ Sym^(m+n-2r) under the actual standard-vector GL2 substitutions. -/
theorem normalizedPolynomialTensorBasis (m n : ℕ) :
    ∃ b : Module.Basis (Σ r : Fin (min m n + 1), Fin (m + n - 2 * r.val + 1)) ℂ
        (MvPolynomial.homogeneousSubmodule (Fin 2) ℂ m ⊗[ℂ]
          MvPolynomial.homogeneousSubmodule (Fin 2) ℂ n),
      (∀ a, TensorProduct.map
          (MvPolynomial.homogeneousSubmodule (Fin 2) ℂ m).subtype
          (MvPolynomial.homogeneousSubmodule (Fin 2) ℂ n).subtype (b a) =
        polynomialTensorString m n a.1 a.2.val) ∧
      (∀ a c : Σ r : Fin (min m n + 1), Fin (m + n - 2 * r.val + 1),
        polynomialTensorPairing m n (polynomialTensorString m n a.1 a.2.val)
            (polynomialTensorString m n c.1 c.2.val) =
          if a = c then
            ((a.1.val.factorial : ℂ) * ((m - a.1.val).factorial : ℂ) *
              ((n - a.1.val).factorial : ℂ) * ((m + n - a.1.val + 1).factorial : ℂ)) /
            ((m.factorial : ℂ) * (n.factorial : ℂ) *
              ((m + n - 2 * a.1.val + 1).factorial : ℂ) *
              ((m + n - 2 * a.1.val).choose a.2.val : ℂ))
          else 0) ∧
      (∀ (g : Matrix.GeneralLinearGroup (Fin 2) ℂ) (r : Fin (min m n + 1))
          (k : Fin (m + n - 2 * r.val + 1)),
        TensorProduct.map (polynomialAction g) (polynomialAction g)
            (polynomialTensorString m n r k.val) =
          ((g : Matrix (Fin 2) (Fin 2) ℂ).det ^ r.val) •
            ∑ i : Fin (m + n - 2 * r.val + 1),
              (MvPolynomial.lcoeff ℂ
                (Finsupp.single 0 (m + n - 2 * r.val - i.val) + Finsupp.single 1 i.val)
                (polynomialAction g (polynomialMonomial (m + n - 2 * r.val) k.val))) •
              polynomialTensorString m n r i.val) := sorry

/-! ## Layer 3: the PBW Rees zero fibre and the linear Poisson bracket -/

/-- On the zero fibre of the PBW Rees algebra of a Lie algebra that is free as a module over a
commutative ring, the commutator divided by the central parameter is a well-defined bilinear
bracket on the
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

/-- The gradient at `ξ ∈ L*` of a symmetric tensor read as a polynomial function on `L*`: the
vector `Σᵢ (∂ᵢ P)(ξ(b₁), …, ξ(bₙ)) • bᵢ` of `L`, where `P` is the polynomial of `p` in the
coordinates of the finite basis `b`. Under biduality it is the derivative of `η ↦ p(η)` at `ξ`,
so it does not depend on `b`. -/
noncomputable def symmetricGradient {L : Type*} [AddCommGroup L] [Module ℝ L] {ι : Type*}
    [Fintype ι] (b : Module.Basis ι ℝ L) (p : SymmetricAlgebra ℝ L) (ξ : Module.Dual ℝ L) : L :=
  ∑ i, MvPolynomial.eval (fun j => ξ (b j))
      (MvPolynomial.pderiv i (SymmetricAlgebra.equivMvPolynomial b p)) • b i

/-- For a finite-dimensional real Lie algebra, every bilinear bracket with the defining equation
of the zero-fibre bracket of `exists_reesZeroFiberBracket` evaluates at `ξ ∈ L*` by the linear
Poisson formula `{p, q}(ξ) = ξ([dp_ξ, dq_ξ])`, the derivatives being the gradients
`symmetricGradient b p ξ` and `symmetricGradient b q ξ` (Gutt, *Deformation Quantization and
Symmetries*, Lecture 1, slide 14, for the convention `P_ξ(X, Y) = ξ([X, Y])`). -/
theorem lift_reesZeroFiberBracket_eq_lie_symmetricGradient (L : Type*) [LieRing L]
    [LieAlgebra ℝ L] {ι : Type*} [Fintype ι] (b : Module.Basis ι ℝ L)
    (B : SymmetricAlgebra ℝ L →ₗ[ℝ] SymmetricAlgebra ℝ L →ₗ[ℝ] SymmetricAlgebra ℝ L)
    (hB : ∀ a c d : TauCeti.UniversalEnvelopingAlgebra.reesAlgebra ℝ L,
      a * c - c * a = TauCeti.UniversalEnvelopingAlgebra.reesParameter ℝ L * d →
      B (TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero ℝ L a)
          (TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero ℝ L c) =
        TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero ℝ L d)
    (p q : SymmetricAlgebra ℝ L) (ξ : Module.Dual ℝ L) :
    SymmetricAlgebra.lift ξ (B p q) = ξ ⁅symmetricGradient b p ξ, symmetricGradient b q ξ⁆ :=
  sorry

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

/-! ## Layer 7: normalized PBW symmetrization and the split Serre presentation -/

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
