import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AbelianVariety.MorphismGroup
import TauCeti.Geometry.Hodge.WeightOne.RiemannForm
import TauCeti.Geometry.Lie.Exponential.LocalInverse

/-!
# Abelian schemes and arithmetic moduli: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular targets, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap.

The file records the light definitions of the roadmap with real bodies, and the theorems whose
carriers exist in the pinned Mathlib and Tau Ceti: the relative carrier `AbelianScheme`, isogenies
and multiplication maps over a base, the degree of a homomorphism of abelian varieties over a field,
simple abelian varieties, the finiteness, semisimplicity and characteristic-polynomial theorems,
coefficient Hom spaces, the real positive-involution normal form and internal square roots,
the alternating elementary-divisor theorem and the Siegel space. Statements
whose carriers are not yet in the libraries (the dual abelian scheme, polarizations, Tate modules of
abelian schemes, de Rham realizations, Barsotti–Tate groups, the complex uniformization, Weil
restriction) are specified in the README and listed at the end.

Design choices made explicit here:
* An abelian scheme is a group object in `Over S` with proper, smooth and geometrically connected
  structure morphism. Commutativity and the homomorphism property of zero-preserving maps are
  theorems (`isCommMonObj`, `isMonHom_of_zero_preserving`), not axioms.
* Over a field the carrier is Tau Ceti's `AbelianVariety K`, whose Hom groups are written
  multiplicatively; `End A = Additive (A ⟶ A)` is a ring, and rational endomorphisms are
  `ℚ ⊗[ℤ] End A`. Dimensions are `A.dim : WithBot ℕ∞`; a statement in dimension `g` carries
  `A.dim = g`.
* The degree of an isogeny is Mathlib's `Scheme.Hom.finrank`, which counts inseparable degree; a
  non-isogeny has degree `0`.
* Riemann forms are Tau Ceti's `IsRiemannForm`, with positivity `E(Jv, v) > 0`; the Hermitian form
  is linear in the first variable, `H(v, w) = E(Jv, w) + i E(v, w)`, and principal means unimodular
  on the lattice (README A5.2).
* ComplexTori Milestone 1 owns the complex Lie-group structure on the translation carrier
  `AddAction.orbitRel.Quotient Λ V`, its descended maps and natural covering/homology identifications,
  for finite-dimensional complex normed `V` and `Λ : Submodule ℤ V` with `DiscreteTopology Λ`
  and `IsZLattice ℝ Λ`. Its Milestones 2–3 supply manifold period families and equivariant maps;
  Milestone 4 supplies trivial-action lattice torsion. A5 transports these to algebraic abelian
  varieties and supplies the polarized Hodge and Siegel interpretations.
-/

open CategoryTheory Limits MonoidalCategory AlgebraicGeometry MonObj Polynomial
open scoped TensorProduct Quaternion TauCeti.AlgebraicGeometry.AbelianVariety.Hom

namespace TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

universe u

/-- A Riemann form determines the homological Hodge structure of weight `−1`: the
`+i`-eigenspace of `J` has type `(-1, 0)`, the Weil operator is `−J`, and the polarizing
form is `−E` (README A5.2, `RiemannForm.homological`). -/
theorem RiemannForm.homological {Λ Vℂ : Type*} [AddCommGroup Λ]
    [Module.Free ℤ Λ] [Module.Finite ℤ Λ] [AddCommGroup Vℂ] [Module ℂ Vℂ]
    {ιℂ : Λ →ₗ[ℤ] Vℂ} (hℂ : IsBaseChange ℂ ιℂ)
    (J : TauCeti.AlmostComplexStructure (TauCeti.Hodge.Realification Λ))
    (E : LinearMap.BilinForm ℤ Λ) (hE : J.IsRiemannForm E) :
    ∃! hs : TauCeti.Hodge.HodgeStructure hℂ (-1),
      hs.piece (-1) = Module.End.eigenspace (J.latticeComplexification hℂ) Complex.I ∧
      hs.piece 0 = Module.End.eigenspace (J.latticeComplexification hℂ) (-Complex.I) ∧
      (∀ p : ℤ, p ≠ -1 → p ≠ 0 → hs.piece p = ⊥) ∧
      hs.weilOperator = -J.latticeComplexification hℂ ∧
      TauCeti.Hodge.IsPolarization hℂ hs (-E) := by
  sorry

/-! ## Layer A0: The carrier and its boundaries -/

/-- An **abelian scheme** over a scheme `S`: a group object in `Over S` whose structure morphism
is proper and smooth with geometrically connected fibres. No commutativity, dimension or ample line
bundle is part of the data (README A0.1). Over `Spec K` it agrees with Tau Ceti's
`AbelianVariety K` (`ofAbelianVariety`, `toAbelianVariety`). -/
structure AbelianScheme (S : Scheme.{u}) where
  /-- The underlying group scheme over `S`. -/
  toOver : Over S
  /-- The group law. -/
  grpObj : GrpObj toOver
  /-- The structure morphism is proper. -/
  isProper : IsProper toOver.hom
  /-- The structure morphism is smooth. -/
  smooth : Smooth toOver.hom
  /-- The structure morphism has geometrically connected fibres. -/
  geometricallyConnected : GeometricallyConnected toOver.hom

namespace AbelianScheme

attribute [instance] AbelianScheme.grpObj AbelianScheme.isProper AbelianScheme.smooth
  AbelianScheme.geometricallyConnected

variable {S : Scheme.{u}}

/-- The underlying scheme of an abelian scheme. -/
noncomputable abbrev toScheme (A : AbelianScheme S) : Scheme.{u} :=
  A.toOver.left

/-- The zero section `S ⟶ A`, the unit of the group law. -/
noncomputable abbrev zeroSection (A : AbelianScheme S) : S ⟶ A.toScheme :=
  η[A.toOver].left

/-- The zero section is a section of the structure morphism. -/
theorem zeroSection_comp (A : AbelianScheme S) : A.zeroSection ≫ A.toOver.hom = 𝟙 S :=
  Over.w η[A.toOver]

/-- Base change of an abelian scheme along `f : T ⟶ S`: the pullback group scheme.
Its group structure is transported by the monoidal pullback functor. -/
noncomputable def baseChange (A : AbelianScheme S) {T : Scheme.{u}} (f : T ⟶ S) :
    AbelianScheme T where
  toOver := (Over.pullback f).obj A.toOver
  grpObj := Functor.grpObjObj
  isProper := inferInstanceAs (IsProper (pullback.snd A.toOver.hom f))
  smooth := inferInstanceAs (Smooth (pullback.snd A.toOver.hom f))
  geometricallyConnected :=
    inferInstanceAs (GeometricallyConnected (pullback.snd A.toOver.hom f))

/-- The `Over` object of a base change is the pullback of the original one. -/
theorem baseChange_toOver (A : AbelianScheme S) {T : Scheme.{u}} (f : T ⟶ S) :
    (A.baseChange f).toOver = (Over.pullback f).obj A.toOver :=
  rfl

