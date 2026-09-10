# Roadmap: foundations of adic spaces

This roadmap develops Huber's theory of adic spaces from the underlying topological algebra to
Tate acyclicity and the gluing of adic spaces. The final application is the construction of the
adic Fargues–Fontaine curve

```text
𝒳 = 𝒴 / φ^ℤ
```

for `E = ℚ_p` and a perfectoid field `F` of characteristic `p`.

The first six layers form a general theory. They are intended to support later work on rigid
geometry, perfectoid geometry, and the geometry of the Fargues–Fontaine curve. The last layer is an
application of that theory: the adic Fargues–Fontaine curve.

## Scope

The roadmap includes the following material.

- Bounded subsets of topological rings, power-bounded elements, Huber rings, Tate rings,
  completion, weighted restricted power series, and strong noetherianness.
- The valuation spectrum `Spv A`, the auxiliary spectra `Spv(A,I)`, continuous valuations, and
  the adic spectrum `Spa(A,A⁺)`, with their spectral topologies.
- Rational subsets and rational localisation for general Huber rings, not only for Tate rings.
- The structure presheaf, its stalk valuations, the categories of pre-adic and adic spaces, and
  the sheaf condition in the category of complete separated topological rings.
- The strongly noetherian form of Tate acyclicity and the Buzzard–Verberkmoes stable-uniformity
  criterion.
- Open and closed adic subspaces, morphisms locally of finite type, and gluing.
- The adic Fargues–Fontaine curve for `E = ℚ_p`.

The roadmap does not include étale sites or étale cohomology, formal models and Raynaud generic
fibres, Berkovich spaces, general fibre products of adic spaces, completed tensor products,
separated or proper morphisms, almost or condensed methods, perfectoid spaces and tilting, or the
structure theory of the Fargues–Fontaine curve. In particular, vector bundles, the
Harder–Narasimhan formalism, `B_dR`, `B_cris`, untilts, the curve for general coefficient field
`E`, the relative curve, and the schematic curve are outside the scope.

The exclusion of fibre products is deliberate. Open and closed immersions and morphisms locally
of finite type can be developed affinoid-locally without them. Separatedness, properness, and the
diagonal formalism should be treated together with completed tensor products and fibre products in
a separate roadmap.

Ring-theoretic material belongs under `TauCeti/RingTheory/Huber/`. The valuation spectra,
structure presheaf, and adic-space definitions belong under
`TauCeti/AlgebraicGeometry/AdicSpace/`.

## Conventions and coordination with Mathlib

The following Mathlib pull requests are relevant to the first three layers.

- mathlib4#38009 defines `Spv A`, its topology, pullback, support, and the support map to
  `Spec A`.
- mathlib4#40013 defines bounded subsets of topological rings and power-bounded elements.
- mathlib4#42312 defines Huber rings and rings of definition.
- mathlib4#42314 defines continuous valuations.
- mathlib4#42315 defines an initial version of `Spa(A,A⁺)`.

The Tau Ceti API should agree with the final Mathlib API. The mathematical object `Spa(A,A⁺)` is a
subspace of `Spv A`, so its points are valuations up to equivalence. An implementation which stores
a representative valuation with a chosen value group must prove that it gives the same space before
it is used by later layers.

The following conventions apply throughout.

1. **Names.** Ring-theoretic predicates live in a `Huber` or `HuberRing` namespace. Names such as
   `IsUniform` and `IsStronglyNoetherian` are not placed in the root namespace.

2. **The plus ring is explicit.** A Huber ring may have many rings of integral elements. A theorem
   about `(A,A⁺)` therefore takes `Aplus : Subring A` explicitly. When the pair is an object of a
   category, the ring and its plus subring are bundled. There is no global typeclass selecting
   `A⁺`.

3. **Completeness includes separatedness in mathematical statements.** Wedhorn assumes that a
   complete topological group or ring is Hausdorff. Lean's `CompleteSpace` does not. Every theorem
   translated from that convention uses both `CompleteSpace` and `T2Space`, or a bundled
   `CompleteSeparated` predicate.

4. **Valuations are considered up to equivalence.** `Spv A` is built from `ValuativeRel A`.
   Statements about a representative use the canonical valuation associated to the valuative
   relation or `Valuation.Compatible`.

5. **Spectrality uses Mathlib's `SpectralSpace`.** The roadmap also introduces the reusable notion
   of a pro-constructible subset of a spectral space and proves that a pro-constructible subspace
   is spectral.

6. **Topological structure sheaves take values in complete separated rings.** Define the full
   subcategory of `TopCommRingCat` consisting of complete Hausdorff topological commutative rings.
   Prove that products and equalizers are created by the forgetful functor and remain complete and
   Hausdorff. The equalizer is closed because the codomain is Hausdorff.

Numbered references below are to Wedhorn's *Adic Spaces* unless another source is named. Huber's
papers are the primary source. Existing Lean files are sources of proofs and implementation
experience; they do not replace the mathematical specification.

## Existing Mathlib used by the roadmap

The roadmap uses the following material already present in Mathlib.

- `ValuativeRel`, its canonical value group and valuation, compatible representatives,
  localisation and quotient constructions, and valuation rings.
- Nonarchimedean topological algebra: linear and adic topologies, open subgroups, topological
  nilpotence, topological subrings and quotients, and uniform completion.
- `SpectralSpace`, `PrimeSpectrum`, product topologies, and Tychonoff compactness.
- Presheaves, stalks, `PresheafedSpace`, `CategoryTheory.GlueData`, and the existing gluing
  theory for presheafed spaces.
- `TopCommRingCat` (the category itself) and `HomologicalComplex`. ⚠ Mathlib registers **no**
  limits for `TopCommRingCat` — no `HasLimits`, products, or equalizers — so Layer 3 must build
  them from `HasLimits TopCat` and `HasLimits CommRingCat` before restricting to the complete
  Hausdorff subcategory.
