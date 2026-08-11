# Roadmap: class field theory

## Scope

This roadmap owns finite-group Tate cohomology and class formations, local class field theory,
and global class field theory for number fields. It begins with the all-integer Tate carrier,
restriction, corestriction, inflation, cup products, periodicity, the Herbrand quotient, and
Tate–Nakayama. It then builds local invariant maps, local reciprocity and duality, the global
Artin map and reciprocity law, norm and existence theorems, class fields, the global class
formation, the sum of local invariants, and Hilbert reciprocity.

The ownership boundary is strict:

- `ProfiniteCohomology` owns continuous cohomology of profinite groups, its explicit low-degree
  models, continuous cups, change-of-group maps, Kummer theory, and the finite-quotient colimit;
- `LocalFieldsRamification` owns valuations, unit and ramification filtrations, arithmetic
  Frobenius, conductors that are purely ramification-theoretic, and the tame quotient;
- `GlobalNumberFields` owns places, mixed weak approximation, moduli, ray and narrow class
  groups, adeles, ideles, Hecke-character carriers, infinity types, number-field orders, `Pic`,
  and `NarrowPic`;
- `NumberFieldArithmetic` owns finite-place Frobenius and the ideal-theoretic Artin map
  `artinHomAway` on `idealsAway`;
- `GlobalQuadraticForms` owns Hasse–Minkowski and the global classification of quadratic
  forms;
- `QuadraticFormInvariants` owns the norm-equation and quaternion presentations of local
  Hilbert symbols and proves that they agree with the cohomological symbol exported here.

Consequently this roadmap defines no modulus, ray-class carrier, idele carrier, Hecke
character, order, Picard group, local quadratic-form invariant, or global quadratic form. It has
no dependency on `QuadraticFormInvariants` or on pro-`p` group theory. The Hilbert pairing is
defined here from Kummer classes, the continuous cup product, and the local invariant map; the
product formula is proved cohomologically. This fixes the dependency direction
`ClassFieldTheory → QuadraticFormInvariants`, never the reverse.

Suggested home: `TauCeti/NumberTheory/ClassFieldTheory/`, split into `Tate/`,
`ClassFormation/`, `Local/`, `Global/`, `Reciprocity/`, and `ClassFields/`.

## Normative dependencies and frozen exports

The only roadmap dependencies are:

```text
ProfiniteCohomology
LocalFieldsRamification
GlobalNumberFields
NumberFieldArithmetic
```

The following exact names are part of the downstream contract. In particular,
`LocalGaloisGroups` consumes the complete local-cohomological row without constructing private
stand-ins.

| Contract | Exact declarations |
|---|---|
| continuous local coefficients | `GalRep`, `H`, `muNRep`, `kummerClass`, `kummerEquiv_mixed` |
| Kummer transport and local Brauer group | `absoluteGaloisGroupComparison`, `muNRepCoeffDictionary`, `Br`, `invMap`, `brRes`, `brCor` |
| local invariant and Hilbert pairing | `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing`, `localSymbol` |
| local duality and Euler characteristic | `tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_finrank_fp` |
| local reciprocity and normalization | `normResidue`, `normResidue_uniformizer`, `artinMap`, `unramifiedCoordinate`, `cyclotomicCharacter_artinMap`, `cyclotomicCharacter_artinMap_padic` |
| local conductors | `conductorExponent`, `conductorIdeal`, `characterConductorExp` |
| finite Tate theory | `tateH`, `tateMap`, `ordinaryToTate`, `tateRes`, `tateCor`, `tateInfl`, `tateCup`, `tatePeriodicity`, `herbrandQuotient` |
| class formations | `FiniteClassFormation`, `tateCupSigma`, `tateNakayama`, `tateNakayama_top` |
| completion and ideal Artin adapters | `localArtinAt`, `unramifiedCoordinate_localArtinAt`, `abelianArtinHomAway` |
| global norm and Hilbert reciprocity | `cyclicHasseNorm`, `hilbertProductFormula` |
| ring class field | `ringClassField`, `gal_ringClassField_equiv_pic` |

`cyclicHasseNorm` and `hilbertProductFormula` are frozen public names. Their statements use the
global and local carriers above; neither may be replaced with a proposition-valued interface
whose hypotheses simply assume the conclusion.

## How to read the milestones

`README.md` is normative. `Suggested.lean` pins representative names and signatures, while
`PROVENANCE.md` records dated implementation and migration information. Prerequisite labels are:

- `M`: a declaration in Mathlib at the repository pin;
- `PC`: an exact export of `ProfiniteCohomology`;
- `LFR`: an exact export of `LocalFieldsRamification`;
- `GNF`: an exact export of `GlobalNumberFields`;
- `NFA`: an exact export of `NumberFieldArithmetic`;
- `L<n>`: an earlier layer of this roadmap.

No milestone depends on an open branch, a future Mathlib release, or an external repository.
Finite-group Tate cohomology and continuous profinite cohomology are distinct carriers connected
by named comparison maps; ordinary and Tate cup products likewise agree through a named theorem,
not by convention.

## Pinned conventions

- Local and global Artin maps use **arithmetic Frobenius**. At an unramified local extension,
  `Art_K(π) = Frob`, and the unramified coordinate sends it to `1 ∈ ℤ̂`.
- For `K/ℚ_p` finite and a unit `u`,
  `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`. Omitting the field norm is ill-typed away from `ℚ_p`.
- The local invariant map sends the fundamental class of a degree-`n` extension to `1/n` in
  `ℚ/ℤ`. Restriction multiplies invariants by the degree; corestriction preserves them.
- A `FiniteClassFormation` records `Nat.card H` as the order of `Ĥ²(H,M)`, not the index
  `[G:H]`. The trivial subgroup is the immediate counterexample to the index formulation.
- `tateH M r` is defined for every `r : ℤ`. Inflation is restricted to positive degrees; Tate
  degree zero is a quotient by the norm and does not admit the naive inflation map.
- The global Artin map is compiled from local maps and agrees with
  `NumberFieldArithmetic.artinHomAway`; there is one ideal-theoretic Artin map in the portfolio.
- A modulus's infinite part consists of real places. The modulus, ray subgroup and ray-class
  group are imported from `GlobalNumberFields`, never redefined here.

## The build, in layers

### Layer 0: Tate cohomology in every integer degree

Construct `tateH M r` for a finite group `G`, a representation `M : Rep ℤ G`, and every integer
`r`. In nonnegative degree it agrees with ordinary group cohomology; in negative degree,
`Ĥ^{-n-1}(G,M) ≃ H_n(G,M)` for `n ≥ 1`, including the Schur-multiplier instance at degree `-3`.

The API includes:

- coefficient functoriality `tateMap`, with identity and composition laws;
- `ordinaryToTate`, natural in coefficients and an isomorphism in positive degree;
- restriction and corestriction in every integer degree, with
  `cor ∘ res = [G:H]`;
- inflation in positive degrees and its comparison with ordinary inflation;
- a Tate cup product in all integer bidegrees, associative, graded-commutative, natural in
  coefficients, and satisfying the projection formula;
- agreement of the Tate cup with the ordinary cup in nonnegative degrees;
- two-periodicity for cyclic groups;
- Sylow detection of `p`-primary classes;
- the negative-degree comparison with group homology.

The nearby false construction is an arbitrary family of additive maps of the right types. It
does not satisfy any of the functoriality, projection, or cup laws and cannot support
Tate–Nakayama.

The target API names those laws: `tateCup_assoc`, `tateCup_comm`, `tateCup_projection`,
`tateMap_tateRes`, and the inflation comparison `tateInfl_ordinaryToTate`. It also names the
ordinary finite-group product `ordinaryCup` and proves both `tateCup_agrees_ordinary` and
`ordinaryCup_explicitCup11`, the latter against `ProfiniteCohomology.explicitCup11`. The
top-subgroup and tower transports are `tateHTopEquiv` and `tateHTowerEquiv`; therefore
`FiniteClassFormation.topClass` is the transported `cls ⊤`, not a freely chosen class.

*Prerequisites:* M finite-group cohomology and homology, M representation categories.

### Layer 1: Herbrand quotients and finite class formations

For cyclic `G`, define the Herbrand quotient as `#Ĥ⁰(G,M)/#Ĥ¹(G,M)`, carrying the finiteness
hypotheses that make `Nat.card` meaningful. Prove multiplicativity in short exact sequences and
invariance under an equivariant map with finite kernel and cokernel. Compute the quotients used
by local and global class field theory, rather than treating them as numerical axioms.

For local units, use a scaled normal-basis element to obtain an open stable lattice that is free
over the group ring, then pass through the finite quotient into the unit filtration. Do not assume
`𝒪_L` itself is free over `𝒪_K[G]`; that holds only in the tame case. The finite local
Galois group is first proved solvable from its ramification filtration, the cyclic `H²` bound is
then propagated by induction, and only afterward are the invariant, fundamental classes, and
class formation constructed. Reciprocity, existence, and local duality are forbidden inputs to
this stage because each is downstream of Tate–Nakayama.