/-- The identity of a scheme has geometrically connected fibres. -/
theorem geometricallyConnected_id (S : Scheme.{u}) : GeometricallyConnected (𝟙 S) := by
  sorry

/-- The dimension-zero abelian scheme: the identity `S ⟶ S` with its trivial group law. -/
noncomputable def identity (S : Scheme.{u}) : AbelianScheme S where
  toOver := 𝟙_ (Over S)
  grpObj := inferInstance
  isProper := by dsimp; infer_instance
  smooth := by dsimp; infer_instance
  geometricallyConnected := geometricallyConnected_id S

/-- A Tau Ceti abelian variety over `K` is an abelian scheme over `Spec K`. -/
noncomputable def ofAbelianVariety {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) : AbelianScheme (Spec (.of K)) where
  toOver := A.toOver
  grpObj := A.grpObj
  isProper := A.isProper
  smooth := inferInstance
  geometricallyConnected := inferInstance

/-- Over a field, an abelian scheme is geometrically integral: a smooth group scheme with
geometrically connected fibres over a field is geometrically irreducible and geometrically
reduced (README A0.1). -/
theorem geometricallyIntegral {K : Type u} [Field K] (A : AbelianScheme (Spec (.of K))) :
    GeometricallyIntegral A.toOver.hom := by
  sorry

/-- An abelian scheme over `Spec K` as a Tau Ceti abelian variety. -/
noncomputable def toAbelianVariety {K : Type u} [Field K] (A : AbelianScheme (Spec (.of K))) :
    TauCeti.AlgebraicGeometry.AbelianVariety K where
  toOver := A.toOver
  grpObj := A.grpObj
  isProper := A.isProper
  geometricallyIntegral := A.geometricallyIntegral