- Laurent-series fields, which carry `Valued`. ⚠ `ℚ_[p]` carries `ValuativeRel` with
  `Valuation.Compatible` rather than a `Valued` instance, and `ℤ_[p]` carries neither; adapt
  rather than assume.
- Witt vectors, Frobenius, and Teichmüller lifts. ⚠ Mathlib has **no** perfectoid ring or field
  predicate — `RingTheory/Perfectoid/` is `FontaineTheta`, `Untilt` and `BDeRham`, and
  `FontaineTheta` states outright that it does not require `R` perfectoid — so the
  perfectoid-field input of Layer 6.1 is built here, as is the pseudouniformiser (Mathlib has
  only the discrete `Valuation.IsUniformizer`) and the `(p,[ϖ])`-adic completeness of `W(𝒪_F)`
  (Mathlib has only the `p`-adic `WittVector.isAdicCompleteIdealSpanP`).
- `PowerSeries.IsRestricted`, which should be compared with the adic restricted-series
  constructions rather than duplicated without coordination.

Boundedness is not treated as pre-existing Mathlib input in the roadmap: it is a named Layer-0
prerequisite, coordinated with mathlib4#40013.

---

## Layer 0: topological algebra, Huber rings, and Tate algebras

References: Wedhorn §§5–6; Huber [Hu1, Hu2]; Henkel; BGR §5.2.

### 0.1 Boundedness and power-bounded elements

For a topological commutative ring `A`, define a subset `S ⊆ A` to be bounded if, for every
neighbourhood `U` of zero, there is a neighbourhood `V` of zero such that

```text
V · S ⊆ U.
```

Coordinate this definition with mathlib4#40013. Develop the elementary calculus of bounded sets:
subsets, finite unions, products, finite sets, images under continuous linear maps, and transport
under topological-ring isomorphisms.

Define

```text
A°  = {a : the set {aⁿ | n ≥ 0} is bounded},
A°° = {a : aⁿ → 0}.
```

Prove that `A°` is a subring for **non-archimedean** commutative rings (Wedhorn Proposition 5.30 —
a neighbourhood basis of `0` by subgroups; *not* "linearly topologised", which means a basis of
open ideals and would exclude every Tate ring here, since a nonzero Tate ring has no proper open
ideal), that `A°°` is an ideal of
`A°`, and that both constructions are preserved by topological-ring isomorphisms. State separately the
hypotheses under which a continuous homomorphism sends bounded or power-bounded subsets to bounded
or power-bounded subsets; this is not asserted for an arbitrary continuous homomorphism.

### 0.2 Huber rings and Tate rings

A pair of definition of `A` consists of an open subring `A₀ ⊆ A` and a finitely generated ideal
`I ⊆ A₀` such that the subspace topology on `A₀` is the `I`-adic topology. A Huber ring is a
topological ring admitting a pair of definition. A Tate ring is a Huber ring containing a
topologically nilpotent unit.

Prove the following results.

- Wedhorn Lemma 6.2: the rings of definition are exactly the open bounded subrings whose topology
  is adic for a finitely generated ideal.
- Wedhorn Corollary 6.4: intersections and products of rings of definition are rings of
  definition, and `A°` is their union.
- Wedhorn Lemma 6.6: for a pair of definition `(A₀,I)`, an ideal of `A` is open precisely when it
  contains a sufficiently large power of `IA`, equivalently when `IA` is contained in its radical.
- Every Huber ring is nonarchimedean, `A°` is open and integrally closed in `A`, and every open
  integrally closed subring contains `A°°`.
- In a Tate ring, sufficiently high powers of a pseudouniformiser belong to every ring of
  definition, and `ϖⁿA₀` is a neighbourhood basis of zero.

A ring of integral elements is an open integrally closed subring `A⁺ ⊆ A°`. Define Huber pairs and
continuous morphisms of pairs.

### 0.3 Completion

Use Wedhorn Proposition and Definition 5.32 and Example 5.33 for completion of topological groups
and rings. Prove that the completion map

```text
A → Â
```

has dense image and kernel `closure {0}`. If `A` is Hausdorff it is a topological embedding.
Remark 6.8 supplies the Huber structure on `Â`; the Tate property is preserved. State separately
the base-change result of Proposition 6.9(1), whose proof cites [Hu1] Lemma 1.6.

Every theorem concerning a complete Huber ring from this point on includes the Hausdorff
hypothesis explicitly.

### 0.4 Weighted restricted series and topological localisation

Develop the general topological-algebra constructions required for rational localisation of a
Huber ring.

- Define Wedhorn's weighted restricted power-series ring `A⟨X₁,…,Xₙ⟩_T` of Remark and
  Definition 5.48, for a family `T = (T_i)` of subsets of `A` subject to Wedhorn's standing
  hypothesis that each `T_i · A` is open (equivalently `T_i^m U` is a neighbourhood of `0` for
  every `m` and every neighbourhood `U`) — without it neither `A[X]_T` nor `A⟨X⟩_T` is defined.
  Include its topology, functoriality, the density of polynomials (5.49), and the universal
  property for power-bounded weighted variables (5.50, which asks `A` complete and each `T_i`
  bounded).
- For a family `T = (T_i)_{i ∈ I}` of **subsets** of `A` and denominators `S = (s_i)_{i ∈ I}`
  indexed by the same `I`, define the topological localisation `A(T/S)` of Proposition and
  Definition 5.51 on the algebraic localisation in which the `s_i` are inverted. Its universal
  property is: the `s_i` become units and every fraction `t/s_i` with `t ∈ T_i` is
  power-bounded. (Numerators are indexed in bundles, not paired off one-to-one with the
  denominators; the ordinary `A⟨t₁,…,tₙ/s⟩` is the case `I` a singleton with
  `T = {t₁,…,tₙ}`.)