Define `FiniteClassFormation M` with a distinguished class for every subgroup, restriction and
corestriction on `Ĥ²`, vanishing `H¹`, cyclicity and correct cardinality of `Ĥ²`, compatibility of
the distinguished classes in towers, and `cor ∘ res`. Restriction of a formation to a subgroup
is again a formation.

Construct `tateCupSigma` by cupping with the distinguished class. Tate–Nakayama says this named
map is bijective for every subgroup and every integer degree. The top-group corollary at degree
`-2` yields the finite-level reciprocity isomorphism. There is no arbitrary class parameter: cup
with zero is not bijective.

*Prerequisites:* L0.

### Layer 2: local invariant maps and cohomological Hilbert symbols

For a nonarchimedean local field `F`, keep all continuous cohomology on the imported Mathlib
carrier:

```text
GalRep n F = ProfiniteCohomology.TopRep (ZMod n) G_F
H n F i A = continuousCohomology (ZMod n) G_F i evaluated at A.
```

Build `muNRep n F`, the separable-closure roots of unity as a coefficient object, and transport
the imported Kummer map to `kummerClass`. For `F/ℚ_p` finite, `kummerEquiv_mixed` is valid for
every `n ≠ 0`, including `n = p`; this is not a consequence of the prime-to-`p` unit case.

Construct the multiplicative coefficient module and the Brauer carrier on the same continuous
cohomology theory. The invariant map `invMap : Br F ≃+ ℚ/ℤ` has the arithmetic-Frobenius
normalization. Name restriction/corestriction and prove their two invariant squares.

For every `n ≠ 0` in mixed characteristic, prove
`h2MuEquivZMod_mixed : H²(F,μ_n) ≃ ZMod n`. A chosen primitive `p`-th root identifies the
trivial `𝔽_p` module with `μ_p`, giving `h2FpEquivZMod_of_mu`; without that coefficient
identification the zero module is a counterexample.

Define `kummerCupPairing ζ` from a chosen primitive root, then define `localSymbol` as Kummer
cup followed by the invariant map. Prove bilinearity and the Steinberg relation. This is the
canonical owner of the cohomological local Hilbert pairing. No quadratic-form or quaternion
symbol is imported.

The transport is explicit: `absoluteGaloisGroupComparison` relates the algebraic-closure and
separable-closure Galois groups, while `muNRepCoeffDictionary` is separately proved continuous
and equivariant. The Brauer carrier is `Br F = H²(G_F,(Fˢ)ˣ)` with invariant `invMap`; `brRes`
and `brCor` satisfy the degree-multiplying restriction and degree-free corestriction squares.
Two Kummer classes naturally cup into `mu_n ⊗ mu_n`, not `mu_n`: multiplication of roots of
unity is not biadditive. A primitive root supplies the additional pairing, and the Steinberg law
is stated only for that named pairing. At exponent two the identification is canonical.

*Prerequisites:* PC continuous cohomology, Kummer theory, cups and degree transport; LFR local
field carrier and unit arithmetic.

### Layer 3: local reciprocity, existence, duality, and Euler characteristic

Use the local fundamental class and Tate–Nakayama at degree `-2` to construct
`normResidue : Kˣ/N_{L/K}Lˣ ≃ Gal(L/K)^{ab}`. For an unramified extension, every uniformizer
maps to the arithmetic Frobenius. Passing over finite abelian extensions gives
`artinMap : Kˣ → G_K^{ab}` with dense image and kernel the intersection of norm groups. It is
not surjective, so no finite-cardinality statement about its target is valid.

Prove the local norm-index theorem, openness and classification of norm groups, local existence,
functoriality in towers, and the conductor/existence compatibility. Consume the unit filtration,
unramified norm calculation and Frobenius from `LocalFieldsRamification`.

Construct local Tate duality from the evaluation pairing
`Hom(A,μ_n) × A → μ_n`. The exported theorem
`tateDualityPairing_perfect_mixed` is stated for the named evaluation pairing; quantifying over
an arbitrary pairing would admit the zero pairing. Prove finiteness of `H⁰`, `H¹`, `H²`, the
cardinality Euler characteristic, and the frozen `𝔽_p` finrank formula
`eulerCharacteristic_finrank_fp`.

Finally prove the cyclotomic normalization, including both
`cyclotomicCharacter_artinMap` with the field norm and its `ℚ_p` specialization. These equations
are consumed by `LocalGaloisGroups` to identify the abstract Demushkin orientation.