/-- The two field adapters are inverse on underlying group schemes. -/
theorem toAbelianVariety_ofAbelianVariety {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    (ofAbelianVariety A).toAbelianVariety.toOver = A.toOver :=
  rfl

/-! ## Layer A1: Rigidity and normalized line bundles -/

/-- **Automatic commutativity** over an arbitrary base (README A1.2). -/
theorem isCommMonObj (A : AbelianScheme S) : IsCommMonObj A.toOver := by
  sorry

/-- **Rigidity** over an arbitrary base, nonreduced bases included: a morphism of abelian schemes
over `S` preserving the zero sections is a homomorphism (README A1.2). -/
theorem isMonHom_of_zero_preserving {A B : AbelianScheme S} (f : A.toOver ⟶ B.toOver)
    (hf : η[A.toOver] ≫ f = η[B.toOver]) : IsMonHom f := by
  sorry

/-- A homomorphism of abelian schemes over a base restricting to zero on a nilpotent closed
subscheme of the base is zero: restriction of homomorphisms across a nilpotent thickening is
injective (README A1.2(4)). -/
theorem eq_of_restrict_nilpotent {A B : AbelianScheme S} {S₀ : Scheme.{u}} (i : S₀ ⟶ S)
    [IsClosedImmersion i] (hi : IsNilpotent (Scheme.Hom.ker i))
    (f g : A.toOver ⟶ B.toOver) [IsMonHom f] [IsMonHom g]
    (h : (Over.pullback i).map f = (Over.pullback i).map g) : f = g := by
  sorry

/-- An abelian scheme of relative dimension zero is the base: its zero section is an
isomorphism (README A1.1). -/
theorem isIso_zeroSection_of_relDim_zero (A : AbelianScheme S)
    [SmoothOfRelativeDimension 0 A.toOver.hom] : IsIso A.zeroSection := by
  sorry

/-- Restriction to the generic fibre is bijective for maps from any smooth test scheme into an
abelian scheme over a connected Dedekind base. The Dedekind condition is imposed on every nonempty
affine open; no properness, separation or quasi-compactness of the source is required
(README A1.8). -/
theorem weilExtension [IsIntegral S]
    (hS : ∀ U : S.affineOpens, Nonempty U.1 → IsDedekindDomain Γ(S, U.1))
    (A : AbelianScheme S) (X : Over S) [Smooth X.hom] :
    Function.Bijective (fun f : X ⟶ A.toOver =>
      (Over.pullback (S.fromSpecStalk (genericPoint S))).map f) := by
  sorry

/-! ## Layer A3: Isogenies, finite-flat quotients, torsion and pairings -/

/-- Multiplication by `n` on an abelian scheme, `[n] = 𝟙 ^ n` in the group of endomorphisms of the
group object. -/
noncomputable def mulBy (A : AbelianScheme S) (n : ℤ) : A.toOver ⟶ A.toOver :=
  𝟙 A.toOver ^ n

/-- Multiplication by one is the identity morphism (README A3.2). -/
theorem mulBy_one (A : AbelianScheme S) : A.mulBy 1 = 𝟙 A.toOver :=
  zpow_one _

/-- Multiplication by zero is the zero homomorphism, written as the Hom group's unit
(README A3.2). -/
theorem mulBy_zero (A : AbelianScheme S) : A.mulBy 0 = 1 :=
  zpow_zero _

/-- Multiplication by minus one is group inversion (README A3.2). -/
theorem mulBy_neg_one (A : AbelianScheme S) : A.mulBy (-1) = ι[A.toOver] := by
  simp [mulBy, CategoryTheory.Hom.inv_def]

/-- Multiplication by a sum is the pointwise product of the multiplication morphisms
in the multiplicative Hom group (README A3.2). -/
theorem mulBy_add (A : AbelianScheme S) (m n : ℤ) :
    A.mulBy (m + n) = A.mulBy m * A.mulBy n :=
  zpow_add _ _ _

/-- An **isogeny** of abelian schemes over `S`: a homomorphism whose scheme morphism is finite, flat and surjective
(README A3.1). Over an affine base this is the condition of Tau Ceti's
`TauCeti.GroupScheme.IsIsogeny`; local finite presentation follows. -/
def IsAbelianIsogeny {A B : AbelianScheme S} (f : A.toOver ⟶ B.toOver) : Prop :=
  IsMonHom f ∧ IsFinite f.left ∧ Flat f.left ∧ Surjective f.left

/-- Check: the identity of an abelian scheme is an isogeny. -/
example (A : AbelianScheme S) : IsAbelianIsogeny (𝟙 A.toOver) := by
  refine ⟨inferInstance, ?_, ?_, ?_⟩ <;> rw [Over.id_left] <;> infer_instance

/-- **Multiplication maps** over an arbitrary base: for `n ≠ 0` on an abelian scheme of relative
dimension `g`, `[n]` is an isogeny of constant rank `|n|^(2g)` (README A3.2). -/
theorem mulBy_isAbelianIsogeny (A : AbelianScheme S) (g : ℕ)
    [SmoothOfRelativeDimension g A.toOver.hom] (n : ℤ) (hn : n ≠ 0) :
    IsAbelianIsogeny (A.mulBy n) ∧
      ∀ x : A.toScheme, (A.mulBy n).left.finrank x = n.natAbs ^ (2 * g) := by
  sorry

/-- `[n]` is étale where `n` is invertible (README A3.2). -/
theorem etale_mulBy (A : AbelianScheme S) (n : ℕ) (hunit : IsUnit (n : Γ(S, ⊤))) :
    Etale (A.mulBy n).left := by
  sorry

end AbelianScheme

namespace OverField

open TauCeti.AlgebraicGeometry
open TauCeti.AlgebraicGeometry.AbelianVariety (IsIsogeny mulBy)

variable {K : Type u} [Field K]

/-- A surjective homomorphism of abelian varieties is flat, hence faithfully flat,
without a dimension restriction (README A3.1). -/
theorem surjectiveHom_flat {A B : AbelianVariety K} (f : A ⟶ B)
    (hf : Surjective (AbelianVariety.Hom.toSchemeHom f)) :
    Flat (AbelianVariety.Hom.toSchemeHom f) := by
  sorry

/-- Over a field, the relative isogeny condition is Tau Ceti's `IsIsogeny` (finite and surjective):
`surjectiveHom_flat` supplies flatness (README A3.1). -/
theorem isAbelianIsogeny_iff {A B : AbelianVariety K} (f : A ⟶ B) :
    AbelianScheme.IsAbelianIsogeny (A := AbelianScheme.ofAbelianVariety A)
        (B := AbelianScheme.ofAbelianVariety B) (AbelianVariety.Hom.toOverHom f) ↔ IsIsogeny f := by
  sorry

/-- **Prime-to-characteristic torsion is dense** over an algebraically closed field: the union of
the images of the `n`-torsion `K`-points, `n` invertible in `K`, is dense (README A3.2(2)). -/
theorem dense_primeToChar_torsion [IsAlgClosed K] (A : AbelianVariety K) :
    Dense (⋃ (x : 𝟙_ (Over (Spec (.of K))) ⟶ A.toOver)
      (_ : ∃ n : ℕ, 0 < n ∧ (n : K) ≠ 0 ∧ x ^ n = 1), Set.range x.left.base) := by
  sorry

/-- **Hom is torsion-free** (README A3.4, A6.2). -/
theorem hom_torsionFree {A B : AbelianVariety K} (f : A ⟶ B) (n : ℕ) (hn : 0 < n)
    (h : f ^ n = 1) : f = 1 := by
  sorry

end OverField

/-! ## Layer A5: Complex uniformization and families -/

/-- **Alternating elementary divisors** (README A5.4(1)): a nondegenerate integral alternating form
on `ℤ^(2g)` has, in a suitable basis, the matrix `[[0, D], [−D, 0]]` with `D` diagonal, positive and
divisibility-ordered; the determinant is `(∏ dᵢ)²`. -/
theorem alternating_elementaryDivisors {g : ℕ}
    (E : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ) (halt : E.transpose = -E)
    (hdiag : ∀ i, E i i = 0)
    (hdet : E.det ≠ 0) :
    ∃ (P : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ) (d : Fin g → ℕ),
      IsUnit P.det ∧ (∀ i, 0 < d i) ∧ (∀ i j, i ≤ j → d i ∣ d j) ∧
      P.transpose * E * P = Matrix.fromBlocks 0 (Matrix.diagonal fun i => (d i : ℤ))
        (-Matrix.diagonal fun i => (d i : ℤ)) 0 ∧
      E.det = (∏ i, (d i : ℤ)) ^ 2 := by
  sorry

/-- The **Siegel space** `H_g`: symmetric complex `g × g` matrices with positive definite
imaginary part (README A5.8). -/
def SiegelUpperHalfSpace (g : ℕ) : Set (Matrix (Fin g) (Fin g) ℂ) :=
  {Ω | Ω.transpose = Ω ∧ (Ω.map Complex.im).PosDef}

/-- The action of an integral `2g × 2g` matrix `[[A, B], [C, D]]` on periods,
`Ω ↦ (AΩ + B)(CΩ + D)⁻¹`, in the column convention for the lattice `ℤ^g + Ωℤ^g`. -/
noncomputable def siegelAction {g : ℕ} (M : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ)
    (Ω : Matrix (Fin g) (Fin g) ℂ) : Matrix (Fin g) (Fin g) ℂ :=
  let Mc := M.map (Int.cast : ℤ → ℂ)
  (Mc.toBlocks₁₁ * Ω + Mc.toBlocks₁₂) * (Mc.toBlocks₂₁ * Ω + Mc.toBlocks₂₂)⁻¹

/-- The identity symplectic matrix fixes every period matrix (README A5.8,
`siegelAction_one`). -/
theorem siegelAction_one {g : ℕ} (Ω : Matrix (Fin g) (Fin g) ℂ) :
    siegelAction (1 : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ) Ω = Ω := by
  sorry

/-- An upper unipotent block matrix translates periods by its upper-right block
(README A5.8, `siegelAction_translation`). The formula holds for every integral block;
symmetric blocks give symplectic matrices. -/
theorem siegelAction_translation {g : ℕ} (B : Matrix (Fin g) (Fin g) ℤ)
    (Ω : Matrix (Fin g) (Fin g) ℂ) :
    siegelAction (Matrix.fromBlocks 1 B 0 1) Ω = Ω + B.map (Int.cast : ℤ → ℂ) := by
  sorry

/-- `Sp_{2g}(ℤ)` preserves the Siegel space, and `CΩ + D` is invertible there (README A5.8). -/
theorem siegelAction_mem {g : ℕ} (M : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ)
    (hM : M ∈ Matrix.symplecticGroup (Fin g) ℤ) {Ω : Matrix (Fin g) (Fin g) ℂ}
    (hΩ : Ω ∈ SiegelUpperHalfSpace g) :
    IsUnit ((M.map (Int.cast : ℤ → ℂ)).toBlocks₂₁ * Ω + (M.map (Int.cast : ℤ → ℂ)).toBlocks₂₂).det ∧
      siegelAction M Ω ∈ SiegelUpperHalfSpace g := by
  sorry

/-- Symplectic multiplication corresponds to composition of the period action on Siegel
space (README A5.8, `siegelAction_mul`). -/
theorem siegelAction_mul {g : ℕ}
    (M N : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ)
    (hM : M ∈ Matrix.symplecticGroup (Fin g) ℤ)
    (hN : N ∈ Matrix.symplecticGroup (Fin g) ℤ)
    {Ω : Matrix (Fin g) (Fin g) ℂ} (hΩ : Ω ∈ SiegelUpperHalfSpace g) :
    siegelAction (M * N) Ω = siegelAction M (siegelAction N Ω) := by
  sorry

/-- Check: positive definite imaginary part does not admit a nonsymmetric period
(README A5.8). -/
example : !![Complex.I, 1; 0, Complex.I] ∉ SiegelUpperHalfSpace 2 := by
  intro h
  have hsym := congrArg (fun Ω : Matrix (Fin 2) (Fin 2) ℂ => Ω 0 1) h.1
  norm_num [Matrix.transpose_apply] at hsym

/-! ## Layer A6: Arithmetic Hom and exports -/

namespace OverField

open TauCeti.AlgebraicGeometry
open TauCeti.AlgebraicGeometry.AbelianVariety (IsIsogeny mulBy)

variable {K : Type u} [Field K]

/-- The **degree** of a homomorphism of abelian varieties: the rank of the finite morphism at the
zero point of the target if it is an isogeny, and `0` otherwise (README A6.1). It counts
inseparable degree. -/
noncomputable def Hom.deg {A B : AbelianVariety K} (f : A ⟶ B) : ℕ := by
  classical
  exact if IsIsogeny f then (AbelianVariety.Hom.toSchemeHom f).finrank B.zeroPoint else 0

/-- Degrees multiply for composable maps between varieties of equal dimension. -/
theorem deg_comp {A B C : AbelianVariety K} (f : A ⟶ B) (h : B ⟶ C) (hAB : A.dim = B.dim)
    (hBC : B.dim = C.dim) : Hom.deg (f ≫ h) = Hom.deg f * Hom.deg h := by
  sorry

/-- `deg [n] = |n|^(2g)`, with `0 ^ 0 = 1` in dimension zero. -/
theorem deg_mulBy (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (n : ℤ) :
    Hom.deg (mulBy A n) = n.natAbs ^ (2 * g) := by
  sorry

/-- For varieties of equal dimension, a homomorphism is an isogeny iff its degree is nonzero. -/
theorem isIsogeny_iff_deg_ne_zero {A B : AbelianVariety K} (f : A ⟶ B) (hAB : A.dim = B.dim) :
    IsIsogeny f ↔ Hom.deg f ≠ 0 := by
  sorry

/-- Every endomorphism of a zero-dimensional abelian variety has degree one. -/
theorem deg_dimension_zero (A : AbelianVariety K) (hg : A.dim = 0) (α : AbelianVariety.End A) :
    Hom.deg (AbelianVariety.End.toHom α) = 1 := by
  sorry

/-- **Images over the original field**: the image of a homomorphism is an abelian subvariety,
through which the homomorphism factors by a faithfully flat homomorphism (README A6.3). -/
theorem exists_abelianImage {A C : AbelianVariety K} (f : A ⟶ C) :
    ∃ (B : AbelianVariety K) (q : A ⟶ B) (i : B ⟶ C),
      IsClosedImmersion (AbelianVariety.Hom.toSchemeHom i) ∧
        Flat (AbelianVariety.Hom.toSchemeHom q) ∧
          Surjective (AbelianVariety.Hom.toSchemeHom q) ∧ q ≫ i = f := by
  sorry

/-- An abelian variety is **simple** if it is not zero-dimensional and each of its abelian
subvarieties (closed-immersion homomorphisms into it) is zero-dimensional or an isomorphism
(README A6.4). -/
def IsSimple (A : AbelianVariety K) : Prop :=
  A.dim ≠ 0 ∧ ∀ (B : AbelianVariety K) (i : B ⟶ A),
    IsClosedImmersion (AbelianVariety.Hom.toSchemeHom i) →
    B.dim = 0 ∨ IsIso i

/-- Check: a zero-dimensional abelian variety is not simple, so that `End⁰` of a simple abelian
variety is never the zero ring. -/
example (A : AbelianVariety K) (hA : A.dim = 0) : ¬ IsSimple A := fun h => h.1 hA

/-- A nonzero endomorphism of a simple abelian variety is an isogeny. -/
theorem isIsogeny_of_isSimple {A : AbelianVariety K} (hA : IsSimple A) (α : AbelianVariety.End A)
    (hα : α ≠ 0) : IsIsogeny (AbelianVariety.End.toHom α) := by
  sorry

/-- `End⁰` of a simple abelian variety is a division algebra (README A6.4). -/
theorem isUnit_of_isSimple {A : AbelianVariety K} (hA : IsSimple A)
    (x : ℚ ⊗[ℤ] AbelianVariety.End A)
    (hx : x ≠ 0) : IsUnit x := by
  sorry

/-- **Poincaré complete reducibility**: every abelian subvariety `B ⊆ A` has a complement `C`
such that addition `B × C → A` is an isogeny (README A6.5). -/
theorem poincareReducibility {A B : AbelianVariety K} (i : B ⟶ A)
    (hi : IsClosedImmersion (AbelianVariety.Hom.toSchemeHom i)) :
    ∃ (C : AbelianVariety K) (j : C ⟶ A), IsClosedImmersion (AbelianVariety.Hom.toSchemeHom j) ∧
      IsIsogeny ((AbelianVariety.prod.fst B C ≫ i) * (AbelianVariety.prod.snd B C ≫ j)) := by
  sorry

/-- **The degree is a homogeneous polynomial** of degree `2g` on every finite family of
endomorphisms, evaluated at integer points (README A6.6). -/
theorem degree_polynomial (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞))
    {I : Type*} [Fintype I] (e : I → AbelianVariety.End A) :
    ∃ p : MvPolynomial I ℚ, p.IsHomogeneous (2 * g) ∧
      ∀ x : I → ℤ, MvPolynomial.eval (fun i => (x i : ℚ)) p =
        (Hom.deg (AbelianVariety.End.toHom (∑ i, x i • e i)) : ℚ) := by
  sorry

/-- **Hom is free of finite rank**, of rank at most `4 · dim A · dim B` (README A6.7). -/
theorem homFreeFinite (A B : AbelianVariety K) (gA gB : ℕ) (hA : A.dim = (gA : WithBot ℕ∞))
    (hB : B.dim = (gB : WithBot ℕ∞)) :
    Module.Free ℤ (Additive (A ⟶ B)) ∧ Module.Finite ℤ (Additive (A ⟶ B)) ∧
      Module.finrank ℤ (Additive (A ⟶ B)) ≤ 4 * gA * gB := by
  sorry

/-- **`End⁰(A)` is a finite-dimensional semisimple `ℚ`-algebra** (README A6.8). -/
theorem endQ_isSemisimple (A : AbelianVariety K) :
    IsSemisimpleRing (ℚ ⊗[ℤ] AbelianVariety.End A) ∧
      Module.Finite ℚ (ℚ ⊗[ℤ] AbelianVariety.End A) := by
  sorry

/-- A monic polynomial over `ℚ_ℓ` is determined by the norms of products of all integral
polynomial tests over its roots, with multiplicity (README A6.9,
`polynomialsFromAdicValues`). -/
theorem eq_of_padicNorm_roots_products (ℓ : ℕ) [Fact ℓ.Prime]
    (P Q : (Padic ℓ)[X]) (hP : P.Monic) (hQ : Q.Monic)
    (hdegree : P.natDegree = Q.natDegree)
    (htests : ∀ F : ℤ[X],
      ‖((P.map (algebraMap (Padic ℓ) (PadicAlgCl ℓ))).roots.map
          (fun a => F.eval₂ (Int.castRingHom (PadicAlgCl ℓ)) a)).prod‖ =
        ‖((Q.map (algebraMap (Padic ℓ) (PadicAlgCl ℓ))).roots.map
          (fun a => F.eval₂ (Int.castRingHom (PadicAlgCl ℓ)) a)).prod‖) : P = Q := by
  sorry

/-- The determinant of a polynomial evaluated at a matrix is the product of its values at
the characteristic roots, counted with multiplicity (README A6.9,
`multiplicativePolynomialLaw`, determinant specialization). -/
theorem det_aeval_eq_prod_roots {F : Type*} [Field F] [IsAlgClosed F] {n : ℕ}
    (M : Matrix (Fin n) (Fin n) F) (G : F[X]) :
    (aeval M G).det = (M.charpoly.roots.map fun a => G.eval a).prod := by
  sorry

/-- **The characteristic polynomial** of an endomorphism: the unique monic integral polynomial of
degree `2g` whose value at every integer `r` is `deg(α − r)`. This algebraic construction uses
degree polynomials, finite-rank Hom and Tate-module linear algebra (README A6.10). -/
theorem exists_charpoly (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞))
    (α : AbelianVariety.End A) :
    ∃! P : ℤ[X], P.Monic ∧ P.natDegree = 2 * g ∧
      ∀ r : ℤ,
        P.eval r = (Hom.deg (AbelianVariety.End.toHom (α - (r : AbelianVariety.End A))) : ℤ) := by
  sorry