- Define the separated completion `A⟨T/S⟩` and prove its corresponding universal property for
  complete Hausdorff target rings.
- Prove independence of auxiliary choices and compatibility with ordinary algebraic
  localisation and completion.

The usual rational localisation `A⟨T/s⟩` is the singleton-`I` case just described. This
construction is required in Layer 6 because `A_inf` is Huber but not Tate.

### 0.5 Restricted series over Tate rings and strong noetherianness

For a complete Hausdorff Tate ring, compare the weighted construction with the usual completed restricted
power-series algebra `A⟨X₁,…,Xₙ⟩`. Develop the following results as separate milestones.

1. Restricted series with coefficients in a complete topological module, including the topology
   and the universal property.
2. Substitution and evaluation, quotient and iteration isomorphisms, and compatibility with
   completed tensoring by a finitely generated module.
3. Weierstrass division and preparation over a complete rank-one nonarchimedean field.
4. Noetherianity of `K⟨X₁,…,Xₙ⟩` for such a field `K`.
5. Stability of noetherianity under quotients and the iteration
   `A⟨X⟩⟨Y⟩ ≅ A⟨X,Y⟩`.

For an arbitrary Tate ring `A`, define `A⟨X₁,…,Xₙ⟩` using separated completion and say that `A`
is strongly noetherian if every such algebra is noetherian. For zero variables this says that the
separated completion `Â` is noetherian; if `A` is complete and Hausdorff, it says that `A` itself is
noetherian. Conclude from BGR 5.2.6 that every complete rank-one nonarchimedean field is strongly
noetherian.

### 0.6 Open mapping and strict morphisms

Formalise Wedhorn Theorem 6.16 and Propositions 6.17–6.18 using Henkel's open mapping theorem.
State Henkel's hypotheses explicitly: the base ring has a zero sequence of units, and the modules
are complete, Hausdorff, and first countable. Derive the form used later: a continuous surjective
linear map between completely metrisable modules over a complete Hausdorff Tate ring is open and induces the
quotient topology.

### Examples

Prove that a discrete ring is Huber, `ℤ_[p]` is Huber but not Tate, `ℚ_[p]` and `F⸨t⸩` are Tate,
and `ℚ_p⟨T₁,…,Tₙ⟩` is complete and strongly noetherian.

### Dependencies

Mathlib, together with the boundedness work coordinated with mathlib4#40013.

---

## Layer 1: valuation spectra and continuous valuations

References: Wedhorn §§3–4 and §7.1; Huber [Hu1].

### 1.1 The valuation spectrum

For a commutative ring `A`, define `Spv A` to be the type of valuative relations on `A`, with
basic opens

```text
Spv(A)(f/s) = {v : v(f) ≤ v(s) and v(s) ≠ 0}.
```

Develop support, pullback along ring homomorphisms, lifts through quotients and localisations, the
continuous support map

```text
supp : Spv A → Spec A,
```

and the section of `supp` given by the trivial valuation attached to a prime ideal (Wedhorn
Remark 4.6).

### 1.2 Spectrality of `Spv A`

Follow Wedhorn Proposition 4.7 and Proposition 3.31.

1. Embed `Spv A` into the product `{0,1}^{A×A}` by the order relation
   `(a,b) ↦ [v(a) ≤ v(b)]`.
2. Express the valuation axioms as closed conditions and identify the image as a closed subspace.
3. Use Tychonoff's theorem to prove compactness of the constructible topology.
4. Prove that the basic opens are clopen in that topology and generate the spectral topology.
5. Prove the `T0` property.
6. Formalise the reusable topological criterion of Wedhorn Proposition 3.31 and deduce
   `SpectralSpace (Spv A)`.

This replaces an analogy with `PrimeSpectrum` by the actual proof used for valuation spectra.

### 1.3 Pro-constructible subspaces

Define a subset of a spectral space to be pro-constructible if it is closed in the constructible
or patch topology. Prove the standard calculus: intersections, inverse images under spectral maps,
and products. Prove that a pro-constructible subspace of a spectral space is spectral.

This is a reusable topology development and is a prerequisite for the spectrality of `Spa`.

### 1.4 The spaces `Spv(A,I)`

Let `A` be an f-adic ring and `I ⊆ A` an ideal admitting a finitely generated `J` with
`√I = √J` — Wedhorn's standing hypotheses for §7.1, both load-bearing (his proof of Lemma 7.5
opens by reducing to `I` finitely generated). For a valuation `v`, develop the cofinality theory
of Wedhorn Lemmas 7.1–7.2, the convex subgroup `cΓ_v(I)` of Definition 7.3, and Lemma 7.4.

Define

```text
Spv(A,I) = {v ∈ Spv A : cΓ_v(I) = Γ_v}
```

as in §7.1.1, and construct the retraction

```text
r_I : Spv A → Spv(A,I).
```

of §7.1.2. Prove Lemma 7.5: `Spv(A,I)` is spectral. Record Remark 7.6 explicitly: the inclusion
`Spv(A,I) → Spv A` is not spectral in general, so later proofs must not obtain spectrality merely
by regarding it as a subspace of `Spv A`.

### 1.5 Continuous valuations

For a Huber ring with pair of definition `(A₀,I)`, define `Cont A` as the points represented by
continuous valuations. Prove Theorem 7.10:

```text
Cont A = {v ∈ Spv(A,IA) : v(a) < 1 for every a ∈ I}.
```

Prove Corollary 7.12: `Cont A` is closed in `Spv(A,IA)`, hence spectral. Show that this space is
independent of the chosen pair of definition. Develop vertical and horizontal specialisation only
as needed for this theorem and for the stalk valuations in Layer 3.

### Dependencies

Layer 0 and Mathlib's valuative-relation API.

---

## Layer 2: affinoid spectra and rational subsets

