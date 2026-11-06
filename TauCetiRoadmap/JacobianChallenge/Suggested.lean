module

public import Mathlib
public import TauCeti.AlgebraicGeometry.AbelianVariety.Albanese
public import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
public import TauCeti.AlgebraicGeometry.CartierDivisor.ClassGroup
public import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
public import TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Degree.Basic
public import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
public import TauCeti.AlgebraicGeometry.Morphisms.Smooth.RelativeDimension
public import TauCeti.AlgebraicGeometry.PicardFunctor.Fppf
public import TauCeti.AlgebraicGeometry.PicardFunctor.PicZero.Fppf

/-!
# Jacobian challenge (AG version): target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The signatures use Tau Ceti's Cartier class group, sheaf cohomology, sheaf of relative
differentials, functor of relative effective Cartier divisors, group-valued relative Picard
fppf sheaf and abelian-variety carrier. Serre duality is stated through the named trace
`serreDualityTrace`. Representability of the Picard sheaf is the class `HasPicardScheme`,
with the representing object `picardScheme` and the representing isomorphism
`picardSchemeIso`, never an existential statement; `uliftYoneda.{u + 1}` in
`picardSchemeIso` is the one universe adapter between the `Type (u + 1)`-valued sheaf and the
morphisms of `Over S`. The Jacobian of a smooth proper geometrically connected curve is defined
without a rational point and is characterized by representing the degree-zero Picard sheaf;
the Abel–Jacobi universal property takes the point as a hypothesis. Multiplication statements
carry the nonzero-integer and positive-dimension hypotheses.

Note the name clash flagged in `README.md`: Mathlib's `WeierstrassCurve.Jacobian`
means Jacobian *coordinates*, not the Jacobian *variety*, so use `JacobianVariety`.

Duality and Riemann–Roch on Gorenstein curves, the degree pieces of the Picard scheme and the
Galois-descent construction are README targets without statements here: they need the sheaf
of regular differentials, a Gorenstein predicate on schemes and the degree-`d` Picard
subsheaves as carriers.
-/

@[expose] public section

namespace TauCetiRoadmap.JacobianChallenge

open CategoryTheory MonoidalCategory AlgebraicGeometry

universe u

/-! ## Layer A: line bundles, divisors, Picard group, degree -/

/-- Cartier divisor classes on an integral scheme form the Picard group of line-bundle
classes, written additively. -/
noncomputable def cartierPicardEquiv (X : Scheme.{u}) [IsIntegral X] :
    TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.ClassGroup X ≃+
      Additive (TauCeti.AlgebraicGeometry.LineBundleClass X) :=
  TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass X

/-- Cartier divisors have isomorphic invertible sheaves exactly when their difference is
the divisor of a nonzero rational function. -/
theorem cartier_sheaf_iso_iff_principal {X : Scheme.{u}} [IsIntegral X]
    (D E : TauCeti.AlgebraicGeometry.Scheme.CartierDivisor X) :
    Nonempty (D.sheaf ≅ E.sheaf) ↔
      ∃ f : X.functionFieldˣ,
        TauCeti.AlgebraicGeometry.Scheme.principalCartierDivisor X f = D - E := by
  exact TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.nonempty_iso_sheaf_iff

/-! ## Layer B: coherent cohomology over `k`, Serre duality and the genus -/

