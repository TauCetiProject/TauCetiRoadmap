import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ProjModel
import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.Smooth
import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.Integral
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Degree
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.WeilPairing.Basic
import TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Relative
import TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine
import TauCeti.AlgebraicGeometry.GroupScheme.Kernel

/-!
# Modular curves, following Katz–Mazur: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need: finite locally free commutative group schemes as commutative
group objects of `Over S`; elliptic curves over a base as smooth proper pointed curves with the
pointed local-Weierstrass condition on Tau Ceti's projective model, with their commutative group
structure; multiplication by `N` as the `N`-th power of the identity in the group of
endomorphisms, and `E[N]` as its kernel; the category `Ell/R` of cartesian pointed arrows and
set-valued moduli problems on it; relative representability, rigidity, étale rigidifiers and the
Katz–Mazur quotient data; the regularity axioms Reg. 1–Reg. 4 and G1–G3 with the universal formal
deformation they quantify over; coarse-moduli data.

Headline theorems stated here: KM 2.3.1 (`[N]` finite locally free of rank `N²`, `E[N]` étale
where `N` is invertible), KM 2.5.1 (pointed morphisms are homomorphisms), the killed-by-rank
theorem of Layer 0B, KM 4.7.0 (relatively representable, affine and rigid implies representable),
KM 5.1.1 (the Axiomatic Regularity Theorem) with the ring-theoretic core of KM 5.3.4, the
existence of the universal formal deformation (Layer 7D), KM 7.1.3 (Katz–Mazur quotients), KM
7.5.1 (regularity of quotients), KM 8.1.1 and 8.1.5 (coarse moduli schemes and their quotients),
the quotient-smoothness theorem of KM's Notes Added in Proof (Layer 9D), the base-change lemma
for invariant rings of Layer 9E, the algebraic reduction of geometric irreducibility of Layer 5C,
and the invariance of regularity and dimension under completion of a Noetherian local ring
(Layer 4D). The strict henselization of a local ring is SchemeAndStackFoundations §0.12a's
`StrictHenselization` strand, and the Artinian test algebras of Layer 7D are the case `Λ = W(k)`
of its §4.2 coefficient category; this file does not import that roadmap's `Suggested.lean`, so
the test algebra appears here only as the parameter structure `ArtinianTestAlgebra`.

Headline theorems not statable at the pins, and what each lacks:

* the First Main Theorem for `[Γ(N)]`, `[Γ₁(N)]` and balanced `[Γ₁(N)]` (KM 5.1.1 applied to
  them) and for `[Γ₀(N)]` (KM 6.6.1): Drinfeld level structures, which need full sets of sections
  and Cartier-divisor sums of sections on a relative curve (Layers 0A and 3);
* the cyclicity theorem KM 6.1.1, the finiteness of `[N-Isog]` (KM 6.5.1) and the Axiomatic
  Isomorphism Theorem KM 6.2.1: the generator scheme `Gˣ`, the subgroup Grassmannian of Layer 0G
  and Drinfeld generators;
* the dual isogeny, Cartier–Nishi duality and the scheme-theoretic Weil pairing (KM 2.5–2.8): the
  relative Picard functor of Layer 2D and the multiplicative group over an arbitrary base;
* the degree bridge of Layer 2A between the scheme-theoretic `[N]` on the projective Weierstrass
  model and Tau Ceti's equation-level degree: the group law on the projective model (Layer 1D)
  and the identification of its function field;
* the coarse `j`-line KM 8.2.1: the `j`-invariant of an elliptic curve over a base as a morphism
  to `Spec ℤ[j]` (Layer 1C);
* `Y₁(N)`, `Y_full(N)`, `Y(ρ)` (Layer 5) and every statement of Layer 10: naive level
  structures on `E[N]`, the quotient curves `Y_H` and the projective `j`-line.
-/

namespace TauCetiRoadmap.ModularCurves

open AlgebraicGeometry CategoryTheory Limits MonoidalCategory CartesianMonoidalCategory MonObj
open scoped Classical

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory
  CategoryTheory.Over.braidedCategory

/-! Pinned library declarations named in the supplier contracts of `README.md`. -/

#check @WeierstrassCurve.projModel
#check @WeierstrassCurve.isProper_projModelOver
#check @WeierstrassCurve.smoothOfRelativeDimension_one_projModelOver
#check @WeierstrassCurve.isIntegral_projModel
#check @TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero
#check @TauCeti.Isogeny.weilPairing
#check @TauCeti.Isogeny.weilPairing_self
#check @TauCeti.Isogeny.weilPairing_nondegenerate
#check @AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier
#check @TauCeti.AffineInvariantQuotient.quotient
#check @TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType
#check @TauCeti.GroupScheme.kernelBaseChangeIso
#check @AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank

/-! ## Layer 0B: finite locally free commutative group schemes -/

/-- A finite locally free commutative group scheme over `S`: a group object of `Over S` whose
group law is commutative and whose structure morphism is finite, flat and locally of finite
presentation. Over a non-noetherian base the last condition is not implied by the first two, and
it is what makes `Scheme.Hom.finrank` locally constant. -/
structure FiniteFlatCommGroupScheme (S : Scheme.{u}) where
  /-- The group object. -/
  obj : Grp (Over S)
  comm : IsCommMonObj obj.X
  finite : IsFinite obj.X.hom
  flat : Flat obj.X.hom
  locallyOfFinitePresentation : LocallyOfFinitePresentation obj.X.hom

attribute [instance] FiniteFlatCommGroupScheme.comm FiniteFlatCommGroupScheme.finite
  FiniteFlatCommGroupScheme.flat FiniteFlatCommGroupScheme.locallyOfFinitePresentation

namespace FiniteFlatCommGroupScheme

variable {S : Scheme.{u}}

/-- The structure morphism of a finite locally free group scheme. -/
abbrev structureMap (G : FiniteFlatCommGroupScheme S) : G.obj.X.left ⟶ S :=
  G.obj.X.hom

/-- Homomorphisms of finite locally free commutative group schemes over `S` are morphisms of
group objects over `S`. -/
abbrev Hom (G H : FiniteFlatCommGroupScheme S) := G.obj ⟶ H.obj

/-- Isomorphisms of finite locally free commutative group schemes over `S`. -/
abbrev Iso (G H : FiniteFlatCommGroupScheme S) := G.obj ≅ H.obj

/-- Multiplication by `n`: the `n`-th power of the identity in the group of endomorphisms of a
commutative group object. -/
noncomputable def mulBy (G : FiniteFlatCommGroupScheme S) (n : ℕ) : Hom G G :=
  (𝟙 G.obj) ^ n

/-- A finite locally free commutative group scheme of constant rank `n` is killed by `n`: the
endomorphism `[n]` is the trivial homomorphism (README 0B). -/
theorem mulBy_eq_one_of_finrank (G : FiniteFlatCommGroupScheme S) (n : ℕ)
    (hrank : G.structureMap.finrank = fun _ ↦ n) :
    mulBy G n = 1 :=
  sorry

end FiniteFlatCommGroupScheme

/-! ## Layer 1: elliptic curves over a base scheme

The projective Weierstrass model is Tau Ceti's `WeierstrassCurve.projModel`, with structure
morphism `projModelOver` and zero section `projModelZero`.
-/