References: Wedhorn §7.2–§7.7; Huber [Hu1] §3.

### 2.1 Huber pairs and `Spa`

For a Huber pair `(A,A⁺)`, define

```text
Spa(A,A⁺) = {v ∈ Cont A : v(a) ≤ 1 for every a ∈ A⁺}
```

with the subspace topology. Prove Theorem 7.35 by showing that `Spa(A,A⁺)` is
pro-constructible in `Spv(A,IA)` for an ideal of definition `I`, and hence spectral.

A morphism of Huber pairs induces the contravariant continuous map on adic spectra. State the exact
hypotheses under which this map is spectral.

### 2.2 Rational subsets

For a finite set `T ⊆ A` and `s ∈ A`, define

```text
R(T/s) = {v ∈ Spa(A,A⁺) : v(t) ≤ v(s) ≠ 0 for every t ∈ T},
```

under the condition that the ideal `TA` is open. One may replace `T` by `T ∪ {s}`.

Prove the five parts of Remark 7.30 — including part (5), finite intersections of rational subsets,
which Theorem 7.35's own proof consumes — using Lemma 6.6 for the open-ideal criterion. In a Tate ring,
`TA` is open precisely when `T` generates the unit ideal; this does not imply that one element of
`T` is a unit. Prove that rational subsets form a basis of quasi-compact opens and are closed under
finite intersections.

Add the following useful results.

- Proposition 7.34: over a complete Hausdorff affinoid ring, rational subsets are unchanged by
  sufficiently small perturbations of their defining functions.
- Corollary 7.53: if `T` is a finite subset of a complete Hausdorff affinoid ring, then `T`
  generates the unit ideal if and only if the standard family

  ```text
  (R(T/t))_{t ∈ T}
  ```

  covers `Spa(A,A⁺)`.
- Proposition 8.2(2): a rational subset of a rational subset is rational in the original affinoid
  spectrum.
- Lemma 7.54: for complete `A`, every open cover — in particular every finite rational cover —
  has a standard rational refinement. This result uses [Hu2] Lemma 2.6 (Wedhorn cites it under
  his own key `[Hu3]`; see the References note on the two keying schemes) and is kept distinct
  from iterated localisation.

### 2.3 The plus ring, emptiness, and analytic points

Prove Proposition 7.52(1), with no completeness hypothesis:

```text
A⁺ = {a ∈ A : v(a) ≤ 1 for every v ∈ Spa(A,A⁺)}.
```

State Proposition 7.52(2), the complete-case unit criterion, separately.

Prove Proposition 7.49(1):

```text
Spa(A,A⁺) = ∅  ↔  A / closure{0} = 0.
```

For a Hausdorff Huber ring this reduces to `Spa(A,A⁺)=∅ ↔ A=0`. Do not state the latter under
`CompleteSpace` alone.

Define a point to be analytic when its support is not open (Definition 7.39), and define the
analytic locus `Spa(A,A⁺)^a`. Prove Proposition 7.49(2), including the criterion for this locus to
be empty; Remark 7.50 gives a second proof that a complete affinoid with empty analytic locus is
discrete, while the behaviour under passage to the separated quotient is 7.49(2)(iii). Prove that the
analytic locus is open and is covered by rational subsets whose coordinate rings are Tate. In
particular, every point of a Tate affinoid is analytic, while a general Huber affinoid may have
non-analytic points.

### 2.4 Quotients and classical affinoids

For an ideal `J ⊆ A`, define the quotient Huber pair and prove Proposition 7.38: its adic spectrum
is a closed subspace of `Spa(A,A⁺)`, with the expected universal property.

Define affinoid algebras over a complete rank-one nonarchimedean field as in Definition 7.56.
Construct closed polydiscs from `K⟨T₁,…,Tₙ⟩` with plus ring `A°`, and describe the elementary
points and rational subdomains of the closed unit disc (Example 7.57 and the examples following
it).

### Dependencies

Layers 0 and 1.

---

## Layer 3: rational localisation and the structure presheaf

References: Wedhorn §5.6 (where 5.48–5.51 live; §5.5 is the topology defined by a valuation) and
§§8.1–8.2; Huber [Hu1, Hu2].

### 3.1 Rational localisation of a Huber pair

Let `U=R(T/s) ⊆ Spa(A,A⁺)`. Define its complete topological coordinate ring using Layer 0:

```text
A_U = A⟨T/s⟩.
```

The public universal property is the topological one: `s` is invertible and every `t/s` is
power-bounded; every continuous map from `A` to a complete Hausdorff Huber ring with these
properties factors uniquely through `A_U`.

Define

```text
A_U⁺
```

as the integral closure in `A_U` of the image of the subring generated by `A⁺` and the fractions
`t/s`. Prove that `(A_U,A_U⁺)` is a Huber pair and that its adic spectrum is naturally homeomorphic
to `U`, with its valuations and rational subsets identified.

A rational subset has many presentations. Construct the canonical isomorphism between the
localisations associated with two presentations of the same subset, prove compatibility for three
presentations, and construct restriction maps satisfying the identity and composition laws.

### 3.2 Complete separated topological rings

Define `CompleteSeparatedTopCommRingCat` as the full subcategory of `TopCommRingCat` on complete
Hausdorff objects. Construct products and equalizers and prove that the forgetful functor creates
them. The equalizer is a closed subring, hence complete; this is where separatedness of the codomain
is used.

### 3.3 The structure presheaf

On the rational basis of `X=Spa(A,A⁺)`, define

```text
𝒪_X(U) = A_U.
```

Extend it to all open subsets by the limit over rational subsets contained in the open. The values
lie in `CompleteSeparatedTopCommRingCat`, and the two definitions agree on rational subsets.

Define

```text
𝒪_X⁺(U) = {f ∈ 𝒪_X(U) : v_x(f_x) ≤ 1 for every x ∈ U}.
```