/-- A root of unity congruent to one modulo an integer at least three, with integral
quotient, equals one (README A6.18, `eq_one_of_root_of_unity`). -/
theorem eq_one_of_root_of_unity {F : Type*} [Field F] [CharZero F]
    (π ζ : F) (hπ : IsIntegral ℤ π) (n : ℤ) (hn : 3 ≤ n)
    (hcongr : ζ = 1 + n * π) (m : ℕ) (hm : 0 < m) (hfinite : ζ ^ m = 1) : ζ = 1 := by
  sorry

/-- A finite-order endomorphism congruent to the identity modulo an integer at least three
is the identity (README A6.18). Finiteness of the polarized automorphism group supplies finite
order; the congruence follows from killing the scheme-theoretic torsion. -/
theorem eq_one_of_finiteOrder_congruence (A : AbelianVariety K)
    (α β : AbelianVariety.End A) (n : ℤ) (hn : 3 ≤ n) (m : ℕ) (hm : 0 < m)
    (hfinite : α ^ m = 1) (hcongr : α = 1 + n • β) : α = 1 := by
  sorry

/-- **Coefficient Hom spaces** (README A6.22): for a commutative `ℚ`-algebra `R`, the coefficient
extension `R ⊗[ℤ] Hom(A, B)`. The objects stay over `K`. -/
abbrev CoefficientHom (A B : AbelianVariety K) (R : Type*) [CommRing R] [Algebra ℚ R] :=
  R ⊗[ℤ] Additive (A ⟶ B)