The construction order is normative. Norm subgroups first define the normic topology and its
completion; compatible finite-level reciprocity maps then give the inverse-limit isomorphism and
the dense, generally non-surjective `artinMap`. Norm limitation precedes the prime-to-residue
existence theorem; Kummer theory then gives full existence for finite extensions of `ℚ_p`, after
which injectivity, the ordinary profinite-completion comparison, and conductor theory follow.
Equal-characteristic `p`-primary existence is not obtained by this route: it requires the excluded
Artin–Schreier–Witt theory.

Local duality uses the named evaluation pairing and an eight-step Shapiro/coinduction
dévissage. A general finite `G_K`-module need not admit a filtration by trivial modules: over
`ℚ_2`, the nontrivial unramified action on `ℤ/3` is the regression example. For an unramified
module and its dual, the two annihilator orders are separately `#H⁰(K,M)` and `#H⁰(K,M')`;
they need not agree (the same `ℚ_2`, `ℤ/3` example gives orders `3` and `1`).

The conductor targets are the attained minima `conductorExponent`, `conductorIdeal`, and
`characterConductorExp`, with minimality and the unramified criterion named. Character-conductor
attainment uses that `ℂˣ` has no small subgroups; continuity plus a neighbourhood basis alone is
insufficient, as the identity `Kˣ → Kˣ` is trivial on no unit-filtration subgroup.

*Prerequisites:* L0–L2; LFR valuation, unit filtration, norm group and Frobenius.

### Layer 4: global carriers, completions, and archimedean reciprocity

Import from `GlobalNumberFields` the modulus, ray-class, adele, idele, idele-class, Hecke,
infinity-type, order and Picard carriers. This roadmap adds only class-field-theoretic maps and
theorems on those carriers.

At each finite place, identify the completion as a nonarchimedean local field, match residue
cardinality with the ideal norm, and compare its arithmetic Frobenius with
`NumberFieldArithmetic.frobeniusClass`. The local factor of the global Artin map is the Layer 3
`artinMap`, not a second definition.

Build the archimedean package here:

- `Art_ℂ` is trivial;
- `Art_ℝ` has kernel `ℝ_{>0} = N_{ℂ/ℝ}(ℂˣ)` and sends a negative element to conjugation;
- the complex invariant is zero and the real nontrivial class has invariant `1/2`;
- the cohomological real Hilbert symbol is nontrivial exactly when both inputs are negative.

Adapt `[IsAbelianGalois K L]` to the explicit commutativity hypothesis of
`NumberFieldArithmetic.artinHomAway`. Prove value-at-prime, uniqueness, enlargement of the
excluded set, and restriction to a subextension by direct use of the supplier's declarations.

*Prerequisites:* LFR, GNF, NFA, L3.

### Layer 5: norm-index machinery and the cyclic Hasse norm theorem

Develop the `S`-idele and unit-lattice Herbrand calculations on the imported idele carriers.
Prove the class-field axiom `H¹(G,C_L)=0` and compute `H²(G,C_L)` in the cyclic case. Extend to
general finite Galois groups by Sylow reduction and solvable induction where required.

For cyclic `L/K`, freeze:

```text
ClassFieldTheory.cyclicHasseNorm
```

It states that `x : Kˣ` is a global norm from `Lˣ` exactly when its principal idele is in the
image of the norm on ideles—equivalently, when `x` is a norm at every place. The cyclic
hypothesis is essential. Record the biquadratic counterexample: for
`ℚ(√13,√17)/ℚ`, `25` is a local norm everywhere but not a global norm.

*Prerequisites:* L0–L4; GNF idele carriers and weak approximation.

### Layer 6: global Artin reciprocity and class-field existence

Compile the local maps on the imported idele class group and prove triviality on principal
ideles using the cyclotomic crossing argument. Identify the induced finite-level map with
`NumberFieldArithmetic.artinHomAway` by its prime values and uniqueness theorem.

Prove:

- the global Artin map and its functoriality in towers;
- the reciprocity law and its ray-class factorization;
- the kernel as the connected component/norm subgroup in the appropriate form;
- the norm-index theorem `[C_K : N C_L] = [L:K]` for finite abelian `L/K`;
- the existence theorem, realizing finite-index open subgroups of the idele class group;
- the ray class field and its splitting law;
- compatibility of conductors with ramification and the conductor-discriminant formula.

The ray-class group itself is `GlobalNumberFields.RayClassGroup`; this layer constructs the
corresponding extension and reciprocity isomorphism.

*Prerequisites:* L4–L5; GNF moduli, ray classes and ideles; NFA ideal Artin map.

### Layer 7: Hilbert, narrow Hilbert, cyclotomic, and ring class fields