/-- One pointed Weierstrass chart in a relative curve: an affine open of the base, an elliptic
Weierstrass equation over its coordinate ring, and a pointed isomorphism of the curve over that
open with the projective Weierstrass model. -/
structure PointedWeierstrassChart {S X : Scheme.{u}} (π : X ⟶ S) (zero : S ⟶ X) where
  base : Scheme.{u}
  baseMap : base ⟶ S
  baseMap_open : IsOpenImmersion baseMap
  ring : CommRingCat.{u}
  baseIso : base ≅ Spec ring
  equation : WeierstrassCurve ring
  equation_elliptic : equation.IsElliptic
  pullbackCarrier : Scheme.{u}
  toTotal : pullbackCarrier ⟶ X
  toBase : pullbackCarrier ⟶ base
  isPullback : IsPullback toTotal toBase π baseMap
  modelIso : pullbackCarrier ≅ equation.projModel
  modelIso_over : modelIso.hom ≫ equation.projModelOver = toBase ≫ baseIso.hom
  pulledZero : base ⟶ pullbackCarrier
  pulledZero_toBase : pulledZero ≫ toBase = 𝟙 base
  pulledZero_toTotal : pulledZero ≫ toTotal = baseMap ≫ zero
  modelIso_zero : pulledZero ≫ modelIso.hom = baseIso.hom ≫ equation.projModelZero

/-- A jointly surjective family of pointed Weierstrass charts. Equations are witnesses of local
existence, not selected fields of an elliptic curve. -/
structure PointedWeierstrassAtlas {S X : Scheme.{u}} (π : X ⟶ S) (zero : S ⟶ X) where
  index : Type u
  chart : index → PointedWeierstrassChart π zero
  covers : ∀ s : S, ∃ i : index, ∃ x : (chart i).base, (chart i).baseMap.base x = s

/-- The local-model condition in the quantifier form of KM 2.2.5–2.2.6 and Deligne–Rapoport
II.1.1: around every point of the base there is an affine open `U`, an elliptic Weierstrass curve
`W` over `Γ(S, U)`, and an isomorphism of the curve restricted to `U` with the projective model of
`W`, compatible with the projection and with the zero section. The open-immersion hypothesis on a
chart's `baseMap` is what makes both this form and the atlas Zariski-local. -/
def IsLocallyWeierstrass {X S : Scheme.{u}} (π : X ⟶ S) (zero : S ⟶ X)
    (hzero : zero ≫ π = 𝟙 S) : Prop :=
  ∀ s : S, ∃ (U : S.affineOpens) (_ : s ∈ U.1) (W : WeierstrassCurve Γ(S, U.1)),
    W.IsElliptic ∧
      ∃ e : pullback π U.1.ι ≅ W.projModel,
        e.hom ≫ W.projModelOver = pullback.snd π U.1.ι ≫ U.2.isoSpec.hom ∧
        (U.2.isoSpec.inv ≫ pullback.lift (U.1.ι ≫ zero) (𝟙 _)
            (by rw [Category.assoc, hzero, Category.comp_id, Category.id_comp])) ≫ e.hom =
          W.projModelZero

/-- An atlas of pointed Weierstrass charts gives the quantifier form of the local-model
condition: the range of an open immersion out of an affine scheme is an affine open of `S`, the
chart's coefficient ring is carried onto `Γ(S, U)` along `baseIso`, and the chart's pullback
square is compared with Mathlib's chosen `pullback`. -/
theorem PointedWeierstrassAtlas.isLocallyWeierstrass {X S : Scheme.{u}} {π : X ⟶ S}
    {zero : S ⟶ X} (hzero : zero ≫ π = 𝟙 S) (A : PointedWeierstrassAtlas π zero) :
    IsLocallyWeierstrass π zero hzero :=
  sorry

/-- The two spellings of the local-model condition agree: choosing a chart at each point of the
base assembles an atlas. Choice is used, which is why the atlas appears under `Nonempty` in
`EllipticCurveGeom`. -/
theorem nonempty_pointedWeierstrassAtlas_iff {X S : Scheme.{u}} {π : X ⟶ S} {zero : S ⟶ X}
    (hzero : zero ≫ π = 𝟙 S) :
    Nonempty (PointedWeierstrassAtlas π zero) ↔ IsLocallyWeierstrass π zero hzero :=
  sorry

/-- Smooth proper pointed genus-one curves with the pointed local-Weierstrass condition
(README, Convention 1). -/
structure EllipticCurveGeom (S : Scheme.{u}) where
  carrier : Scheme.{u}
  structureMap : carrier ⟶ S
  zero : S ⟶ carrier
  zero_comp : zero ≫ structureMap = 𝟙 S
  smooth : SmoothOfRelativeDimension 1 structureMap
  proper : IsProper structureMap
  localModel : Nonempty (PointedWeierstrassAtlas structureMap zero)

attribute [instance] EllipticCurveGeom.smooth EllipticCurveGeom.proper

/-- An elliptic curve with its canonical commutative group structure (Layer 1D): a commutative
group object structure on the curve over `S` whose unit is the zero section. -/
structure EllipticCurve (S : Scheme.{u}) extends EllipticCurveGeom S where
  grp : GrpObj (Over.mk structureMap)
  comm : letI := grp; IsCommMonObj (Over.mk structureMap)
  one_eq_zero :
    letI := grp
    (η[Over.mk structureMap] : _ ⟶ Over.mk structureMap).left =
      (𝟙_ (Over S)).hom ≫ zero

namespace EllipticCurve

variable {S : Scheme.{u}}

/-- The underlying geometric elliptic curve. -/
abbrev toGeom (E : EllipticCurve S) : EllipticCurveGeom S :=
  E.toEllipticCurveGeom

/-- An elliptic curve as a group object of `Over S`. -/
noncomputable def toGrp (E : EllipticCurve S) : Grp (Over S) :=
  { X := Over.mk E.structureMap, grp := E.grp }

instance isCommMonObj (E : EllipticCurve S) : IsCommMonObj E.toGrp.X :=
  E.comm