namespace CoefficientHom

variable {R : Type*} [CommRing R] [Algebra ℚ R]

/-- The identity coefficient arrow. -/
noncomputable def id (A : AbelianVariety K) : CoefficientHom A A R :=
  1 ⊗ₜ[ℤ] Additive.ofMul (𝟙 A)

/-- The coefficient automorphism group: the units of `R ⊗[ℤ] AbelianVariety.End A`. -/
abbrev units (A : AbelianVariety K) := (R ⊗[ℤ] AbelianVariety.End A)ˣ

/-- Check: with zero coefficients every coefficient endomorphism is a unit. -/
example [Subsingleton R] (A : AbelianVariety K) :
    IsUnit (0 : R ⊗[ℤ] AbelianVariety.End A) := by
  have : (0 : R ⊗[ℤ] AbelianVariety.End A) = 1 := Subsingleton.elim _ _
  rw [this]
  exact isUnit_one

end CoefficientHom

/-- **Localized Hom** (README A6.26): global arrows `D ⊗[ℤ] Hom` over the field `K`.
Each arrow has a single denominator invertible in `D`. -/
abbrev LocalizedHom (D : Subring ℚ) (A B : AbelianVariety K) :=
  D ⊗[ℤ] Additive (A ⟶ B)

end OverField