/-- **The Serre-duality trace** `H¹(X, Ω_{X/k}) → k` of a proper curve smooth of relative
dimension one over `k`. A class represented by a repartition of rational differentials
`(η_x)_x` over the closed points goes to `Σ_x Tr_{κ(x)/k} Res_x(η_x)`, which vanishes on
global rational differentials by the residue theorem. -/
noncomputable def serreDualityTrace (k : Type u) [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] [SmoothOfRelativeDimension 1 (X ↘ Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] :
    TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (X.relativeDifferentials k) 1 →ₗ[k] k := by
  sorry

/-- **Serre duality through the trace.** On a proper curve smooth of relative dimension one
over `k`, for every quasi-coherent `F` each linear form on `H¹(X, F)` is
`serreDualityTrace k X ∘ H¹(φ)` for exactly one `φ : F ⟶ Ω_{X/k}`. For `F = L` invertible this
says that the cup pairing `H⁰(X, Ω_{X/k} ⊗ L⁻¹) × H¹(X, L) → H¹(X, Ω_{X/k}) → k` is perfect;
for `F = 𝒪_X` it gives `dim_k H⁰(X, Ω_{X/k}) = dim_k H¹(X, 𝒪_X)`. -/
@[stacks 0BS2 "(5) and (6), with the trace named"]
theorem serreDuality_existsUnique {k : Type u} [Field k] {X : Scheme.{u}}
    [X.Over (Spec (.of k))] [SmoothOfRelativeDimension 1 (X ↘ Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] (F : X.Modules) [F.IsQuasicoherent]
    (ℓ : TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology F 1 →ₗ[k] k) :
    ∃! φ : F ⟶ X.relativeDifferentials k,
      serreDualityTrace k X ∘ₗ Scheme.Modules.cohomologyMapBaseLinear k X φ 1 = ℓ := by
  sorry

/-! ## Layer D: the relative Picard functor and the Jacobian scheme -/

/-- A morphism `f : X ⟶ S` **has a Picard scheme** when the presheaf of sets underlying Tau
Ceti's group-valued relative Picard fppf sheaf is representable. The sheaf takes values in
`Type (u + 1)` while morphisms of `Over S` lie in `Type u`; `Functor.RepresentableBy` allows
this, so no universe is shrunk. -/
abbrev HasPicardScheme {S X : Scheme.{u}} (f : X ⟶ S) : Prop :=
  ((TauCeti.AlgebraicGeometry.relativePicardFppfSheaf f).obj ⋙
    forget AddCommGrpCat).IsRepresentable

/-- The **Picard scheme** of `f`: the representing object of the relative Picard fppf sheaf.
Its group law is tensor product of line-bundle classes, transported by Yoneda. -/
noncomputable def picardScheme {S X : Scheme.{u}} (f : X ⟶ S) [HasPicardScheme f] : Over S :=
  ((TauCeti.AlgebraicGeometry.relativePicardFppfSheaf f).obj ⋙ forget AddCommGrpCat).reprX

/-- The **representing isomorphism** between the lifted functor of points of `picardScheme f`
and the relative Picard fppf sheaf. -/
noncomputable def picardSchemeIso {S X : Scheme.{u}} (f : X ⟶ S) [HasPicardScheme f] :
    uliftYoneda.{u + 1}.obj (picardScheme f) ≅
      (TauCeti.AlgebraicGeometry.relativePicardFppfSheaf f).obj ⋙ forget AddCommGrpCat :=
  Functor.uliftYonedaReprXIso _

/-- A proper curve smooth of relative dimension one with geometrically connected fibres over a
field has a Picard scheme. No rational point is assumed. -/
@[stacks 0B9Z "More general: over any field, with no rational point."]
theorem hasPicardScheme_of_curve {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    HasPicardScheme X.hom := by
  sorry

/-- **The Hilbert scheme of points of a curve.** For a proper curve smooth of relative
dimension one over a field and every `d`, relative effective Cartier divisors of degree `d`
form a representable functor on all test schemes; the representing scheme is the symmetric
power `Symᵈ X`. -/
@[stacks 0B9A "Special case: a proper curve smooth of relative dimension one over a field."]
theorem isRepresentable_relativeEffectiveCartierDegreeSubfunctor {k : Type u} [Field k]
    (X : Over (Spec (.of k))) [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] (d : ℕ) :
    Functor.IsRepresentable
      (TauCeti.AlgebraicGeometry.relativeEffectiveCartierDegreeSubfunctor X.hom d).toFunctor := by
  sorry

/-- The **Jacobian** of a smooth proper geometrically connected curve over `k`: the abelian
variety representing the degree-zero relative Picard fppf sheaf
(`jacobianVarietyRepresentableBy`), with tensor product as its group law. It is built over a
finite Galois extension over which the curve has a point and descended, so its definition uses
no rational point. -/
noncomputable def JacobianVariety {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    TauCeti.AlgebraicGeometry.AbelianVariety k := by
  sorry

/-- **`Pic⁰` over any field.** The Jacobian represents the degree-zero relative Picard fppf sheaf
on all test schemes over `k`; no rational point is assumed. -/
@[stacks 0BA0 "More general: the degree-zero piece over any field."]
noncomputable def jacobianVarietyRepresentableBy {k : Type u} [Field k]
    (X : Over (Spec (.of k))) [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom]
    [GeometricallyConnected X.hom] :
    ((TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheaf X.hom).obj ⋙
      forget AddCommGrpCat).RepresentableBy (JacobianVariety X).toOver := by
  sorry

/-! ## Layer E: abelian varieties -/

/-- A proper geometrically integral group scheme over a field has commutative multiplication. -/
theorem properIntegralGroup_commutative {k : Type u} [Field k]
    (G : Over (Spec (.of k))) [GrpObj G] [IsProper G.hom]
    [GeometricallyIntegral G.hom] : IsCommMonObj G := by
  exact isCommMonObj_of_isProper_of_geometricallyIntegral G

/-- Multiplication by a nonzero integer on an abelian variety is an isogeny. -/
theorem multiplication_isogeny {k : Type u} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) (n : ℤ) (hn : n ≠ 0) :
    TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny
      (TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A n) := by
  sorry

/-- On a positive-dimensional abelian variety, multiplication by an integer is étale
exactly when that integer is nonzero in the ground field. -/
theorem multiplication_etale_iff {k : Type u} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) (hdim : 0 < A.dim) (n : ℤ) :
    Etale (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom
      (TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A n)) ↔ (n : k) ≠ 0 := by
  sorry

/-! ## Layer F: Abel–Jacobi and the universal property -/

/-- The **Abel–Jacobi morphism** `x ↦ 𝒪(x − x₀)` into the Jacobian, for a `k`-rational point
`x₀`. On `T`-points, through `jacobianVarietyRepresentableBy`, it is Tau Ceti's
`abelJacobiMapToPicZeroFppf`. The Jacobian itself does not depend on `x₀`. -/
noncomputable def abelJacobi {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) : X ⟶ (JacobianVariety X).toOver := by
  sorry

/-- The Abel–Jacobi morphism has the Albanese property: every pointed curve morphism to an
abelian variety factors through a unique homomorphism. Normalized Picard pullback with
`a^* ∘ λ_Θ = [−1]` and biduality provide the factorization, including for the zero Jacobian in
genus zero. -/
theorem isAlbanese_abelJacobi {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese x₀ (abelJacobi X x₀) := by
  sorry

end TauCetiRoadmap.JacobianChallenge