Construct the Hilbert class field as the class field of the trivial finite modulus and the narrow
Hilbert class field using `GlobalNumberFields.narrowModulus`. Prove the Galois/class-group
isomorphisms, maximal unramified properties, splitting criteria, and the principal ideal theorem.

Derive Kronecker–Weber from global existence and prove that the least cyclotomic level equals the
abelian conductor, including the `n ≠ 2 mod 4` normalization. Prove the abelian
conductor-discriminant formula from the local formula and the character dictionary.

For a `GlobalNumberFields.NumberFieldOrder O`, construct its ring class field from the imported
conductor, proper ideal group and `Pic O`. Freeze the isomorphism
`Gal(H_O/K) ≃ Pic O`, its ramification bound, the maximal-order comparison, and the splitting
criterion. Orders and Picard groups remain owned by `GlobalNumberFields`.

*Prerequisites:* L6; GNF order/Picard API.

### Layer 8: global class formation, local invariants, and Hilbert reciprocity

Package the global idele-class formation with its fundamental classes. Prove that continuous
cohomology of the absolute Galois group is the imported finite-quotient colimit from
`ProfiniteCohomology`; do not build a second continuous carrier here.

Prove the exact sequence

```text
0 → Br(K) → ⨁_v Br(K_v) → ℚ/ℤ → 0
```

in invariant coordinates and the sum-of-local-invariants theorem. Define each finite local
Hilbert invariant by applying `localSymbol` at the completion and each real invariant by Layer 4.
Prove finite support, then freeze

```text
ClassFieldTheory.hilbertProductFormula
```

in additive cohomological form: the sum of the local `ZMod 2` invariants is zero. The equivalent
multiplicative statement is `∏_v (a,b)_v = 1`. `QuadraticFormInvariants` later proves its
norm-equation/quaternion symbol agrees with this one and inherits the product formula.

*Prerequisites:* PC finite-quotient colimit and cups; L2–L7.

## Worked examples

- At `ℚ_p`, verify the unramified coordinate of `Art(p)` is `1`, a unit has coordinate `0`,
  and `χ_cyc(Art(u)) = u⁻¹`; at `p=2`, test `u=-1,-3` and the uniformizer separately.
- Compute `ℚˣ/N_{ℚ(i)/ℚ}ℚ(i)ˣ` locally and compare the sign at the real place.
- For `ℚ(√5)/ℚ`, check the norm index and the cyclic Hasse norm theorem.
- Exhibit `25` as the standard failure of the Hasse norm principle in the biquadratic
  extension `ℚ(√13,√17)/ℚ`.
- Compute the Hilbert and narrow Hilbert class fields in small quadratic examples and test the
  principal ideal theorem.
- Verify `ℚ(i) ⊂ ℚ(ζ₄)`, `ℚ(√2) ⊂ ℚ(ζ₈)`, and `ℚ(√5) ⊂ ℚ(ζ₅)` with the correct conductor.
- Derive quadratic reciprocity from `hilbertProductFormula`, including the real and dyadic
  factors.
- For a nonmaximal imaginary-quadratic order, compare `Gal(H_O/K)` with
  `GlobalNumberFields.Pic O`; do not reconstruct the order or its ideals locally.

## Dependency order

Layers 0 and 1 are the finite-group substrate. Layers 2 and 3 build local cohomology,
reciprocity, existence and duality over the ramification roadmap. Layer 4 connects those results
to the global carriers. Layers 5 and 6 build the norm and reciprocity theorems. Layer 7 builds
named class fields. Layer 8 packages the global formation and Hilbert reciprocity.

The main parallelism is:

- the finite Tate carrier and the local coefficient dictionaries can begin independently;
- archimedean reciprocity can proceed alongside the nonarchimedean local theory;
- the ideal-Artin adapter can proceed once `NumberFieldArithmetic` is stable;
- ring class fields wait for both global existence and the `GlobalNumberFields` order/Pic API.

## References

- J. Tate, in Cassels–Fröhlich, *Algebraic Number Theory*: global class formations and
  cohomological class field theory.
- E. Artin and J. Tate, *Class Field Theory*: Tate cohomology, class formations, reciprocity,
  existence, and local-global compatibility.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*: finite and profinite
  cohomology, local duality, and global formations.
- J. Neukirch, *Algebraic Number Theory*, Ch. VI–VII: local and global class field theory.
- J. Milne, *Class Field Theory*: idelic reciprocity, Hasse norm, and examples.
- J.-P. Serre, *Local Fields* and *Galois Cohomology*: local invariants, local duality, and
  normalization conventions.

Implementation sources, licensing notes, and the complete extraction record are in
[`PROVENANCE.md`](PROVENANCE.md).