/-- Homomorphisms of elliptic curves over a fixed base are homomorphisms of commutative group
schemes; a bare pointed scheme morphism is not coerced to this type. -/
noncomputable abbrev Hom (E E' : EllipticCurve S) := E.toGrp ⟶ E'.toGrp

/-- The scheme morphism underlying a homomorphism. -/
noncomputable abbrev Hom.toSchemeHom {E E' : EllipticCurve S} (f : Hom E E') : E.carrier ⟶ E'.carrier :=
  f.hom.hom.left

/-- KM 2.5.1, proved in Layer 2D from the relative Picard theory: a scheme morphism over `S`
carrying zero to zero is uniquely a homomorphism of group schemes. It converts into `Hom`; it is
not used to define `Hom` or the multiplication maps. -/
theorem isGroupHom_of_mapsZero {E E' : EllipticCurve S}
    (f : E.carrier ⟶ E'.carrier) (hf_over : f ≫ E'.structureMap = E.structureMap)
    (hf_zero : E.zero ≫ f = E'.zero) :
    ∃! F : Hom E E', F.toSchemeHom = f :=
  sorry

/-- Multiplication by a natural number: the `n`-th power of the identity in the group of
endomorphisms of the commutative group object `E`. -/
noncomputable def mulBy (E : EllipticCurve S) (n : ℕ) : Hom E E :=
  (𝟙 E.toGrp) ^ n

/-- KM 2.3.1, finiteness: `[N]` is finite for `N ≠ 0`. -/
theorem isFinite_mulBy (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    IsFinite (E.mulBy N).toSchemeHom :=
  sorry

/-- KM 2.3.1, flatness: `[N]` is flat for `N ≠ 0`. -/
theorem flat_mulBy (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Flat (E.mulBy N).toSchemeHom :=
  sorry

/-- `[N]` is locally of finite presentation, because its source and target are locally of finite
presentation over `S`. Together with `isFinite_mulBy` and `flat_mulBy` this is what makes its
rank locally constant. -/
theorem locallyOfFinitePresentation_mulBy (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    LocallyOfFinitePresentation (E.mulBy N).toSchemeHom :=
  sorry

/-- KM 2.3.1, the rank: `[N]` has locally constant rank `N²`, proved through the narrow
function-field degree bridge of Layer 2A from Tau Ceti's equation-level
`TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero`. -/
theorem finrank_mulBy (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    (E.mulBy N).toSchemeHom.finrank = fun _ ↦ N ^ 2 :=
  sorry

/-- The kernel of a homomorphism of commutative group schemes is commutative. -/
theorem isCommMonObj_kernel_mulBy (E : EllipticCurve S) (N : ℕ) :
    IsCommMonObj (kernel (E.mulBy N)).X :=
  sorry

/-- The kernel of `[N]` is finite over `S` for `N ≠ 0`: it is the fibre of the finite morphism
`[N]` over the zero section (`TauCeti.GroupScheme.isPullback_kernel_scheme`). -/
theorem isFinite_kernel_mulBy (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    IsFinite (kernel (E.mulBy N)).X.hom :=
  sorry

/-- The kernel of `[N]` is flat over `S` for `N ≠ 0`. -/
theorem flat_kernel_mulBy (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    Flat (kernel (E.mulBy N)).X.hom :=
  sorry

/-- The kernel of `[N]` is locally of finite presentation over `S` for `N ≠ 0`. -/
theorem locallyOfFinitePresentation_kernel_mulBy (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    LocallyOfFinitePresentation (kernel (E.mulBy N)).X.hom :=
  sorry

/-- The finite locally free kernel `E[N]` of `[N]`, for nonzero `N`. -/
noncomputable def torsion (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    FiniteFlatCommGroupScheme S where
  obj := kernel (E.mulBy N)
  comm := E.isCommMonObj_kernel_mulBy N
  finite := E.isFinite_kernel_mulBy N
  flat := E.flat_kernel_mulBy N
  locallyOfFinitePresentation := E.locallyOfFinitePresentation_kernel_mulBy N

/-- KM 2.3.1: `E[N]` is finite locally free of rank `N²`. -/
theorem finrank_torsion (E : EllipticCurve S) (N : ℕ) [NeZero N] :
    (E.torsion N).structureMap.finrank = fun _ ↦ N ^ 2 :=
  sorry

/-- KM 2.3.1, étaleness: `E[N]` is étale over `S` where `N` is invertible. -/
theorem etale_torsion_of_isUnit (E : EllipticCurve S) (N : ℕ) [NeZero N]
    (hN : IsUnit ((N : ℕ) : Γ(S, ⊤))) :
    Etale (E.torsion N).structureMap :=
  sorry

/-- `[m] ≫ [k] = [m k]`: powers of the identity compose. -/
theorem mulBy_mul (E : EllipticCurve S) (m k : ℕ) :
    E.mulBy (m * k) = E.mulBy m ≫ E.mulBy k := by
  simp only [mulBy, pow_mul]
  rw [MonObj.comp_pow, Category.comp_id]

/-- The inclusion `E[m] ⊆ E[n]` for `m ∣ n`, the kernel inclusion lifted through `[n]`. -/
noncomputable def torsionInclusion (E : EllipticCurve S) (m n : ℕ) [NeZero m] [NeZero n]
    (h : m ∣ n) : FiniteFlatCommGroupScheme.Hom (E.torsion m) (E.torsion n) :=
  (kernel.lift (E.mulBy n) (kernel.ι (E.mulBy m)) (by
    obtain ⟨k, rfl⟩ := h
    rw [E.mulBy_mul, ← Category.assoc, kernel.condition, zero_comp]) :
      kernel (E.mulBy m) ⟶ kernel (E.mulBy n))

end EllipticCurve

/-! ## Layer 4: the category `Ell/R` and moduli problems -/

/-- An object of `Ell/R`: an `R`-scheme together with an elliptic curve over it. -/
structure EllObj (R : CommRingCat.{u}) where
  base : Scheme.{u}
  structureMap : base ⟶ Spec R
  curve : EllipticCurve base

/-- A cartesian pointed arrow in `Ell/R`: a morphism of `R`-schemes together with a morphism of
total spaces making the square cartesian and carrying zero to zero. -/
@[ext]
structure EllHom {R : CommRingCat.{u}} (X Y : EllObj R) where
  base : X.base ⟶ Y.base
  over_base : base ≫ Y.structureMap = X.structureMap
  total : X.curve.carrier ⟶ Y.curve.carrier
  cartesian : IsPullback total X.curve.structureMap Y.curve.structureMap base
  maps_zero : X.curve.zero ≫ total = base ≫ Y.curve.zero

namespace EllHom

/-- The identity arrow. -/
@[simps]
def id {R : CommRingCat.{u}} (X : EllObj R) : EllHom X X where
  base := 𝟙 X.base
  over_base := by simp
  total := 𝟙 X.curve.carrier
  cartesian := IsPullback.of_horiz_isIso ⟨by simp⟩
  maps_zero := by simp

/-- Composition of cartesian pointed arrows; cartesian squares paste. -/
@[simps]
def comp {R : CommRingCat.{u}} {X Y Z : EllObj R} (f : EllHom X Y) (g : EllHom Y Z) :
    EllHom X Z where
  base := f.base ≫ g.base
  over_base := by rw [Category.assoc, g.over_base, f.over_base]
  total := f.total ≫ g.total
  cartesian := f.cartesian.paste_horiz g.cartesian
  maps_zero := by simp [reassoc_of% f.maps_zero, g.maps_zero]

end EllHom

instance ellObjCategory (R : CommRingCat.{u}) : Category.{u} (EllObj R) where
  Hom := EllHom
  id := EllHom.id
  comp := EllHom.comp
  id_comp f := by ext <;> simp
  comp_id f := by ext <;> simp
  assoc f g h := by ext <;> simp

/-- The set-valued moduli problem on `Ell/R`. The larger universe accommodates level structures
containing scheme and group-scheme data. -/
abbrev ModuliProblem (R : CommRingCat.{u}) := (EllObj R)ᵒᵖ ⥤ Type (u + 1)

/-- The moduli problem represented by an object `X` of `Ell/R`. -/
noncomputable def EllObj.yonedaProblem {R : CommRingCat.{u}} (X : EllObj R) :
    ModuliProblem R :=
  yoneda.obj X ⋙ uliftFunctor.{u + 1}

namespace ModuliProblem

/-- Relative-representability data (KM 4.2): for every `X = (E/S)` in `Ell/R` a scheme
`𝒫_{E/S}` over `S` representing `T ↦ 𝒫(E_T)`. The test objects `T → S` are taken as the
cartesian arrows `Y ⟶ X` of `Ell/R` with base `T`, which is the same functor because every
`T → S` carries the base change `E_T` and a cartesian arrow is determined by its base; the
bijections are natural in `Y`. -/
structure RelRepData {R : CommRingCat.{u}} (P : ModuliProblem R) where
  rep : ∀ X : EllObj R, Over X.base
  equiv : ∀ {X Y : EllObj R} (f : Y ⟶ X), P.obj (Opposite.op Y) ≃ (Over.mk f.base ⟶ rep X)
  equiv_naturality : ∀ {X Y Z : EllObj R} (f : Y ⟶ X) (g : Z ⟶ Y) (α : P.obj (Opposite.op Y)),
    equiv (g ≫ f) (P.map g.op α) = Over.homMk g.base rfl ≫ equiv f α

/-- A relatively representable problem is affine, finite, flat, or étale over `Ell/R` when every
representing morphism has the corresponding property. -/
def RelRepData.HasProperty {R : CommRingCat.{u}} {P : ModuliProblem R} (D : P.RelRepData)
    (Q : MorphismProperty Scheme.{u}) : Prop :=
  ∀ X : EllObj R, Q (D.rep X).hom

/-- KM 4.3: rigidity means that an automorphism of `E/S` fixing a level structure is trivial. -/
def IsRigid {R : CommRingCat.{u}} (P : ModuliProblem R) : Prop :=
  ∀ (X : EllObj R) (σ : X ≅ X), σ.hom.base = 𝟙 X.base →
    ∀ α : P.obj (Opposite.op X), P.map σ.hom.op α = α → σ = Iso.refl X

/-- Representability of `𝒫` by an object of `Ell/R`: KM's `(E_univ / 𝕄(𝒫))`. -/
structure RepresentedBy {R : CommRingCat.{u}} (P : ModuliProblem R) (X : EllObj R) where
  univ : P.obj (Opposite.op X)
  bijective : ∀ Y : EllObj R, Function.Bijective fun f : Y ⟶ X ↦ P.map f.op univ

/-- KM 4.7.0, proved in Layer 4C by the Legendre and level-three rigidifiers and the finite étale
equivalence-relation quotient of Layer 0C: a relatively representable, affine, rigid moduli
problem is representable. -/
theorem exists_representedBy_of_isRigid {R : CommRingCat.{u}} (P : ModuliProblem R)
    (D : P.RelRepData) (hD : D.HasProperty @IsAffineHom) (hP : P.IsRigid) :
    ∃ X : EllObj R, Nonempty (P.RepresentedBy X) :=
  sorry

/-- KM 4.12, in the corrected reading of the Notes Added in Proof: for every representable étale
surjective rigidifier the simultaneous scheme is non-empty, regular, and every non-empty open has
dimension two. Non-emptiness is part of the strong sense of "of dimension two"; without it the
empty scheme would satisfy the predicate. -/
def RelRepData.IsRegularOfDimTwo {R : CommRingCat.{u}} {P : ModuliProblem R}
    (D : P.RelRepData) (rigidifiers : Set (EllObj R)) : Prop :=
  ∀ X ∈ rigidifiers,
    Nonempty (D.rep X).left ∧
      (∀ x : (D.rep X).left, IsRegularLocalRing ((D.rep X).left.presheaf.stalk x)) ∧
        ∀ U : (D.rep X).left.Opens, Nonempty U → topologicalKrullDim U = 2

end ModuliProblem

/-- KM 4.6: a representable rigidifier `δ`, given by its universal object, whose represented
problem is relatively representable by étale schemes over `Ell/R`. -/
structure EtaleRigidifier (R : CommRingCat.{u}) where
  obj : EllObj R
  relRep : obj.yonedaProblem.RelRepData
  etale : relRep.HasProperty @Etale
  /-- The rigidifier covers `Ell/R` (KM p. 110 distinguishes "étale" from "étale and surjective").
  For KM 7.1.2's Q2 this loses nothing, since a non-surjective étale representable problem may be
  enlarged by a disjoint union; for KM 4.12 it is what makes the non-emptiness clause of
  `IsRegularOfDimTwo` meaningful. -/
  surjective : relRep.HasProperty @Surjective

/-- The universal objects of the representable étale rigidifiers over `R`. -/
def EtaleRigidifier.objects (R : CommRingCat.{u}) : Set (EllObj R) :=
  Set.range fun δ : EtaleRigidifier R ↦ δ.obj

/-- `q` is the categorical quotient of `X` by the action `ρ` in the category of schemes; for the
affine actions of Chapter 7 this is the invariant-ring quotient of Layer 0C. -/
def IsCategoricalQuotient {S : Scheme.{u}} {X Y : Over S} {H : Type v} [Group H]
    (ρ : H →* Aut X) (q : X ⟶ Y) : Prop :=
  (∀ h : H, (ρ h).asIso.hom ≫ q = q) ∧
    ∀ (Z : Scheme.{u}) (g : X.left ⟶ Z), (∀ h : H, (ρ h).asIso.hom.left ≫ g = g) →
      ∃! g' : Y.left ⟶ Z, q.left ≫ g' = g

/-- Data exhibiting `𝒫' = 𝒫/H` in the sense of KM 7.1.2: an `H`-invariant morphism `q`
(Q1: `H` acts trivially on `𝒫'`) such that, for every representable étale rigidifier `δ`, the
scheme quotient `𝕄(δ,𝒫)/H` exists and `q` identifies it with `𝕄(δ,𝒫')` (Q2). The morphisms
`𝒫_{E/S} ⟶ 𝒫'_{E/S}` induced by `q` and the actions of `H` on `𝒫_{E/S}` induced by the action
on `𝒫` are recorded with the laws that characterise them through the representing bijections.
The categorical universal property is a conclusion of KM 7.1.3, not part of the definition. -/
structure KatzMazurQuotientData {R : CommRingCat.{u}} (P P' : ModuliProblem R) (H : Type u)
    [Group H] [Finite H] where
  q : P ⟶ P'
  act : H →* Aut P
  relRep : P.RelRepData
  relRep' : P'.RelRepData
  /-- The morphism of representing schemes induced by `q`. -/
  mapRep : ∀ X : EllObj R, relRep.rep X ⟶ relRep'.rep X
  mapRep_equiv : ∀ {X Y : EllObj R} (f : Y ⟶ X) (α : P.obj (Opposite.op Y)),
    relRep'.equiv f (q.app _ α) = relRep.equiv f α ≫ mapRep X
  /-- The action of `H` on the representing scheme `𝒫_{E/S}` induced by the action on `𝒫`. -/
  schemeAction : ∀ X : EllObj R, H →* Aut (relRep.rep X)
  schemeAction_equiv : ∀ {X Y : EllObj R} (f : Y ⟶ X) (α : P.obj (Opposite.op Y)) (h : H),
    relRep.equiv f ((act h).asIso.hom.app _ α) = relRep.equiv f α ≫ (schemeAction X h).asIso.hom
  q1 : ∀ h : H, (act h).asIso.hom ≫ q = q
  q2 : ∀ δ : EtaleRigidifier R, IsCategoricalQuotient (schemeAction δ.obj) (mapRep δ.obj)

namespace KatzMazurQuotientData

variable {R : CommRingCat.{u}} {P P' : ModuliProblem R} {H : Type u} [Group H] [Finite H]

/-- KM 7.1.3, existence: an affine relatively representable problem with a finite group action
has a Katz–Mazur quotient. -/
theorem exists_of_hasProperty_affine (D : P.RelRepData) (hD : D.HasProperty @IsAffineHom)
    (act : H →* Aut P) :
    ∃ (P' : ModuliProblem R) (Q : KatzMazurQuotientData P P' H), Q.act = act ∧ Q.relRep = D :=
  sorry

/-- KM 7.1.3(1): the quotient of an affine problem is affine over `Ell/R`. -/
theorem hasProperty_affine (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) : Q.relRep'.HasProperty @IsAffineHom :=
  sorry

/-- KM 7.1.3(1), the universal property: an `H`-invariant morphism to a relatively representable
problem factors uniquely through the quotient. -/
theorem existsUnique_desc (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (P'' : ModuliProblem R) (D'' : P''.RelRepData)
    (g : P ⟶ P'') (hg : ∀ h : H, (Q.act h).asIso.hom ≫ g = g) :
    ∃! g' : P' ⟶ P'', Q.q ≫ g' = g :=
  sorry

/-- KM 7.1.3(3), the invertible-order case: `(𝒫_{E/S})/H ≅ (𝒫/H)_{E/S}` when `|H|` is invertible
on `S`. The same conclusion holds when the action is free. Flatness of `𝒫_{E/S} ⟶ S`
alone is insufficient: the action `x ↦ -x` on `ℤ[x]` acquires new invariants modulo `2`.
Flat base change in the invariant-ring theorem means that the base-change morphism is flat. -/
theorem isCategoricalQuotient_of_isUnit_card (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (X : EllObj R)
    (hH : IsUnit ((Nat.card H : ℕ) : Γ(X.base, ⊤))) :
    IsCategoricalQuotient (Q.schemeAction X) (Q.mapRep X) :=
  sorry

/-- The finite-type form of the quotient-projection finiteness statement.
The affine source must also be locally of finite type over `Ell/R`. Integrality of an
arbitrary finite-group invariant extension does not imply module-finiteness; see README 9A.
The integral level problems used later are finite over `Ell/R`, so satisfy this hypothesis. -/
theorem isFinite_mapRep (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom)
    (hP_ft : Q.relRep.HasProperty @LocallyOfFiniteType) (X : EllObj R) :
    IsFinite (Q.mapRep X).left :=
  sorry

/-- KM 7.1.3(2), the free case: if `H` acts freely on `𝒫`, the projection
`𝒫 ⟶ 𝒫/H` is an étale `H`-torsor, in particular étale and hence locally of finite presentation.

Freeness is stated over nonempty bases only, and this is load-bearing. KM's own phrasing
("`G` operates freely on the set `𝒫(E/S)`") cannot be taken literally here: over the empty
base the standard problems have `𝒫(E/∅)` a singleton, and its unique element is fixed by all
of `H`, so the unrestricted set-level hypothesis would force `H = 1` and the theorem would be
vacuous. Restricted to `X` with nonempty base, the hypothesis is equivalent to scheme-theoretic
freeness (for every `h ≠ 1` the fixed locus of `σ_h` on each `𝒫_{E/S}` is the empty scheme),
because a fixed point of the scheme with residue field `κ` is a fixed element of `𝒫(E_κ/κ)`
over the nonempty base `Spec κ`. The étale-torsor conclusion needs no restriction: over the
empty base it holds trivially. README 9A(2) fixes this reading for the prose roadmap.

Under the finite-type hypothesis of `isFinite_mapRep`, the general quotient projection is finite
but need not be flat or locally of finite presentation (for `R = ℤ ⋉ V` with `V` an
infinite-dimensional `𝔽₂`-vector space and `A = R[ε]/(ε²)`, `ε ↦ -ε`, the algebra `A` is
finitely presented over `R` and finite, but not finitely presented, over its invariant ring
`R ⊕ Vε`). -/
theorem etale_mapRep_of_free (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom)
    (hfree : ∀ X : EllObj R, Nonempty X.base → ∀ (α : P.obj (Opposite.op X)) (h : H),
      (Q.act h).asIso.hom.app (Opposite.op X) α = α → h = 1)
    (X : EllObj R) :
    Etale (Q.mapRep X).left :=
  sorry

/-- KM 7.1.3(6): if `R` is noetherian and `𝒫` is finite over `Ell/R`, so is `𝒫/H`. -/
theorem hasProperty_finite (Q : KatzMazurQuotientData P P' H) [IsNoetherianRing R]
    (hP : Q.relRep.HasProperty @IsFinite) : Q.relRep'.HasProperty @IsFinite :=
  sorry

end KatzMazurQuotientData

/-! ## Layer 7: the regularity axioms and the Axiomatic Regularity Theorem -/

/-- An isomorphism of `p`-divisible groups `E[p^∞] ≅ E'[p^∞]`: a compatible system of
isomorphisms `E[pⁿ] ≅ E'[pⁿ]` (PD-1 of README 7E). -/
structure PDivisibleGroupIso {S : Scheme.{u}} (E E' : EllipticCurve S) (p : ℕ) [NeZero p] where
  iso : ∀ n : ℕ, FiniteFlatCommGroupScheme.Iso (E.torsion (p ^ n)) (E'.torsion (p ^ n))
  compat : ∀ n : ℕ,
    (iso n).hom ≫ E'.torsionInclusion (p ^ n) (p ^ (n + 1)) (pow_dvd_pow p n.le_succ) =
      E.torsionInclusion (p ^ n) (p ^ (n + 1)) (pow_dvd_pow p n.le_succ) ≫ (iso (n + 1)).hom

/-- Supersingularity over a field: `E[p]` is connected (PD-2 of README 7E). Over an
algebraically closed field of characteristic `p` this is the usual notion. -/
def EllipticCurve.IsSupersingular {k : Type u} [Field k] (p : ℕ) [NeZero p]
    (E : EllipticCurve (Spec (CommRingCat.of k))) : Prop :=
  ConnectedSpace (E.torsion p).obj.X.left

/-- The parameter of the deformation functor of Layer 7D: an Artinian local `W(k)`-algebra with
residue field identified with `k`. SchemeAndStackFoundations §4.2 owns this object, as the case
`Λ = W(k)` of its Artinian coefficient category (`Formal.ArtinianTestAlgebra` in its
`Suggested.lean`); the pinned library has no carrier for it and this file does not import that
roadmap's `Suggested.lean`, so only the parameter structure is restated here, with no theorems
about it. -/
structure ArtinianTestAlgebra (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] where
  A : Type u
  [commRing : CommRing A]
  [isLocalRing : IsLocalRing A]
  [isArtinianRing : IsArtinianRing A]
  algebraMap : WittVector p k →+* A
  residue : A →+* k
  residue_surjective : Function.Surjective residue
  ker_residue : RingHom.ker residue = IsLocalRing.maximalIdeal A
  residue_comp_algebraMap : residue.comp algebraMap = WittVector.constantCoeff

attribute [instance] ArtinianTestAlgebra.commRing

section Deformations

variable (p : ℕ) [Fact p.Prime] {k : Type u} [Field k]

/-- `E₀/k` as an object of `Ell/W(k)` over the closed point of `Spec W(k)`. -/
noncomputable def EllipticCurve.specialObj (E₀ : EllipticCurve (Spec (CommRingCat.of k))) :
    EllObj (CommRingCat.of (WittVector p k)) :=
  ⟨Spec (CommRingCat.of k), Spec.map (CommRingCat.ofHom WittVector.constantCoeff), E₀⟩

/-- A deformation of `E₀` over an Artinian test algebra: a curve over `Spec A` together with a
cartesian identification of its special fibre with `E₀`. -/
structure Deformation (E₀ : EllipticCurve (Spec (CommRingCat.of k)))
    (T : ArtinianTestAlgebra p k) where
  curve : EllipticCurve (Spec (CommRingCat.of T.A))
  ident : EllHom (E₀.specialObj p)
    ⟨Spec (CommRingCat.of T.A), Spec.map (CommRingCat.ofHom T.algebraMap), curve⟩
  ident_base : ident.base = Spec.map (CommRingCat.ofHom T.residue)

/-- The universal object of a deformation over `Spec W(k)[[T]]`. -/
noncomputable def universalDeformationObj
    (E : EllipticCurve (Spec (CommRingCat.of (PowerSeries (WittVector p k))))) :
    EllObj (CommRingCat.of (WittVector p k)) :=
  ⟨Spec (CommRingCat.of (PowerSeries (WittVector p k))),
    Spec.map (CommRingCat.ofHom (algebraMap (WittVector p k) (PowerSeries (WittVector p k)))), E⟩

/-- The universal formal deformation of `E₀` over `W(k)[[T]]` (Layer 7D): a family with special
fibre `E₀` such that every deformation over an Artinian test algebra is pulled back from it along
a unique local `W(k)`-algebra map, compatibly with the identifications of special fibres. -/
structure UniversalDeformation (E₀ : EllipticCurve (Spec (CommRingCat.of k))) where
  family : EllipticCurve (Spec (CommRingCat.of (PowerSeries (WittVector p k))))
  ident : EllHom (E₀.specialObj p) (universalDeformationObj p family)
  ident_base : ident.base =
    Spec.map (CommRingCat.ofHom (WittVector.constantCoeff.comp PowerSeries.constantCoeff))
  universal : ∀ (T : ArtinianTestAlgebra p k) (D : Deformation p E₀ T),
    ∃! ψ : PowerSeries (WittVector p k) →+* T.A,
      ψ.comp (algebraMap (WittVector p k) (PowerSeries (WittVector p k))) = T.algebraMap ∧
        T.residue.comp ψ = WittVector.constantCoeff.comp PowerSeries.constantCoeff ∧
          ∃ e : EllHom ⟨Spec (CommRingCat.of T.A), Spec.map (CommRingCat.ofHom T.algebraMap),
              D.curve⟩ (universalDeformationObj p family),
            e.base = Spec.map (CommRingCat.ofHom ψ) ∧ D.ident.comp e = ident

/-- Layer 7D: every elliptic curve over an algebraically closed field of characteristic `p` has a
universal formal deformation over `W(k)[[T]]`. -/
theorem exists_universalDeformation [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurve (Spec (CommRingCat.of k))) :
    Nonempty (UniversalDeformation p E₀) :=
  sorry

end Deformations

/-- The ring `ℤ` at universe `u`, the coefficient ring of `Ell/ℤ`. -/
abbrev intRing : CommRingCat.{u} := CommRingCat.of (ULift.{u} ℤ)

/-- An elliptic curve over an arbitrary scheme as an object of `Ell/ℤ`. -/
noncomputable def EllObj.ofCurve {S : Scheme.{u}} (E : EllipticCurve S) :
    EllObj (intRing.{u}) :=
  ⟨S, specULiftZIsTerminal.from S, E⟩

/-- KM 5.1.1's axioms Reg. 1–Reg. 4 for a moduli problem over `Ell/ℤ` at a prime `p`, stated on
chosen relative-representability data. -/
structure RegularityAxioms {P : ModuliProblem (intRing.{u})} (D : P.RelRepData) (p : ℕ)
    [Fact p.Prime] [NeZero p] where
  /-- Reg. 1: `𝒫` is relatively representable and finite over `Ell/ℤ`. -/
  reg1 : D.HasProperty @IsFinite
  /-- Reg. 2: `𝒫 ⊗ ℤ[1/p]` is finite étale over `Ell ⊗ ℤ[1/p]`. -/
  reg2 : ∀ X : EllObj (intRing.{u}), IsUnit ((p : ℕ) : Γ(X.base, ⊤)) → Etale (D.rep X).hom
  /-- Reg. 3: `𝒫_{E/S}` depends only on `E[p^∞]`, as an existence statement. -/
  reg3 : ∀ (S : Scheme.{u}) (E E' : EllipticCurve S), PDivisibleGroupIso E E' p →
    Nonempty (D.rep (EllObj.ofCurve E) ≅ D.rep (EllObj.ofCurve E'))
  /-- Reg. 4A: over a supersingular curve over an algebraically closed field of characteristic
  `p`, the set `𝒫(E₀/k)` has exactly one element. -/
  reg4A : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurve (Spec (CommRingCat.of k))), E₀.IsSupersingular p →
      Nonempty (P.obj (Opposite.op (EllObj.ofCurve E₀))) ∧
        Subsingleton (P.obj (Opposite.op (EllObj.ofCurve E₀)))
  /-- Reg. 4B: over the universal formal deformation of such a curve, `𝒫_𝔈` is the spectrum of a
  two-dimensional regular local ring. -/
  reg4B : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurve (Spec (CommRingCat.of k))), E₀.IsSupersingular p →
      ∀ 𝔈 : UniversalDeformation p E₀,
        IsAffine (D.rep (EllObj.ofCurve 𝔈.family)).left ∧
          IsRegularLocalRing Γ((D.rep (EllObj.ofCurve 𝔈.family)).left, ⊤) ∧
            ringKrullDim Γ((D.rep (EllObj.ofCurve 𝔈.family)).left, ⊤) = 2

/-- The Axiomatic Regularity Theorem KM 5.1.1, proved in Layer 7H: Reg. 1–Reg. 4 imply that `𝒫`
is finite flat over `Ell/ℤ` of constant positive rank and regular of dimension two. -/
theorem axiomaticRegularity {P : ModuliProblem (intRing.{u})} {D : P.RelRepData} {p : ℕ}
    [Fact p.Prime] [NeZero p] (_Reg : RegularityAxioms D p) :
    D.HasProperty @Flat ∧ D.HasProperty @LocallyOfFinitePresentation ∧
      (∃ n : ℕ, 0 < n ∧ ∀ X, (D.rep X).hom.finrank = fun _ ↦ n) ∧
        D.IsRegularOfDimTwo (EtaleRigidifier.objects _) :=
  sorry

/-- The ring-theoretic core of the rigidity engine KM 5.3.4 (Layer 7G): for a one-parameter
commutative formal group law `G` over an arbitrary ring `R`, if `X^{pⁿ} = 0` cuts out a
subgroup scheme — stated universally, `G(X,Y)^{pⁿ}` lies in the ideal `(X^{pⁿ}, Y^{pⁿ})` of
`R⟦X,Y⟧` — then `p = 0` in `R`. KM's proof isolates the binomial coefficients: comparing
total-degree-`pⁿ` terms forces `(X+Y)^{pⁿ} = X^{pⁿ} + Y^{pⁿ}`, so `C(pⁿ, i) = 0` in `R` for
`0 < i < pⁿ`; `i = 1` gives `pⁿ = 0` and `i = p^{n-1}`, whose binomial coefficient is `p`
times an integer prime to `p`, gives `p = 0`. The full KM 5.3.4 additionally identifies the
subgroup with `Ker(Fⁿ)`; the scheme-level engine KM 5.3.3 and the rigidity assertions
Rigid I–III (KM 5.3.2.1–5.3.2.3) are specified in README 7G. -/
theorem formalGroup_p_eq_zero_of_pow_mem_span {R : Type u} [CommRing R]
    (F : FormalGroup R) [F.IsComm] (p : ℕ) [Fact p.Prime] {n : ℕ} (hn : 1 ≤ n)
    (h : F.toPowerSeries ^ p ^ n ∈
      Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 2) R) ^ p ^ n,
        MvPowerSeries.X 1 ^ p ^ n}) :
    (p : R) = 0 :=
  sorry

/-! ## Layer 9C: the Axiomatic Regularity Theorem for quotients -/

/-- KM 7.5.1's hypotheses G1–G3 for a Katz–Mazur quotient at the prime `p`, on top of Reg. 1–4
for the source. -/
structure QuotientRegularityAxioms {P P' : ModuliProblem (intRing.{u})} {H : Type u}
    [Group H] [Finite H] (Q : KatzMazurQuotientData P P' H) (p : ℕ) [Fact p.Prime] [NeZero p]
    where
  reg : RegularityAxioms Q.relRep p
  /-- G1: after inverting `p`, the action of `H` on `𝒫` is free, in the scheme-theoretic
  sense: for every `h ≠ 1` the fixed locus of `σ_h` on `𝒫_{E/S}` is the empty scheme. It is
  stated on test objects — a fixed `T`-point with `T` nonempty forces `h = 1` — which is
  equivalent, since a nonempty fixed `T` maps a point into the fixed locus, and a nonempty
  fixed locus admits a fixed field-valued point. The `Nonempty T.left` hypothesis is what
  makes this a fixed-locus condition rather than a contradiction: the empty scheme is initial,
  so its unique morphism to `𝒫_{E/S}` is fixed by every `h`, and without the restriction G1
  would force `H = 1` and `axiomaticRegularityOfQuotients` would be unsatisfiable in every
  nontrivial case. README 9C G1 fixes the same reading. -/
  g1 : ∀ X : EllObj (intRing.{u}), IsUnit ((p : ℕ) : Γ(X.base, ⊤)) →
    ∀ T : Over X.base, Nonempty T.left →
      ∀ (t : T ⟶ Q.relRep.rep X) (h : H),
        t ≫ (Q.schemeAction X h).asIso.hom = t → h = 1
  /-- G2: the Reg. 3 comparisons induced by isomorphisms of `p`-divisible groups can be chosen
  `H`-equivariant. -/
  g2 : ∀ (S : Scheme.{u}) (E E' : EllipticCurve S), PDivisibleGroupIso E E' p →
    ∃ e : Q.relRep.rep (EllObj.ofCurve E) ≅ Q.relRep.rep (EllObj.ofCurve E'),
      ∀ h : H, (Q.schemeAction (EllObj.ofCurve E) h).asIso.hom ≫ e.hom =
        e.hom ≫ (Q.schemeAction (EllObj.ofCurve E') h).asIso.hom
  /-- G3: over a supersingular universal deformation, with `𝒫_𝔈 = Spec A`, the algebra `A` is
  generated by `|H|` elements as a module over its invariant subring `A^H`. -/
  g3 : ∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    (E₀ : EllipticCurve (Spec (CommRingCat.of k))), E₀.IsSupersingular p →
      ∀ 𝔈 : UniversalDeformation p E₀,
        ∃ s : Finset Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤),
          s.card ≤ Nat.card H ∧
            ∀ a : Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤),
              ∃ c : Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤) →
                  Γ((Q.relRep.rep (EllObj.ofCurve 𝔈.family)).left, ⊤),
                (∀ x, ∀ h : H,
                  (Q.schemeAction (EllObj.ofCurve 𝔈.family) h).asIso.hom.left.appTop (c x) = c x) ∧
                  a = ∑ x ∈ s, c x * x

/-- KM 7.5.1, the Axiomatic Regularity Theorem for quotients: under Reg. 1–4 and G1–G3, `𝒫/H` is
finite flat of constant positive rank and regular of dimension two, and `𝒫 ⟶ 𝒫/H` is finite
flat of degree `|H|`. -/
theorem axiomaticRegularityOfQuotients {P P' : ModuliProblem (intRing.{u})} {H : Type u}
    [Group H] [Finite H] {Q : KatzMazurQuotientData P P' H} {p : ℕ} [Fact p.Prime] [NeZero p]
    (_QR : QuotientRegularityAxioms Q p) :
    Q.relRep'.HasProperty @Flat ∧ Q.relRep'.HasProperty @LocallyOfFinitePresentation ∧
      (∃ n : ℕ, 0 < n ∧ ∀ X, (Q.relRep'.rep X).hom.finrank = fun _ ↦ n) ∧
        Q.relRep'.IsRegularOfDimTwo (EtaleRigidifier.objects _) ∧
          ∀ X, IsFinite (Q.mapRep X).left ∧ Flat (Q.mapRep X).left ∧
            LocallyOfFinitePresentation (Q.mapRep X).left ∧
              (Q.mapRep X).left.finrank = fun _ ↦ Nat.card H :=
  sorry

/-! ## Layer 9D–9E: coarse moduli schemes -/

/-- Coarse-moduli data for a moduli problem (KM 8.1.1–8.1.3.1): a scheme `M(𝒫)` over `R`, natural
classifying maps `S ⟶ M(𝒫)` for objects of `𝒫`, the universal property among such families of
maps to schemes, and the bijection on isomorphism classes over algebraically closed fields. -/
structure CoarseModuliData {R : CommRingCat.{u}} (P : ModuliProblem R) where
  M : Scheme.{u}
  structureMap : M ⟶ Spec R
  classify : ∀ X : EllObj R, P.obj (Opposite.op X) → (X.base ⟶ M)
  classify_over : ∀ X α, classify X α ≫ structureMap = X.structureMap
  classify_natural : ∀ {X Y : EllObj R} (f : X ⟶ Y) (α : P.obj (Opposite.op Y)),
    classify X (P.map f.op α) = f.base ≫ classify Y α
  universal : ∀ (Z : Scheme.{u}) (g : ∀ X : EllObj R, P.obj (Opposite.op X) → (X.base ⟶ Z)),
    (∀ {X Y : EllObj R} (f : X ⟶ Y) (α : P.obj (Opposite.op Y)),
      g X (P.map f.op α) = f.base ≫ g Y α) →
      ∃! φ : M ⟶ Z, ∀ X α, classify X α ≫ φ = g X α
  surjective_algClosed : ∀ (k : Type u) [Field k] [IsAlgClosed k]
    (t : Spec (CommRingCat.of k) ⟶ M),
    ∃ (s : Spec (CommRingCat.of k) ⟶ Spec R) (E : EllipticCurve (Spec (CommRingCat.of k)))
      (α : P.obj (Opposite.op ⟨_, s, E⟩)), classify ⟨_, s, E⟩ α = t
  injective_algClosed : ∀ (k : Type u) [Field k] [IsAlgClosed k]
    (s : Spec (CommRingCat.of k) ⟶ Spec R) (E E' : EllipticCurve (Spec (CommRingCat.of k)))
    (α : P.obj (Opposite.op ⟨_, s, E⟩)) (α' : P.obj (Opposite.op ⟨_, s, E'⟩)),
    classify ⟨_, s, E⟩ α = classify ⟨_, s, E'⟩ α' →
      ∃ σ : (⟨_, s, E⟩ : EllObj R) ≅ ⟨_, s, E'⟩, σ.hom.base = 𝟙 _ ∧ P.map σ.hom.op α' = α

/-- KM 8.1.1: an affine relatively representable problem has a coarse moduli scheme, constructed
Zariski-locally on `R` from a representable finite étale Galois rigidifier and glued. -/
theorem exists_coarseModuliData {R : CommRingCat.{u}} (P : ModuliProblem R) (D : P.RelRepData)
    (hD : D.HasProperty @IsAffineHom) : Nonempty (CoarseModuliData P) :=
  sorry

/-- KM 8.1.5: `M(𝒫)/H ≅ M(𝒫/H)`. The action of `H` on `M(𝒫)` is the one induced by the
universal property, and the comparison is compatible with classifying maps. -/
theorem coarseModuli_quotient {R : CommRingCat.{u}} {P P' : ModuliProblem R} {H : Type u}
    [Group H] [Finite H] (Q : KatzMazurQuotientData P P' H)
    (hP : Q.relRep.HasProperty @IsAffineHom) (M : CoarseModuliData P) (M' : CoarseModuliData P') :
    ∃ (ρ : H →* Aut (Over.mk M.structureMap)) (q : Over.mk M.structureMap ⟶ Over.mk M'.structureMap),
      (∀ (h : H) X α, M.classify X α ≫ (ρ h).asIso.hom.left = M.classify X ((Q.act h).asIso.hom.app _ α)) ∧
        (∀ X α, M.classify X α ≫ q.left = M'.classify X (Q.q.app _ α)) ∧
          IsCategoricalQuotient ρ q :=
  sorry

/-- Base change of the kernel of a linear map of flat modules over a principal ideal domain: if
the cokernel of `f` is torsion-free, then for every `D`-algebra `R` the kernel of `f ⊗ R` is the
base change of the kernel of `f`. Applied in Layer 9E to `f : A ⟶ ∏_{g∈G} A`, `a ↦ (ga − a)_g`,
whose kernel is the invariant ring `A^G`, this is the criterion under which formation of the
invariant ring commutes with every base change: it does so exactly when it commutes with
reduction modulo every maximal ideal of `D`. -/
theorem ker_baseChange_of_noZeroSMulDivisors_coker {D : Type u} [CommRing D] [IsDomain D]
    [IsPrincipalIdealRing D] {M N : Type u} [AddCommGroup M] [Module D M] [AddCommGroup N]
    [Module D N] [Module.Flat D M] [Module.Flat D N] (f : M →ₗ[D] N)
    [NoZeroSMulDivisors D (N ⧸ LinearMap.range f)] (R : Type u) [CommRing R] [Algebra D R] :
    LinearMap.ker (LinearMap.baseChange R f) =
      LinearMap.range (LinearMap.baseChange R (LinearMap.ker f).subtype) :=
  sorry

/-! ## Layer 9D: smoothness of finite quotients

The generic theorem behind the interior smoothness of the compactified curves of README Layer 10,
stated for an arbitrary categorical quotient of a smooth affine relative curve over a locally
noetherian base with regular local rings. Its application to `Y₁(N)/ℤ[1/N]` with its diamond
action, giving the smoothness of every `Y_H`, is README Layer 9D; no modular object occurs in the
signature. -/

section Layer9D

/-- KM, Notes Added in Proof, pp. 508–509: a finite quotient of a smooth affine relative curve
over a locally noetherian base with regular local rings is again a smooth relative curve. No
invertibility of the order of `H` on the base is assumed, which is what makes the statement
usable in residue characteristics `2` and `3`. -/
theorem smoothOfRelativeDimension_one_of_isCategoricalQuotient {S Y Q : Scheme.{u}}
    [IsLocallyNoetherian S] (_hS : ∀ s : S, IsRegularLocalRing (S.presheaf.stalk s))
    (f : Y ⟶ S) [IsAffineHom f] [SmoothOfRelativeDimension 1 f] (g : Q ⟶ S)
    {H : Type u} [Group H] [Finite H] (ρ : H →* Aut (Over.mk f)) (q : Over.mk f ⟶ Over.mk g)
    (_hq : IsCategoricalQuotient ρ q) : SmoothOfRelativeDimension 1 g :=
  sorry

end Layer9D

/-! ## Layer 5C: geometric irreducibility, the algebraic reduction

The twisted-curve application is conditional on geometric connectedness. README Layer 5C
specifies an external scheme–analytic comparison contract; it is not an imported theorem or a
milestone already supplied by another roadmap. The declarations here prove only the algebraic
implication from that explicit hypothesis.
-/

/-- A nonempty connected scheme, smooth of relative dimension one over an algebraically closed
field, is irreducible. Smoothness gives local noetherianness and normality; a connected locally
noetherian normal scheme is irreducible. -/
theorem irreducibleSpace_of_connectedSpace {K : Type u} [Field K] [IsAlgClosed K]
    (Y : Scheme.{u}) (sY : Y ⟶ Spec (CommRingCat.of K))
    [SmoothOfRelativeDimension 1 sY] [Nonempty Y] [ConnectedSpace Y] :
    IrreducibleSpace Y :=
  sorry

/-- Geometric irreducibility of a smooth `ℚ`-curve, given geometric connectedness: the base
change of a smooth morphism is smooth, so the leaf above applies over `ℚ̄` once `hconn` is
supplied. This is the reduction Layer 5C applies to `Y(ρ)`. The hypothesis `hconn` is not proved
here; the reference route described in README Layer 5C uses complex uniformisation and a
scheme–analytic connectedness comparison. -/
theorem irreducibleSpace_baseChange_algebraicClosure_of_connectedSpace
    (Y : Scheme.{0}) (sY : Y ⟶ Spec (CommRingCat.of ℚ))
    [SmoothOfRelativeDimension 1 sY] [Nonempty Y]
    (hconn : ConnectedSpace ↥(pullback sY
      (Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ)))))) :
    IrreducibleSpace ↥(pullback sY
      (Spec.map (CommRingCat.ofHom (algebraMap ℚ (AlgebraicClosure ℚ))))) :=
  sorry

/-! ## Layer 4D: regularity and dimension under completion

The strict henselization of a local ring that this layer consumes is SchemeAndStackFoundations
§0.12a's `StrictHenselization` strand (the filtered colimit of pointed étale neighbourhoods, with
its universal property, local-ring properties and Noetherianity); this file does not import that
roadmap's `Suggested.lean`. Of the statements Layer 4D owns, the two below are stated here. -/

/-- **Dimension of the completion.** Stacks, Lemma 15.44.1 (07NV). -/
@[stacks 07NV]
theorem ringKrullDim_adicCompletion (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A] :
    ringKrullDim (AdicCompletion (IsLocalRing.maximalIdeal A) A) = ringKrullDim A := by
  sorry

/-- **Regularity of the completion.** A Noetherian local ring is regular iff its completion is.
Stacks, Lemma 15.44.4 (07NY). -/
@[stacks 07NY]
theorem isRegularLocalRing_adicCompletion_iff (A : Type*) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] :
    IsRegularLocalRing A ↔ IsRegularLocalRing (AdicCompletion (IsLocalRing.maximalIdeal A) A) := by
  sorry

end TauCetiRoadmap.ModularCurves
