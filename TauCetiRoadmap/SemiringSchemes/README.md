# Roadmap: schemes over commutative semirings

**Summary.** Build scheme theory over commutative semirings in the functor-of-points framework of
Toën and Vaquié, specialised to the symmetric monoidal category of commutative monoids
(ℕ-semimodules): affine semiring schemes are the opposite of `CommSemiRingCat`, Zariski open
immersions of affines are the flat epimorphisms of finite presentation, and semiring schemes are
the Zariski sheaves admitting an open cover by affines. Flatness means that tensoring preserves
finite limits; Mathlib's `Module.Flat` is the weaker mono-flatness over semirings, and the roadmap
builds the stronger notion. Quotients and closed subschemes are governed by congruences, not
ideals; prime ideals still govern the underlying Zariski topology. The end theorems are: the
Toën–Vaquié Zariski topology on affine semiring schemes equals the topology of principal
localizations; semiring schemes are closed under fibre products and gluing; closed subschemes of
`Spec A` correspond to congruences on `A`; base change to ℤ and the inclusion of ring schemes
form an adjunction whose left adjoint is fully faithful and which recovers Mathlib's `Scheme`;
and semiring schemes defined as locally semiringed spaces are equivalent to the functor-of-points
semiring schemes.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-categorical-algebra-of-semirings-and-semimodules) | Categorical algebra of semirings and semimodules | limits and colimits in `CommSemiRingCat` and `SemimoduleCat`, pushouts as tensor products, epimorphisms, regular epimorphisms, congruence-based finite presentation |
| [1](#layer-1-congruences-and-ideals) | Congruences and ideals | the ideal/congruence Galois connection, subtractive ideals, when ideals suffice, saturated primes and the spectrum of a quotient, localization of congruences |
| [2](#layer-2-flatness) | Flatness | `Module.LimitFlat` (tensor preserves finite limits), Lazard and the equational criterion, comparison with Mathlib's `Module.Flat`, faithful flatness, descent |
| [3](#layer-3-the-zariski-site-of-affine-semiring-schemes) | The Zariski site of affine semiring schemes | Zariski open morphisms, Toën–Vaquié and principal Zariski topologies, their equality, subcanonicity |
| [4](#layer-4-semiring-schemes) | Semiring schemes | the generic open-immersion-site layer, the scheme category, fibre products, gluing, open subschemes, closed immersions and closed subschemes through congruences |
| [5](#layer-5-rings-and-semirings) | Rings and semirings | group completion, base change to ℤ, the inclusion of ring schemes, comparison with Mathlib's `Scheme` |
| [6](#layer-6-locally-semiringed-spaces) | Locally semiringed spaces | the semiring structure sheaf, `Spec` as a locally semiringed space, geometric semiring schemes, the comparison with Layer 4, quasi-coherent congruence sheaves |

## Scope and ownership

**This roadmap owns** the generic open-immersion-site layer of §4.1, the commutative algebra of semirings and semimodules that scheme theory over
semirings needs and that Mathlib and Tau Ceti lack (colimits in `CommSemiRingCat`, limits and
colimits in `SemimoduleCat`, congruence-based finite presentation, the ideal/congruence dictionary,
finite-limit flatness and faithfully flat descent over semirings); the Toën–Vaquié Zariski site on
`CommSemiRingCat.{u}ᵒᵖ` and its principal-localization description; semiring schemes, their fibre
products, gluing, open and closed immersions and closed subschemes; the functors between semiring
schemes and ring schemes; locally semiringed spaces, the semiring structure sheaf and the
comparison of the two models; and quasi-coherent semimodules and congruence sheaves exactly to the
extent that closed subschemes need them (§6.5).

**Relation to the FunctorOfPoints roadmap.** The [FunctorOfPoints roadmap](../FunctorOfPoints/README.md) builds a
functor-of-points interface over Mathlib's ring-based schemes, on the site `(CommAlgCat R)ᵒᵖ`
with the Zariski topology induced from `Scheme.zariskiTopology`, open subfunctors in the
Demazure–Gabriel form `D(I)`, and the locally representable full subcategory
`TauCeti.FunctorOfPoints.LocallyRepresentable R` (its §2.1). Its absolute form (its §2.4) is
`TauCeti.FunctorOfPoints.schemeEquivAbsolute : Scheme.{u} ≌ LocallyRepresentableAbsolute` on
`CommRingCat.{u}ᵒᵖ`. That roadmap states the ring case only and leaves the Toën–Vaquié
instantiation over semirings to this one. The division is:

1. *The generic layer* (§4.1): for a category of affines `C`, a Grothendieck topology `J` and a
   class `P` of basic open immersions, open subfunctors of representables, open immersions of
   sheaves, and schemes as sheaves with a jointly locally surjective family of open immersions
   from representables, with Toën–Vaquié's Lemmas 2.13–2.14 and Propositions 2.16–2.18. **This
   roadmap owns it**, at that generality, because it needs two instances: `CommSemiRingCat.{u}ᵒᵖ`
   (Layer 4) and `CommRingCat.{u}ᵒᵖ` (Layer 5).
2. *The comparison with Mathlib's `Scheme`*: owned by the FunctorOfPoints roadmap
   (`schemeEquivAbsolute`). This roadmap proves that its ring instance of the generic layer is the
   same full subcategory of sheaves as `LocallyRepresentableAbsolute` (§5.3) and composes.

**Not in scope.** Deitmar and monoid schemes, schemes over 𝔽₁, blueprints, hyperrings, bands,
tropical geometry and tropical schemes, bend relations, tropical ideals, matroids, the work of
Connes–Consani, Durov, Flores–Weibel and Joó–Mincheva, prime congruences, vector bundles and line
bundles over semirings, cohomology of semimodule sheaves, and arithmetic applications.

## Conventions

- *Semiring* means commutative unital semiring, Mathlib's `CommSemiring`. A semimodule over `A` is
  a Mathlib `Module A M` with `[AddCommMonoid M]`; the category is Mathlib's `SemimoduleCat A`.
  An ℕ-module is a commutative monoid. No additive inverses are assumed anywhere unless a
  statement says `CommRing` or `AddCommGroup`.
- *Universes.* Semirings live in `Type u`. The category of affine semiring schemes is
  `Aff := CommSemiRingCat.{u}ᵒᵖ`, a large category with `Type u` hom-sets. Presheaves and sheaves on
  `Aff` are valued in `Type u`. For a semiring `A`, write `Spec A := yoneda.obj (op (CommSemiRingCat.of A))`;
  its value at `op (op B)` is identified with `A →+* B`. No sheafification functor on `Aff` is
  used: images of morphisms into sheaves are formed with Mathlib's `Subfunctor.sheafify`, and
  "epimorphism of sheaves" means Mathlib's `Presheaf.IsLocallySurjective`, as in
  `Mathlib/AlgebraicGeometry/Sites/Representability.lean`.
- *Flatness* is `Module.LimitFlat` (§2.1): tensoring preserves finite limits, equivalently
  equalizers. The word "flat" in this roadmap always means this. Mathlib's `Module.Flat` over a
  semiring is mono-flatness and is called mono-flatness here. Mathlib's docstring plans to
  rename its current class to `Module.MonoFlat` and give `Module.Flat` the finite-limit meaning;
  if that lands, `Module.LimitFlat` is deleted in favour of Mathlib's class, and the lemmas of
  §2.1–§2.2 are restated on it.
- *Finite presentation* of an algebra over a semiring is `Algebra.CongrFinitePresentation`
  (§0.4): a quotient of a polynomial algebra in finitely many variables by a congruence generated
  by finitely many pairs. Mathlib's ideal-based `Algebra.FinitePresentation` is not used for
  semirings.
- *Kernels.* The kernel of a semiring map is the congruence `RingCon.ker f`. Mathlib's ideal
  `RingHom.ker f` is called the zero class of `f` and is only used as such.
- *Zariski topology.* The primary topology on `Aff` is Toën–Vaquié's `zariskiTopologyTV` (§3.2).
  The principal topology `zariskiTopologyPrincipal` is proved equal to it (§3.3) and is the one used
  for computations.
- *Spectrum.* The underlying space of an affine semiring scheme is Mathlib's `PrimeSpectrum A`
  with its Zariski topology; `PrimeSpectrum` is already stated for `CommSemiring`.
- *Naming.* New declarations go in the namespaces of the Mathlib objects they extend
  (`RingCon`, `Ideal`, `Module`, `RingHom`, `CommSemiRingCat`, `SemimoduleCat`) and in
  `TauCeti.SemiringScheme` for scheme-level objects. Names given below are proposals; the
  statements are definitive.

## Exact supplier contracts

### From Mathlib

Paths name the supplier APIs; use the Mathlib revision pinned by this repository.
The compiled `Suggested.lean` consumes these interfaces directly.

- `CommSemiRingCat` in `Mathlib/Algebra/Category/Ring/Basic.lean`: the category, its concrete
  structure, `forget₂ CommRingCat CommSemiRingCat` (the instance named `hasForgetToAddCommMonCat`
  at line 668 provides this `HasForget₂`), and `forget₂ CommSemiRingCat SemiRingCat` (fully
  faithful). `Mathlib/Algebra/Category/Ring/Limits.lean`: `CommSemiRingCat.hasLimits` and limit
  preservation by the forgetful functors, including `forget₂ CommRingCat CommSemiRingCat`.
  `Mathlib/Algebra/Category/Ring/FilteredColimits.lean`: filtered colimits of commutative semirings
  and `forget_preservesFilteredColimits`. There is **no** `HasColimits CommSemiRingCat` instance
  and no pushout API for `CommSemiRingCat`; `CommRingCat.pushoutCocone` and
  `CommRingCat.pushoutCoconeIsColimit` (`Mathlib/Algebra/Category/Ring/Constructions.lean`) and
  `hasColimits_commRingCat` (`Mathlib/Algebra/Category/Ring/Colimits.lean`) are ring-only.
- `SemimoduleCat` in `Mathlib/Algebra/Category/ModuleCat/Semi.lean` (monomorphisms are injective
  maps; hom-sets carry `AddCommMonoid`, and Mathlib's `Preadditive` is not available, see the TODO
  pointing to https://github.com/leanprover-community/mathlib4/issues/28826) and its monoidal
  structure in `Mathlib/Algebra/Category/ModuleCat/Monoidal/Basic.lean` and `.../Symmetric.lean`.
  There are no limit or colimit instances for `SemimoduleCat`.
- Congruences: `RingCon`, `ringConGen`, `RingCon.Quotient` and its `CommSemiring` and `Algebra`
  instances, `RingCon.mk'`, `RingCon.mkₐ` in `Mathlib/RingTheory/Congruence/Defs.lean` and
  `.../Basic.lean` (complete lattice, `RingCon.gi`); `RingCon.ker`, `RingCon.lift`,
  `RingCon.kerLift`, `RingCon.quotientKerEquivRangeS`, `RingCon.quotientKerEquivOfSurjective`,
  `RingCon.correspondence`, `RingCon.quotientQuotientEquivQuotient` in
  `Mathlib/RingTheory/Congruence/Hom.lean`. Module congruences: `ModuleCon`, `ModuleCon.ker` in
  `Mathlib/Algebra/Module/Congruence/Defs.lean`. For rings, `Ideal.Quotient.ringCon` in
  `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`.
- Ideals over semirings: `Ideal`, `Ideal.IsPrime` (`Mathlib/RingTheory/Ideal/Prime.lean`),
  `Ideal.span`, `RingHom.ker` (`Mathlib/RingTheory/Ideal/Maps.lean`, line 750, an ideal of a
  semiring), `IsLocalRing` for `Semiring` (`Mathlib/RingTheory/LocalRing/Defs.lean`) and
  `IsLocalHom` (`Mathlib/Algebra/Group/Units/Hom.lean`).
- Localization over semirings: `IsLocalization` and `Localization` for `CommSemiring`
  (`Mathlib/RingTheory/Localization/Defs.lean`), `Localization.Away`
  (`.../Localization/Away/Basic.lean`), `Localization.AtPrime` and
  `IsLocalization.AtPrime.isLocalRing` (`.../Localization/AtPrime/Basic.lean`), `LocalizedModule`
  for `AddCommMonoid` modules (`Mathlib/Algebra/Module/LocalizedModule/Basic.lean`).
- Tensor products over semirings: `TensorProduct` for `[CommSemiring R]` and `AddCommMonoid`
  modules; `Algebra.TensorProduct.instCommSemiring` and, when one factor is a ring,
  `Algebra.TensorProduct.instRing` and `instCommRing`
  (`Mathlib/RingTheory/TensorProduct/Basic.lean`); so `ℤ ⊗[ℕ] A` is a `CommRing` for a semiring `A`.
- `Algebra.IsEpi` for `CommSemiring` and `Algebra.isEpi_iff_forall_one_tmul_eq`
  (`Mathlib/Algebra/Algebra/Epi.lean`); `CommRingCat.epi_iff_epi` is ring-only
  (`Mathlib/Algebra/Category/Ring/Epi.lean`).
- Flatness: `Module.Flat` in `Mathlib/RingTheory/Flat/Basic.lean`. Over `[CommSemiring R]` with
  `[AddCommMonoid M]` it is **mono-flatness**: the class field asks that `N.subtype.rTensor M` be
  injective for finitely generated submodules `N` of finite modules `P : Type u`, and
  `Module.Flat.rTensor_preserves_injective_linearMap` extends this to all injective maps. The
  module docstring states that `Module.Flat` "is defined to be equivalent to mono-flatness over a
  semiring" and records the TODO "to introduce the genuine flatness over semirings and rename the
  current `Module.Flat` to `Module.MonoFlat`", where genuine flatness is "`· ⊗ M` preserves finite
  limits". The exactness characterisations (`Module.Flat.iff_lTensor_exact` and its relatives),
  `RingHom.Flat` (`Mathlib/RingTheory/RingHom/Flat.lean`) and `Module.FaithfullyFlat`
  (`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`) are ring-only. `IsLocalization.flat`
  (`Mathlib/RingTheory/Flat/Localization.lean`) holds over semirings, as mono-flatness.
- Finite presentation: `Algebra.FinitePresentation` (`Mathlib/RingTheory/FinitePresentation.lean`)
  is stated for `[CommSemiring R]`, but its relation module is the ideal
  `RingHom.ker f.toRingHom`; `RingHom.FinitePresentation` is ring-only;
  `Module.FinitePresentation` (`Mathlib/Algebra/Module/FinitePresentation.lean`) is stated for
  semirings with a kernel submodule. `CategoryTheory.IsFinitelyPresentable`
  (`Mathlib/CategoryTheory/Presentable/Finite.lean`) and the ring-only comparison
  `CommRingCat.isFinitelyPresentable_under` (`Mathlib/Algebra/Category/Ring/FinitePresentation.lean`).
- Spectrum: `PrimeSpectrum` for `CommSemiring` (`Mathlib/RingTheory/Spectrum/Prime/Defs.lean`),
  `PrimeSpectrum.comap` (`.../RingHom.lean`), and in `.../Topology.lean` the semiring-general
  `basicOpen`, `isTopologicalBasis_basic_opens`, `isCompact_basicOpen`,
  `localization_away_comap_range`, `localization_away_isOpenEmbedding`, `iSup_basicOpen_eq_top_iff`,
  `compactSpace`, `quasiSober`, `T0Space`. The section `SpecOfSurjective`
  (`isClosedEmbedding_comap_of_surjective` and relatives) is ring-only, and its semiring analogue is
  false (§1.4).
- Structure sheaf and spaces: `AlgebraicGeometry.StructureSheaf` (`Mathlib/AlgebraicGeometry/StructureSheaf.lean`)
  is `[CommRing R]` throughout. `TopCat.Presheaf.stalk` needs `HasColimits C`
  (`Mathlib/Topology/Sheaves/Stalks.lean`); `AlgebraicGeometry.SheafedSpace`
  (`Mathlib/Geometry/RingedSpace/SheafedSpace.lean`); `LocallyRingedSpace`
  (`Mathlib/Geometry/RingedSpace/LocallyRingedSpace.lean`) is `SheafedSpace CommRingCat` only;
  `Spec.fullyFaithfulToLocallyRingedSpace` (`Mathlib/AlgebraicGeometry/GammaSpecAdjunction.lean`).
- Sites: `CategoryTheory.Precoverage` (`Mathlib/CategoryTheory/Sites/Precoverage.lean`),
  `Pretopology`, `GrothendieckTopology`, `Sheaf`, `GrothendieckTopology.Subcanonical`,
  `Subfunctor.sheafify` and `Subfunctor.range` (`Mathlib/CategoryTheory/Sites/Subsheaf.lean`),
  `Presheaf.IsLocallySurjective`, `Sheaf.IsLocallyInjective`, `Functor.relativelyRepresentable`
  and `MorphismProperty.presheaf` (`Mathlib/CategoryTheory/MorphismProperty/Representable.lean`).
- Ring schemes: `AlgebraicGeometry.Scheme`, `Scheme.Spec`, `Scheme.zariskiTopology` and
  `Scheme.subcanonical_zariskiTopology` (`Mathlib/AlgebraicGeometry/Sites/BigZariski.lean`),
  `Scheme.LocalRepresentability.isRepresentable` (`.../Sites/Representability.lean`),
  `IsOpenImmersion.of_flat_of_mono` (`Mathlib/AlgebraicGeometry/Morphisms/FlatMono.lean`),
  `IsClosedImmersion` (`.../Morphisms/ClosedImmersion.lean`).
- Group completion of commutative monoids: `Algebra.GrothendieckAddGroup`
  (`Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean`), `AddUnits`.

### Matching-family prerequisite

For a diagram of `A`-semimodules, construct its matching families as the submodule of
`∀ j, F.obj j` cut out by the equations `F.map f (x i) = x j`. Define the induced maps for
natural transformations and restriction along diagram functors, and prove identity and
composition. Section 0.2 uses this carrier for limit cones; §6.2 uses its multispan form
for basic-open sheaf conditions. This construction is part of §0.2, not an assumed
supplier from a different Tau Ceti revision.

### From the FunctorOfPoints roadmap

- `TauCeti.CommAlgCat.zariskiTopology`, its standard covers `generate_away_mem_zariskiTopology`
  (its §0.1), `TauCeti.FunctorOfPoints.IsOpenSubfunctor` (its §1.2), `CommAlgCat.intEquiv`,
  `LocallyRepresentableAbsolute` and `TauCeti.FunctorOfPoints.schemeEquivAbsolute` (its §2.4),
  consumed in §5.3 and §5.4.

## How to read the build

Layer 0 and Layer 1 are pure algebra and can start immediately; §1 depends only on §0.1 and §0.4.
Layer 2 depends on §0.2 and §0.3. Layer 3 needs Layers 0–2. Layer 4 opens with the generic
layer §4.1, which needs only Mathlib's site API and can be built in parallel with Layers 0–3; the
rest of Layer 4 needs Layer 3. Layer 5 needs Layer 4 and §§0.1, 1.2, 2.4 of the FunctorOfPoints
roadmap. Layer 6 needs §0.1 (colimits, for stalks), Layer 1 and Layer 3 (§3.3's
comparison of topologies and §3.4's classification of open subfunctors); its comparison theorem
§6.4 also needs Layer 4. Inside each layer the order is the subsection order unless a `*Needs:*`
clause says otherwise. Difficulty is marked **[D1]** (routine transport of known arguments),
**[D2]** (substantial but standard) or **[D3]** (new arguments or large API).

---

## Layer 0: Categorical algebra of semirings and semimodules

### 0.1 Colimits in `CommSemiRingCat` [D2]

Construct all small colimits in `CommSemiRingCat.{u}`.

- Coequalizers: the coequalizer of `f g : A ⟶ B` is `B ⧸ ringConGen (fun x y ↦ ∃ a, f a = x ∧ g a = y)`
  with `RingCon.mk'`.
- Pushouts: for `R → A` and `R → B`, the cocone `A → A ⊗[R] B ← B` is a pushout
  (`CommSemiRingCat.pushoutCocone`, `CommSemiRingCat.pushoutCoconeIsColimit`), generalising the
  `CommRingCat` declarations of the same names. Binary coproducts are `A ⊗[ℕ] B`; the initial
  object is `ℕ`.
- Arbitrary coproducts as filtered colimits of finite ones, and `HasColimits CommSemiRingCat.{u}`.
- `forget₂ CommRingCat CommSemiRingCat` preserves filtered colimits and pushouts; it does not
  preserve the initial object (`ℤ` versus `ℕ`).

**Checks.** The pushout of `ℕ → ℤ` along `ℕ → 𝔹`, where `𝔹 = ℕ ⧸ (1 ~ 2)` is the Boolean semifield,
is the zero semiring, since in `ℤ ⊗[ℕ] 𝔹` the element `1 ⊗ 1` equals `1 ⊗ 1 + 1 ⊗ 1` and is
additively invertible. The coequalizer of the two maps `ℕ[x] ⇉ ℕ` sending `x` to `1` and to `2`
is `𝔹`.

*Needs:* Mathlib `RingCon`, `Algebra.TensorProduct`, `CommSemiRingCat` filtered colimits.

### 0.2 Limits and colimits in `SemimoduleCat` [D2]

For a semiring `A`, construct `HasLimits (SemimoduleCat.{v} A)` with limit cone carried by
§0.2's matching-family submodule, and `HasColimits (SemimoduleCat.{v} A)`, with
cokernel-type quotients by `ModuleCon`. Show the forgetful functor to `Type v` preserves limits and
filtered colimits and that filtered colimits commute with finite limits in `SemimoduleCat A`
(both are computed on underlying sets). Equalizers are `LinearMap.eqLocus`. Identify the tensor
product bifunctor of `Mathlib/Algebra/Category/ModuleCat/Monoidal/Basic.lean` as a left adjoint
(`tensorLeft M ⊣` internal hom), so it preserves colimits.

**Pitfalls.** `SemimoduleCat A` is not abelian and not preadditive in Mathlib's sense. A
monomorphism is an injective map, but an epimorphism need not be surjective: `ℕ → ℤ` is an
epimorphism of ℕ-modules, because a monoid map out of `ℤ` is determined by the additive unit
it assigns to `1`. Cokernels do not determine exactness: there is no "kernel equals image"
formulation, and statements about exactness must be phrased with equalizers and coequalizers.

*Needs:* §0.2's matching-family construction; Mathlib `ModuleCon`.

### 0.3 Epimorphisms and regular epimorphisms [D1]

- `CommSemiRingCat.epi_iff_isEpi`: for an `A`-algebra `B`,
  `Epi (CommSemiRingCat.ofHom (algebraMap A B)) ↔ Algebra.IsEpi A B`, generalising
  `CommRingCat.epi_iff_epi`. Equivalently the codiagonal `B ⊗[A] B → B` is bijective, equivalently
  `Spec B → Spec A` is a monomorphism in `Aff`.
- Localizations `A → A[S⁻¹]` and surjections are epimorphisms; epimorphisms are stable under
  pushout and composition.
- `CommSemiRingCat.regularEpi_iff_surjective`: a morphism is a regular epimorphism if and only if it
  is surjective; it is then the coequalizer of its kernel pair, and the kernel pair is
  `RingCon.ker f` viewed as a subsemiring of `A × A`.

**Checks.** `ℕ → ℤ`, `ℕ → ℚ≥0` and `ℕ → ℤ[1/2]` are epimorphisms that are not surjective. The
map `ℕ[x] → ℕ[x, y] ⧸ (x + y ~ 0)` is an epimorphism (an element with an additive inverse has a
unique one).

*Needs:* §0.1 (pushouts); Mathlib `Algebra.IsEpi`.

### 0.4 Finite presentation through congruences [D2]

Define, for `[CommSemiring R] [CommSemiring A] [Algebra R A]`,

```lean
class Algebra.CongrFinitePresentation (R A : Type*) [CommSemiring R] [CommSemiring A]
    [Algebra R A] : Prop where
  out : ∃ (n : ℕ) (f : MvPolynomial (Fin n) R →ₐ[R] A) (s : Finset (MvPolynomial (Fin n) R ×
    MvPolynomial (Fin n) R)), Function.Surjective f ∧
      ringConGen (fun a b ↦ (a, b) ∈ s) = RingCon.ker f.toRingHom
```

and `RingHom.CongrFinitePresentation` through `RingHom.toAlgebra`. Prove:

- `Algebra.congrFinitePresentation_iff_isFinitelyPresentable`: `A` is congruence-finitely
  presented over `R` if and only if `Under.mk (CommSemiRingCat.ofHom (algebraMap R A))` is
  `IsFinitelyPresentable.{u}` in `Under (CommSemiRingCat.of R)`; this is Toën–Vaquié's
  Definition 2.9(3). Generalise `CommRingCat.isFinitelyPresentable_under`.
- Independence of the presentation (any surjection from a finitely generated polynomial algebra
  has finitely generated kernel congruence), stability under base change, composition, and
  `Localization.Away` (presented as `R[y] ⧸ (x y ~ 1)`), finite products (Borger–Jun,
  Proposition 6.6), and the transfer statements of Borger–Jun Propositions 6.1 and 6.5
  (faithfully flat descent of finite presentation, after §2.4).
- For rings: `Algebra.congrFinitePresentation_iff [CommRing R] [CommRing A] [Algebra R A] :
  Algebra.CongrFinitePresentation R A ↔ Algebra.FinitePresentation R A`, using §1.3.

**Pitfall.** Mathlib's `Algebra.FinitePresentation R A` over a semiring uses the ideal
`RingHom.ker`, which does not determine the quotient. If `A` is a finitely generated semiring that
is zero-sum-free and has no zero divisors, any surjection `ℕ[x₁,…,xₙ] → A` sending each variable
to a nonzero element has zero class `⊥`, so Mathlib's predicate holds whatever the congruence
kernel is. The same applies to `Module.FinitePresentation` over a semiring. Neither is used.

*Needs:* §0.1, §0.3; Mathlib `MvPolynomial`, `ringConGen`, `IsFinitelyPresentable`.

### Dependencies

Mathlib's `CommSemiRingCat`, `RingCon`, tensor products and `Algebra.IsEpi`; the matching-family submodule constructed here.

---

## Layer 1: Congruences and ideals

Quotients of semirings are quotients by congruences, and the kernel of a semiring map is a
congruence. An ideal `I` determines a congruence, and a congruence determines an ideal (its zero
class), but these are not inverse to each other. This layer fixes the dictionary, which is used
for closed subschemes in §4.5 and §6.5, and records exactly when ideals suffice. Throughout,
`R` is a commutative semiring.

### 1.1 The Bourne congruence and the zero class [D1]

```lean
/-- The congruence generated by `I ~ 0`: `a ~ b ↔ ∃ i ∈ I, ∃ j ∈ I, a + i = b + j`. -/
def Ideal.toRingCon (I : Ideal R) : RingCon R
/-- The zero class `{a | c a 0}` of a congruence. -/
def RingCon.zeroIdeal (c : RingCon R) : Ideal R
```

- `Ideal.toRingCon_eq_ringConGen : I.toRingCon = ringConGen (fun a b ↦ a ∈ I ∧ b = 0)`.
- `Ideal.gc_toRingCon : GaloisConnection Ideal.toRingCon RingCon.zeroIdeal`.
- `RingHom.ker_eq_zeroIdeal : RingHom.ker f = (RingCon.ker f).zeroIdeal`.
- `RingCon.zeroIdeal_mono`, `Ideal.toRingCon_sup`, `Ideal.toRingCon_iSup`, and compatibility with
  `Ideal.map` along surjections and with `RingCon.comap`.

### 1.2 Subtractive ideals [D1]

```lean
/-- `I` is subtractive (a k-ideal): `a + i ∈ I` and `i ∈ I` imply `a ∈ I`. -/
def Ideal.IsSubtractive (I : Ideal R) : Prop := ∀ a i, i ∈ I → a + i ∈ I → a ∈ I
/-- The subtractive closure `{a | ∃ i ∈ I, a + i ∈ I}`. -/
def Ideal.subtractiveClosure (I : Ideal R) : Ideal R
```

- `RingCon.zeroIdeal_toRingCon : I.toRingCon.zeroIdeal = I.subtractiveClosure`.
- `RingCon.isSubtractive_zeroIdeal`: zero classes are subtractive; in particular `RingHom.ker f` is
  subtractive.
- The Galois connection restricts to an order isomorphism between subtractive ideals and
  ideal-generated congruences, those `c` with `c = c.zeroIdeal.toRingCon`.
- Every ideal of a ring is subtractive; prime ideals of semirings need not be.

**Checks.** In `ℕ`, the ideal `ℕ \ {1}` is prime and not subtractive (`1 + 2 = 3`); its
subtractive closure is `ℕ`, so `(ℕ \ {1}).toRingCon = ⊤` (Giansiracusa–Giansiracusa, after
Proposition 2.4.6). The congruence `1 ~ 2` on `ℕ`, with quotient `𝔹`, has zero class `⊥` and is
not ideal-generated. Its kernel `RingCon.ker (ℕ → 𝔹)` differs from `⊥` although `RingHom.ker` is
`⊥`.

### 1.3 When ideals suffice [D1]

- `RingCon.toRingCon_zeroIdeal_of_isAddUnit (c : RingCon R) (h : ∀ x : c.Quotient, IsAddUnit x) :
  c.zeroIdeal.toRingCon = c`: if the quotient is a ring, the congruence is generated by its zero
  class. (If `[a] = [b]` and `[e] = -[a]`, then `a + e` and `b + e` lie in the zero class and
  `a + (b + e) = b + (a + e)`.)
- For `[CommRing R]`: `Ideal.toRingCon_eq_quotient_ringCon : I.toRingCon = Ideal.Quotient.ringCon I`,
  and `RingCon.orderIsoIdeal : RingCon R ≃o Ideal R` given by `zeroIdeal` with inverse
  `toRingCon` (Giansiracusa–Giansiracusa, Proposition 2.4.6), with
  `I.toRingCon.Quotient ≃+* R ⧸ I` commuting with the quotient maps. This is the statement that,
  for rings, the congruence-based theory of this roadmap recovers the ideal-based theory of
  Mathlib.
- A surjection `f : R → S` with `S` a ring has `RingCon.ker f = (RingHom.ker f).toRingCon`.

### 1.4 Prime ideals and the spectrum of a quotient [D2]

Prime ideals govern the topology; congruences govern quotients. Define, for `c : RingCon R` and an
ideal `p`, `RingCon.IsSaturated c p : Prop := ∀ a b, c a b → (a ∈ p ↔ b ∈ p)`.

- `PrimeSpectrum.range_comap_mk' (c : RingCon R) : Set.range (PrimeSpectrum.comap c.mk') =
  {p | c.IsSaturated p.asIdeal}`, and `PrimeSpectrum.comap c.mk'` is a homeomorphism onto this
  set with the subspace topology.
- The range is contained in `zeroLocus c.zeroIdeal`, but need not be closed,
  specialization-closed, or equal to that zero locus.
- If `c = I.toRingCon` with `I` subtractive, the range is the set of primes `p ⊇ I` that are
  saturated for `I.toRingCon`; it contains every subtractive prime containing `I`.

**Checks.** For `f : 𝔹[x] → 𝔹`, `x ↦ 1`, the zero class of `RingCon.ker f` is `⊥` (a nonzero
polynomial over `𝔹` takes the value `1` at `1`), `⊥` is prime in `𝔹[x]`, and the range of
`comap f` is `{⊥}`: the generic point, which is dense and not closed, since `(x)` is another
prime. This is the semiring form of Giansiracusa–Giansiracusa, Remark 3.3.2, and shows that the
semiring analogue of Mathlib's ring-only `PrimeSpectrum.isClosedEmbedding_comap_of_surjective`
is false. For `ℕ` and `I = ℕ \ {1}`, `zeroLocus I = {I}` while `I.toRingCon.Quotient = 0` has
empty spectrum.

### 1.5 Congruences and localization [D2]

For a submonoid `M` and `[IsLocalization M S]`, define `RingCon.localization c M S : RingCon S`
as the congruence generated by the image of `c` under `algebraMap R S`, and prove the explicit
description: `x ~ y` if and only if there are `m ∈ M` and `(a, b)` related by `c` with
`x * algebraMap R S m = algebraMap R S a` and `y * algebraMap R S m = algebraMap R S b`. Prove:

- `(c.localization M S).Quotient` is a localization of `c.Quotient` at the image of `M`.
- The underlying set of `c.localization M S`, as a subset of `S × S`, is the localized
  `R`-submodule `M⁻¹ c` of `M⁻¹ (R × R)`; the map `M⁻¹ c → S × S` is injective (by
  mono-flatness of localization, Mathlib's `IsLocalization.flat`).
- `RingCon.ker` commutes with localization: for `f : R →+* T`,
  `RingCon.ker (f localized) = (RingCon.ker f).localization M S` when `T` is localized at `f(M)`.
  This uses §2.2's finite-limit flatness of localization (a kernel pair is a pullback), not only
  mono-flatness.
- Restriction and extension give a Galois connection between congruences on `R` and on `S`,
  restricting to a bijection onto congruences on `R` that are `M`-saturated
  (`n a ~ n b` with `n ∈ M` implies `a ~ b`).

*Needs:* §1.1; §2.2 for the kernel statement.

### Examples

The `𝔹[x] → 𝔹` example separates "closed immersion" from "topologically closed". The `ℕ` examples
separate ideals from congruences in both directions. The ring case of §1.3 ties everything to
`Ideal.Quotient`.

### Dependencies

Mathlib's `RingCon`, `Ideal`, `PrimeSpectrum` and `IsLocalization`; §0.1 for quotients as
coequalizers; §2.2 for one statement of §1.5.

---

## Layer 2: Flatness

### Why finite-limit flatness

There are two notions of flatness for a semimodule `M` over a semiring `R`:

- *mono-flat*: `M ⊗[R] -` preserves injective linear maps. This is what Mathlib's `Module.Flat`
  expresses over a semiring.
- *flat* (Toën–Vaquié Definition 2.9(1); Katsov; Borger–Jun Definition 2.3): `M ⊗[R] -` preserves
  finite limits, equivalently equalizers of pairs, since finite products are finite biproducts and
  are always preserved.

Flat implies mono-flat, because `f` is injective if and only if the diagonal `N → N ×_P N` is an
isomorphism, a finite-limit condition (Borger–Jun, Proposition 2.4). For rings the two agree,
because an equalizer of `f, g` is the kernel of `f - g`. Over a semiring there is no subtraction,
an equalizer is not a kernel, and injectivity carries no information about equalizers. Every
place where scheme theory uses flatness uses equalizers or pullbacks:

- faithfully flat descent and the sheaf property of representables are statements that
  `M → M ⊗ S ⇉ M ⊗ S ⊗ S` is an equalizer (§2.4);
- the fibre product of two Zariski opens, and base change of open immersions, need flat base change
  to preserve pullbacks (§3.1);
- localization of the kernel congruence of a map, used for closed subschemes, needs preservation of
  kernel pairs (§1.5).

So the roadmap is built on finite-limit flatness. No target assumes the converse over arbitrary commutative semirings;
only the comparison over rings in §2.2 is required.

### 2.1 Definition and the equational criterion [D2]

Define flatness by the equational criterion, which is universe-free:

```lean
/-- `M` is flat over `R`: every linear relation in `M` is rectifiable. -/
class Module.LimitFlat (R M : Type*) [CommSemiring R] [AddCommMonoid M] [Module R M] : Prop where
  out : ∀ {m : ℕ} (r s : Fin m → R) (x : Fin m → M), ∑ i, r i • x i = ∑ i, s i • x i →
    ∃ (n : ℕ) (a : Fin m → Fin n → R) (y : Fin n → M),
      (∀ i, x i = ∑ j, a i j • y j) ∧ ∀ j, ∑ i, r i * a i j = ∑ i, s i * a i j
```

(Borger–Jun, Corollary 3.6, first proved over semirings by Katsov.) Prove Lazard's theorem
(Borger–Jun, Theorem 3.5), in every universe `v` of test modules:

- `Module.limitFlat_iff_preservesFiniteLimits`: `Module.LimitFlat R M` if and only if
  `tensorLeft (SemimoduleCat.of R M)` preserves finite limits on `SemimoduleCat.{v} R`, if and only
  if it preserves equalizers;
- equivalently, `M` is a filtered colimit of finite free modules; equivalently every map from a
  finitely presented module (finite presentation by module congruences) factors through a finite
  free module.

The fixed definition avoids the universe quantification that Mathlib's `Module.Flat` resolves by
restricting to `P : Type u`.

### 2.2 Basic theory [D2]

- Free and projective modules are flat; flatness is closed under filtered colimits, direct sums,
  retracts, tensor products, base change and transitivity (for `R → S` flat and `M` flat over `S`).
- `Module.LimitFlat.flat [Module.LimitFlat R M] : Module.Flat R M` (Borger–Jun, Proposition 2.4).
- `Module.limitFlat_iff_flat [CommRing R] [AddCommGroup M] [Module R M] :
  Module.LimitFlat R M ↔ Module.Flat R M`.
- `IsLocalization.limitFlat (M : Submonoid R) [IsLocalization M S] : Module.LimitFlat R S`, and
  `LocalizedModule` is the base change; localization preserves finite limits because it is a
  filtered colimit (§0.2).
- Flat modules over an additively cancellative (respectively zero-sum-free) semiring are additively
  cancellative (respectively zero-sum-free) (Borger–Jun, Proposition 2.5).
- `RingHom.LimitFlat (f : A →+* B) : Prop`, defined through `RingHom.toAlgebra` like Mathlib's
  ring-only `RingHom.Flat`, with composition and base change.

**Checks.** `ℕ → ℤ` is not flat, not even mono-flat: the injection `ℕ → ℕ ∪ {∞}` (with `∞`
absorbing) becomes `ℤ → 0`. `ℕ → 𝔹` is not mono-flat: `ℕ → ℤ` becomes `𝔹 → 0`. (Diklich-Zelich,
Corollary 1.1.3, proves the first non-flatness.) `GL₂` over `ℕ` is not flat (Borger–Jun,
Theorem 1.4); this is not a target, but it shows that familiar ring-flat objects can fail.

### 2.3 Faithful flatness [D2]

Define `Module.LimitFaithfullyFlat R M` as `Module.LimitFlat R M` together with: a linear map
`φ` is bijective whenever `M ⊗ φ` is (Toën–Vaquié's conservativity, Borger–Jun §4). Prove:

- Purity: for `R → S` flat, faithfulness is equivalent to `M → S ⊗ M ⇉ S ⊗ S ⊗ M` being an
  equalizer for every `M` (Borger–Jun, Proposition 4.12).
- `Module.limitFaithfullyFlat_iff_surjective_comap`: for an `R`-algebra `S`,
  `LimitFaithfullyFlat R S ↔ LimitFlat R S ∧ Function.Surjective (PrimeSpectrum.comap (algebraMap R S))`
  (Diklich-Zelich, Corollary 1.3.8, via Propositions 1.3.4 and 1.3.6).
- Going-down for flat maps: the range of `PrimeSpectrum.comap` of a flat map is stable under
  generalization (Diklich-Zelich, Theorem 1.3.9).
- `limitFaithfullyFlat_pi_away_iff (f : Fin n → R) :
  Module.LimitFaithfullyFlat R (∀ i, Localization.Away (f i)) ↔ Ideal.span (Set.range f) = ⊤`
  (Borger–Jun, Proposition 5.1). Its proof replaces the ring proof's `x - y` by equalities
  `aⁿ t = aⁿ u` and a partition of unity.
- A flat epimorphism that is faithfully flat is an isomorphism.
- For a finite family of `R`-algebras `Sᵢ`, the product of the base-change functors is
  conservative if and only if `∏ Sᵢ` is faithfully flat (finite products of semirings,
  Borger–Jun Proposition 2.1).

### 2.4 Faithfully flat descent [D2]

- `Module.LimitFaithfullyFlat.comonadic`: for faithfully flat `R → S`, base change
  `SemimoduleCat R ⥤ SemimoduleCat S` is comonadic (Borger–Jun, Theorem 4.1, via Beck's theorem;
  Toën–Vaquié Theorem 2.5).
- The same for commutative algebras: base change on `Under (CommSemiRingCat.of R)` is comonadic
  (Borger–Jun, Proposition 4.9), so affine schemes and algebras descend.
- Consequence: the presheaf `A ↦ SemimoduleCat A` on `Aff` is a stack for the fpqc topology, and
  the presheaf `A ↦ Under A` is a stack (Toën–Vaquié, Corollary 2.11(2)).
- Descent of finite presentation for modules and algebras (Borger–Jun, Propositions 6.2 and 6.5).

### Dependencies

§0.2, §0.3, §0.4; Mathlib's tensor products, `Localization`, `PrimeSpectrum`, `Module.Flat` (as a
consequence only).

---

## Layer 3: The Zariski site of affine semiring schemes

### 3.1 Zariski open morphisms [D1]

```lean
/-- Toën–Vaquié Definition 2.9(4): a flat epimorphism of finite presentation. -/
def RingHom.IsZariskiOpen {A B : Type u} [CommSemiring A] [CommSemiring B] (f : A →+* B) : Prop :=
  f.LimitFlat ∧ (letI := f.toAlgebra; Algebra.IsEpi A B) ∧ f.CongrFinitePresentation
```

and the corresponding `MorphismProperty Aff`. Prove: isomorphisms and `A → Localization.Away f`
are Zariski open; the class is stable under composition and under pushout (base change); every
Zariski open is a monomorphism in `Aff`; the projections `R₁ × R₂ → Rᵢ` are Zariski open, being
the localizations at the primitive idempotents (Borger–Jun, Proposition 2.1; over a semiring
`1 - e` is not available, so the idempotent decomposition is stated with both idempotents).

**Pitfall.** `ℕ → ℤ` is an epimorphism of finite presentation (`ℤ = ℕ[y] ⧸ (1 + y ~ 0)`) and
`Spec ℤ → Spec ℕ` is a monomorphism, but it is not Zariski open, because `ℕ → ℤ` is not flat. Its
image in `PrimeSpectrum ℕ` is `{(0)} ∪ {pℕ}`, which omits for instance the prime `ℕ \ {1}`.

### 3.2 The two Zariski topologies [D2]

- `zariskiPrecoverageTV : Precoverage Aff`: a family `{Spec Aᵢ → Spec A}` is a covering if every
  `A → Aᵢ` is Zariski open and some finite subfamily has a faithfully flat product (Toën–Vaquié,
  Definition 2.10(2)). Prove it is stable under base change and composition, contains
  isomorphisms, and generates `zariskiTopologyTV : GrothendieckTopology Aff`. The fpqc
  precoverage (Definition 2.10(1)) is defined alongside; it is used only for subcanonicity.
- `zariskiPrecoveragePrincipal`: families `{Spec A[1/fᵢ] → Spec A}` with `fᵢ` finite and
  `Ideal.span (Set.range f) = ⊤`, closed under isomorphism; `zariskiTopologyPrincipal`
  (Borger–Jun, Remark 5.2).
- `zariskiTopologyPrincipal ≤ zariskiTopologyTV`, by §2.3 (`limitFaithfullyFlat_pi_away_iff`).

### 3.3 Zariski opens are locally principal [D3]

**Theorem** (`RingHom.IsZariskiOpen.exists_away_cover`). Let `f : A →+* B` be Zariski open. Then
`PrimeSpectrum.comap f` is a homeomorphism onto a quasi-compact open subset `W` of
`PrimeSpectrum A`, and there are `g₁, …, gₙ ∈ A` with `W = ⋃ D(gᵢ)`, `Ideal.span {f gᵢ} = ⊤` in
`B`, and each `Localization.Away (gᵢ) → Localization.Away (f gᵢ)` an isomorphism.

Proof route (Diklich-Zelich, Theorem 1.3.10): for `p` in the range, `A_p → B ⊗ A_p` is a flat
epimorphism, faithfully flat by §2.3, hence an isomorphism; `A_p` is the filtered colimit of the
`A[1/g]`, `g ∉ p`, in `Under A`, and finite presentation of `B` (§0.4) gives one `g` with
`A[1/g] ≅ B[1/g]`; quasi-compactness of `PrimeSpectrum B` (Mathlib `compactSpace`) gives finitely
many. Marty (Theorems 3.7 and 3.8) gives a second proof route in a strong relative context.
If using that route, prove every context hypothesis for commutative monoids as part of
this target; they are not supplier instances assumed here.

**Corollary** (`zariskiTopologyTV_eq_principal`). `zariskiTopologyTV = zariskiTopologyPrincipal`.
Every Toën–Vaquié covering family is refined by a principal one: the faithful flatness of a finite
subproduct makes the images cover `PrimeSpectrum A` (§2.3), and each member is covered by
principal localizations of `A` by the theorem.

Borger–Jun (Remark 5.2) record the equality of these topologies as unknown to them; the
theorem above is the target, and its proof must be checked in full rather than taken from the
cited sources.

### 3.4 Open subfunctors of an affine [D2]

For `W : TopologicalSpace.Opens (PrimeSpectrum A)`, let `Spec.openSubfunctor W` be the subfunctor
of `Spec A` whose `B`-points are the maps `φ : A →+* B` with `Set.range (PrimeSpectrum.comap φ) ⊆ W`.
Prove `SemiringScheme.openSubfunctorOrderIso A : TopologicalSpace.Opens (PrimeSpectrum A) ≃o
{U : Subfunctor (Spec A) // IsZariskiOpenSubfunctor U}`, where Zariski open subfunctors are those
of Toën–Vaquié Definition 2.12(1) (the sheafified range of a family of Zariski open morphisms).
Under it, `D(g)` corresponds to `Spec A[1/g]` and finite intersections correspond to fibre
products. This is the semiring form of Marty's Theorem 3.13 and the input to §6.4.

### 3.5 Subcanonicity [D1]

`zariskiTopologyTV.Subcanonical`: every `Spec A` is a sheaf, indeed an fpqc sheaf (Toën–Vaquié,
Corollary 2.11(1)), by purity of faithfully flat maps (§2.3). The principal case is the equalizer
`A → ∏ A[1/fᵢ] ⇉ ∏ A[1/(fᵢ fⱼ)]` of Borger–Jun's proof of Proposition 5.1.

### Dependencies

Layers 0–2; Mathlib's `Precoverage`, `GrothendieckTopology`, `Subfunctor.sheafify`,
`PrimeSpectrum`.

---

## Layer 4: Semiring schemes

### 4.1 The generic layer [D2]

Fix a category `C` with pullbacks, a subcanonical Grothendieck topology `J` on `C`, and a
`MorphismProperty C` `P` of monomorphisms containing isomorphisms and stable under composition and
base change, such that `J` is generated by covering families of `P`-morphisms. Bundle these as a
structure `TauCeti.OpenImmersionSite C` with fields `J`, `P` and the stated properties. Build,
in namespace `TauCeti.OpenImmersionSite`:

- `IsOpenSubfunctor P J (X : C) (U : Subfunctor (yoneda.obj X))`: `U` is the
  `Subfunctor.sheafify J` of the range of a family of `P`-morphisms into `X`.
- `IsOpenImmersion P J (f : F ⟶ G)` for sheaves `F G : Sheaf J (Type u)`: for every
  `yoneda.obj X ⟶ G`, the pullback of `f` is a monomorphism onto an open subfunctor (Toën–Vaquié,
  Definition 2.12(2)); stability under base change and composition (Lemma 2.13); for
  representables, `IsOpenImmersion P J (yoneda.map g) ↔ P g` (Lemma 2.14, whose proof uses
  descent of the `P`-morphisms along `J`, supplied here by §2.4 and §0.4).
- `IsScheme P J (F : Sheaf J (Type u))`: there is a family of representables with open immersions
  into `F` whose induced map from the presheaf coproduct is `Presheaf.IsLocallySurjective`
  (Definition 2.15); the full subcategory; locality on `C` (Proposition 2.16); open subfunctors of
  schemes are schemes and the characterization of open immersions between schemes
  (Proposition 2.17); stability under coproducts and fibre products and the presentation by
  equivalence relations, that is, gluing (Proposition 2.18).
- Distinguish an open immersion of sheaves from relative representability by affines.
  An open subfunctor of an affine is covered by representable `P`-pieces but need not
  itself be affine: already over a field, `𝔸² \ {0}` is an open non-affine subscheme.
  For representable source and target, prove the comparison with `P` under
  `HasDescent`; for a general open source, use the covering-by-`P`-pieces statement.
  In the ring comparison, extend to the site of schemes and use the scheme-level
  `IsOpenImmersion.presheaf` in `Scheme.LocalRepresentability.isRepresentable`.
  Do not impose `Functor.relativelyRepresentable` by affine objects on every open immersion.

The proofs are Toën–Vaquié's and use only the listed properties of `(C, J, P)`, except Lemma 2.14,
whose proof uses descent of `P`-morphisms and finite presentation; state it with those two
properties as fields of a refinement `OpenImmersionSite.HasDescent`.

### 4.2 Definition and first properties [D1]

`TauCeti.SemiringScheme.{u}` is `(IsScheme zariskiOpen zariskiTopologyTV).FullSubcategory`.
Instantiate §4.1: `Spec A` is a semiring scheme; open immersions between affines are exactly
`Spec` of Zariski open morphisms; semiring schemes have fibre products and small coproducts, and
the inclusion into `Sheaf zariskiTopologyTV (Type u)` preserves them; open subfunctors are
semiring schemes; gluing data produce semiring schemes.

### 4.3 Relative schemes and examples [D2]

- For a semiring `A`, `A`-schemes are semiring schemes over `Spec A`; the category is equivalent
  to the scheme category of the instance of §4.1 at `(Under (CommSemiRingCat.of A))ᵒᵖ`
  (Giansiracusa–Giansiracusa, Proposition 3.1.2, in functor-of-points form).
- Affine space `𝔸ⁿ_A := Spec A[x₁, …, xₙ]` represents `B ↦ Bⁿ` on `A`-algebras.
- The projective line `ℙ¹_A`, glued from `Spec A[x]` and `Spec A[y]` along `Spec A[x, x⁻¹]` with
  `y = x⁻¹`; its `B`-points for a local semiring `B` are `B ⊔ B` modulo `x ~ x⁻¹` on units.
- The open subscheme `𝔸²_A \ {0}` and its non-affineness (global sections `A[x, y]`).
- Disjoint unions `Spec (A₁ × A₂) ≅ Spec A₁ ⊔ Spec A₂` (Borger–Jun, Proposition 2.1).

**Check.** `ℙ¹_𝔹` and `ℙ¹_ℕ` are not affine: their global sections are `𝔹` and `ℕ`.

### 4.4 Affine morphisms [D2]

A morphism `f : X ⟶ Y` of semiring schemes is affine if its pullback along every `Spec A → Y` is
affine. Prove that affineness is local on the target for Zariski covers, using descent of algebras
(§2.4), and that affine morphisms to `Y` are equivalent to quasi-coherent algebras in the descent
sense: compatible systems of algebras over the affines of `Y`.

### 4.5 Closed immersions and closed subschemes [D2]

**Definition** (`IsClosedImmersion`). `f : X ⟶ Y` is a closed immersion if for every
`Spec A ⟶ Y` there is `c : RingCon A` and an isomorphism over `Spec A` between the pullback and
`Spec c.Quotient`. Equivalently, `f` is affine and on affines is `Spec` of a regular epimorphism
(§0.3). This is Toën–Vaquié's notion of regular monomorphism made local, and agrees with
Giansiracusa–Giansiracusa's choice in §3.3 ("an affine morphism with surjective sheaf map").

Prove:

- Stability under base change (`A' ⊗[A] c.Quotient ≅ A' ⧸ (congruence generated by c)`) and
  composition.
- Locality on the target: if `A → B` becomes surjective after base change to each `A[1/fᵢ]` with
  `Ideal.span {fᵢ} = ⊤`, it is surjective. (For `b ∈ B`, write `fᵢᴺ b` as an image using equalities
  `fᵢᵐ (fᵢⁿ b) = fᵢᵐ φ(aᵢ)` and a partition of unity `1 = ∑ xᵢ fᵢᴺ`; no subtraction is needed.)
- `closedSubschemeOrderIso (A) : ClosedSubscheme (Spec A) ≃o (RingCon A)ᵒᵈ`, where
  `ClosedSubscheme X` is the type of closed immersions into `X` up to isomorphism over `X`.
- Intersections of closed subschemes are joins of congruences; the scheme-theoretic image of a
  morphism of affines `Spec B → Spec A` is `Spec (A ⧸ RingCon.ker φ)`.
- The ideal-generated closed subscheme `V(I) := Spec (I.toRingCon.Quotient)`, with
  `V(I) = V(I.subtractiveClosure)`; for rings these are all closed subschemes (§1.3).
- Under the topology comparison of §6, the underlying set of `Spec c.Quotient` in
  `PrimeSpectrum A` is the set of `c`-saturated primes (§1.4).

**Pitfall.** Closed immersions need not be topologically closed (§1.4); a definition through
"homeomorphism onto a closed subset plus surjective sheaf map" is not equivalent over semirings
and is not used.

### Dependencies

Layer 3; §1.1–§1.4; §2.4; Mathlib's site, `Subfunctor` and representability API.

---

## Layer 5: Rings and semirings

### 5.1 Group completion of semirings [D1]

- `CommSemiRingCat.groupCompletion : CommSemiRingCat.{u} ⥤ CommRingCat.{u}`, `A ↦ ℤ ⊗[ℕ] A`
  (Mathlib's `Algebra.TensorProduct.instCommRing`), and
  `CommSemiRingCat.groupCompletionAdj : groupCompletion ⊣ forget₂ CommRingCat CommSemiRingCat`.
- `forget₂ CommRingCat CommSemiRingCat` is fully faithful; the counit is an isomorphism, so the
  rings form a reflective subcategory. The underlying additive group of `ℤ ⊗[ℕ] A` is
  `Algebra.GrothendieckAddGroup A`.
- **There is no right adjoint** at the level of commutative semirings:
  `¬ (forget₂ CommRingCat.{u} CommSemiRingCat.{u}).IsLeftAdjoint`, since a left adjoint preserves
  the initial object and `ℤ` is not initial in `CommSemiRingCat`. (The additively invertible
  elements of a semiring form an ideal, which contains `1` only for rings.)
- At the level of modules, `AddCommGrpCat ⥤ AddCommMonCat` has both adjoints: group completion
  `M ↦ ℤ ⊗[ℕ] M` on the left and `M ↦ AddUnits M ≅ Hom_ℕ(ℤ, M)` on the right (Borger–Jun, §2).
  For a semiring `A`, the `ℤ ⊗[ℕ] A`-modules form a full subcategory of `A`-modules, closed under
  limits and colimits, consisting of the modules whose underlying monoid is a group (Toën–Vaquié,
  proof of Proposition 3.3).

**Check.** `ℤ ⊗[ℕ] 𝔹 = 0` and `ℤ ⊗[ℕ] ℚ≥0 = ℚ`; a semiring `A` is a ring if and only if
`𝔹 ⊗[ℕ] A = 0` (Borger–Jun, §1).

### 5.2 Group completion preserves the Zariski data [D1]

For `f : A →+* B` and a `ℤ ⊗ A`-module `N`, the natural map `N ⊗[A] B → N ⊗[ℤ ⊗ A] (ℤ ⊗ B)` is
an isomorphism (Toën–Vaquié, Proposition 3.3). Hence group completion sends flat maps to flat
maps, epimorphisms to epimorphisms, finitely presented maps to finitely presented maps, Zariski
open maps to Zariski open maps, and Zariski covers to Zariski covers. For a ring map,
`RingHom.IsZariskiOpen f` holds if and only if `Spec.map f` is an open immersion in Mathlib's
sense (`IsOpenImmersion.of_flat_of_mono` and the converse; `Module.limitFlat_iff_flat`; §0.4's
ring comparison; Mathlib monomorphisms of affine schemes correspond to epimorphisms of rings).

### 5.3 Base change and inclusion [D2]

Let `RingSchemeTV.{u}` be the scheme category of the generic layer §4.1 at `CommRingCat.{u}ᵒᵖ`,
with `P` the ring maps satisfying `RingHom.IsZariskiOpen` and `J` the topology they generate
(Toën–Vaquié §3.1). First prove that it is the FunctorOfPoints roadmap's absolute category:

- on `CommRingCat.{u}ᵒᵖ`, `J` equals the transport along `CommAlgCat.intEquiv` of
  `TauCeti.CommAlgCat.zariskiTopology ℤ` (both are generated by principal covers: §3.3 for rings,
  and `generate_away_mem_zariskiTopology`);
- an open subfunctor in the sense of §4.1 is an open subfunctor in the sense of
  `TauCeti.FunctorOfPoints.IsOpenSubfunctor` and conversely (for `Spec A`, both are the
  `D(I)`, by §3.4 at rings);
- hence `RingSchemeTV.{u}` and `LocallyRepresentableAbsolute` are the same full subcategory of
  Zariski sheaves on `CommRingCat.{u}ᵒᵖ`: `RingSchemeTV.equivLocallyRepresentableAbsolute`.

Then construct:

- `SemiringScheme.baseChangeℤ : SemiringScheme.{u} ⥤ RingSchemeTV.{u}`, the base change
  `X ↦ X ⊗_ℕ ℤ` with `Spec A ↦ Spec (ℤ ⊗[ℕ] A)` (Toën–Vaquié, Corollary 2.22 applied through
  Proposition 3.3).
- `SemiringScheme.ofRingScheme : RingSchemeTV.{u} ⥤ SemiringScheme.{u}`, extending
  `Spec R ↦ Spec R` for rings `R`, and
  `ofRingSchemeAdj : ofRingScheme ⊣ baseChangeℤ` with `ofRingScheme` fully faithful
  (Toën–Vaquié, Proposition 3.4).
- `Spec ℤ → Spec ℕ` is a monomorphism; `ofRingScheme` identifies `RingSchemeTV` with the
  semiring schemes admitting a (necessarily unique) morphism to `Spec ℤ`, that is, with the slice
  over `Spec ℤ`; under this identification `baseChangeℤ X = X ×_{Spec ℕ} Spec ℤ`, and
  `ofRingScheme` preserves fibre products.
- Compatibility with closed immersions and open immersions in both directions.

**Pitfall.** `Spec ℤ → Spec ℕ` is a monomorphism of finite presentation but neither an open nor a
closed immersion (§3.1, §0.3). The inclusion of ring schemes is the *left* adjoint of base change,
not the right adjoint.

### 5.4 Comparison with Mathlib's `Scheme` [D2]

Compose §5.3 with `RingSchemeTV.equivLocallyRepresentableAbsolute` and the FunctorOfPoints
equivalence `schemeEquivAbsolute : Scheme.{u} ≌ LocallyRepresentableAbsolute`:

- `SemiringScheme.toScheme : SemiringScheme.{u} ⥤ AlgebraicGeometry.Scheme.{u}` with
  `(Spec A).toScheme ≅ AlgebraicGeometry.Spec (CommRingCat.of (ℤ ⊗[ℕ] A))`;
- `SemiringScheme.ofScheme : AlgebraicGeometry.Scheme.{u} ⥤ SemiringScheme.{u}`, fully faithful,
  `ofScheme ⊣ toScheme`, with `ofScheme ⋙ toScheme ≅ 𝟭`;
- `ofScheme` sends Mathlib's open immersions, closed immersions (`IsClosedImmersion`) and fibre
  products to those of §4, and reflects them.

This is the precise sense in which, restricted to rings, the theory recovers Mathlib's `Scheme`.

### Dependencies

Layer 4; §§0.1, 1.2, 2.4 of the FunctorOfPoints roadmap; Mathlib's
`IsOpenImmersion.of_flat_of_mono`.

---

## Layer 6: Locally semiringed spaces

### 6.1 Semiringed spaces [D2]

Using `HasColimits CommSemiRingCat` (§0.1), stalks of `CommSemiRingCat`-valued presheaves exist and
are computed as filtered colimits of underlying sets.

```lean
structure LocallySemiringedSpace extends SheafedSpace CommSemiRingCat.{u} where
  isLocalRing : ∀ x, IsLocalRing (presheaf.stalk x)
```

Morphisms are morphisms of `SheafedSpace` whose stalk maps are `IsLocalHom`. Prove that in a local
semiring the non-units form the unique maximal ideal, so locality of a stalk map means that
non-units go to non-units. Construct the fully faithful functor
`LocallyRingedSpace.toLocallySemiringedSpace` along `forget₂ CommRingCat CommSemiRingCat`
(which preserves the filtered colimits computing stalks).

**Pitfall.** Local semirings behave differently: `ℝ≥0` is a semifield with the nontrivial quotient
`𝔹`, so residue semifields are not simple objects.

### 6.2 The semiring structure sheaf [D3]

Generalise `AlgebraicGeometry.StructureSheaf` from `[CommRing R]` to `[CommSemiring R]`:

- `StructureSheaf R : Sheaf CommSemiRingCat (PrimeSpectrum.Top R)`, sections being locally
  fractions in `Localization.AtPrime`, with the `M`-valued version for an `R`-module `M` valued in
  `AddCommMonCat` using `LocalizedModule`.
- `stalkIso : stalk at p ≅ Localization.AtPrime p.asIdeal`;
  `basicOpenIso : Γ(D(f)) ≅ Localization.Away f`; `globalSectionsIso : Γ(⊤) ≅ R`.
- `Spec R` as a `LocallySemiringedSpace`; `Spec` is a functor
  `CommSemiRingCatᵒᵖ ⥤ LocallySemiringedSpace`.

**Pitfall.** Mathlib's proofs of `toBasicOpen_injective` and `toBasicOpen_surjective` use
subtraction (`sub_eq_zero`). Every step must be restated as an equality `cⁿ a = cⁿ b` in a
localization, and the gluing uses a partition of unity `fᴺ = ∑ bᵢ hᵢ` with
`a := ∑ bᵢ aᵢ`; the same computation as Borger–Jun's proof of Proposition 5.1. §0.2's
matching-family construction in its jointly-injective multispan form applies to the basic-open sheaf condition.

### 6.3 `Spec` is fully faithful; the Γ–Spec adjunction [D2]

- `Γ ⊣ Spec` on `LocallySemiringedSpace`, with unit `X → Spec Γ(X)` sending `x` to the prime
  `{f | germ f ∈ maximal ideal of the stalk}`.
- `Spec.fullyFaithfulToLocallySemiringedSpace`, generalising
  `Spec.fullyFaithfulToLocallyRingedSpace`. The ring argument works: for a local morphism,
  `a ∉ f(p)` iff `a` is a unit in the stalk iff its image is a unit in the stalk at `p`.
- `LocallyRingedSpace.toLocallySemiringedSpace` commutes with `Spec` on rings.

### 6.4 Geometric semiring schemes and the comparison theorem [D3]

`GeometricSemiringScheme` is the full subcategory of `LocallySemiringedSpace` of spaces covered by
open subspaces isomorphic to some `Spec A` (Giansiracusa–Giansiracusa §3.1, with morphisms the
morphisms of locally semiringed spaces; §6.3 shows these agree with their "locally given by algebra
maps" morphisms).

**Theorem** (`GeometricSemiringScheme.functorOfPointsEquivalence`). The functor
`X ↦ (A ↦ Hom(Spec A, X))` is an equivalence `GeometricSemiringScheme.{u} ≌ SemiringScheme.{u}`
sending `Spec A` to `Spec A`, open subspaces to open subfunctors, and open immersions to open
immersions.

Proof route, as for rings in Demazure–Gabriel I §1:

1. `Hom(Spec -, X)` is a sheaf for the principal topology (gluing of morphisms of locally
   semiringed spaces along `D(fᵢ)`), hence for `zariskiTopologyTV` (§3.3).
2. Open subspaces of `X` give open subfunctors; for affine `X` this is §3.4.
3. Full faithfulness from §6.3 by covering with affines.
4. Essential surjectivity: glue the spaces `Spec Aᵢ` of an affine open cover along the opens of
   `PrimeSpectrum Aᵢ` corresponding (§3.4) to the open subfunctors `Spec Aᵢ ×_F Spec Aⱼ`.

For rings the equivalence is compatible with §5.4, `LocallyRingedSpace.toLocallySemiringedSpace`
and Mathlib's `Scheme.toLocallyRingedSpace`.

Literature: Giansiracusa–Giansiracusa, Remark 3.1.1, asserts without proof that their category is
equivalent to Toën–Vaquié's; Borger–Jun, Remark 5.3, assert that the locally semiringed approach
(attributed to Jun) is equivalent to the principal-topology version. The construction and comparison in this layer are required proof targets;
the comparison of topologies in §3.3 identifies the two sites.

### 6.5 Quasi-coherent modules and congruence sheaves [D2]

Only what closed subschemes need. Semimodule categories are not abelian, so no kernel, cokernel or
cohomology API is used.

- For an `A`-module `M`, the sheaf `M~` of `AddCommMonCat` on `PrimeSpectrum A` from §6.2, with
  `M~(D(f)) ≅ LocalizedModule (Submonoid.powers f) M` and stalks `LocalizedModule p.primeCompl M`.
  `M ↦ M~` preserves finite limits (§2.2).
- A congruence sheaf on a geometric semiring scheme `X` is a subsheaf `J ⊆ 𝒪_X × 𝒪_X` with each
  `J(U)` a `RingCon` on `𝒪_X(U)`; it is quasi-coherent if on every affine open `Spec A`,
  `J(D(f))` is `J(Spec A).localization (Submonoid.powers f)` (§1.5).
- Taking global sections is an order isomorphism between quasi-coherent congruence sheaves on
  `Spec A` and `RingCon A` (Giansiracusa–Giansiracusa, Proposition 3.3.1(1)).
- On a geometric semiring scheme, closed subschemes correspond to quasi-coherent congruence sheaves
  (Proposition 3.3.1(2)), the kernel congruence of `𝒪_X → f_* 𝒪_Y` giving one direction; under
  §6.4 this matches §4.5.
- The quasi-coherent semimodules on `Spec A` (sheaves of `𝒪`-semimodules locally of the form `M~`)
  are equivalent to `SemimoduleCat A`, and this matches the descent definition of §2.4 on affines.

### Dependencies

§0.1, Layer 1, §2.2, §3.3, §3.4, Layer 4; Mathlib's `SheafedSpace`, `TopCat.Presheaf.stalk`,
`PrimeSpectrum`, `LocalizedModule`; §0.2's matching-family API.

---

## Downstream consumers

Positive models of moduli spaces over `ℕ`, `ℚ≥0` and `ℝ≥0` (Borger–Jun, §1), vector bundles and
line bundles over semirings, and a roadmap on cohomology of semiring schemes would build on Layers
2–6. The FunctorOfPoints roadmap can reuse §4.1 for its ring case; it supplies §5.4's
equivalence.

## Shared interfaces and scope boundaries

This roadmap owns `OpenImmersionSite` and its semiring and ring instances (§4.1).
The ring-specific FunctorOfPoints roadmap owns `LocallyRepresentableAbsolute` and
`schemeEquivAbsolute`; §5.3 proves agreement with that ring-specific interface. This
keeps the dependency one-way: the semiring-to-Mathlib comparison consumes
FunctorOfPoints, whose own construction does not depend on this roadmap.

Use the same `Type u`-valued sheaf convention as Mathlib: for
`Aff := CommSemiRingCat.{u}ᵒᵖ`, presheaves have domain `Affᵒᵖ`.
Use `Subfunctor.sheafify` for the image inside a sheaf and
`Presheaf.IsLocallySurjective` for local surjectivity of covers.

The generic representable-open comparison needs the descent hypotheses of
`OpenImmersionSite.HasDescent`, not just stability under pullback and composition.
The semiring instance supplies them using §§0.4 and 2.4. The topology comparison of
§3.3 and geometric comparison of §6.4 are proof targets; the references do not replace
their proofs. No target assumes a converse from mono-flatness to finite-limit flatness
for arbitrary commutative semirings.

## References

- B. Toën, M. Vaquié, *Au-dessous de Spec ℤ*, J. K-Theory 3 (2009), 437–500,
  [arXiv:math/0509684](https://arxiv.org/abs/math/0509684): Definitions 2.9, 2.10, 2.12, 2.15;
  Theorem 2.5; Corollary 2.11; Lemmas 2.13, 2.14; Propositions 2.16–2.18; Corollary 2.22; §3.2
  (Definition 3.2, Propositions 3.3, 3.4).
- J. Borger, J. Jun, *Facets of module theory over semirings*,
  [arXiv:2405.18645v3](https://arxiv.org/abs/2405.18645) (2025): §2 (Definition 2.3,
  Propositions 2.1, 2.4, 2.5), §3 (Theorem 3.5, Corollary 3.6), §4 (Theorem 4.1, Propositions 4.9,
  4.12), §5 (Proposition 5.1, Remarks 5.2, 5.3), §6 (Propositions 6.1–6.6), Theorem 1.4.
- I. Diklich-Zelich, *The Miracle of Flatness in Algebraic Geometry*, PhD thesis, Columbia
  University, 2026, https://www.math.columbia.edu/~ivanz/thesis.pdf: Corollary 1.1.3,
  Propositions 1.3.4, 1.3.6, Corollary 1.3.8, Theorems 1.3.9, 1.3.10, Remark 1.3.12.
- F. Marty, *Relative Zariski open objects*, [arXiv:0712.3676v3](https://arxiv.org/abs/0712.3676)
  (2009): Theorems 3.7, 3.8, 3.13.
- J. Giansiracusa, N. Giansiracusa, *Equations of tropical varieties*, Duke Math. J. 165 (2016),
  [arXiv:1308.0042](https://arxiv.org/abs/1308.0042): §2.4 (Definition 2.4.1, Propositions 2.4.4,
  2.4.6, Lemma 2.4.5), §3.1 (Remark 3.1.1, Proposition 3.1.2), §3.3 (Proposition 3.3.1,
  Remark 3.3.2). Only the general semiring material is used.
- Y. Katsov, *On flat semimodules over semirings*, Algebra Universalis 51 (2004), 287–299,
  https://doi.org/10.1007/s00012-004-1865-1 (cited in Mathlib's `Mathlib/RingTheory/Flat/Basic.lean`).
- Y. Katsov, T. G. Nam, J. Zumbrägel, *On simpleness of semirings and complete semirings*,
  [arXiv:1105.5591](https://arxiv.org/abs/1105.5591), §5.
- J. S. Golan, *Semirings and their Applications*, Kluwer, 1999: congruences, k-ideals (subtractive
  ideals), the Bourne congruence.
- M. Demazure, P. Gabriel, *Groupes algébriques I*, 1970, Chapitre I, §1: the functor-of-points
  comparison for rings followed in §6.4.

---