Stalks are colimits in rings; no topology on a stalk is used. Prove that every stalk is a local
ring, that the support of the point valuation is its maximal ideal, and that the valuation
therefore factors through the residue field.

### 3.4 Pre-adic spaces

Define Wedhorn's category `𝒱^pre`. An object consists of a topological space, a presheaf of complete
separated topological rings, local stalks, and an equivalence class of valuations on each residue
field. A morphism consists of a continuous map, a morphism of presheaves, local homomorphisms on
stalks, and compatibility with the residue-field valuations.

Define affinoid pre-adic spaces and pre-adic spaces, including the condition that the presheaf is
adapted to the affinoid basis. Let `𝒱` be the full subcategory in which the structure presheaf is a
sheaf in `CompleteSeparatedTopCommRingCat`.

Keep the following notions distinct.

- `Huber.IsSheafyPair A Aplus`: the chosen pair has a sheaf structure presheaf.
- `Huber.IsSheafyRing A`: Wedhorn Definition 8.26, quantified over rings of integral elements of
  the completion.
- `Huber.IsStablySheafyRing A`: every topologically finite-type algebra over the completion is
  sheafy.

Prove their precise implications and invariance under completion and isomorphism.

### 3.5 Sheaf criteria on the rational basis

Prove that `𝒪_X(X) ≅ A` as a topological ring for a complete Hausdorff pair. Prove the basis sheaf
criterion in the target category:

- rational subsets form a basis closed under finite intersections;
- rational subsets are quasi-compact;
- every cover of a rational subset admits a finite rational refinement;
- the sheaf condition on this basis is equivalent to the sheaf condition on all opens;
- the equalizer topology is the subspace topology inherited from the product.

### Dependencies

Layers 0 and 2, together with Mathlib's presheaf and category-theory libraries.

---

## Layer 4: sheafiness and Tate acyclicity

References: Wedhorn §8.2, especially Theorem 8.28; Huber [Hu2, Hu3]; Tate; Buzzard–Verberkmoes;
Hansen–Kedlaya.

### 4.1 Strongly noetherian Tate rings

First let `A` be a complete Hausdorff strongly noetherian Tate ring and let `A⁺` be a ring of
integral elements. Prove the algebraic part of Wedhorn's argument in the following order.

1. Remark 8.29: for every finitely generated `A`-module `M`, construct the natural isomorphism

   ```text
   M ⊗_A A⟨X⟩ ≅ M⟨X⟩.
   ```

2. Lemma 8.31: prove that `A⟨X⟩` is faithfully flat over `A`, and that the quotients

   ```text
   A⟨X⟩/(f-X),      A⟨X⟩/(1-fX)
   ```

   are flat in the cases used for Laurent rational subsets.

3. Proposition 8.30: prove that restriction maps between rational localisations are flat. Use
   Remark 7.55 for the required chain of rational subsets.

4. Corollary 8.32: obtain the faithful-flatness and injectivity statements for rational covers.

5. Lemma 8.33: prove exactness for a two-piece Laurent cover.

6. Use Lemma 7.54 to refine to a standard rational cover and Lemma 8.34 to pass from the Laurent
   case to an arbitrary finite rational cover.

Do not replace this chain by an application of noetherian adic-completion flatness: a nonzero Tate
ring has no proper open ideal, and rational localisation is not the adic completion of `A[1/s]`.

Prove the additional topological statements separately. The rings and modules in the argument are
complete, Hausdorff, and metrisable; use Layer 0's open mapping theorem to show that the relevant
images are closed and that the algebraic quotient topology agrees with the topology on the target.

Conclude for complete Hausdorff `A`:

- `Huber.IsSheafyPair A Aplus`;
- exactness in every degree of the augmented Čech complex for every finite rational cover of a
  rational subset.

Then prove that completion preserves strong noetherianness and identifies rational localisations
and structure presheaves. Use this comparison to deduce Wedhorn Theorem 8.28(b) for an arbitrary
strongly noetherian Tate ring, and Corollary 8.35: every strongly noetherian Tate ring is stably
sheafy.

The all-degrees Čech statement is the form used later. Wedhorn's Theorem 8.28 also states
sheaf-cohomology vanishing; this roadmap does not identify Čech acyclicity with that statement
without a separate comparison theorem.

### 4.2 Stably uniform Tate rings

Use Hansen–Kedlaya Definition 2.3 for uniformity (`A°` bounded) and Definition 3.13 for stable
uniformity. A complete Hausdorff Tate pair is stably uniform when every rational localisation is
uniform.

Formalise the precise Buzzard–Verberkmoes theorem: if every affinoid rational subspace of
`Spa(A,A⁺)` is uniform, then the structure presheaf is a sheaf. State this first at pair level and
then derive any ring-level formulation. No noetherian hypothesis is used.

### Examples

Recover Tate's acyclicity theorem for standard Laurent covers of the closed `p`-adic unit disc.
Prove that `K⟨X,Q⟩/(Q²)` is strongly noetherian and sheafy, but not uniform.

### Dependencies

Layers 0 and 3.

---

## Layer 5: adic spaces and elementary geometry

References: Wedhorn §§8.2–8.3; Huber [Hu2].

An affinoid adic space is an object of `𝒱` isomorphic to the pre-adic spectrum of a sheafy Huber
pair. An adic space is an object of `𝒱` admitting an open cover by affinoid adic spaces. The local
identifications are isomorphisms in `𝒱`, not merely homeomorphisms.

### 5.1 Open and closed subspaces

Define open immersions and open adic subspaces. Prove that restriction to an open subset preserves
the adic-space structure and that rational subsets are open affinoid subspaces.