/-- The localized Yoneda presheaf on all schemes over `S`, valued in `D`-modules.
Restriction is precomposition followed by coefficient extension (README A6.26). -/
noncomputable def localizedYoneda {S : Scheme.{u}} (D : Subring ℚ)
    (A : AbelianScheme S) : (Over S)ᵒᵖ ⥤ ModuleCat.{u} D := by
  letI := A.isCommMonObj
  let pre {T U : Over S} (f : T ⟶ U) :
      Additive (U ⟶ A.toOver) →ₗ[ℤ] Additive (T ⟶ A.toOver) :=
    (MonoidHom.toAdditive
      { toFun := fun x => f ≫ x
        map_one' := MonObj.comp_one f
        map_mul' := fun x y => MonObj.comp_mul f x y }).toIntLinearMap
  exact
    { obj := fun T => ModuleCat.of D (D ⊗[ℤ] Additive (T.unop ⟶ A.toOver))
      map := fun f => ModuleCat.ofHom ((pre f.unop).baseChange D)
      map_id := by
        intro T
        apply ModuleCat.hom_ext
        ext d
        simp [pre]
      map_comp := by
        intro T U V f g
        apply ModuleCat.hom_ext
        ext d
        simp [pre, Category.assoc] }

/-- The value of the localized Yoneda presheaf is definitionally the sectionwise tensor product
(README A6.26). -/
theorem localizedYoneda_obj {S : Scheme.{u}} (D : Subring ℚ)
    (A : AbelianScheme S) (T : Over S) :
    letI := A.isCommMonObj
    Nonempty ((localizedYoneda D A).obj (Opposite.op T) ≃ₗ[D]
      D ⊗[ℤ] Additive (T ⟶ A.toOver)) :=
  ⟨LinearEquiv.refl D _⟩

/-- Restriction of localized sections precomposes the section and preserves its coefficient
(README A6.26). -/
@[simp] theorem localizedYoneda_map_tmul {S : Scheme.{u}} (D : Subring ℚ)
    (A : AbelianScheme S) {T U : Over S} (f : T ⟶ U) (d : D) (x : U ⟶ A.toOver) :
    letI := A.isCommMonObj
    ((localizedYoneda D A).map f.op).hom (d ⊗ₜ[ℤ] Additive.ofMul x) =
      d ⊗ₜ[ℤ] Additive.ofMul (f ≫ x) :=
  rfl

/-- Frobenius classification: an associative finite-dimensional real division algebra is
real, complex or Hamilton quaternionic. The complex case has centre larger than the real
scalars (README A6.15). -/
theorem realCentralDivisionAlgebra (D : Type*) [DivisionRing D] [Algebra ℝ D]
    [Module.Finite ℝ D] :
    Nonempty (D ≃ₐ[ℝ] ℝ) ∨ Nonempty (D ≃ₐ[ℝ] ℂ) ∨ Nonempty (D ≃ₐ[ℝ] ℍ[ℝ]) := by
  sorry

section RealRosatiAlgebra

open scoped ComplexOrder

variable {E : Type*} [Ring E] [Algebra ℝ E] [StarRing E] [StarModule ℝ E]

/-- Self-adjointness and strict positivity of the trace quadratic form `x ↦ t (s * x * star x)`.
For a cyclic, involution-invariant trace strictly positive on `x * star x`, this expresses positive
definite left multiplication for the trace inner product (README A6.15). -/
def IsRosatiPositive (t : E →ₗ[ℝ] ℝ) (s : E) : Prop :=
  IsSelfAdjoint s ∧ ∀ x : E, x ≠ 0 → 0 < t (s * x * star x)

/-- A positive self-adjoint unit has a unique positive self-adjoint square root inside the real
algebra. The root is invertible, is a real polynomial in the original element, and preserves
its commutant. The trace is cyclic, involution-invariant and strictly positive on `x * star x`
(README A6.15). -/
theorem rosatiPositiveSquareRoot [Module.Finite ℝ E] (t : E →ₗ[ℝ] ℝ)
    (hcyclic : ∀ x y : E, t (x * y) = t (y * x))
    (hstar : ∀ x : E, t (star x) = t x)
    (hpos : ∀ x : E, x ≠ 0 → 0 < t (x * star x))
    (s : E) (hs : IsRosatiPositive t s) (hsUnit : IsUnit s) :
    ∃ r : E, IsRosatiPositive t r ∧ r * r = s ∧ IsUnit r ∧
      (∃ p : ℝ[X], aeval s p = r) ∧
      (∀ c : E, Commute c s → Commute c r) ∧
      ∀ r' : E, IsRosatiPositive t r' → r' * r' = s → r' = r := by
  sorry

/-- A finite-dimensional real algebra with a cyclic, involution-invariant trace strictly positive
on `x * star x` has real, complex and quaternionic matrix factors carrying the standard adjoints.
Intrinsic strict positivity agrees with positive definiteness in every factor (README A6.15).
Quaternionic definiteness uses the real part of the Hermitian quadratic form. -/
theorem realRosatiDecomposition [Module.Finite ℝ E] (t : E →ₗ[ℝ] ℝ)
    (hcyclic : ∀ x y : E, t (x * y) = t (y * x))
    (hstar : ∀ x : E, t (star x) = t x)
    (hpos : ∀ x : E, x ≠ 0 → 0 < t (x * star x)) :
    ∃ (nR nC nH : ℕ) (dR : Fin nR → ℕ) (dC : Fin nC → ℕ) (dH : Fin nH → ℕ),
      (∀ i, 0 < dR i) ∧ (∀ i, 0 < dC i) ∧ (∀ i, 0 < dH i) ∧
      ∃ e : E ≃ₐ[ℝ]
          ((∀ i : Fin nR, Matrix (Fin (dR i)) (Fin (dR i)) ℝ) ×
            (∀ i : Fin nC, Matrix (Fin (dC i)) (Fin (dC i)) ℂ) ×
            (∀ i : Fin nH, Matrix (Fin (dH i)) (Fin (dH i)) ℍ[ℝ])),
        (∀ x : E, e (star x) = star (e x)) ∧
        ∀ s : E, IsRosatiPositive t s ↔
          (∀ i, ((e s).1 i).PosDef) ∧
          (∀ i, ((e s).2.1 i).PosDef) ∧
          (∀ i, ((e s).2.2 i).IsHermitian ∧
            ∀ v : Fin (dH i) → ℍ[ℝ], v ≠ 0 →
              0 < (∑ j, ∑ k, star (v j) * ((e s).2.2 i) j k * v k).re) := by
  sorry

/-- Check: positivity is vacuous in the zero matrix algebra, whose zero element is a unit
and its own square root (README A6.15). -/
example :
    let t := Matrix.traceLinearMap (Fin 0) ℝ ℝ
    let z : Matrix (Fin 0) (Fin 0) ℝ := 0
    IsRosatiPositive t z ∧ z * z = z ∧ IsUnit z := by
  refine ⟨⟨?_, ?_⟩, ?_, ?_⟩
  · exact Subsingleton.elim _ _
  · intro x hx
    exact (hx (Subsingleton.elim _ _)).elim
  · exact Subsingleton.elim _ _
  · rw [Subsingleton.elim (0 : Matrix (Fin 0) (Fin 0) ℝ) 1]
    exact isUnit_one

end RealRosatiAlgebra

/-! Library declarations this roadmap builds on. -/

#check @AlgebraicGeometry.Scheme.Hom.finrank
#check @Module.Flat.of_flat_tensorProduct
#check @AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral
#check @LinearMap.IsPerfPair
#check @TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny
#check @TauCeti.AlgebraicGeometry.AbelianVariety.mulBy
#check @TauCeti.AlmostComplexStructure.IsRiemannForm
#check @TauCeti.AlmostComplexStructure.isRiemannForm_iff_isPolarization
#check @TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos
#check @lieExp
#check @isLocalDiffeomorphAt_lieExp_zero
#check @Matrix.symplecticGroup

/-!
## Targets of the README not typed here

The API and Checks of A0.1 and A2.2 include `AbelianScheme.field_agreement`,
`AbelianScheme.dual_baseChange`, `AbelianScheme.dual_elliptic`, `AbelianScheme.dual_field`,
`AbelianScheme.dual_prod`, `AbelianScheme.dual_product` and `AbelianScheme.dual_zero`.
The elliptic comparison uses the inversion adapter from ModularCurves' self-duality to
the positive self-duality here; its Poincaré pullback and torsion-pairing sign are retained.
A3.1 specifies `IsAbelianIsogeny.comp_rank`, `IsAbelianIsogeny.elliptic_two` and
`IsAbelianIsogeny.field_iff`; the last is the field comparison theorem above.
A5.8 states `siegelAction_one`, `siegelAction_translation` and `siegelAction_mul` above.
A6.1 specifies `deg_dual`, `deg_functionField`, `deg_mulBy_two_elliptic`, `deg_zero`,
`deg_frobenius_ne_card_ker` and `deg_neg_one`; its Checks include multiplication
by two, inversion and the positive-dimensional zero and identity maps.
A6.9's `eq_of_padicNorm_roots_products` and `det_aeval_eq_prod_roots`, and
A6.18's `eq_one_of_root_of_unity`, are stated above with their hypotheses.
A6.22 specifies `CoefficientHom.scalar_isogeny`, `CoefficientHom.dual_numbers` and
`CoefficientHom.zero`; its Checks include scalar and dual-numbers inverses. A6.26 includes
`LocalizedHom.prime_to_p`.

A6.26's `LocalizedHom.yonedaComparison` identifies global localized homomorphisms over `S`
with natural `D`-linear transformations between the localized Yoneda presheaves on all `S`-schemes.
The field `LocalizedHom` signature above specializes those global Hom modules. For the disjoint
union of copies of `Spec ℂ`, multiplication by `2^n` on component `n` has local inverses but no global
inverse over `ℤ[1/2]`, because their denominators are unbounded. Its Checks also include integral
coefficients and finite disjoint unions for `localizedYoneda`.

A6.28 constructs `AbelianTwist` as a module presheaf with pointwise coefficient tensor products
and invariant equalizers. Representation is a natural `D`-linear isomorphism from
`localizedYoneda D B` for an abelian scheme `B/S`; uniqueness, trivialization independence,
base change and contragredient duality use A6.26's global arrows. Its Checks include failure of
Zariski separation on the infinite disjoint
union for the trivial torsor over `ℤ[1/2]`: points of exact order `2^n` give a nonzero localized
section with zero restriction to each component. A6.29's `twistRealizations` applies the realization
to the representing scheme and global descent arrows. In sheaf-valued realization targets it
uses the sheaf tensor product and invariant subobject, rather than a sectionwise formula.
Its polarization descent additionally requires `P(ℝ) ≠ ∅` and a character
`c : Z → 𝔾_m` positive on `Z(ℝ)` with `z^∨ λ z = c(z) λ`. The coefficient line
`L_c = (D(c) ⊗_D O_P)^Z` uses the rank-one representation with action by `c`.
A trivialization `L_c ≅ D` must be positive relative to evaluation at a real point of `P`.
Contragredient duality descends `λ` first as an `L_c`-valued symmetric isogeny; the oriented
trivialization makes it a `D`-polarization. Its weak class is independent of the real point and
positive trivialization modulo positive units of `D` (README A6.27–A6.29;
Kisin–Shin–Zhu §5.12.4, printed p. 174). With `D = ℚ`, `A = E²`, the action
`diag(1, −1)` and coefficient torsor `Spec ℚ(i)`, the multiplier is `1` but the descended form
is `diag(1, −1)` in the basis `e₁ ⊗ 1, e₂ ⊗ i`; real triviality fails and the form is indefinite.

A6.15 specifies `rosatiRegularRepresentation`: the scalar-extended Rosati trace gives a real
inner product, and faithful left multiplication carries Rosati to the operator adjoint. The generic
normal-form and internal-square-root signatures above use its cyclic, involution-invariant trace
and strict positivity hypotheses. A6.24 specifies `CoefficientHom.polarizedAdjoint`, reversing
composition and extending real-linearly between polarized coefficient Hom spaces. Its `realIsometries`
target uses the internal root and adjoint-compatible algebra actions to retain endomorphism
intertwiners.

The README states each of these with its hypotheses; most need carriers that are not in the pinned
Mathlib or Tau Ceti.

A3.6 defines `isSkewSymmetricPairing`, `isDiagonallyAlternatingPairing` and
`isStronglyAlternatingPairing` on the shared group and pairing carriers. The third requires an
fpqc-local central extension by `𝔾_m` with the prescribed commutator; the diagonal identity alone
is the second predicate. It provides `stronglyAlternatingPairing_diagonal`,
`diagonallyAlternatingPairing_skew`, `stronglyAlternatingPairing_restrict` and
`stronglyAlternatingPairing_baseChange`. `ThetaGroup.stronglyAlternating` exports `G(L)` as the
witness, `ThetaGroup.restrict` pulls back that extension, and `ThetaGroup.baseChange` preserves
the witness. The lifts are `ψ : t_x^*L → L`, with product `ψ ∘ t_x^*χ`, scalar action `cψ`, and
commutator `ũṽũ⁻¹ṽ⁻¹`. Evaluation at zero identifies the torsor with inverse frames
`Isom(x^*L, O_T)`; inversion to usual frames changes the scalar action to `c⁻¹`.
`ThetaGroup.alpha_two` separates diagonal from strong alternation, and
`ThetaGroup.elliptic_level_three` tests the commutator normalization. A3.7 provides
`polarizedWeilPairing.stronglyAlternating` using the restricted theta extension after a local
choice of representative, with restriction and arbitrary-base-change compatibility.

* **Relative Picard objects** (AlgebraicModuliForArithmeticGeometry §§7.6.1–7.6.1a supplies
  the fppf sheaf and section rigidification; ComplexComparisonPartII C3.2d.2 and C3.2f.1–C3.2f.2
  supply algebraicity and full identity components, including nilpotents, with the hypotheses
  of README A0.3 and the supplier contracts): `abelianPicardInputs`,
  `relativeSeesaw`, `relativeCube`, `torsionRestriction`, `raynaudRepresentability`,
  `AbelianScheme.dual`, `normalizedPoincare`, `mumfordMap`, `Polarization`,
  `polarizationRepresentatives`, `Polarization.graphBundle` (with `graphBundle_spec`),
  `projectivePresentation`, `nefNormalizedLines`, `AbelianNS` (with `AbelianNS.tensorQ`),
  `ThetaGroup`, `polarizedWeilPairing`, `dualIsogenyCartierKernel`, `Polarization.rosati`,
  `divisorAmpleCriterion`, `principalQuotient`, `symmetricHomRealization`, `polarizedIsogenyDegree`,
  `polarizationType` (parts (2) and (3)), `rosatiPositivity`, `rationalNSAmpleCone`, `neronSeveriRank`,
  `reducedTraceComparison`, `polarizedAutomorphisms`, `polarizationOrbits`, `realIsometries`,
  `WeakPolarization`, `Morikawa`.
* **Coherent and intersection-theoretic carriers**: `relativeInvariantForms`,
  `ampleCohomologyAndDegree`, `ampleIntersectionPositive`, `AbelianHodgeLine`.
  In A2.4, on an elliptic curve, `h⁰(O(d·0)) = d` assumes `d > 0`; it is `1` at `d = 0`
  and `0` for `d < 0`. The formulas `χ(O(d·0)) = d` and `deg φ = d²` hold for every integer
  `d`, with degree zero for a non-isogeny.
  For any `L`, write `Q = (id × φ_L)^*P`, `M = L ⊗ [−1]^*L` and
  `t(x, y) = (x + y, x − y)`. Then `t^*Q ≅ M ⊠ M^{-1}` and `χ(M) = 2^g χ(L)`.
  HRR, the intersection projection formula and Künneth, with `deg t = 2^{2g}` from
  JacobianChallenge Layer E's field multiplication theorem, give `χ(Q) = (−1)^g χ(L)²`
  in every characteristic. For `f = id × φ_L`, proper Chow pushforward of the fundamental
  cycle is `deg(φ_L)` times the target cycle when `φ_L` is an isogeny, and zero otherwise;
  HRR and `χ(P) = (−1)^g` give the second computation. For `L = O_A`, `g > 0`, the latter
  case is essential. For `L = O_E(0)`, the shear `(x, y) ↦ (x, x + y)` retains the mixed
  factor `Q`, whereas `t` gives `O_E(2·0) ⊠ O_E(−2·0)` and Euler characteristic `−4`.
* **Finite flat quotients and level structures**: `AbelianQuotient`, `torsionDivisibility`,
  `FullLevel`, `genusTwoTwoTorsion`, `homDescentFullLevel`.
* **Abelian torsion, Tate modules and algebraic trace** (A3.2, A4.1, A6.10–A6.11): `AbelianTate`,
  `homTateInjective`, `charpolyTate`, `traceDegreeSubfield`. Their constructions use the shared
  torsion and Tate carriers, degree polynomials, finite-rank Hom and linear algebra. The
  characteristic-polynomial signature above supplies the algebraic degree characterization.
* **Étale and `ℓ`-adic cohomology**: `frobeniusSemisimple`, `exteriorCohomology`,
  `weilRestrictionTate`. A4.4's ordinary finite-coefficient Künneth: Supplied by
  EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleKunneth`.
  Use constant `ℤ/ℓ^r`-coefficients on proper A over algebraically closed k with ℓ invertible,
  retaining cup products, pullbacks, base change and every coefficient reduction.
  Supplied by EtaleCohomologyFoundations §F.3 /
  `VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.etaleFiniteness`.
  This geometric domain gives the bound 2g and finite cohomology at each level.
  Supplied by EtaleCohomologyFoundations §F.4 /
  `VanishingCycles.classicalAdicRealization`, `VanishingCycles.adicFiniteness`.
  The normalized constant tower has uniform cohomological and Tor bounds, so the integral
  realization is compared with the derived finite-level limit and all derived reductions.
* **De Rham, divided-power and Barsotti–Tate carriers**: `AbelianVectorExtension`, `AbelianH1dR`,
  `BarsottiTate`, `TruncatedBT`, `AbelianPD`, `grothendieckMessing`, `polarizedEffectivity`, `serreTate`,
  `SerreTate.q`, `ordinaryFrobeniusWeighted`, `polarizedTruncationLifting`, `oddPrimeLifting`, `dyadicOrdinaryLifting`,
  `genusTwoJacobianLifting`, `polarizedFormalAlgebraization`, `genusTwoFormalEffectivity`.
  A4.5a owns `TruncatedBT S p n` for prime `p` and `n ≥ 1`: finite locally free commutative
  groups killed by `p^n`, flat as fppf `ℤ/p^n`-module sheaves, with the additional Frobenius–
  Verschiebung exactness on `V(p)` at level one. Its API is `TruncatedBT.height`,
  `TruncatedBT.baseChange`, `TruncatedBT.cartierDual`, `TruncatedBT.restrict` and
  `BarsottiTate.truncation` with values in this carrier. This is also the carrier used by
  FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.10; exact-sequence and coLie recognition,
  classification, and generic stack and truncation smoothness are downstream extensions.
  A4.5a also owns the canonical finite locally free group Frobenius and Cartier-dual
  Verschiebung in characteristic `p`, their naturality, base change and `VF = [p] = FV`.
  The broader flat-affine construction in that roadmap's R07.1.1 extends these maps and
  agrees with them on finite locally free groups.
  In A4.12, `p > 2`, `O` is the ring of integers of a finite extension of `ℚ_p` with residue
  field `k`, `A₀/k` is a principally polarized abelian surface, and `G₁` is a principally
  quasi-polarized `TruncatedBT (Spec O) p 1` of height four with compatible
  `G₁_k ≅ A₀[p]`. The theorem `polarizedTruncationLifting` supplies a principally
  quasi-polarized full tower `H/O` with `H_k ≅ A₀[p^∞]` and `H[p] ≅ G₁`, whose markings
  and quasi-polarizations agree over `k`. It uses A4.CR.7.2's deformation theory;
  `oddPrimeLifting` then applies Serre–Tate and polarized effectivity to obtain `A/O`.
* **Crystalline Dieudonné theory** (A4.CR.7.2): the contravariant crystalline Dieudonné
  crystal of a Barsotti–Tate group, Dieudonné variance and Tate twists, and Grothendieck–Messing
  deformation theory. The APIs `LogCrystalline.dieudonneEvaluation.evaluate`,
  `LogCrystalline.dieudonneEvaluation.contravariant` and `LogCrystalline.dieudonneEvaluation.fv`
  use the namespace `TauCetiRoadmap.CrystallineCohomology`; their crystalline-site and
  finite-locally-free coefficient carriers are supplied by CrystallineCohomology CR.1 and CR.7.1.
  FiniteFlatGroupsAndIntegralPadicHodgeTheory consumes the Dieudonné crystal, variance and twists,
  and Grothendieck–Messing equivalence from A4.CR.7.2; its slope decomposition and relative
  crystalline direct images use CrystallineCohomology CR.4.7 and CR.7.3, respectively.
* **Riemann forms** (Tau Ceti's `IsRiemannForm`, current library; the homological
  construction `RiemannForm.homological` is stated above): `RiemannForm.hermitian`,
  `RiemannForm.im_hermitian`, `RiemannForm.hermitian_self_pos`,
  `RiemannForm.scale`, `RiemannForm.pullback`, `RiemannForm.hodgeDual`.
  The Checks include `RiemannForm.zero_dimension` (vacuous positivity),
  `RiemannForm.homological_sign` (`Q = −E` with `C = −J`),
  `RiemannForm.scale_nonprincipal` (doubling loses integral unimodularity), and
  `RiemannForm.dual_double` (the rational dual of a doubled form is half-integral).
* **Complex analytic carriers** (ComplexComparisonPartII C−1.1–C−1.3 supplies analytic spaces
  and analytification, retaining nilpotents and arbitrary open gluing, with locally separated
  algebraic-space inputs and étale relation charts; Hausdorffness requires separatedness.
  C1.9 supplies coherent GAGA for proper finite-type complex schemes and coherent pushforward
  along proper finite-type morphisms, without requiring a proper base.
  ComplexTori Milestone 1 supplies the complex Lie-group
  quotient `AddAction.orbitRel.Quotient Λ V`, descended lattice-preserving maps and natural
  covering/homology identifications; Milestone 4, Integral connecting class, step 6 supplies
  `Λ/nΛ` torsion for `n > 0` and the trivial action. A5.1 proves the exponential lattice
  hypotheses and transports these structures to the analytification of an abelian variety;
  `AbelianLattice.tate` provides algebraic transport and transition-map compatibility.
  A5.6 consumes Milestones 2–3 on Hausdorff second-countable manifold patches with full
  discrete holomorphic periods, proves relative properness and the polarized Hodge comparison,
  and extends to singular or nonreduced analytic bases. A5.8 supplies the Siegel period,
  polarization, symplectic cocycle and period-equivariance formulas to those constructors;
  linear actions at stabilizers do not imply a free manifold quotient):
  `AbelianLattice`, `appellHumbert`, `polarizedHodgeEquivalence`,
  `analyticFamilies`, `realizationConventions`, `SiegelFamily` (beyond the Siegel space above),
  `cmIsotypic`.
* **Products and boundaries over a base**: `relativeProductsAndDimension` (beyond the
  dimension-zero case above), `fieldAndEllipticBoundary`.
* **Algebraic spaces and relative Hom**: `relativeEllipticEquivalence`, `relativeHom`,
  `CoefficientIsog`, `AbelianTwist`, `twistRealizations`, `weilRestriction`,
  `weilRestrictionSplits`, `weilRestrictionAbelian`, `QuadraticAbelianTwist`, `CurveGenerated`.
-/

end TauCetiRoadmap.AbelianSchemesAndArithmeticModuli