Define closed immersions affinoid-locally using quotient Huber pairs from Proposition 7.38, for a
**closed** ideal `J` with `A/J` sheafy — 7.38 itself holds for arbitrary `J`, but the quotient
affinoid of 7.22 need be neither Hausdorff nor sheafy, and this layer works in `𝒱`. Prove
independence of the chosen affinoid cover and the expected factorisation property.

### 5.2 Morphisms locally of finite type

Define a morphism of affinoid adic spaces to be topologically of finite type when the corresponding
map of complete Hausdorff Huber rings presents the target as a quotient of a **weighted** restricted
power-series algebra `A⟨X₁,…,Xₙ⟩_T` (§0.4) — not the Tate-only `A⟨X₁,…,Xₙ⟩`, since Layer 6's `A_inf`
is Huber and not Tate — by a **quotient mapping** in Wedhorn's sense (§8.5): surjective, continuous
and open, with the plus ring of the target the integral closure of the image of the source's. Define locally finite-type morphisms by affinoid covers, and prove independence under
rational localisation and refinement.

Separated and proper morphisms are not defined in this roadmap because their natural definitions
use fibre products and diagonals.

### 5.3 Gluing

Use Mathlib's `CategoryTheory.GlueData` and the existing gluing of presheafed spaces. Add the data
specific to adic spaces: local ring structures on stalks, residue-field valuations, their
compatibility on overlaps, and the proof that the glued object is locally affinoid. Prove the
universal property of the glued adic space.

### 5.4 Examples

Construct:

- `Spa(K,K°)` for a complete rank-one nonarchimedean field;
- the closed unit disc and closed polydiscs;
- the open unit disc as the union of the rational closed discs

  ```text
  {v : v(Tⁿ) ≤ v(p)},    n ≥ 1,
  ```

  with coordinate rings `ℚ_p⟨T,Tⁿ/p⟩`.

Prove that the open unit disc is not affinoid because it is not quasi-compact, while every affinoid
adic spectrum is quasi-compact.

### Dependencies

Layers 3 and 4.

---

## Layer 6: the adic Fargues–Fontaine curve

References: Fargues–Fontaine; Kedlaya; Scholze–Weinstein.

Let `F` be a complete rank-one nonarchimedean perfect field of characteristic `p`, equipped with a
pseudouniformiser `ϖ`. No algebraic-closedness hypothesis is imposed.

### 6.1 Perfectoid-field input and `A_inf`

Package the following data and results:

- perfection and completeness of `F` and `𝒪_F`;
- a pseudouniformiser `ϖ` with `0<|ϖ|<1`;
- Witt vectors `W(𝒪_F)`, Frobenius, and Teichmüller lifts;
- completeness and separatedness of the `(p,[ϖ])`-adic topology.

Define

```text
A_inf = W(𝒪_F)
```

with pair of definition `(A_inf,(p,[ϖ]))` and plus ring `A_inf`. Prove that it is a complete
Hausdorff Huber ring and that it has no topologically nilpotent unit, hence is not Tate. Its rational
localisations therefore use Layer 0's general topological localisation, not the Tate-only
construction.

Define

```text
𝒴 = {v ∈ Spa(A_inf,A_inf) : v(p[ϖ]) ≠ 0}
   = D(p) ∩ D([ϖ]).
```

Prove that `𝒴` is open, nonempty, and stable under Witt Frobenius. Construct an explicit Gauss
point. By the analytic-point theory of Layer 2, the analytic locus of `Spa(A_inf,A_inf)` is
`D(p) ∪ D([ϖ])`; it is not equal to `𝒴`.

### 6.2 Power comparison and Frobenius windows

For every `v ∈ 𝒴`, prove that `v(p)` and `v([ϖ])` are power-comparable. For all positive `a` there
is a positive `b` such that

```text
v([ϖ])^b ≤ v(p)^a,
```

and conversely. Derive this directly from continuity for the `(p,[ϖ])`-adic topology.

Let `φ` act on valuations by precomposition with Witt Frobenius. Define radius inequalities without
assigning a real number to a higher-rank valuation: for positive integers `a,b`, interpret

```text
κ(v) ≥ a/b
```

as `v([ϖ])^b ≤ v(p)^a`, and define the reverse inequality similarly. Prove

```text
κ(φ(v)) = p κ(v)
```

in this order-theoretic sense.

Kedlaya's windows (AWS notes, Remark 3.1.9) take an arbitrary breakpoint `c ∈ (1,p) ∩ ℚ`; this
roadmap fixes `c = (p+1)/2`, which lies in that range for every prime. The choice is ours, and
nothing below depends on it beyond `1 < c < p`. For every integer `n`, define

```text
U_n = {v ∈ 𝒴 : p^n ≤ κ(v) ≤ c p^n},
V_n = {v ∈ 𝒴 : c p^n ≤ κ(v) ≤ p^(n+1)}.
```

Clear positive denominators to express each condition as a rational inequality. Prove that these
are rational subsets, that they cover `𝒴`, that Frobenius shifts the index, and that different
translates in one family are disjoint. Deduce that the `ℤ`-action is free and each window is
wandering.

Define the quotient topological space

```text
𝒳 = 𝒴 / φ^ℤ.
```

Prove that the quotient map is open, injective on each wandering window, and that the images of
`U_0` and `V_0` cover `𝒳`. Conclude that `𝒳` is quasi-compact and `T0`. Quasi-compactness does not
make `𝒳` affinoid; non-affinoidness is a separate statement and is not claimed here.

### 6.3 Interval rings

For a closed interval `I=[s,r] ⊂ (0,∞)`, define Kedlaya's interval ring `B^I` and the norm

```text
λ_I = max(λ_s,λ_r).
```

Prove separately that:

- `B^I` is a complete Hausdorff Tate ring;
- `B^I` (Kedlaya's `B^I_{L,E}`, with the coefficient field fixed to `E = ℚ_p` throughout) is
  strongly noetherian, by Kedlaya's Theorem 4.10 — whose hypotheses are that `L` is perfect,
  complete and nonarchimedean, which is why algebraic closedness is not needed. Note his Remarks
  4.12/4.14: the endpoint cases `I = [0,r]` and `[r,∞]` are not known to be strongly noetherian,
  which is why `I` is restricted to closed intervals inside `(0,∞)` above;
- the unit ball `B^{I,+}` equals the power-bounded subring and is a ring of integral elements;
- `B^{I,+}` agrees with the integral closure of the image of the appropriate localised
  `A_inf` plus ring;
- the rational window and interval parameters are related by the reciprocal radius dictionary:
  with `|ϖ| = p^(−α)` and `r = −log_p ρ` one computes `κ = α/r`, so a `κ`-window `[a, b]`
  corresponds to `ρ ∈ [|ϖ|^(1/a), |ϖ|^(1/b)]`. The conversion is a lemma to be proved, not a
  notational convention, and the endpoint completions are Banach rings — no theorem that they are
  fields is cited or used.

Do not assert that the endpoint completions are fields unless that theorem is proved separately.
Layer 4 implies that every `Spa(B^I,B^{I,+})` is sheafy.

### 6.4 The quotient sheaf and affinoid charts

For an open `U ⊆ 𝒳`, define

```text
𝒪_𝒳(U) = 𝒪_𝒴(q⁻¹U)^{φ=1}.
```

Prove that this is a sheaf of complete separated topological rings and that the valuations on the
stalks are independent of the representative of an orbit.

For a wandering window `W`, prove in this order:

1. `q⁻¹(q(W))` is the disjoint union of the translates `φⁿ(W)`;
2. `q|_W` is a homeomorphism from `W` to the open subset `q(W)`;
3. `W`, with its restricted pre-adic structure, is isomorphic to
   `Spa(B^I,B^{I,+})` as an affinoid pre-adic space;
4. for every open `V ⊆ W`, restriction gives a topological-ring isomorphism

   ```text
   𝒪_𝒳(q(V)) ≅ 𝒪_𝒴(V);
   ```

5. these isomorphisms commute with restrictions and identify plus subrings and residue-field
   valuations.

All five statements are needed for an isomorphism in `𝒱^pre`: statements 1–4 give a homeomorphism
and a family of ring isomorphisms, and it is statement 5 — naturality together with compatibility of
the residue-field valuations — that makes the data a morphism in `𝒱^pre` at all. Layer 4 supplies
sheafiness of the interval ring and upgrades the result to an isomorphism in `𝒱`. Since the images
of the windows cover `𝒳`, the quotient is an adic space; note that the sheaf property on `𝒳`
descends from the window charts, not from Layer 4 applied to `𝒴` directly, since `A_inf` is not
Tate. Kedlaya's Theorem 4.10 also makes every `B^I⟨T₁,…,T_k⟩` noetherian, so the chart rings are
stably sheafy; that is retained as a supporting theorem — it feeds Wedhorn Remark 8.27 and the
successor roadmap — and not as an alternative construction of the charts, since by itself it
produces neither the morphism of pre-adic spaces nor the identification of the quotient presheaf
with the affinoid structure sheaf.

Finally, prove independence of the pseudouniformiser. Show that `(p,[ϖ])` and `(p,[ϖ'])` define the
same topology, identify the two opens `𝒴` and their Frobenius actions, and construct an isomorphism
of the quotient adic spaces.

### Dependencies

The construction of `A_inf`, `𝒴`, and the windows uses Layers 0–2. The structure presheaf uses
Layer 3, sheafiness of the interval charts uses Layer 4, and the final local-to-global assertion
uses Layer 5.

---

## Dependency graph

The reusable foundations are ordered as follows.

```text
Layer 0 → Layer 1 → Layer 2 → Layer 3 → Layer 4 → Layer 5.
```

Layer 6 has an initial topological part using Layers 0–2 and a final adic-space part using
Layers 3–5.

## Acceptance examples

The following examples should be proved alongside the general theory.

- The support map `Spv A → Spec A` has the trivial-valuation section.
- `Spv(A,I)`, `Cont A`, and `Spa(A,A⁺)` are spectral by the stated proofs, not by an invalid
  spectral-subspace argument.
- `Spa(A,A⁺)` is empty precisely when `A/closure{0}=0`.
- Closed quotient pairs give closed affinoid subspaces.
- The closed and open unit discs are adic spaces, and the open disc is not affinoid.
- The standard Laurent cover of the closed disc has exact augmented Čech complex.
- `K⟨X,Q⟩/(Q²)` is sheafy and non-uniform.
- `𝒴` is nonempty, the two window images cover `𝒳`, and each window image is an affinoid
  `Spa(B^I,B^{I,+})`.

## References

- R. Huber, *Continuous valuations*, Math. Z. 212 (1993), 455–477 — [Hu1].
- R. Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217
  (1994), 513–551 — [Hu2].
- R. Huber, *Étale cohomology of rigid analytic varieties and adic spaces*, Vieweg 1996 —
  [Hu3] (background; its étale theory is out of scope).

⚠ **Two keying schemes.** These keys are this roadmap's own and are shifted by one against
Wedhorn's bibliography, where *Continuous valuations* is `[Hu2]`, *A generalization of formal
schemes…* is `[Hu3]`, and the étale book is `[Hu4]`. When transcribing a citation out of Wedhorn,
re-map it: his `[Hu2]` is our `[Hu1]`, his `[Hu3]` is our `[Hu2]`.

- T. Wedhorn, *Adic Spaces*, arXiv:1910.05934, **v1 — the only version**. Every numbered
  reference in this roadmap is to that version's numbering.
- J. Tate, *Rigid analytic spaces*, Invent. Math. 12 (1971), 257–289.
- K. Buzzard and A. Verberkmoes, *Stably uniform affinoids are sheafy*, J. reine angew.
  Math. 740 (2018), 25–39 — [BV].
- D. Hansen and K. Kedlaya, *Sheafiness criteria for Huber rings*, version dated **6 August
  2026**, `https://kskedlaya.org/papers/criteria.pdf` — [HK]. This is a living preprint served
  from the author's page with no version history, so cite it by date and re-check that date when
  relying on it.
- K. Kedlaya, *Noetherian properties of Fargues–Fontaine curves*, IMRN 2016, no. 8,
  2544–2567; arXiv:1410.5160.
- L. Fargues and J.-M. Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge
  p-adique*, Astérisque 406 (2018).
- P. Scholze and J. Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics
  Studies 207 (2020).
- L. Henkel, *An Open Mapping Theorem for rings which have a zero sequence of units*,
  arXiv:1407.5647.
- S. Bosch, U. Güntzer, and R. Remmert, *Non-Archimedean Analysis*, Grundlehren 261 (1984).
- K. Buzzard, J. Commelin, and P. Massot, *Formalising perfectoid spaces*,
  arXiv:1910.12320.

## Existing Lean work

The principal source of existing code is AINTLIB (`github.com/CBirkbeck/AINTLIB`, Apache-2.0),
branch `dev/adic-spaces`, project `projects/AdicSpaces/`. For reproducibility, the previous roadmap
audit used commit `59bbbe8ba14a` (2026-07-28); the branch had advanced to
`37bbdaeb9ad9e3bc9f0d660feadc2779e455a91c` on 5 August 2026. Before migration, repin the branch and
repeat both the direct-`sorry` count and the transitive `#print axioms` audit.

The status table deliberately distinguishes a declaration with no direct `sorry` from a theorem
whose dependency cone is axiom-clean. Direct counts are file-level grep counts: they over-count,
because comments match, and they see no cross-file dependence, which is exactly why they are
recorded separately from the transitive audit — a `#print axioms` gate on the actual capstones in
TauCeti CI. At the audited pin `59bbbe8ba14a` those counts were: `Spv` spectrality 36; `Cont` 2;
presheaf and `𝒱^pre` substrate 49 + 38; everything else in the table 0. They are stale for the
current branch head and must be regenerated at the repin rather than carried over.

| Result | Existing source | Direct status at the audited pin | Transitive status | Roadmap status |
|---|---|---|---|---|
| Boundedness and power-bounded elements | `Bounded.lean` | no direct `sorry` | audit required | coordinate with mathlib4#40013 |
| Huber and Tate rings | `HuberRings.lean`, `OpenIdeals.lean`, `PseudoUniformizer.lean` | no direct `sorry` | audit required | align with mathlib4#42312 |
| Weighted series and topological localisation | restricted-series and localisation files | mixed | audit required | incomplete |
| Strong noetherianness | `RestrictedPowerSeries.lean`, `TateAlgebra*.lean` | no direct `sorry` in principal definitions | audit required | needs decomposition by §0.5 |
| Open mapping theorem | `BanachOMT.lean`, `OpenMapping.lean` | contains direct `sorry` | incomplete | incomplete |
| `Spv`, support, and functoriality | `ValuationSpectrum.lean` | no direct `sorry` | audit required | align with mathlib4#38009 |
| Spectrality of `Spv` | `SpvAITopology.lean` | contains many direct `sorry`s | incomplete | incomplete |
| `Spv(A,I)` and continuous valuations | convexity and `ContinuousValuations.lean` files | contains direct `sorry` | incomplete | incomplete |
| `Spa` and rational subsets | `AffinoidRings.lean`, `AdicSpectrum.lean`, `RationalSubsets.lean` | no direct `sorry` in main definitions | audit required | align with mathlib4#42315 |
| Rational localisation and structure presheaf | `Presheaf.lean`, `StructureSheaf.lean`, localisation files | contains direct `sorry` | incomplete | incomplete |
| Strongly noetherian sheafiness | `Wedhorn828.lean`, `WedhornCechAcyclicity.lean`, and their dependencies | contains direct `sorry` | incomplete | incomplete |
| All-degree Čech acyclicity | no complete source | — | — | new |
| Buzzard–Verberkmoes theorem | no complete source | — | — | new |
| Adic-space gluing and open disc | partial adic-space files | incomplete | incomplete | not yet assembled |
| Fargues–Fontaine topology and windows | `YSpace.lean`, `Curve.lean`, Frobenius files | no direct `sorry` in the exported theorems | inherits earlier layers | implemented modulo dependencies |
| Interval rings | interval-ring files, `StronglyNoetherianB.lean`, `SheafyBI.lean` | no direct `sorry` in the exported theorems | inherits earlier layers | implemented modulo dependencies |
| Local chart isomorphism in `𝒱^pre` | no complete source | — | — | new |

The AINTLIB `ScottishBook/` directory, almost-mathematics files, general perfectoid-space files, and
other material outside the scope above are not migration sources for this roadmap.

Vendored inputs, both under AINTLIB's Apache-2.0 licence: `Vendored/Coram*` — William Coram's
restricted-power-series and Gauss-norm work, whose Mathlib face is `PowerSeries.IsRestricted`
(a *normed* condition, `‖coeff‖·cⁱ → 0`, genuinely different from an adic one, and refactored
upstream after this roadmap's pin) — and `Vendored/XiaMvPowerSeriesEquiv.lean`, Bingyu Xia's
`MvPowerSeries.map` lemmas and equivalence zoo, culminating in the power-series Fubini
isomorphism `MvPowerSeries.finSuccEquiv` that the unit-disc sheafiness argument consumes. The
latter was vendored from `WilliamCoram/PhD` pending its own upstream pull request, which is
mathlib4#36507; Mathlib has `finSuccEquiv` for `MvPolynomial` but not yet for `MvPowerSeries`.
Compare both with current Mathlib at migration and coordinate rather than porting blindly.
