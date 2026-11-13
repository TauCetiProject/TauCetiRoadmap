# Roadmap: perfectoid quotients, part II — structure of integral perfectoid rings and the ind-syntomic André lemma

**Summary.** This roadmap extends PerfectoidQuotients from its integral perfectoid algebra
(Layer 0: Fontaine generators, Witt torsion, torsion removal, `p`-integral closure and completed
ring operations) and its almost and modulo-`p` root covers (Layers 1–2) to the structure theory of
integral perfectoid rings with torsion and to André's lemma without completions. It answers three
questions. What does the tilt remember about an integral perfectoid ring? The ring modulo `ϖ^p`,
its `ϖ`-torsion as an `A_inf`-module, its adic completeness, whether it is a valuation ring and its
value group, and whether its fraction field is algebraically closed; and the class of integral
perfectoid rings is closed under fibre products along surjections and is generated, under
quotients, by torsion-free members (Layers Q5–Q6; Česnavičius–Scholze Propositions 2.1.4, 2.1.9
and 2.1.12). How far can André's lemma be pushed? To a faithfully flat, ind-syntomic,
`ϖ`-Henselian extension in which every monic polynomial of positive degree acquires a root with
compatible `p`-power roots modulo a `ϖ`-divisible ideal, and from there to faithfully flat
semiperfectoid covers of all `p`-Zariski rings (Layers Q7–Q9; Česnavičius–Scholze Theorem 2.3.4
and Corollary 2.3.7). What does this give for regular local rings? Faithfully flat perfectoid
covers, by perfecting a prism, and the almost vanishing of `Tor` along finite subextensions of the
absolute integral closure that Bhatt and Scholze derive from almost purity along an arbitrary
ideal, which for `F`-finite residue fields is Heitmann–Ma's theorem (Layer Q10). The end theorems
are the ind-syntomic André lemma (Q9.3), semiperfectoid covers of `p`-Zariski rings (Q9.6), fibre products
of perfectoid rings (Q5.6), tilting of perfectoid valuation rings (Q6.4, Q6.7), torsion-free
presentations (Q6.8), perfectoid covers of regular local rings (Q10.2), such a cover inside the
completed absolute integral closure for an `F`-finite residue field (Q10.4), and the almost
vanishing of `Tor` (Q10.5–Q10.6).

## Scope and ownership

**Where PerfectoidQuotients stops.** PerfectoidQuotients owns: Tor-independence and complete étale
δ-extension (§0.0); the characteristic-`p` unit and projection lemmas (§0.1); naturality of `♯` and
`θ`, finite Fontaine maps, the Frobenius-surjectivity equivalences and the Fontaine-generator
criteria, including the normal form `p + [π♭]^p x` of a generator (§0.2); the bound-one theorem for
`p`-power torsion and the cotangent consequences (§0.3); the annihilator identities for compatible
root towers and the decomposition `A ≅ A_tf ×_{(A_tf/ϖ)_red} (A/ϖ)_red` (§0.4); `p`-integral
closure, its injectivity criterion and the perfectoid completion of `p`-integral closures (§0.5);
completed root-polynomial algebras, completed tensor products, root-stable quotients, products,
sharp-ideal completions and completed ind-étale and henselian extensions (§0.6); the fixed-field
integral model (§0.7); the relative smooth-site cover, the modulo-`p` ind-syntomic refinement of
André's cover and Bhatt's almost faithfully flat root extensions (§§1.1–1.4); and
characteristic-`p` radical quotients (§2.1). This Part II starts there. It owns the tilting
identities for integral perfectoid rings with torsion that are not stated above, fibre products of
perfectoid rings and their glueing with perfect algebras, the relative tilting equivalence with the
transfer of completeness, of the valuation-ring property, of value groups and of algebraically
closed fraction fields, and torsion-free presentations (Česnavičius–Scholze (2.1.1.3), (2.1.2.2),
(2.1.2.5), Propositions 2.1.4, 2.1.9 and 2.1.12, Example 2.1.5 and Remark 2.1.10, pp. 10–17);
ind-fppf and ind-syntomic ring maps, the integral approximation lemma, the valuative criterion for
topological nilpotence, the ind-syntomic André lemma and semiperfectoid covers of `p`-Zariski rings
(Česnavičius–Scholze §2.3.3, Lemmas 2.3.1 and 2.3.2, Theorem 2.3.4 and Corollary 2.3.7,
pp. 22–28); the unramified refinement of the residue tower (Česnavičius–Scholze Lemma 3.1.1 (a));
the prismatic perfectoid cover of a regular local ring (Bhatt–Scholze Remark 3.11); and the almost
vanishing of `Tor` that Bhatt–Scholze Remark 10.13 derives from almost purity.

**Imported, not planned again.**

- From PerfectoidSpaces: the Frobenius-bijectivity and compatible-root criteria for integral
  perfectoid rings (P1.24); the comparison of integral perfectoid rings with perfectoid Tate rings
  (P1.25); finite
  extensions of perfectoid fields and the equivalence `K` algebraically closed iff `K♭` is (P3.7);
  δ-rings, prisms, perfection of prisms and the equivalence between perfect prisms and integral
  perfectoid rings (P4.15.2); André's `p`-completely faithfully flat root cover (P4.15.4); the
  residue tower of a complete regular local ring (P7.16a) and the `p`-power root tower with
  perfectoid completion for a perfect residue field (P7.17), which is Česnavičius–Scholze
  Lemma 3.1.1 (b).
- From PrismaticCohomology: distinguished elements, their factors and the radical criterion
  (§§0.61–0.63), rigidity of prism maps (§0.79), the perfect-site description of perfectoidization
  and its universal property among perfectoid targets (§2.30), and integral perfectoidization with
  almost purity along an arbitrary finitely generated ideal (§2.31; Bhatt–Scholze Theorems 10.9
  and 10.11).
- From EnhancedDerivedSheaves: Kunz's theorem that Frobenius of a regular `𝔽_p`-algebra is flat
  (§E1.6, `frobenius_flat_of_isRegular`).
- From DerivedDeRhamCohomology: Bhatt's ordinary flatness criterion over a noetherian base (§1.10).
- From DeformationAndDerivedPatchingAlgebra: Cohen rings, their truncated formal smoothness and the
  lifting of a residue map from a Cohen ring to a complete local ring (§1.10), which gives the
  Frobenius lifts of the Cohen rings used in Q10.2 and Q10.4.
- From StableReduction: syntomic morphisms (Layer 1), whose affine local model is Tau Ceti's
  `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`.
- From PerfectoidSpaces, the Tate-ring forms of Q5.1 (1) and Q5.3 (P1.4–P1.6); Q5.1 and Q5.3 state
  them for arbitrary complete rings, respectively integral perfectoid rings with torsion.
- From Mathlib: the multiplicative identification of the tilt of a `p`-adically complete ring with
  the `p`-power compatible sequences in the ring is `Perfection.quotientMulEquiv` at the ideal `(p)`,
  with the sharp map `PreTilt.untilt` as its zeroth coordinate
  (`Perfection.coeff_zero_symm_quotientMulEquiv`); it is not restated here.
- From Tau Ceti: the integral perfectoid predicate `TauCeti.Perfectoid.IsIntegralPerfectoid` (BMS1
  Definition 3.5), with its `p`-adic completeness, perfect rings and the zero ring as examples, and
  surjectivity of Frobenius `A/π → A/π^p`; the henselization of a pair, its ind-étaleness, its
  quotients by powers of the ideal and its faithful flatness along an ideal in the Jacobson radical
  (`TauCeti.Henselization.algebra`, `TauCeti.Henselization.faithfullyFlat_of_le_jacobson`), and the
  permanence of henselian pairs under surjections and radicals; continuity of valuations
  (`Valuation.IsContinuous`), the bound `v(a) < 1` at a
  topologically nilpotent `a` for continuous `v`
  (`Valuation.IsContinuous.lt_one_of_isTopologicallyNilpotent`) and the cofinality of the powers of
  a topologically nilpotent element in the value group
  (`Valuation.IsContinuous.cofinalValue_of_isTopologicallyNilpotent`), Wedhorn's description of
  continuous valuations through an ideal of definition
  (`TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one`) and his valuative
  criterion for integrality (`TauCeti.Huber.isIntegral_of_forall_continuous_valuation_le_one`), and
  the affine blowup algebra with its universal property (`Ideal.affineBlowup`).

**Residue fields.** The perfectoid cover inside `(R⁺)^∧` of a complete regular local ring `R` of
mixed characteristic (Q10.4) is constructed when the residue field is `F`-finite, the hypothesis of
Heitmann–Ma Theorem 1.3, by finite free stages that are base changes of `R` along powers of a
Frobenius lift. For a residue field that is not `F`-finite no cover inside `(R⁺)^∧` is constructed
here or by a supplier: Q10.2 gives a faithfully flat perfectoid cover of `R` with no map to
`(R⁺)^∧`, and Q10.5 takes a cover together with such a map as hypotheses.

**Not owned here.** Purity for flat cohomology (Česnavičius–Scholze §§3–6), the pro-fppf site
(§4.1.1) and the algebraic tilting of étale cohomology (Theorem 2.2.7, EtaleDualityAndPerverseSheavesPartII
§8.5) are consumers of this roadmap and are listed under "Downstream consumers". Arc covers and
the tilting of complete arc covers (Česnavičius–Scholze Lemma 2.2.2) belong to
ArcTopologyAndDescent §12.6, which does not use this roadmap.

## Conventions

Fix a prime `p`. Rings are commutative and unital; the zero ring is allowed unless excluded.
In examples, `C` denotes a complete algebraically closed nonarchimedean extension of `ℚ_p`,
`𝒪_C` its valuation ring and `k̄` its residue field. Numerical absolute values are normalized
by `|p| = p^{−1}`; the theorem statements allow arbitrary ordered value groups.
Completeness is classical: `A` is `I`-adically complete when `A → lim_n A/I^n A` is bijective
(Mathlib `IsAdicComplete`, which includes separatedness).

The tilt is `A♭ = lim_{x ↦ x^p} A/pA`, Mathlib's `PreTilt A p` (whose ring structure is stated for
`p` a nonunit). For `p`-adically complete `A` with `p` a nonunit, `x ↦ x♯` is Mathlib's
multiplicative `PreTilt.untilt`, `A_inf(A) = W(A♭)` and `θ : A_inf(A) → A` is Mathlib's
`WittVector.fontaineTheta`, with `θ([x]) = x♯` (`WittVector.fontaineTheta_teichmuller`).

*Integral perfectoid* is Tau Ceti's predicate `TauCeti.Perfectoid.IsIntegralPerfectoid` (BMS1
Definition 3.5, the object of PerfectoidSpaces P1.24): there is `ϖ` with `ϖ^p | p` such that `A` is
`ϖ`-adically complete, Frobenius on `A/p` is surjective, and `ker θ` is principal, the last clause
stated for every proof that `p` is a nonunit, so that the zero ring qualifies. `Suggested.lean`
uses it directly. For integral perfectoid `A` and such `ϖ`,
`ϖ♭ ∈ A♭` denotes an element with `(ϖ♭)♯` a unit multiple of `ϖ` and `p♭` one with `(p♭)♯` a unit
multiple of `p` (PerfectoidSpaces P1.24); only the ideals `(ϖ♭)` and `(p♭)` are canonical (Q5.3).
`ξ = (ξ₀, ξ₁, …)` denotes a generator of `ker θ` in Witt coordinates; `ξ₁` is a unit and, by the
normal form of PerfectoidQuotients §0.2, `p♭` may be chosen equal to `ξ₀`.

For a module `M` and `a ∈ A`, `M[a]` is the `a`-torsion and `M[a^∞]` the `a`-power torsion
(Česnavičius–Scholze write `M⟨a⟩`, `M⟨a^∞⟩`). A *compatible system of `p`-power roots* of `a` is a
sequence `(a_n)_{n≥0}` with `a_0 = a` and `a_{n+1}^p = a_n`. A polynomial whose roots are asserted
is monic *of positive degree*: the constant `1` has no root in a nonzero ring. An element of
`B[T^{1/p^∞}]` is monic of degree `d ∈ ℤ[1/p]_{≥0}` if it is `T^d` plus a `B`-linear combination of
`T^e` with `e < d`; `ϖ^{m/p^j}` means `(ϖ^{1/p^j})^m`.

A valuation `v : A → Γ ∪ {0}` on a topological ring is *continuous* in the sense of Wedhorn
Definition 7.7 (Tau Ceti `Valuation.IsContinuous`, which quantifies over attained values). On a
ring with the `ϖ`-adic topology and `v(A) ≤ 1`, this is Česnavičius–Scholze's convention that the
powers of `v(ϖ)` fall below every element of the value group (Q8.1).

`ϖ`-Henselian means that `(A, ϖA)` is a henselian pair (Mathlib `HenselianRing A (ϖ)`). A ring is
*`p`-Zariski* if `1 + pA ⊆ A^×` (Q9.5). `W(k)⟦x^{1/p^∞}⟧` is the colimit of the power series rings
in the `x^{1/p^m}`, without a further completion. A regular local ring is *unramified* if it has
mixed characteristic `(0, p)` and `p ∉ 𝔪²`. For a domain `R`, `R⁺` is the integral closure of `R` in
an algebraic closure of its fraction field (Mathlib `integralClosure R (AlgebraicClosure
(FractionRing R))`), and `(R⁺)^∧` its `p`-adic completion.

Universes: families of rings and colimits are small in a fixed universe; the existential
statements of `Suggested.lean` produce rings in the universe of the input ring. The valuations of
Q8.3 and Q8.4 take values in ordered groups of an arbitrary universe, independent of the ring's:
Q8.3 bounds every such valuation, and the converse direction of Q8.4 is witnessed by a valuation of
rank one, whose value group embeds in `ℝ_{>0}`.

The statements of `Suggested.lean` carry, as instance hypotheses, facts that are consequences of
the README's hypotheses but are needed to form the objects: `Fact ¬IsUnit (p : A)` (the ring is
nonzero) for `PreTilt A p` and `PreTilt.untilt`, `IsDomain` for a regular local ring and, in Q6.7,
`IsDomain (PreTilt A p)` (Q6.4). The `p`-adic completeness that `PreTilt.untilt` and
`WittVector.fontaineTheta` also need is the instance
`TauCeti.Perfectoid.IsIntegralPerfectoid.isAdicComplete_span_natCast` of an integral perfectoid
ring, and is not repeated as a hypothesis.

Theorem, section and page numbers refer to the arXiv versions listed under References, which are the
versions read.

## Exact supplier contracts

### From Mathlib

At the Mathlib revision pinned by the repository's `lake-manifest.json`.

- `PreTilt A p` (`Mathlib/RingTheory/Perfection.lean`): the inverse-limit perfection of `A/p`, a
  perfect ring of characteristic `p` when `p` is a nonunit of `A` (`Fact ¬IsUnit (p : A)`).
  `PreTilt.isDomain` is the valued-field case of Q6.3.
- `PreTilt.untilt`, `PreTilt.mk_untilt_eq_coeff_zero`, `PreTilt.untilt_iterate_frobeniusEquiv_symm_pow`
  (`Mathlib/RingTheory/Perfectoid/Untilt.lean`): the multiplicative sharp map of a `p`-adically
  complete ring with nonunit `p`, its reduction modulo `p`, and `((x^{1/p^n})♯)^{p^n} = x♯`.
- `Perfection.quotientMulEquiv` and `Perfection.coeff_zero_symm_quotientMulEquiv`
  (`Mathlib/RingTheory/Teichmuller.lean`): for `A` complete for an ideal `I` with `A/I` of
  characteristic `p`, the monoid isomorphism between the `p`-power compatible sequences in `A` and
  `Perfection (A/I) p`, whose inverse has zeroth coordinate the Teichmüller limit. At `I = (p)` this
  is the multiplicative description of the tilt (Česnavičius–Scholze (2.1.1.2), p. 10; BMS1
  Lemma 3.2 (i), p. 19).
- `WittVector.fontaineTheta`, `WittVector.mk_fontaineTheta`, `WittVector.fontaineTheta_teichmuller`
  and `WittVector.surjective_fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean`): Fontaine's
  map, its reduction modulo `p`, its value on Teichmüller representatives, and its surjectivity when
  Frobenius on `A/p` is surjective.
- `WittVector.eq_of_apply_teichmuller_eq` (`Mathlib/RingTheory/WittVector/TeichmullerSeries.lean`):
  two ring maps out of `W(R)` into a ring in which `p` is nilpotent agree if they agree on
  Teichmüller representatives.
- `WittVector.map`, `WittVector.verschiebung`, `WittVector.teichmuller`; `PerfectRing`,
  `PerfectClosure`, `frobenius`; `MvPolynomial`, `Polynomial.Monic`, `PowerSeries`.
- `IsAdicComplete`, `IsAdic`, `AdicCompletion` (with its ring structure), `IsAdicComplete.le_jacobson_bot`.
- `ValuationRing` (stated for domains), `ValuationRing.ValueGroup`, `IsAlgClosed`, `FractionRing`,
  `Localization.Away`, `Localization.AtPrime`, `integralClosure`, `AlgebraicClosure`,
  `IsIntegrallyClosed`, `nilradical`, `Ideal.jacobson`, `RingHom.eqLocus`.
- `Module.Flat`, `Module.FaithfullyFlat`, `Algebra.FinitePresentation`, `Algebra.Etale`,
  `IsSMulRegular`, `RingTheory.Sequence.IsRegular`, `HenselianRing`, `IsRegularLocalRing`,
  `IsLocalRing.ResidueField`, `IsTopologicallyNilpotent`, `Valuation`.
- `CategoryTheory.Tor` (`Mathlib/CategoryTheory/Monoidal/Tor.lean`): `Tor_n` as a bifunctor on a
  monoidal preadditive category with projective resolutions, here `ModuleCat (R/pⁿ)`.

### From Tau Ceti

At the Tau Ceti revision pinned by the repository's `lake-manifest.json`.

- `TauCeti.Perfectoid.IsIntegralPerfectoid p A` (`TauCeti/RingTheory/Perfectoid/Integral.lean`):
  some `π` with `π^p | p` makes `A` `π`-adically complete and separated, Frobenius on `A/p` is
  surjective, and the kernel of `WittVector.fontaineTheta` is principal for every proof that `p` is
  a nonunit and `A` is `p`-adically complete. Its API: the instance `isAdicComplete_span_natCast`
  (an integral perfectoid ring is `p`-adically complete and separated), `not_isUnit_natCast` (`p`
  is a nonunit in a nonzero one), `isPrincipal_ker_fontaineTheta`, `exists_natCast_dvd_sub_pow`
  (every element is a `p`-th power modulo `p`), `frobeniusModPow_surjective` (Frobenius
  `A/π → A/π^p` is surjective for every `π` with `π^p | p`, the surjectivity half of BMS1
  Lemma 3.10 (i)), `of_perfectRing` (a perfect ring of characteristic `p`, with `π = 0`) and
  `of_subsingleton` (the zero ring), all in the namespace `TauCeti.Perfectoid.IsIntegralPerfectoid`.
  The predicate does not depend on a choice of `π` and allows `p`-torsion and zero divisors.
- `TauCeti.Henselization.algebra I` (`TauCeti/RingTheory/Henselization/Algebra.lean`), the
  henselization of a pair `(R, I)`, with extended ideal `TauCeti.Henselization.extended I`, the
  instance `TauCeti.Henselization.henselian` (the pair is henselian), the instance
  `TauCeti.Henselization.indEtale` (it is ind-étale over `R`, `IndEtale.lean`), flatness through
  `TauCeti.Algebra.IndEtale.flat` (`TauCeti/RingTheory/Etale/IndEtale.lean`),
  `TauCeti.Henselization.quotientPowEquiv` (`R/Iⁿ ≅ R^h/(I^h)ⁿ` for every `n`, `Quotient.lean`) and
  `TauCeti.Henselization.faithfullyFlat_of_le_jacobson` (faithful flatness of `R → R^h` when `I`
  lies in the Jacobson radical of `R`).
- `RingHom.henselianRing_of_surjective` (`TauCeti/RingTheory/Henselian/Quotient.lean`: a
  surjection `R → S` carries a henselian pair `(R, I)` to the henselian pair `(S, IS)`) and
  `Ideal.henselianRing_radical_iff` (`TauCeti/RingTheory/Henselian/Ideal.lean`: `(R, √I)` is
  henselian iff `(R, I)` is).

- `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension n R S`
  (`TauCeti/RingTheory/Syntomic/StandardSyntomic.lean`): `S` is flat over `R` and has a finite
  presentation with `n + c` generators and `c` relations whose nontrivial fibres have Krull
  dimension `n`, that is, `S` is a flat relative global complete intersection. Supplied there:
  invariance under isomorphism (`of_algEquiv`), base change (`baseChange`) and polynomial rings in
  finitely many variables (`mvPolynomial`, `mvPolynomial_fin`); composition, with addition of
  relative dimensions (`trans`, `TauCeti/RingTheory/Syntomic/Composition.lean`); and localization
  away from one element, of relative dimension `0`, also composed on either side with a standard
  syntomic algebra (`localization_away`, `trans_localization_away`, `localization_away_trans`,
  `TauCeti/RingTheory/Syntomic/Localization.lean`), all in the namespace
  `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`. Flatness is part of the definition: for
  one equation, that a fibrewise nonzero hypersurface is automatically flat (Stacks
  Lemma 10.136.13, the case of one relation) is Q7.6 here.
- `Valuation.IsContinuous` (`TauCeti/RingTheory/Valuation/Continuous/Basic.lean`): every set
  `{a : v(a) < v(b)}` is open. `Valuation.IsContinuous.lt_one_of_isTopologicallyNilpotent` and
  `Valuation.IsContinuous.cofinalValue_of_isTopologicallyNilpotent`
  (`TauCeti/RingTheory/Valuation/Continuous/TopologicallyNilpotent.lean`) are the easy directions of
  Q8.1 and Q8.4.
- `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.PairOfDefinition`
  (`TauCeti/RingTheory/Huber/Basic.lean`): Tate rings and pairs of definition `(A₀, I)` with `A₀`
  open and `I` finitely generated defining the subspace topology.
- `TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one`
  (`TauCeti/AlgebraicGeometry/AdicSpace/Cont/OfIdeal.lean`, Wedhorn Theorem 7.10) and
  `TauCeti.Huber.isIntegral_of_forall_continuous_valuation_le_one` (Wedhorn Proposition 7.18 (1)).
- `Ideal.affineBlowup`, `Ideal.mem_affineBlowup_iff`, `Ideal.isRegular_algebraMap_affineBlowup`,
  `Ideal.affineBlowupLift` (`TauCeti/RingTheory/Ideal/AffineBlowup.lean`): the subalgebra
  `A[I/a] ⊆ A[1/a]`, its elements `y/a^k` with `y ∈ I^k`, regularity of `a` on it and its universal
  property. The presentation by a regular sequence is Q7.5 here.

### From TauCetiRoadmap.PerfectoidQuotients

- §0.2: `untilt_natural` and `theta_natural` (naturality of `♯` and `θ`);
  `theta_generator_iff_unit_coeff_one` (an element of `ker θ` generates it iff its first Witt
  coordinate is a unit), `theta_generator_nonzerodivisor`, `theta_generator_normal_form` (a
  generator `p + [π♭]^p x` with `x` a unit), `theta_map_preserves_generator` (a map of integral
  perfectoid rings carries generators to generators), and `frobenius_surjectivity_equivalences`.
- §0.3: `perfectoid_p_torsion_killed_by_p` (`A[p^∞] = A[p]` for integral perfectoid `A`).
- §0.4: `compatible_root_annihilator` and `compatible_root_power_torsion` (in a reduced ring,
  `A[a^{1/p^n}] = A[a] = A[a^∞]` for an element with a compatible root tower), reducedness of
  integral perfectoid rings (imported there from PerfectoidSpaces P4.15.5), and
  `perfectoid_torsion_free_quotient` (the quotient `A/A[ϖ^∞]` is integral perfectoid, with tilt
  `A♭/A♭[(ϖ♭)^∞]`, and the fibre-product decomposition along `(A/ϖ)_red`).
- §0.5: `pIntegralClosure` (the `p`-integral closure inside a fixed ambient ring) with minimality and
  containment in the integral closure; `perfectoid_p_integral_closedness` (for a nonzerodivisor
  `ϖ` with `ϖ^p | p`, injectivity of `A/ϖ → A/ϖ^p`, `x ↦ x^p`, is equivalent to `p`-integral
  closedness in `A[1/ϖ]`); `completion_pIntegralClosure_perfectoid` (Česnavičius–Scholze
  Proposition 2.1.8); `completion_integrally_closed_perfectoid` (Česnavičius Lemma 4.7).
- §0.6: `perfectoid_completed_root_polynomial`, `perfectoid_completed_tensor`,
  `perfectoid_completed_root_quotient` (Česnavičius–Scholze Proposition 2.1.11 (a)–(c)),
  `integralPerfectoid_pi_iff` (products, (d)), `perfectoid_sharp_ideal_completion` ((e): the
  completion along the ideal generated by the sharps of finitely many elements of the tilt is
  integral perfectoid, with tilt the corresponding completion of the tilt) and
  `perfectoid_completely_etale_henselization` (the `p`-adic completions of étale, ind-étale and
  henselian extensions are integral perfectoid; Q6.8 obtains from it, with (e), the `ϖ`-adic
  completion of Česnavičius–Scholze Corollary 2.1.6).
- §1.2 and §1.4: the modulo-`p` ind-syntomic refinement `andre_ind_syntomic_mod_p` and Bhatt's almost
  faithfully flat root extension `bhatt_root_extension_almost_faithfully_flat`, against which Q9.4
  compares.

### From TauCetiRoadmap.PerfectoidSpaces

- P1.24, beyond the predicate itself, which is consumed from Tau Ceti
  (`TauCeti.Perfectoid.IsIntegralPerfectoid`): bijectivity of Frobenius `A/π → A/π^p` for `π^p | p`
  and `A` `π`-adically complete without a nonzerodivisor hypothesis (BMS1 Lemma 3.10 (i), whose
  surjectivity half is Tau Ceti's `frobeniusModPow_surjective`), compatible `p`-power roots of unit multiples of `π` and `p` (BMS1
  Lemma 3.9), and the converse criterion for a nonzerodivisor `π`. Supplier checks: `ℤ_p` is not
  integral perfectoid (no admissible `π`); the `p`-adic completion of `ℤ_p[p^{1/p^∞}]` is, with
  `π = p^{1/p}`; a perfect `𝔽_p`-algebra is, with `π = 0`.
- P1.25: `isPerfectoidTateRing_iff_integral` (a complete Tate ring is perfectoid iff its ring of
  integral elements is bounded and integral perfectoid); used for rank-one valuation rings in Q6.6.
- P3.7: `isAlgClosed_tilt` and `isAlgClosed_of_tilt` (a perfectoid field is algebraically closed iff
  its tilt is; Scholze Theorem 3.7 (ii) and Proposition 3.8).
- P4.15.2: δ-rings, distinguished elements, prisms, perfection of a prism by Frobenius colimit and
  completion, the equivalence between perfect prisms and integral perfectoid rings, and
  initiality of `(A_inf(A), ker θ)`.
- P4.15.4: André's `p`-completely faithfully flat integral perfectoid cover on which every monic
  polynomial of positive degree has a root (Bhatt–Scholze Theorem 7.14).
- P7.16a: `exists_residueTower` and the Cohen presentations `cohen_unramified`, `cohen_ramified`,
  `cohen_equalCharacteristic` of a complete regular local ring.
- P7.17: `RegularTower.exists_perfectoidTower`: for a complete regular local ring of mixed
  characteristic with perfect residue field `k`, the tower `R_m` (`W(k)[p^{1/p^m}]⟦x^{1/p^m}⟧` if
  `p ∉ 𝔪²`, `W(k)⟦x^{1/p^m}⟧/(p − g)` with `g ∈ (p, x)²` otherwise) of finite flat regular local
  `R`-algebras of `p`-power rank whose colimit has integral perfectoid `p`-adic completion.
- P0.1–P0.2 and P0.11: the basic setup, the root setup of compatible `p`-power roots and almost
  flatness, used to phrase the almost conclusions of Q10.5.

### From TauCetiRoadmap.PrismaticCohomology

- §0.61 (δ-functoriality: a map of δ-rings carries distinguished elements to distinguished
  elements, the first assertion of that section), §0.62 (factors
  of distinguished elements) and §0.63 (for `d, p` in the Jacobson radical, `d` is distinguished
  iff `p ∈ (d, φ(d))`).
- §0.79: rigidity of maps of prisms and its converse (a derived `(p, I)`-complete δ-`A`-algebra `B`
  gives a prism `(B, IB)` iff `B` is `I`-torsion-free).
- §0.83–§0.84: perfection of a prism and perfect prisms versus perfectoid rings, imported there from
  PerfectoidSpaces P4.15.2 and cited here through that owner.
- §2.30: the perfect-site description of perfectoidization, `S_perfd = lim_{S → T} T` over maps
  to perfectoid rings, giving the universal property of `S → S_perfd` among maps to integral
  perfectoid rings.
- §2.31: integral perfectoidization (for `S` the `p`-completion of an integral algebra over a
  perfectoid ring, `S_perfd` is a discrete perfectoid ring) and almost purity along an arbitrary
  finitely generated ideal `J` (for a finitely presented finite algebra finite étale away from
  `V(J)`, `R/pⁿ → S_perfd/pⁿ` is almost finite projective for `J_perfd = ker(R → (R/J)_perfd)`).

### From TauCetiRoadmap.EnhancedDerivedSheaves

- §E1.6: `frobenius_flat_of_isRegular` (Kunz: the absolute Frobenius of a regular ring of
  characteristic `p` is flat).

### From TauCetiRoadmap.DerivedDeRhamCohomology

- §1.10: `DerivedDeRham.ordinaryFlatnessFromCompleteFlatness` and
  `DerivedDeRham.ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness`: for `A` noetherian and
  `A`, `B` both `π`-torsion-free and `π`-adically complete, (faithful) flatness of `A/π → B/π`
  gives (faithful) flatness of `A → B` (Bhatt, Proposition 5.1).

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

- §1.10: Cohen rings (characteristic-zero complete discrete valuation rings with maximal ideal
  `(p)` and a labelled residue field), the formal smoothness of `ℤ/pⁿ → C/pⁿ` for every `n ≥ 1`,
  and compatible coefficient lifting: for a Cohen ring `C` and a complete local ring `R` with
  residue field of characteristic `p`, every unital ring map `C/p → R/𝔪_R` lifts to a ring map
  `C → R`, by lifting along the square-zero surjections `R/𝔪_R^{n+1} → R/𝔪_R^n` (Stacks
  Lemmas 10.160.6–10.160.7). Taking `R = C` and the map `x ↦ x^p` of the residue field gives a
  *Frobenius lift* of `C`: a ring endomorphism `φ_C` with `φ_C(c) ≡ c^p mod p` for every `c ∈ C`.
  No perfectness of the residue field is assumed. Supplier checks: for `C = ℤ_p` the only
  Frobenius lift is the identity; for `C = W(k)` with `k` perfect it is the Witt vector Frobenius.

### From TauCetiRoadmap.StableReduction

- Layer 1: syntomic morphisms (flat, locally finitely presented, with local complete intersection
  fibres). On affines a ring map is syntomic iff it is Zariski locally on the source standard
  syntomic (Stacks Lemmas 10.136.4 and 10.136.15); `Suggested.lean` uses this description as
  `IsSyntomic`.

## How to read the build

Q5 and Q6 are the commutative algebra of integral perfectoid rings: Q5 proves the tilting
identities (tilt modulo `ϖ^p`, torsion transfer, `A_inf` of a surjection) and fibre products; Q6
proves the relative tilting equivalence, the transfer of completeness and of the valuation-ring
property, and the torsion-free presentations that feed the reduction step of the André lemma. Q7
and Q8 are independent of each other and of Q6: Q7 is general commutative algebra (ind-fppf and
ind-syntomic maps, glueing of flatness, blowup algebras of regular pairs, syntomic hypersurfaces);
Q8 is about continuous valuations (their tilt, the integral approximation lemma, the valuative
nilpotence criterion). Q9 combines Q5–Q8 with PerfectoidQuotients Layer 0 into the ind-syntomic
André lemma and semiperfectoid covers of `p`-Zariski rings. Q10 uses PerfectoidSpaces P4.15.2 and
P7, PrismaticCohomology §§2.30–2.31 and Q5.4 for regular local rings.

[Suggested.lean](Suggested.lean) states the headline theorems: fibre products
(`isIntegralPerfectoid_fibreProduct`), the transfer statements of Česnavičius–Scholze
Proposition 2.1.9 (`isAdicComplete_preTilt_iff`, `valuationRing_iff_preTilt`,
`untilt_dvd_iff_and_exists_isUnit_mul_untilt`, `isAlgClosed_fractionRing_iff`), torsion-free
presentations (`exists_surjective_of_isSMulRegular`, `exists_surjective_of_isSMulRegular_of_roots`,
`exists_surjective_of_isSMulRegular_p`), the approximation lemma (`exists_approximation`), the
nilpotence criterion (`isTopologicallyNilpotent_iff_forall_lt_one`), the ind-syntomic André lemma
(`exists_indSyntomic_andre`), semiperfectoid covers (`exists_semiperfectoid_cover`), perfectoid
covers of regular local rings (`exists_faithfullyFlat_isIntegralPerfectoid`) and, for `F`-finite
residue fields, inside the completed absolute integral closure
(`exists_faithfullyFlat_isIntegralPerfectoid_injective_completion`), and the almost vanishing
of `Tor`, given a cover (`tor_map_mul_root_eq_zero_of_cover`) and for `F`-finite residue fields
(`tor_map_mul_root_eq_zero`), with the definitions `IsSyntomic`, `IsIndSyntomic` and `IsPZariski`;
integral perfectoidness is Tau Ceti's `TauCeti.Perfectoid.IsIntegralPerfectoid`. Its module docstring names the relative tilting equivalence (Q6.1)
as not statable at the pins: the tilt is not a functor there.

## Layer Q5: Tilting identities, torsion transfer and fibre products

The tilt of a `p`-adically complete ring may be computed with any `ϖ | p`, and Fontaine's map is
determined by its values on Teichmüller representatives. For an integral perfectoid ring the tilt
agrees with the ring modulo `ϖ^p`, and the `ϖ`-torsion of the ring and the `ϖ♭`-torsion of the
tilt are isomorphic `A_inf`-modules. These identities give the converse of the decomposition of
PerfectoidQuotients §0.4: fibre products of perfectoid rings along a surjection are perfectoid.

### Q5.1 The tilt computed modulo a divisor of `p`, and uniqueness of `θ`

Let `A` be `p`-adically complete, so that `p` is a nonunit unless `A = 0`. The multiplicative
identification of `A♭` with the `p`-power compatible sequences of `A` is Mathlib's
`Perfection.quotientMulEquiv` at `(p)`, and its zeroth coordinate is `PreTilt.untilt`. Prove:

1. If `ϖ ∈ A` divides `p` and `A` is `ϖ`-adically complete, then reduction gives a ring isomorphism
   `lim_{x ↦ x^p} A/pA → lim_{x ↦ x^p} A/ϖA`, so `A♭` may be computed with `ϖ` in place of `p`.
   No nonzerodivisor hypothesis on `ϖ` and no roots of `ϖ` are assumed
   (Česnavičius–Scholze (2.1.1.3), p. 10; BMS1 Lemma 3.2 (i), p. 19). For the ring of power-bounded
   elements of a perfectoid Tate ring this is the identification `lim_Φ R°/ϖ₀` of
   PerfectoidSpaces P1.4; here `A` is any `ϖ`-adically complete ring.
2. For `A` nonzero, `θ : W(A♭) → A` is the unique ring map with `θ([x]) = x♯` for every `x ∈ A♭`
   (Česnavičius–Scholze §2.1.1 and footnote 6, p. 10).

*Proof route.* For (1): since `ϖ | p`, `A/ϖ` has characteristic `p` (or is zero), and
`x ≡ y mod ϖ` implies `x^{p^m} ≡ y^{p^m} mod ϖ^{m+1}`; so `Perfection.quotientMulEquiv` applies at
`(ϖ)` as well as at `(p)`. The reduction map `lim_F A/p → lim_F A/ϖ` is a ring map (it is induced by
`A/p → A/ϖ`, which commutes with Frobenius) and equals the composite of the inverse of the first
monoid isomorphism with the second, hence is bijective. For (2): two ring maps
`W(A♭) → A` agreeing on Teichmüller representatives agree after composing with `A → A/pⁿ`, where
`p` is nilpotent (`WittVector.eq_of_apply_teichmuller_eq`), hence agree by separatedness.

*Needs:* Mathlib `Perfection.quotientMulEquiv`, `PreTilt.untilt`, `WittVector.fontaineTheta_teichmuller`,
`WittVector.eq_of_apply_teichmuller_eq`, `IsAdicComplete`.

**Checks.**

- For `A = ℤ_p` the compatible sequences are `0` and the constant sequences of `(p−1)`-st roots of
  unity (for `ζ^{p−1} = 1` one has `ζ^p = ζ`), matching `ℤ_p♭ = lim_F 𝔽_p = 𝔽_p`; at `p = 2` the
  only nonzero sequence is constantly `1`, since `−1` has no square root in `ℤ_2`.
- For a perfect `𝔽_p`-algebra `A` (`p = 0`, `ϖ = 0`), `x ↦ x♯` is the identity of `A = A♭` and
  (1) is the identity map.
- For `A = 𝒪_C` with `C` complete algebraically closed, `ε = (1, ζ_p, ζ_{p²}, …)` has `ε♯ = 1 = 1♯`
  with `ε ≠ 1`: the sharp map is not injective, so (2) is a statement about `θ`, not about `♯`.
- The divisibility `ϖ | p` is what makes `x ↦ x^p` a ring map on `A/ϖ`: for `p = 3`, `A = ℤ_3` and
  `ϖ = 9`, `(1 + 1)^3 = 8 ≠ 2 = 1^3 + 1^3` in `ℤ/9`, so `lim_{x ↦ x^3} ℤ/9` is not an inverse limit
  of rings. For `A = 𝒪_C` and `ϖ = p^{1/p}`, (1) gives `lim_F 𝒪_C/ϖ ≅ 𝒪_{C♭}`.

### Q5.2 Tilts and `A_inf` of products and fibre products

Prove:

1. For any family `(A_i)_{i∈I}` of rings, `(∏ A_i)♭ ≅ ∏ A_i♭` by the projections; if the `A_i` are
   `p`-adically complete, so is `∏ A_i`, and `A_inf(∏ A_i) ≅ ∏ A_inf(A_i)` compatibly with `θ`.
   This is the product clause of PerfectoidQuotients §0.6 (`integralPerfectoid_pi_iff`) without
   its perfectoid hypothesis.
2. Let `A → A' ← B` be maps of `p`-adically complete rings with `A'[p^∞] = A'[p]`. Then
   `C = A ×_{A'} B` is `p`-adically complete, `p^{n+1}(A × B) ∩ C ⊆ pⁿC` for all `n`, and the
   induced maps `C♭ → A♭ ×_{A'♭} B♭` and `A_inf(C) → A_inf(A) ×_{A_inf(A')} A_inf(B)` are ring
   isomorphisms compatible with `θ`
   (Česnavičius–Scholze §2.1.1, p. 10, and proof of Proposition 2.1.4, second paragraph, p. 12).

*Proof route.* (1): `(∏ A_i)/p = ∏ (A_i/p)`, and inverse limits and Witt vectors commute with
products. (2), completeness: if `(a, b) = p^{n+1}(a₁, b₁)` lies in `C`, the defect `f(a₁) − g(b₁)` is
killed by `p^{n+1}`, hence by `p`, so `(pa₁, pb₁) ∈ C` and `(a, b) ∈ pⁿC`; thus the `p`-adic topology
of `C` is the subspace topology of `A × B`, in which `C` is closed because `A'` is separated. Tilt:
by Mathlib's `Perfection.quotientMulEquiv`, `C♭` is multiplicatively the monoid of compatible
sequences of `C`, and inverse limits commute with fibre products. `W(−)` commutes with limits;
compatibility with `θ` follows from Q5.1 (2).

*Needs:* Q5.1; Mathlib `PreTilt`, `WittVector`, `IsAdicComplete`, `Perfection.quotientMulEquiv`.

**Checks.**

- For `A' = 0` the fibre product is `A × B` and (2) reduces to (1) for two factors.
- For `B = A'` and `g` the identity, `C = A` and both isomorphisms are identities.
- For `A = B = 𝒪_C` over the residue field `k̄`, `C = 𝒪_C ×_{k̄} 𝒪_C` has tilt
  `𝒪_{C♭} ×_{k̄} 𝒪_{C♭}`.
- The torsion hypothesis enters the completeness step: the defect `f(a₁) − g(b₁)` is killed by
  `p^{n+1}`, and `A'[p^∞] = A'[p]` makes it killed by `p`. It holds for every integral perfectoid
  `A'` (PerfectoidQuotients §0.3) and fails for `A' = ℤ/p²`, where `1` is killed by `p²` but not
  by `p`.

### Q5.3 The tilt and the ring agree modulo `ϖ^p`

Let `A` be integral perfectoid and `ϖ ∈ A` with `ϖ^p | p` and `A` `ϖ`-adically complete; choose
`ϖ♭, p♭` as in the conventions. Prove:

1. `x ↦ x♯` induces ring isomorphisms `A♭/(ϖ♭)^p A♭ ≅ A/ϖ^p A` and `A♭/p♭A♭ ≅ A/pA`;
2. consequently `(ϖ♭)^p | p♭`, the ideals `(ϖ♭)` and `(p♭)` of `A♭` do not depend on the choices,
   and `A♭` is `ϖ♭`-adically complete

(Česnavičius–Scholze (2.1.2.2), p. 11; BMS1 proof of Lemma 3.10 (i), pp. 22–23). This is the form,
for integral perfectoid rings with torsion and possibly without a Tate structure, of the
isomorphism `R♭°/ϖ♭ ≅ R°/ϖ` for perfectoid Tate rings in PerfectoidSpaces P1.4–P1.6.

*Proof route.* Modulo `ϖ^p`, `x ↦ x♯` is the projection of `lim_F A/ϖ` (Q5.1 (1)) to the
coordinate of index one followed by the Frobenius `A/ϖ → A/ϖ^p`, which is bijective
(PerfectoidSpaces P1.24); so it is a ring map, surjective because Frobenius of `A/p` is surjective,
and its kernel is generated by `(ϖ♭)^p` as in the proof of BMS1 Lemma 3.10 (i). The same argument
with `p` gives the second isomorphism. Then `p♭ ↦ 0` in `A/ϖ^p` gives `(ϖ♭)^p | p♭`, and a
`ϖ♭`-adic Cauchy sequence stabilizes coordinatewise in `lim_F A/ϖ`.

*Needs:* Q5.1; PerfectoidSpaces P1.24; PerfectoidQuotients §0.2 (`frobenius_surjectivity_equivalences`);
Mathlib `PreTilt.untilt`.

**Checks.**

- For `A = 𝒪_C` and `ϖ = p^{1/p}`: `𝒪_{C♭}/(p♭) ≅ 𝒪_C/p`.
- For a perfect `𝔽_p`-algebra with `ϖ = 0`: `p♭ = 0`, `ϖ♭ = 0`, and (1) is the identity of `A`.
- For `A` the `p`-adic completion of `ℤ_p[p^{1/p^∞}]`, `ϖ = p^{1/p}` and `t = p♭`, `A♭` is the
  `t`-adic completion of `𝔽_p[t^{1/p^∞}]` and `A♭/t ≅ 𝔽_p[t^{1/p^∞}]/(t) ≅ A/p`.
- Only the ideals are canonical: in `𝒪_{C♭}`, `p♭` and `u·p♭` for a unit `u ≠ 1` both have sharp a
  unit multiple of `p`, and both generate the same ideal.

### Q5.4 Torsion of a perfectoid ring and of its tilt

Let `A` be integral perfectoid, `ξ` a generator of `ker θ` and `p♭ = ξ₀`. Prove:

1. the `A_inf(A)`-module `M = {(x, y) ∈ A_inf(A)² : ξx = py} / {(pz, ξz)}` maps isomorphically to
   `A♭[p♭]` by `(x, y) ↦ x mod p` and to `A[p]` by `(x, y) ↦ y mod ξ`, so `A♭[p♭] ≅ A[p]` as
   `A_inf(A)`-modules;
2. for `ϖ` with `ϖ^p | p` and `A` `ϖ`-adically complete and `ϖ♭` with `(ϖ♭)♯` a unit multiple of
   `ϖ`, there is an `A_inf(A)`-module isomorphism `A♭[ϖ♭] ≅ A[ϖ]`; in particular `A♭` is
   `ϖ♭`-torsion-free iff `A` is `ϖ`-torsion-free

(Česnavičius–Scholze (2.1.2.5), p. 11). With `ϖ` replaced by `(ϖ♭)♯`, (2) applied to the roots
`((ϖ♭)^{1/pⁿ})♯` recovers `A[ϖ^{1/p^∞}] = A[ϖ] = A[ϖ^∞]`, which is
`compatible_root_power_torsion` of PerfectoidQuotients §0.4.

*Proof route.* `p` and `ξ` are nonzerodivisors on `A_inf(A)` (`A♭` perfect;
`theta_generator_nonzerodivisor`), so `M = Tor_1^{A_inf}(A_inf/p, A_inf/ξ)` computed by the two
Koszul resolutions is `(A_inf/ξ)[p] = A[p]` and `(A_inf/p)[ξ] = A♭[ξ₀]`, since `ξ ≡ [ξ₀] mod p`.
For (2), `[ϖ♭]` acts on `A[p]` through `(ϖ♭)♯` and on `A♭[p♭]` through `ϖ♭`; as `ϖ | p` and
`(ϖ♭)^p | p♭` (Q5.3), `A[ϖ] ⊆ A[p]` and `A♭[ϖ♭] ⊆ A♭[p♭]` are the kernels of `[ϖ♭]` on the two sides.

*Needs:* Q5.3; PerfectoidQuotients §0.2 (`theta_generator_iff_unit_coeff_one`,
`theta_generator_nonzerodivisor`).

**Checks.**

- For `A = 𝒪_C` both sides of (1) vanish.
- For a perfect `𝔽_p`-algebra, `ξ = p`, `p♭ = 0`, and (1) says `A♭[0] = A ≅ A[p] = A`.
- For `A = 𝒪_C × 𝔽̄_p` (integral perfectoid by PerfectoidQuotients §0.6) and `ϖ = (p^{1/p}, 0)`:
  `A[ϖ] = 0 × 𝔽̄_p` and `A♭[ϖ♭] = 0 × 𝔽̄_p`, matching (2), and the same holds for the root
  `ϖ = (p^{1/p²}, 0)`, whose `p`-th power `(p^{1/p}, 0)` divides `p = (p, 0)`. The element
  `(p^{1/p}, 1)` also has `p`-th power dividing `p`, but it is not admissible in (2):
  `⋂_n (p^{1/p}, 1)ⁿA = 0 × 𝔽̄_p ≠ 0`, so `A` is not `(p^{1/p}, 1)`-adically separated.
- The perfectoid hypothesis is needed: for the semiperfect but nonreduced `A = 𝔽_p[t^{1/p^∞}]/(t)`
  with `ϖ = 0`, `A♭ = lim_F A` is the `t`-adic completion of `B = 𝔽_p[t^{1/p^∞}]`: Frobenius of `B`
  is an automorphism carrying `(t)` to `(t^p)`, and `(x_n)_n ↦ (F^n(x_n))_n` identifies `lim_F B/(t)`
  with `lim_n B/(t^{pⁿ})`, a domain. So `A♭[0] = A♭` is reduced while `A[0] = A` contains the
  nonzero nilpotent `t^{1/p}`. More precisely, as `A_inf(A)`-modules, the Teichmüller lift of
  `t ∈ A♭` acts nontrivially on `A♭` but acts as zero on `A`, since `t♯ = 0` there; thus
  (2) fails even as a module assertion. The value `A♭ = 𝔽_p` would be wrong: the sequence
  `(t^{1/p^{n+1}} mod t)_n` is a nonzero element of `lim_F A`.

### Q5.5 `A_inf` of a surjection of perfectoid rings

Let `f : A ↠ A'` be a surjection of integral perfectoid rings and `ξ_A` a generator of `ker θ_A`.
Prove that `A_inf(f)` is surjective, `ker(A_inf(f))/ξ_A ker(A_inf(f)) ≅ ker f`, `A_inf(f)` maps
`ker θ_A` onto `ker θ_{A'}`, and the induced maps `A_inf(A) → A_inf(A') ×_{A'} A` and
`[p♭]A_inf(A) → [p♭]A_inf(A') ×_{pA'} pA` are surjective (Česnavičius–Scholze Proposition 2.1.4,
first part, (2.1.4.1), and proof, first paragraph, p. 12).

*Proof route.* By completeness, surjectivity of `A_inf(f)` may be checked modulo `p` and then
modulo `p♭`, where it is `A♭/p♭ ≅ A/p ↠ A'/p ≅ A'♭/p♭` (Q5.3). `ξ_A` maps to a generator of
`ker θ_{A'}` (`theta_map_preserves_generator`); the snake lemma for multiplication by `ξ_A` on
`0 → ker A_inf(f) → A_inf(A) → A_inf(A') → 0` gives the kernel statements. The first fibre-product
surjection follows from surjectivity on `ker θ` and of `θ_A`; the second by applying the first to
the quotients by `p`-power torsion (`perfectoid_torsion_free_quotient`).

*Needs:* Q5.3, Q5.4; PerfectoidQuotients §§0.2, 0.4; Mathlib `WittVector.map`.

**Checks.**

- For `f` the identity every assertion is trivial.
- For `A = 𝒪_C → A' = 𝒪_C/(p^{1/p^∞}) = k̄`: `W(𝒪_{C♭}) → W(k̄)` is surjective with kernel
  `W(𝔪_{C♭})`, and `ker θ` maps onto `ker θ_{k̄} = (p)`.
- For `A' = 0`, `ker f = A` and `ker(A_inf(f))/ξ_A = A_inf(A)/ξ_A = A`.

### Q5.6 Fibre products of perfectoid rings

**Theorem** (`isIntegralPerfectoid_fibreProduct`). Let `f : A ↠ A'` be a surjection of integral
perfectoid rings and `g : B → A'` any map from an integral perfectoid ring. Then
`C = A ×_{A'} B` (the subring of `A × B` on which `f` and `g` agree) is integral perfectoid, and the
projections induce `C♭ ≅ A♭ ×_{A'♭} B♭` (Česnavičius–Scholze Proposition 2.1.4, second part, and
proof, second paragraph, p. 12).

`Suggested.lean` states integral perfectoidness of `C`; the tilt identification is Q5.2 (2).

*Proof route.* By Q5.2 (with `A'[p^∞] = A'[p]`, PerfectoidQuotients §0.3) `C` is `p`-adically
complete, `C♭` is the fibre product of tilts and `A_inf(C)` that of the `A_inf`. By Q5.5 there is
`ξ = p + [p♭]x ∈ A_inf(C)` mapping to generators of `ker θ` for `A`, `A'` and `B`; the snake lemma
gives `A_inf(C)/(ξ) ≅ C`, and the perfect-prism characterization (PerfectoidSpaces P4.15.2;
Česnavičius–Scholze (2.1.2.1)) makes `C` integral perfectoid.

*Needs:* Q5.2, Q5.5; PerfectoidQuotients §§0.2–0.3; PerfectoidSpaces P4.15.2; Tau Ceti
`TauCeti.Perfectoid.IsIntegralPerfectoid`.

**Checks.**

- For `A' = 0` this is integral perfectoidness of `A × B` (PerfectoidQuotients §0.6).
- `𝒪_C ×_{k̄} 𝒪_C` is integral perfectoid with tilt `𝒪_{C♭} ×_{k̄} 𝒪_{C♭}`.
- The decomposition `A ≅ A_tf ×_{(A_tf/ϖ)_red} (A/ϖ)_red` of PerfectoidQuotients §0.4 is an
  instance, with the surjection `A_tf ↠ (A_tf/ϖ)_red`.
- For `A = B = 𝔽_p[t^{1/p^∞}]` and `f = g` the quotient map `t ↦ 0` onto `A' = 𝔽_p`, the fibre product
  `{(a, b) : a(0) = b(0)}` is perfect, hence integral perfectoid with `π = 0`, and is its own tilt, as
  `C♭ ≅ A♭ ×_{A'♭} B♭` predicts.

### Q5.7 Glueing a perfectoid ring with a perfect algebra

Let `A` be integral perfectoid and `ϖ | p` with `A` `ϖ`-adically complete. For every perfect
`𝔽_p`-algebra `B` and ring map `B → (A/ϖ)_red`, the ring `A ×_{(A/ϖ)_red} B` is integral perfectoid
(Česnavičius–Scholze Example 2.1.5, p. 13).

*Proof route.* `(A/ϖ)_red` is perfect (a reduced quotient of the semiperfect `A/p`), hence integral
perfectoid, and `A → (A/ϖ)_red` is surjective; apply Q5.6.

*Needs:* Q5.6; Tau Ceti `TauCeti.Perfectoid.IsIntegralPerfectoid.of_perfectRing`.

**Checks.**

- For `A = 𝒪_C`, `ϖ = p` and `𝔽_p → k̄`, the subring `{x ∈ 𝒪_C : x mod 𝔪 ∈ 𝔽_p}` is integral
  perfectoid.
- For `B = (A/ϖ)_red` with the identity, the fibre product is `A`.
- The direction of the map matters: a map `(A/ϖ)_red → B` does not define a fibre product with `A`
  over `(A/ϖ)_red`.

### Examples

`𝒪_C` and its tilt satisfy every identity of this layer with trivial torsion; `𝒪_C × 𝔽̄_p` and
`𝒪_C ×_{k̄} 𝒪_C` are integral perfectoid rings with `ϖ`-torsion, respectively not domains, on which
Q5.4 and Q5.6 are tested.

### Dependencies

*Needs:* Mathlib `PreTilt`, `Perfection.quotientMulEquiv`, `WittVector`; PerfectoidQuotients §§0.2–0.4
and §0.6; PerfectoidSpaces P1.24 and P4.15.2; Tau Ceti `TauCeti.Perfectoid.IsIntegralPerfectoid`.

## Layer Q6: The relative tilting equivalence, valuation rings and torsion-free presentations

Fixing a generator `ξ` of `ker θ`, tilting is an equivalence between integral perfectoid
`A`-algebras and complete perfect `A♭`-algebras, and it matches adic completeness on both sides.
Valuation rings of any rank, their value groups and algebraic closedness of fraction fields
correspond under it. The last target writes every integral perfectoid ring as a quotient of a
torsion-free one, keeping compatible roots of `ϖ`.

### Q6.1 The relative tilting equivalence over an integral perfectoid ring

Let `A` be integral perfectoid and `ξ = (ξ₀, ξ₁, …)` a generator of `ker θ_A`. Prove that
`A' ↦ A'♭` and `B ↦ W(B)/(ξ)` are mutually quasi-inverse equivalences between the category of
integral perfectoid `A`-algebras and the category of perfect `A♭`-algebras that are
`ξ₀`-adically complete; under it `θ_{A'}` is the quotient map and `ξ` generates `ker θ_{A'}` for
every integral perfectoid `A`-algebra `A'` (Česnavičius–Scholze Proposition 2.1.9, first assertion,
p. 14, and (2.1.2.1), p. 10). Morphisms are ring maps under `A`, respectively under `A♭`.

*Proof route.* For a perfect `ξ₀`-complete `A♭`-algebra `B`, `W(B)` is `(p, [ξ₀])`-complete, and
`ξ` stays distinguished because `ξ₁` maps to a unit, so `(W(B), (ξ))` is a perfect prism
(PrismaticCohomology §§0.61–0.63, §0.79); PerfectoidSpaces P4.15.2 gives that `W(B)/(ξ)` is
integral perfectoid with tilt `B`. Conversely `ξ` generates `ker θ_{A'}`
(`theta_map_preserves_generator`), so `A' = W(A'♭)/(ξ)`, and by Q5.3 completeness for `(p♭)` is
`ξ₀`-adic completeness.

*Needs:* Q5.3; PerfectoidQuotients §0.2; PerfectoidSpaces P4.15.2; PrismaticCohomology §§0.61–0.63,
§0.79; Mathlib `WittVector`, `PerfectRing`.

**Checks.**

- For `A` of characteristic `p` (`ξ = p`, `ξ₀ = 0`) the equivalence is the identity on perfect
  `A`-algebras (`0`-adic completeness is automatic).
- For `A = 𝒪_C`: `𝒪_C ↦ 𝒪_{C♭}` and `𝒪_C/(p^{1/p^∞}) = k̄ ↦ k̄`.
- The completeness condition is needed: the perfect `𝒪_{C♭}`-algebra `C♭` is not `ξ₀`-adically
  separated (`ξ₀` is a unit there), and `W(C♭)/(ξ) = 0` because `ξ` becomes a unit; the zero ring
  is not the untilt of `C♭`.

### Q6.2 Adic completeness transfers along tilting

**Theorem** (`isAdicComplete_preTilt_iff`). Let `A'` be a nonzero integral perfectoid ring, `ξ` a
generator of `ker θ_{A'}` and `ϖ♭ ∈ A'♭` with `ϖ♭ | ξ₀`. Then `A'♭` is `ϖ♭`-adically complete iff
`A'` is `(ϖ♭)♯`-adically complete (Česnavičius–Scholze Proposition 2.1.9, completeness assertion,
and proof, first paragraph, pp. 14–15). No torsion-freeness is assumed; `ϖ♭ = 0` is allowed.

*Proof route.* If `A'` is `ϖ`-complete, `ϖ = (ϖ♭)♯`: put `b = (ϖ♭)^{1/p}`; `(b♯)^p = ϖ` divides
`p` up to a unit, and Q5.3 applied to `b♯` gives `b`-adic, hence `ϖ♭`-adic, completeness of `A'♭`.
Conversely `W(A'♭)` is `[ϖ♭]`-adically complete, and it suffices that `ξW(A'♭)` be closed
(Stacks Lemma 10.96.10), i.e. `ξW ∩ [ϖ♭]ⁿW = ξ[ϖ♭]ⁿW`. Using the decomposition of PerfectoidQuotients
§0.4 reduce to `ϖ♭` a nonzerodivisor and `n = 1`. If `ξw ∈ ([ϖ♭])` with `w = Vᵐ(w_m, w_{m+1}, …)`
and `w_m ∉ (ϖ♭)^{pᵐ}`, the Witt coordinates of `ξw` give `(ϖ♭)^{p^{m+1}} | w_m^p`, hence
`(ϖ♭)^{pᵐ} | w_m` by perfectness, a contradiction.

*Needs:* Q6.1, Q5.3; PerfectoidQuotients §0.4 (`perfectoid_torsion_free_quotient`); Mathlib
`WittVector.verschiebung`, `IsAdicComplete`, `PreTilt.untilt`.

**Checks.**

- For `A' = 𝒪_C` and `ϖ♭ = (p♭)^{1/p}` both rings are complete.
- For `ϖ♭ = 0` (allowed when `ξ₀ = 0`, i.e. `p = 0` in `A'`) both sides are completeness for the
  zero ideal, which always holds.
- For `A' = ∏_{n∈ℕ} 𝒪_C` and `ϖ♭` the constant sequence `(p♭)^{1/p}`, both `A'` and
  `A'♭ = ∏ 𝒪_{C♭}` are complete although neither is noetherian.
- For `A' = 𝒪_C` and `ϖ♭ = (p♭)²`, which does not divide `ξ₀`, both rings are still complete: the
  divisibility is the hypothesis the proof route uses (it makes `(ϖ♭)♯` divide `p`), not a boundary of
  the equivalence.

### Q6.3 The tilt of a `p`-adically complete valuation ring

Let `V` be a valuation ring that is `p`-adically complete, with `p` a nonunit of `V`. Prove that
`V♭` is a valuation ring, that for `x, y ∈ V♭` one has `x | y` in `V♭` iff `x♯ | y♯` in `V`, that
`x♯ = 0` only for `x = 0`, and that `x ↦ x♯` induces an injective order-preserving homomorphism
`Frac(V♭)^×/(V♭)^× → Frac(V)^×/V^×` (Česnavičius–Scholze proof of Proposition 2.1.9, second
paragraph, first sentence, p. 15). No perfectoid hypothesis: only the multiplicative description of
the tilt is used. Mathlib's `PreTilt.isDomain` is the rank-one valued-field case.

*Proof route.* By `Perfection.quotientMulEquiv`, `V♭` is multiplicatively the monoid of compatible
sequences `(x_n)` of `V` with `x♯ = x_0`. If `x♯ = 0` then every `x_n^{pⁿ} = 0`, so `x = 0`. If
`x♯ | y♯` with `x ≠ 0`, then for each `n` the element `x_n ≠ 0` has `x_n^{pⁿ} = x♯` dividing
`y♯ = y_n^{pⁿ}`; for the valuation `|·|` of `V`, written multiplicatively, this says
`|y_n|^{pⁿ} ≤ |x_n|^{pⁿ}`, hence `|y_n| ≤ |x_n|` in the torsion-free ordered value group, that is,
`x_n | y_n`. So `z_n = y_n/x_n ∈ V` is a compatible sequence with `xz = y`. Totality of the order on
values gives the valuation-ring property.

*Needs:* Mathlib `ValuationRing`, `ValuationRing.ValueGroup`, `PreTilt`, `Perfection.quotientMulEquiv`.

**Checks.**

- For `V = 𝒪_C`, `V♭ = 𝒪_{C♭}`.
- For `V = ℤ_p`, `V♭ = 𝔽_p` is a field: a valuation ring with trivial value group, so the
  value-group map `{1} → ℤ` is not surjective.
- For `V = 𝔽_p⟦t⟧` (`p = 0`), `V♭ = lim_F 𝔽_p⟦t⟧ = ⋂ 𝔽_p⟦t^{pⁿ}⟧ = 𝔽_p`: the tilt can lose the whole
  value group.
- Divisibility reverses the multiplicative valuation: in `V = 𝒪_C`, `x = 1` and
  `y = p♭ = (p^{1/pⁿ})_n` have `x♯ = 1` dividing `y♯ = p`, with `|y_n| = |p|^{1/pⁿ} ≤ 1 = |x_n|` and
  quotient `z = p♭`; the opposite inequality `|x_n| ≤ |y_n|` would make `p` a unit of `𝒪_C`.

### Q6.4 Tilting of perfectoid valuation rings

**Theorem** (`valuationRing_iff_preTilt`). A nonzero integral perfectoid ring `A'` is a valuation
ring iff `A'♭` is (Česnavičius–Scholze Proposition 2.1.9, valuation-ring assertion, p. 14).

**Theorem** (`untilt_dvd_iff_and_exists_isUnit_mul_untilt`). If moreover `A'` is a valuation ring,
then `x | y` in `A'♭` iff `x♯ | y♯` in `A'`, and every `a ∈ A'` is `u · b♯` with `u ∈ A'^×` and
`b ∈ A'♭`; together, `x ↦ x♯` induces an order-preserving isomorphism of value groups
`Frac(A'♭)^×/(A'♭)^× ≅ Frac(A')^×/A'^×` (Česnavičius–Scholze Proposition 2.1.9 and proof, second
paragraph, pp. 14–15). No rank assumption.

*Proof route.* If `A'` is a valuation ring, so is `A'♭` by Q6.3. If `A'♭` is, then by Q5.3, Q5.4
and PerfectoidQuotients §0.4 the ring `A'` is local, `p`-torsion-free unless `pA' = 0` (in which
case `A' = A'♭`), and reduced. Dividing by a power of `(p♭)♯` one may assume `a ∉ pA'`; then
`a = b♯ + (p♭)♯c` with `b ∉ (p♭)` (Q5.3), and `b` strictly divides `p♭`, so
`a = b♯ (1 + (p♭/b)♯ c)` with the second factor a unit. This gives the valuation-ring property and
surjectivity on value groups; injectivity is Q6.3.

*Needs:* Q6.3, Q5.3, Q5.4; PerfectoidQuotients §0.4; Mathlib `ValuationRing`, `ValuationRing.ValueGroup`.

**Checks.**

- `𝒪_C` and `𝒪_{C♭}` correspond, both with value group `|C^×| = |C♭^×|`.
- `𝒪_C × 𝒪_C` is integral perfectoid but not a domain, and neither is its tilt `𝒪_{C♭} × 𝒪_{C♭}`.
- The completion of `ℤ_p[p^{1/p^∞}]` and the `t`-adic completion of `𝔽_p[t^{1/p^∞}]` correspond,
  with value group `ℤ[1/p]` on both sides; for `t = (p, p^{1/p}, p^{1/p²}, …)` one has
  `(t^{1/p})♯ = p^{1/p}`, and `1 + p = u · 1♯` with `u = 1 + p` a unit exhibits the
  unit-times-sharp form.
- For `pA' = 0` (a perfect valuation ring) `♯` is the identity and both assertions are trivial.

### Q6.5 Localizations of complete valuation rings are complete

Let `V` be a valuation ring and `a ∈ V` with `V` `a`-adically complete. Prove that `V_𝔮` is
`a`-adically complete for every prime `𝔮 ∋ a`, and that if `V` is complete for its valuation
topology then so is `V_𝔮` for every prime `𝔮` (Česnavičius–Scholze proof of Proposition 2.1.9, last
paragraph and footnote 8, p. 15). `a = 0` is allowed.

*Proof route.* For `a = 0` there is nothing to prove: every ring is complete for the zero ideal.
Let `a ≠ 0`, so that multiplication by `aⁿ` is injective on the domains `V` and `V_𝔮`. Every
element of `V ∖ 𝔮` divides every element of `𝔮`, so `𝔮 ≅ 𝔮V_𝔮` and `𝔮` kills `V_𝔮/V`. The snake
lemma for multiplication by `aⁿ` on `0 → V → V_𝔮 → V_𝔮/V → 0` gives exact sequences
`0 → V_𝔮/V → V/aⁿ → V_𝔮/aⁿ → V_𝔮/V → 0` (the outer terms are the kernel and cokernel of `aⁿ` on
`V_𝔮/V`, which `a ∈ 𝔮` kills); in this inverse system the transition maps on the left copy are
multiplication by `a`, hence zero, and passing to the limit gives completeness of `V_𝔮`. For the
valuation topology: if `𝔮 = 0`, `V_𝔮 = Frac(V)` carries the trivial valuation, whose topology is
discrete, hence complete; if `𝔮 ≠ 0`, completeness of `V` is completeness of the nonunital ring `𝔮`
with its principal ideals open, which `𝔮 ≅ 𝔮V_𝔮` does not change.

*Needs:* Mathlib `ValuationRing`, `Localization.AtPrime`, `IsAdicComplete`.

**Checks.**

- For `V = 𝒪_C` and `𝔮 = 𝔪`, `V_𝔮 = V`.
- The prime `𝔮 = 0` is excluded for `a ≠ 0`: `Frac(V)` is not `a`-adically separated (`a` is a unit).
- For `a = 0`, `0`-adic completeness holds for every ring and the statement is empty. The exact
  sequence of the proof route needs `a ≠ 0`: for `V = ℤ_p`, `𝔮 = 0` and `a = 0` it would embed the
  torsion module `ℚ_p/ℤ_p` into the torsion-free `ℤ_p`.

### Q6.6 Localizations of perfectoid valuation rings

Let `V` be an integral perfectoid valuation ring and `𝔮` a prime, excluding `𝔮 = 0` when `V` has
mixed characteristic `(0, p)`. Prove that `V_𝔮` is an integral perfectoid valuation ring; if `V` has
mixed characteristic and dimension `≥ 1`, its height-one prime `𝔭 = √(pV)` satisfies
`(V_𝔭)♭ ≅ (V♭)_{𝔭♭}` with `𝔭♭ = √(p♭V♭)`, and `V_𝔭[1/p]` is a perfectoid field with ring of integers
`V_𝔭` (Česnavičius–Scholze proof of Proposition 2.1.9, third paragraph, and Remark 2.1.10, p. 15).

*Proof route.* On `V` and `V♭` the `p`- and `p♭`-adic topologies are the valuation topologies;
Q6.5 gives completeness of `V_𝔮` and `(V♭)_{𝔮♭}`. Q5.3 identifies `V/p` with `V♭/p♭` compatibly with
localization, so `(V♭)_{𝔮♭}` is a complete perfect valuation ring whose untilt (Q6.1) is `V_𝔮`; Q6.4
identifies valuation rings. A rank-one `p`-complete integral perfectoid valuation ring is the ring of
integers of the perfectoid field `V_𝔭[1/p]` (PerfectoidSpaces P1.25).

*Needs:* Q6.5, Q6.4, Q6.1, Q5.3; PerfectoidSpaces P1.25.

**Checks.**

- For `V = 𝒪_C` with `C` of characteristic `0` the only allowed prime is `𝔪`, giving `V`; for
  `V = 𝒪_{C♭}` (characteristic `p`) the prime `0` is also allowed and gives the perfect field `C♭`.
- For a rank-two perfectoid valuation ring with height-one prime `𝔭`, `V_𝔭` is the rank-one
  coarsening.
- The excluded case: for mixed characteristic `V`, `V_0 = Frac(V)` is a field in which `p` is a unit,
  not `p`-adically separated, hence not integral perfectoid in the complete sense; in characteristic
  `p`, `Frac(V)` is a perfect field and is integral perfectoid with `π = 0`.

### Q6.7 Algebraically closed fraction fields under tilting

**Theorem** (`isAlgClosed_fractionRing_iff`). An integral perfectoid valuation ring `A'` has
algebraically closed fraction field iff `A'♭` does (Česnavičius–Scholze Proposition 2.1.9,
parenthetical assertion, and proof, third paragraph, pp. 14–15).

*Proof route.* If `pA' = 0` then `A' = A'♭`. Otherwise `A'` has mixed characteristic and dimension
`≥ 1`, `Frac(A') = Frac(A'_𝔭)` for the height-one prime, and by Q6.6 `K = A'_𝔭[1/p]` is a perfectoid
field with tilt `Frac((A'♭)_{𝔭♭}) = Frac(A'♭)`; PerfectoidSpaces P3.7 (`isAlgClosed_tilt`,
`isAlgClosed_of_tilt`) concludes.

*Needs:* Q6.6, Q6.4; PerfectoidSpaces P3.7; Mathlib `IsAlgClosed`, `FractionRing`.

**Checks.**

- For `A' = 𝒪_C`: `C` is algebraically closed iff `C♭` is.
- For the completion of `ℤ_p[p^{1/p^∞}]` (`p` odd), `X² − u` with `u ∈ ℤ_p^×` a non-square has no
  root (the residue field is `𝔽_p`), so the fraction field is not algebraically closed, and by the
  theorem neither is `𝔽_p((t^{1/p^∞}))^∧`.
- For a dimension-zero `A'` (a perfect field of characteristic `p`) the statement is a tautology.

### Q6.8 Perfectoid rings are quotients of torsion-free ones

Let `A` be integral perfectoid and `ϖ` with `ϖ^p | p` and `A` `ϖ`-adically complete.

**Theorem** (`exists_surjective_of_isSMulRegular`). There are an integral perfectoid `Ã`, an element
`ϖ̃ ∈ Ã` with `ϖ̃^p | p` such that `Ã` is `ϖ̃`-torsion-free and `ϖ̃`-adically complete, and a
surjection `Ã ↠ A` carrying `ϖ̃` to `ϖ` (Česnavičius–Scholze Proposition 2.1.12, p. 17).

**Theorem** (`exists_surjective_of_isSMulRegular_of_roots`). If `ϖ` has a compatible system of
`p`-power roots `(ϖ^{1/pⁿ})`, then `Ã` and `ϖ̃` can be chosen with a compatible system of `p`-power
roots `(ϖ̃^{1/pⁿ})` mapping to `(ϖ^{1/pⁿ})` (proof of Proposition 2.1.12 with `u = 1`, pp. 17–18;
the form used in the proof of Theorem 2.3.4, p. 25).

**Theorem** (`exists_surjective_of_isSMulRegular_p`). Every integral perfectoid ring is a quotient
of a `p`-torsion-free integral perfectoid ring (Proposition 2.1.12, second assertion, p. 17).

*Proof route.* Write `A = W(A♭)/(ξ)` with `ξ₁` a unit and choose `ϖ♭` with `ϖ = (ϖ♭)♯u`,
`u ∈ A^×` (Q5.3); with roots, take `ϖ♭ = (ϖ^{1/pⁿ})_n` (Mathlib `Perfection.quotientMulEquiv`), so
`u = 1`. Let `B₀ = 𝔽_p[X_a^{1/p^∞} : a ∈ A♭]` with `B₀ ↠ A♭`, `X_a ↦ a`; lift the `ξ_i` to
`ξ̃_i ∈ B₀` with `X_{ϖ♭}^p | ξ̃₀`, and let `B` be the `X_{ϖ♭}`-adic completion of `B₀[1/ξ̃₁]`, a perfect
`𝔽_p`-algebra that surjects onto `A♭` and is `ξ̃₀`-adically complete because `(ξ̃₀) ⊆ (X_{ϖ♭})`
(Stacks Lemma 10.96.8). Let `ξ̃ ∈ W(B)` have Witt coordinates `ξ̃_i`. Then `(W(B), (ξ̃))` is a
perfect prism: `W(B)` is `(p, [ξ̃₀])`-adically complete, and `ξ̃` is distinguished because
`δ(ξ̃)` reduces to the unit `ξ̃₁` of `B = W(B)/p`. So `Ã' = W(B)/(ξ̃)` is integral perfectoid with
tilt `B` (PerfectoidSpaces P4.15.2; Česnavičius–Scholze (2.1.2.1), p. 10), and it surjects onto
`A` because `W(B) ↠ W(A♭)` carries `ξ̃` to `ξ`. With `ϖ̃' = (X_{ϖ♭})♯` one has `ϖ̃'^p | p`, as `p` is a
unit multiple of `(ξ̃₀)♯` in `Ã'`; `Ã'` is `ϖ̃'`-complete (Q6.2) and `ϖ̃'`-torsion-free (Q5.4, as `B`
is `X_{ϖ♭}`-torsion-free). In general let `ũ ∈ Ã'` lift `u`. The `p`-adic completion `R₁` of the
étale `Ã'`-algebra `Ã'[1/ũ]` is integral perfectoid (`perfectoid_completely_etale_henselization` of
PerfectoidQuotients §0.6, which is stated for `p`-adic completions), and the `ϖ̃'`-adic completion
`Ã` of `R₁` is integral perfectoid (`perfectoid_sharp_ideal_completion` of PerfectoidQuotients §0.6
for the image of `X_{ϖ♭}` in `R₁♭`, whose sharp is the image of `ϖ̃'` by `untilt_natural`). Since
`p ∈ ϖ̃'^p Ã'`, `R₁/ϖ̃'ⁿ = Ã'[1/ũ]/ϖ̃'ⁿ` for every `n`, so `Ã` is the `ϖ̃'`-adic completion of
`Ã'[1/ũ]` (the ring of Česnavičius–Scholze's proof, there via their Corollary 2.1.6, p. 13), and
it surjects onto the `ϖ`-adically complete `A`. Put `ϖ̃ = ϖ̃'ũ`, a unit multiple of `ϖ̃'` in `Ã`:
then `ϖ̃^p | p`, `Ã` is `ϖ̃`-adically complete, and `Ã` is `ϖ̃`-torsion-free, being the completion of
the `ϖ̃'`-torsion-free `Ã'[1/ũ]` along a nonzerodivisor. With roots `Ã = Ã'` and the roots
`((X_{ϖ♭})^{1/pⁿ})♯` lift `ϖ^{1/pⁿ}`. For `p`-torsion-freeness take `ξ̃₀ = X_{ξ₀}`, let `B` be the
`X_{ξ₀}`-adic completion of `B₀[1/ξ̃₁]` and `Ã = Ã'`: Q5.4 (1) gives `Ã'[p] ≅ B[X_{ξ₀}] = 0`.

*Needs:* Q5.3, Q5.4, Q6.2; PerfectoidSpaces P4.15.2; PerfectoidQuotients §0.2 (`untilt_natural`) and
§0.6 (`perfectoid_completely_etale_henselization`, `perfectoid_sharp_ideal_completion`); Mathlib
`PerfectClosure`, `MvPolynomial`, `WittVector`, `Perfection.quotientMulEquiv`, `Localization.Away`,
`AdicCompletion`.

**Checks.**

- For `A = k̄` (perfect, `ϖ = 0`): `Ã` the `p`-adic completion of `W(k̄)[p^{1/p^∞}]` with
  `ϖ̃ = p^{1/p}` works, and it carries the roots `p^{1/p^{n+1}}` lifting the zero roots of `0`.
- For `A` already `ϖ`-torsion-free, `Ã = A` works.
- For `A = 𝔽_p`, the third theorem is realized by the completion of `ℤ_p[p^{1/p^∞}] → 𝔽_p`.
- The roots variant is genuinely stronger: in the first theorem `ϖ̃` need not have roots in `Ã`
  mapping to given roots of `ϖ`, since the lift `ϖ̃ = ϖ̃'ũ` involves the unit `ũ`.
- The last completion is `ϖ̃'`-adic, and the `p`-adic one does not replace it. Let `A` be a perfect
  `𝔽_p`-algebra with `ξ = p`, choose `ϖ = 0 = ϖ♭u` with a unit `u ≠ 1`, the lifts `ξ̃₀ = 0`,
  `ξ̃₁ = 1`, `ξ̃_i = 0` for `i ≥ 2`, and `ũ = X_u`. Then `ξ̃ = p` in `W(B)`, `Ã' = B` has `p = 0`, and
  `B[1/X_u]` is its own `p`-adic completion. It is not `X_0`-adically complete: `Σ_n (X_0/X_u)ⁿ`
  converges `X_0`-adically to an inverse of `1 − X_0/X_u`, which has none in `B[1/X_u]`: sending
  `X_0` and `X_u` to `t` and every other `X_a` to `1` maps `B[1/X_u]` to the `t`-adic completion of
  `𝔽_p[t^{1/p^∞}]` with `t` inverted, a nonzero ring, and kills `X_u − X_0`.

### Examples

`𝒪_C ↔ 𝒪_{C♭}` and the completed `ℤ_p[p^{1/p^∞}] ↔ 𝔽_p[t^{1/p^∞}]^∧` are the valuation-ring examples
of Q6.4 and Q6.7; `∏ 𝒪_C` tests completeness transfer without noetherian hypotheses; `k̄` and `𝔽_p`
test the presentations of Q6.8.

### Dependencies

*Needs:* Layer Q5; PerfectoidQuotients §§0.2, 0.4, 0.6; PerfectoidSpaces P1.25, P3.7 and P4.15.2;
PrismaticCohomology §§0.61–0.63 and §0.79; Tau Ceti `TauCeti.Perfectoid.IsIntegralPerfectoid`.

## Layer Q7: Ind-fppf and ind-syntomic ring maps

Česnavičius–Scholze's improvement of André's lemma replaces faithful flatness by ind-syntomicity.
This layer defines ind-fppf and ind-syntomic ring maps with their factorization criteria and
stability properties, and proves the three commutative-algebra facts the proof of the André lemma
uses: glueing of flatness along a nonzerodivisor, the presentation of the blowup algebra of a
regular pair, and syntomicity of fibrewise nonzero hypersurfaces.

### Q7.1 Ind-fppf ring maps

Define a ring map `A → A'` to be *ind-fppf* if `A'` is, as an `A`-algebra, a filtered colimit of
faithfully flat finitely presented `A`-algebras; equivalently, `A → A'` is faithfully flat and every
`A`-algebra map `B → A'` with `B` finitely presented factors through a faithfully flat finitely
presented `A`-algebra (Česnavičius–Scholze §2.3.3 and footnote 12, p. 24; Stacks Lemma 10.127.4).
Faithfully flat of finite presentation means Mathlib `Module.FaithfullyFlat` together with
`Algebra.FinitePresentation`; colimits are small and filtered.

*Needs:* Mathlib `Module.FaithfullyFlat`, `Algebra.FinitePresentation` and filtered colimits
of commutative algebras (Stacks Lemma 10.127.4, tag 07C3).

Its basic API consists of the following facts.

- a faithfully flat finitely presented `A`-algebra is ind-fppf, and ind-fppf is invariant under
  `A`-algebra isomorphism;
- an ind-fppf `A`-algebra is faithfully flat;
- `A'` is ind-fppf iff it is a filtered colimit of faithfully flat finitely presented
  `A`-algebras, iff `A → A'` is faithfully flat and `A'` is a filtered colimit of flat finitely
  presented `A`-algebras;
- composites, base changes, nonempty finite products and filtered colimits of ind-fppf maps are
  ind-fppf (Q7.3).

**Checks.**

- `A → A` is ind-fppf, including for the zero ring.
- `A → A[X]` is ind-fppf, and so is `A → A[X_i : i ∈ ℕ]`, which for nonzero `A` is not of finite
  presentation: ind-fppf is strictly larger than fppf.
- `ℤ → ℚ` is flat but not faithfully flat (`ℚ ⊗ 𝔽_p = 0`), hence not ind-fppf; `ℤ → 𝔽_p` is not flat.
- `A → A × A` is ind-fppf (finite étale and faithfully flat); the empty product, the zero
  `ℤ`-algebra, is not, so the product clause needs a nonempty index set.
- Faithfully flat does not imply ind-fppf: for a noetherian local `ℚ`-algebra `R` with a nonreduced
  formal fibre, `R → R^∧` is faithfully flat but not ind-fppf (the example recorded in
  Česnavičius–Scholze footnote 12, p. 24).

### Q7.2 Syntomic and ind-syntomic ring maps

Define `IsSyntomic`: a ring map `R → S` is *syntomic* if there are `g_1, …, g_m ∈ S` generating the
unit ideal such that each `S_{g_i}` is a standard syntomic `R`-algebra
(`TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`, of any relative dimension). By Stacks
Lemmas 10.136.4 and 10.136.15 this agrees with Stacks Definition 10.136.1 (flat, finitely presented,
with local complete intersection fibres), with Česnavičius–Scholze footnote 11, p. 24, and on
affines with the syntomic morphisms of StableReduction Layer 1.

Define `IsIndSyntomic`: a ring map `A → A'` is *ind-syntomic* if every `A`-algebra map `B → A'`
with `B` finitely presented over `A` factors through a syntomic `A`-algebra; equivalently (Stacks
Lemma 10.127.4) `A'` is a filtered colimit of syntomic `A`-algebras (Česnavičius–Scholze §2.3.3,
p. 24). Ind-syntomic does not include faithful flatness.

*Needs:* StableReduction Layer 1; Tau Ceti
`TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension` and its localization, composition
and base-change theorems in the supplier contract; Mathlib `Algebra.FinitePresentation`,
`Localization.Away`, `Ideal.span` and filtered colimits of commutative algebras.

Its basic API consists of the following facts.

- a standard syntomic algebra is syntomic (take `m = 1`, `g_1 = 1`); a syntomic algebra is flat and
  finitely presented, and ind-syntomic;
- syntomic maps are stable under base change (Tau Ceti's base change of standard syntomic algebras
  and of localizations) and composition: for `R → S → T` with charts `S_g` standard syntomic over
  `R` and `T_h` standard syntomic over `S`, each `T_{hg} = T_h ⊗_S S_g` is standard syntomic over
  `S_g` by base change and then over `R` by Tau Ceti's composition of standard syntomic algebras,
  and the products `hg` generate the unit ideal of `T` (Stacks Lemma 10.136.17);
- an ind-syntomic algebra is flat (a filtered colimit of flat modules), and a faithfully flat
  ind-syntomic algebra is ind-fppf;
- composites, base changes, finite products (including the empty product) and filtered colimits of
  ind-syntomic maps are ind-syntomic (Q7.3);
- ind-syntomic is invariant under `A`-algebra isomorphism.

**Checks.**

- `A → A[T^{1/p^∞}] = colim_n A[T^{1/pⁿ}]` is ind-syntomic (each `A[T^{1/pⁿ}]` is a polynomial
  ring in one variable, standard syntomic of relative dimension one by Tau Ceti's polynomial case)
  and faithfully flat, hence ind-fppf.
- `A → A[T, X]/(ϖX − q)` for `ϖ ∈ A` and monic `q ∈ A[T]` of positive degree is syntomic (Q7.6).
- `ℤ → 𝔽_p` is not ind-syntomic: it is not flat.
- `ℤ → ℤ[1/p] = ℤ[x]/(px − 1)` is syntomic, indeed standard syntomic of relative dimension `0`
  (Tau Ceti's localization case: one generator, one relation, fibres empty or a point), but not
  faithfully flat, hence not ind-fppf.
- `𝔽_p → 𝔽_p[x, y]/(x², xy, y²)` is flat (over a field) and finitely presented but not syntomic:
  its fibre is not a complete intersection, and no presentation with `n + c` generators and `c`
  relations has fibres of dimension `n` (Tau Ceti's discussion of this example).

### Q7.3 Stability of ind-fppf and ind-syntomic maps

Prove: ind-fppf maps and ind-syntomic maps are each stable under composition and base change; a
nonempty finite product of ind-fppf `A`-algebras is ind-fppf, and every finite product of
ind-syntomic `A`-algebras is ind-syntomic; filtered colimits of ind-fppf (resp. ind-syntomic)
`A`-algebras are ind-fppf (resp. ind-syntomic); `A → A'` is ind-fppf iff it is faithfully flat and
`A'` is a filtered colimit of flat finitely presented `A`-algebras; a faithfully flat ind-syntomic
map is ind-fppf (Česnavičius–Scholze §2.3.3 and footnote 13, p. 24). The source states the product
clause for finite products; for ind-fppf algebras it holds for nonempty ones only.

*Proof route.* The factorization criteria reduce every assertion to finitely presented test
algebras. Composition: for `A → A' → A''` and a test map `B → A''`, factor `A' ⊗_A B → A''` through
an `A'`-algebra `S` of the relevant class, write `A'` as a filtered colimit of `A`-algebras of that
class and descend `S` and the factorization to a finite stage, descending faithful flatness by the
limit argument for finitely presented flat algebras and syntomicity by Stacks Lemma 10.168.9; then use
transitivity. Base change, products and colimits follow from the criteria; faithful flatness of a
filtered colimit of faithfully flat algebras follows from flatness and nonvanishing fibres (Stacks
Lemma 10.39.15). If `A → A'` is faithfully flat and `A' = colim S_j` with `S_j` flat finitely
presented, a test map factors through some `S_i`, and `Spec S_i → Spec A` is surjective because
`Spec A' → Spec A` factors through it.

*Needs:* Q7.1, Q7.2; Tau Ceti `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`; StableReduction
Layer 1; Mathlib `Module.FaithfullyFlat`, `Algebra.FinitePresentation`.

**Checks.**

- `A → A[T^{1/p^∞}] → A[T^{1/p^∞}, U^{1/p^∞}]` is ind-syntomic and ind-fppf.
- Base change of the ind-fppf `ℤ → ℤ[X]` along `ℤ → 𝔽_p` is `𝔽_p → 𝔽_p[X]`.
- The empty product: over `ℤ` it is the zero algebra, ind-syntomic (the empty cover) but not ind-fppf.

### Q7.4 Glueing flatness along a nonzerodivisor

Let `A` be a ring, `f ∈ A` and `M` an `A`-module. Prove: if `f` is a nonzerodivisor on `A` and on
`M`, `M[1/f]` is flat over `A[1/f]` and `M/fM` is flat over `A/fA`, then `M` is flat over `A`; the
same with faithfully flat (Stacks Lemma 10.99.16; the glueing of flatness used in
Česnavičius–Scholze §2.3.6, p. 26). No noetherian or finiteness hypothesis.

*Proof route.* For an `f`-power-torsion `Q`, `Tor_i^A(M, Q) = 0` for `i ≥ 1`: for `A/f`-modules,
`M ⊗^L_A A/f = M/fM` because `f` is regular on `A` and `M`, so
`Tor_i^A(M, Q) = Tor_i^(A/f)(M/fM, Q) = 0`; extensions and filtered colimits give all `f`-power-torsion `Q`.
For `f`-torsion-free `Q`, use
`0 → Q → Q[1/f] → C → 0` and `Tor_1^A(M, Q[1/f]) = Tor_1^{A[1/f]}(M[1/f], Q[1/f]) = 0`. Faithful
flatness: closed points of `Spec A` lie in `V(f)` or in `D(f)`.

*Needs:* Mathlib `Module.Flat`, `Module.FaithfullyFlat`, `IsSMulRegular`, `Localization.Away`.

**Checks.**

- `A = ℤ`, `f = p`, `M = ℤ_p`: `ℚ_p` is flat over `ℤ[1/p]` and `𝔽_p` over `𝔽_p`, so `ℤ_p` is flat
  over `ℤ`.
- The regularity of `f` on `M` is needed: `M = ℤ/p` over `ℤ` with `f = p` has `M[1/p] = 0` and
  `M/pM = 𝔽_p` flat, but `M` is not flat.
- The regularity of `f` on `A` is needed, even when `f` is regular on `M`: let `N = ℤ[1/p]/ℤ` and
  `A = ℤ ⊕ N` with `N² = 0` (a non-noetherian square-zero extension of `ℤ`), `f = p`, `M = A/N = ℤ`.
  Then `p` kills the nonzero `(0, [1/p])`, so it is a zero divisor of `A`, but it is regular on
  `M`; `A[1/p] = ℤ[1/p] = M[1/p]` because `N` is `p`-power torsion; `pA = pℤ ⊕ N` because `N` is
  `p`-divisible, so `A/pA = 𝔽_p = M/pM`. Both fibre conditions hold, yet tensoring
  `0 → N → A → M → 0` with `M` gives `Tor_1^A(M, M) = N ⊗_A M = N/N² = N ≠ 0` (the map to `M` is
  zero as `N` kills `M`), so `M` is not flat over `A`.

### Q7.5 Affine blowup algebras along a regular pair

Let `R` be a ring and `a, g ∈ R` an `R`-regular sequence (`a` a nonzerodivisor on `R`, `g` a
nonzerodivisor on `R/aR`). Prove that the affine blowup algebra `R[g/a] = Ideal.affineBlowup (a, g) a`
inside `R[1/a]` is isomorphic to `R[X]/(aX − g)` via `X ↦ g/a` (Stacks Lemma 15.32.2, for
`H_1`-regular sequences, which include regular ones; Česnavičius–Scholze (2.3.6.1), p. 26).

*Proof route.* The surjection `R[X]/(aX − g) → R[g/a]` comes from the universal property
(`Ideal.affineBlowupLift`). Injectivity: `a` is a nonzerodivisor on `R[X]/(aX − g)` because `a, g`
is regular, so `R[X]/(aX − g)` embeds in its localization at `a`, which is `R[1/a]`.

*Needs:* Tau Ceti `Ideal.affineBlowup`, `Ideal.affineBlowupLift`; Mathlib `RingTheory.Sequence.IsRegular`,
`Localization.Away`, `Polynomial`.

**Checks.**

- `R = ℤ_p[T]`, `a = p`, `g = T`: `R[T/p] ≅ ℤ_p[T, X]/(pX − T) ≅ ℤ_p[X]`.
- Regularity is needed: `R = ℤ`, `a = g = 2` gives `R[g/a] = ℤ`, while `ℤ[X]/(2X − 2)` has the
  `2`-torsion class `X − 1`.
- For `R = ℤ`, `a = 2` and `g = 0`, the pair is not regular: the presentation
  `ℤ[X]/(2X)` has the nonzero `2`-torsion class `X`, while `ℤ[0/2] = ℤ`. If `a` is a unit,
  `R/aR = 0` and `R[X]/(aX) = R`, so that boundary gives no torsion counterexample.

### Q7.6 Fibrewise nonzero hypersurfaces are syntomic

Let `A` be a ring, `n ≥ 1` and `g ∈ A[x_1, …, x_n]`. Prove: if the image of `g` in
`κ(𝔭)[x_1, …, x_n]` is nonzero for every prime `𝔭` of `A`, then `A[x]/(g)` is standard syntomic of
relative dimension `n − 1` over `A`; in particular it is flat and finitely presented (Stacks
Lemma 10.136.13, case of one equation; Česnavičius–Scholze §2.3.6, last paragraph, p. 28). For
`n = 0` the hypothesis says that `g ∈ A` lies in no prime ideal, hence is a unit, and `A/(g) = 0`;
the zero algebra is standard syntomic of every relative dimension `m`, through the presentation
`A[x_1, …, x_{m+1}]/(1)` with `m + 1` generators and one relation, as it is flat and has no
nontrivial fibre. (Tau Ceti's presentation has `m + c` generators and `c` relations, so no
presentation with `0` generators and the relation `g` has a relative dimension.)

*Proof route.* Each fibre `κ(𝔭)[x]/(ḡ)` is empty (`ḡ` a unit) or a hypersurface of dimension
`n − 1`, so `A[x]/(g)` is a relative global complete intersection; it is flat by Stacks
Lemma 10.136.12 (2), so Tau Ceti's `Algebra.Presentation.isStandardSyntomicOfRelativeDimension`
applies.

*Needs:* Q7.2; Tau Ceti `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`,
`Algebra.Presentation.isStandardSyntomicOfRelativeDimension`; Mathlib `MvPolynomial`,
`Ideal.ResidueField`, `Module.Flat`.

**Checks.**

- For `ϖ ∈ A` and monic `q ∈ A[T]` of positive degree, `g = ϖX − q ∈ A[T, X]` is nonzero in every
  fibre (linear in `X` with unit coefficient where `ϖ ≠ 0`, equal to `−q̄ ≠ 0` where `ϖ = 0`).
- The hypothesis is needed: `g = pX` over `ℤ` vanishes in the fibre at `p`, and `ℤ[X]/(pX)` is not
  flat (`X` is `p`-torsion).
- `g = 1 + px` over `ℤ_p` is nonzero in both fibres, and `ℤ_p[x]/(1 + px) ≅ ℚ_p` (`x ↦ −1/p`) is flat
  over `ℤ_p` with empty special fibre.

### Examples

`A → A[T^{1/p^∞}]` is the basic ind-syntomic faithfully flat map; the blowup algebras
`A_0[X]/(ϖ^m X − P)` of Q7.5, with `A_0 = A[T^{1/p^∞}]`, are the stages of the André extension of
Q9.2. Each is ind-syntomic over `A`: it is the filtered colimit over sufficiently large `n` of the
hypersurfaces `A[T^{1/pⁿ}][X]/(ϖ^m X − P)`, syntomic by their fibrewise nonvanishing (Q7.6).
For `A = 𝒪_C`, `ϖ = p^{1/p}`, `m = 1` and `P = T`, it is not syntomic: inverting `ϖ`
gives `C[T^{1/p^∞}]`, which is not finitely generated over `C` (Q9.2). Over the zero ring
the same algebra is zero and is syntomic, so non-syntomicity is not asserted for arbitrary `A`.

### Dependencies

*Needs:* StableReduction Layer 1; Tau Ceti `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`,
`Ideal.affineBlowup`; Mathlib flatness, finite presentation and regular sequences.

## Layer Q8: Continuous valuations: tilting, approximation and topological nilpotence

Continuous valuations control the André construction. A continuous valuation on an integral
perfectoid ring tilts to one on `A♭`; every element of an integral perfectoid ring is approximated
by a sharp up to `|p| · max(|a'♯|, |ϖ|^{pm})` for all continuous valuations at once; and
topological nilpotence in a Tate ring is detected by continuous valuations bounded on a ring of
definition.

### Q8.1 Continuous valuations for an element-adic topology

Let `A` carry the `ϖ`-adic topology and let `v` be a valuation on `A` with `v(A) ≤ 1` and value group
`Γ_v`. Prove that `v` is continuous (Tau Ceti `Valuation.IsContinuous`) iff for every `γ ∈ Γ_v` some
`v(ϖ)ⁿ < γ`; and, for a Tate ring `R` with pair of definition `(A₀, I)` and `v` with `v(A₀) ≤ 1`,
that `v` is continuous iff for every `γ ∈ Γ_v` there is `n` with `v(a) < γ` for all `a ∈ Iⁿ`, iff
`v(ϖ) < 1` and the powers `v(ϖ)ⁿ` are cofinal in `Γ_v` for one, equivalently every, topologically
nilpotent unit `ϖ` of `R` (Česnavičius–Scholze Lemma 2.3.1, sentence after the statement, p. 22;
Wedhorn Definition 7.7, p. 58, Lemma 7.4 (iii), p. 57, and Theorem 7.10, p. 59: `Cont(A)` is the
set of `v ∈ Spv(A, I·A)` with `v(a) < 1` on `I`, and the membership in `Spv(A, I·A)`, cofinality
of the values on `I`, is part of the criterion). In the element-adic case `v(ϖ) = 0` is allowed,
and then `v` is continuous.

*Proof route.* If `v(ϖ)ⁿ < γ` then `ϖⁿA ⊆ {v < γ}` since `v(A) ≤ 1`; conversely openness of
`{v < v(b)}` gives `ϖⁿA ⊆ {v < v(b)}` for some `n`, and a general `γ ∈ Γ_v` is a ratio of attained
values, each bounded below by an attained value since `v ≤ 1`. The forward implication is Tau Ceti's
`Valuation.IsContinuous.cofinalValue_of_isTopologicallyNilpotent`. In the Tate-ring case `{v < γ}`
is open iff it contains some `Iⁿ`, since the `Iⁿ` are a basis of neighbourhoods of `0`; for a
topologically nilpotent unit `ϖ` some `ϖ^N` lies in `I` and some `I^m` in the open set `ϖA₀`, so
cofinality of the `v(ϖ)ⁿ` and of the values on the `Iⁿ` are equivalent, `v(ϖ) ≠ 0` as `ϖ` is a
unit, and every `γ ∈ Γ_v` is again bounded below by an attained value because `R = A₀[1/ϖ]`. Tau
Ceti states the Tate-ring form as
`TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one`, with the
`Spv(A, I·A)` membership as a separate conjunct.

*Needs:* Tau Ceti `Valuation.IsContinuous`, `Valuation.IsContinuous.cofinalValue_of_isTopologicallyNilpotent`,
`TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one`; Mathlib `Valuation`, `IsAdic`.

**Checks.**

- On `ℤ_p` the `p`-adic valuation is continuous.
- The trivial valuation on `ℤ_p` (`v(a) = 1` for `a ≠ 0`) is not: `v(p)ⁿ = 1` never falls below `1`.
- A valuation factoring through `A/ϖ` (`v(ϖ) = 0`) is continuous.
- The cofinality clause is needed in the Tate-ring form: on `ℚ_p⟨T⟩` with `A₀ = ℤ_p⟨T⟩` and
  `I = pA₀`, let `v` be the rank-two valuation composed from the `T`-adic valuation and the `p`-adic
  valuation of the lowest coefficient, `v(f) = (−ord_T f, −v_p(a_{ord_T f})) ∈ ℤ²` ordered
  lexicographically, `v(0) = 0`. Then `v(A₀) ≤ (0, 0) = 1`, `v(p) = (0, −1) < 1` and `v(pf) < 1` for
  all `f ∈ A₀`, yet `v(T) = (−1, 0) < (0, −n) = v(p)ⁿ` for every `n`: `{v < v(T)}` contains no
  `pᵏA₀`, so `v` is not continuous, and the criterion "`v < 1` on `I`" alone would wrongly accept it.

### Q8.2 The tilt of a continuous valuation

Let `A` be integral perfectoid, `ϖ` with `ϖ^p | p` and `A` `ϖ`-adically complete, and `ϖ♭` as in
the conventions. For a continuous valuation `v` on `A` with `v(A) ≤ 1`, define the *tilted
valuation* `v♭ : A♭ → Γ_v ∪ {0}` by `v♭(x) = v(x♯)`. Prove that `v♭` is a valuation on `A♭`,
continuous for the `ϖ♭`-adic topology, with `v♭(A♭) ≤ 1` and `v♭(ϖ♭) = v(ϖ)`
(Česnavičius–Scholze proof of Lemma 2.3.1, second paragraph and footnote 10, p. 23).

*Construction.* Multiplicativity, `v♭(0) = 0` and `v♭(1) = 1` hold because `♯` is multiplicative.
Ultrametric inequality: `(x + y)♯ = lim_n ((x^{1/pⁿ})♯ + (y^{1/pⁿ})♯)^{pⁿ}` in the `ϖ`-adic topology,
because `b^{p^{n−1}} mod pⁿ` depends only on `b mod p`; each term has value
`≤ max(v(x♯), v(y♯))`, and continuity of `v` transfers the bound to the limit.

Its basic API consists of the following facts.

- `v♭(x) = v(x♯)` by definition, and `v♭ ≤ 1` on `A♭`;
- `v♭(ϖ♭) = v(ϖ)` when `(ϖ♭)♯` is a unit multiple of `ϖ`;
- `v♭` is continuous for the `ϖ♭`-adic topology (Q8.1, as `v♭(ϖ♭)ⁿ = v(ϖ)ⁿ`);
- naturality: for a map `f : A → B` of integral perfectoid rings and `w` continuous on `B`,
  `(w ∘ f)♭ = w♭ ∘ f♭` (PerfectoidQuotients §0.2, `untilt_natural`);
- if `pA = 0`, then `A♭ = A`, `♯` is the identity and `v♭ = v`;
- for `A = K°` with `K` a perfectoid field and `v` its valuation, `v♭` is the valuation of `K♭°`
  (PerfectoidSpaces P1.15).

*Needs:* Q5.1, Q5.3, Q8.1; PerfectoidQuotients §0.2 (`untilt_natural`);
PerfectoidSpaces P1.15; Mathlib `PreTilt.untilt`, `Valuation`; Tau Ceti `Valuation.IsContinuous`.

**Checks.**

- For `A = 𝒪_C` and its valuation: `v♭(p♭) = v(p)`, and `v♭` is the valuation of `C♭` on `𝒪_{C♭}`.
- If `v(ϖ) = 0`, then `v♭` kills `ϖ♭` and factors through `A♭/ϖ♭ ≅ A/ϖ` (Q5.3 reduced modulo `ϖ`).
- Valuing a lift of the zeroth coordinate is not well defined: for `A = 𝒪_C` and `x = p♭`, the zeroth
  coordinate is `0 ∈ 𝒪_C/p` with lifts `0` and `p` of different values, while `v♭(p♭) = v(p)`.

### Q8.3 The integral approximation lemma

**Theorem** (`exists_approximation`). Let `A` be integral perfectoid with the `ϖ`-adic topology,
`ϖ^p | p` and `A` `ϖ`-adically complete; let `a ∈ A` and `m ≥ 0`. There is `a' ∈ A♭` such that every
continuous valuation `v` on `A` with `v(A) ≤ 1` satisfies `v(a − a'♯) ≤ v(p) · max(v(a'♯), v(ϖ)^{pm})`;
in particular `v(a) ≤ v(ϖ^{pm})` iff `v(a'♯) ≤ v(ϖ^{pm})` (Česnavičius–Scholze Lemma 2.3.1,
(2.3.1.1)–(2.3.1.2), and proof, pp. 22–23; an integral variant of Scholze Corollary 6.7 (i)).

*Proof route.* The second assertion follows from the first by the ultrametric inequality. Replace
`ϖ` by `ρ` with `ρ^p` a unit multiple of `p` (Q5.3): this does not increase `v(ϖ)^p` and only
enlarges the set of valuations. Choose `ξ` with `(ξ − [ξ̄])/p` a unit of `W(A♭)`, `ξ̄ = ξ mod p`, a
lift `z_0 ∈ W(A♭)` of `a`, and define
`z_{n+1} = [z̄_n] − [ξ̄]((ξ − [ξ̄])/p)^{−1}((z_n − [z̄_n])/p)`; put `a' = z̄_m`. For the tilted
valuation `v♭` of Q8.2, write `|z|_sup ≤ γ` for the family of inequalities `v♭(z_(j)) ≤ γ` over the
Teichmüller expansion `z = Σ [z_(j)] pʲ`; Witt addition and multiplication preserve these bounds, and
no supremum in the value group is used. Since `ξ̄` is a unit multiple of `(ϖ♭)^p`,
`|z_{n+1} − [z̄_n]|_sup ≤ v♭(ϖ♭)^p |z_n|_sup`; an induction distinguishing whether `v♭(z̄_N)` first
exceeds `v♭(ϖ♭)^{p(N+1)}` before or after `m` gives `|z_m − [z̄_m]|_sup ≤ max(v♭(z̄_m), v♭(ϖ♭)^{pm})`,
and `θ(z_m − [z̄_m]) = a − a'♯` concludes.

*Needs:* Q5.3, Q8.1, Q8.2; PerfectoidQuotients §0.2; Mathlib `WittVector.teichmuller`,
`PreTilt.untilt`, `Perfection.quotientMulEquiv`; Tau Ceti `Valuation.IsContinuous`.

**Checks.**

- For `a = b♯`, `a' = b` gives `v(a − a'♯) = 0`.
- For `m = 0` the bound is `v(a − a'♯) ≤ v(p)`, realized by any `a'` with `a'♯ ≡ a mod p`.
- For `v` with `v(p) = 0` (factoring through `A/p`) the bound forces `a ≡ a'♯` modulo the support of
  `v`, consistent with `a − a'♯ ∈ pA` from the construction.
- `a'` is not unique: for `A = 𝒪_C` and `a = 1 + p`, both `a' = 1` (with `v(a − a'♯) = v(p)`, equal to
  the bound `v(p) · max(1, v(ϖ)^{pm})`) and `a' = b` with `b♯ = 1 + p` (difference `0`) satisfy it.

### Q8.4 Topological nilpotence detected by continuous valuations

**Theorem** (`isTopologicallyNilpotent_iff_forall_lt_one`). Let `R` be a Tate ring with a pair of
definition `(A₀, I)` (Tau Ceti `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.PairOfDefinition`). An
element `a ∈ R` is topologically nilpotent iff `v(a) < 1` for every continuous valuation `v` on `R`
with `v(A₀) ≤ 1`. For `A` with the `ϖ`-adic topology, `ϖ` a nonzerodivisor, `R = A[1/ϖ]` with `A` an
open ring of definition, this is Česnavičius–Scholze Lemma 2.3.2, p. 24: `a ∈ A[1/ϖ]` has `aⁿ ∈ ϖA` for large `n` iff `v(a) < 1` for all
continuous `v` with `v(A) ≤ 1`.

*Proof route.* The forward direction is Tau Ceti's
`Valuation.IsContinuous.lt_one_of_isTopologicallyNilpotent`. Conversely, `v(a) ≤ 1` for all such `v`
makes `a` integral over `A₀` (`TauCeti.Huber.isIntegral_of_forall_continuous_valuation_le_one`;
Wedhorn Proposition 7.18 (1)), so its powers are bounded. If `A₀^{∘∘} · A₀[1/a] = A₀[1/a]`, then
`a^N + Σ a_i a^i = 0` with `a_i` topologically nilpotent, so `a` is topologically nilpotent.
Otherwise choose a maximal ideal `𝔪 ⊇ A₀^{∘∘} A₀[1/a]`, a minimal prime `𝔭 ⊆ 𝔪` extending to a minimal
prime of `R[1/a]` (Stacks Lemmas 10.17.2 and 10.30.5), a valuation ring `V` dominating
`(A₀[1/a]/𝔭)_𝔪` (Stacks Lemma 10.50.2), and `V̄ = V/⋂ϖⁿV`; the induced valuation is continuous, `≤ 1`
on `A₀` and has `v(1/a) ≤ 1`, contradicting `v(a) < 1`. The contradicting valuation may be taken of
rank one, so the criterion does not depend on the universe of the value groups: for a continuous
`v` with `v(A₀) ≤ 1` and `v(a) ≥ 1` and a topologically nilpotent unit `ϖ` of `R`, let `H` be the
largest convex subgroup of `Γ_v` not containing `v(ϖ)`. As the powers of `v(ϖ)` are cofinal in
`Γ_v` (Q8.1), `Γ_v/H` has no convex subgroup other than `1` and itself, so it embeds in `ℝ_{>0}`
as an ordered group; the coarsening `w` of `v` with values in `Γ_v/H ∪ {0}` has `w(ϖ) < 1` with
cofinal powers, hence is continuous (Q8.1), and `w(A₀) ≤ 1`, `w(a) ≥ 1`.

*Needs:* Q8.1; Tau Ceti `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.PairOfDefinition`,
`Valuation.IsContinuous.lt_one_of_isTopologicallyNilpotent`,
`TauCeti.Huber.isIntegral_of_forall_continuous_valuation_le_one`; Mathlib `IsTopologicallyNilpotent`.

**Checks.**

- In `ℚ_p` with `A₀ = ℤ_p`: `p` is topologically nilpotent and has `v(p) < 1` for every continuous
  `v`; `1` is not, and `v(1) = 1`.
- In `ℚ_p⟨T⟩` with `A₀ = ℤ_p⟨T⟩`, the Gauss valuation has `v(T) = 1`, so `T` is not topologically
  nilpotent.
- The ring of definition must be bounded: with the open unbounded subring `B = ℚ_p` in place of
  `A₀`, no valuation continuous on `ℚ_p` is `≤ 1` on `ℚ_p` (it would be trivial on `p`), so the
  right side holds vacuously for `a = 1`, which is not topologically nilpotent.
- The zero ring is a Tate ring with no valuations; both sides hold for `a = 0`.
- Rank one suffices for the converse. On `ℚ_p⟨T⟩` with `A₀ = ℤ_p⟨T⟩`, let `v(f)` be the pair
  `(|f|_Gauss, γ^{ord_{T=1} f̄})` in `p^ℤ × γ^ℤ`, ordered lexicographically with `γ < 1`, where `f̄` is
  the reduction in `𝔽_p[T]` of `f` scaled to Gauss norm one. Then `v(A₀) ≤ 1`, `v(p)ⁿ = (p^{−n}, 1)`
  is cofinal, so `v` is continuous, and `v(T) = (1, 1) = 1`. Here `H = 1 × γ^ℤ`, and the coarsening
  is the Gauss valuation, with value group `p^ℤ ⊂ ℝ_{>0}` and `w(T) = 1`. The only convex subgroup
  containing `v(p)` is the whole group, and coarsening by it gives the trivial valuation, which is
  not continuous.

### Examples

On `𝒪_C` the tilted valuation is the valuation of `C♭`, and Q8.3 approximates `a ∈ 𝒪_C` by a sharp
to within `|p|`; the Gauss valuation on `ℤ_p⟨T⟩` is the standard witness for Q8.4.

### Dependencies

*Needs:* Layer Q5; PerfectoidQuotients §0.2; PerfectoidSpaces P1.15 and P1.24; Tau Ceti
`TauCeti.Perfectoid.IsIntegralPerfectoid`, continuous valuations, Tate rings and pairs of definition.

## Layer Q9: The ind-syntomic André lemma and semiperfectoid covers

The André lemma adjoins compatible `p`-power roots of a root of every monic polynomial and takes
`p`-integral closures, which keeps the completion perfectoid; dividing by the `ϖ`-divisible ideal
generated by the polynomials keeps faithful flatness. The technical heart describes the
`p`-integral closure for one polynomial as an increasing union of ind-syntomic blowup algebras, by
approximating the polynomial by a sharp with compatible roots. The corollary gives faithfully flat
semiperfectoid covers of all `p`-Zariski rings.

### Q9.1 The root extension of a set of monic polynomials

Let `A` be a ring, `ϖ ∈ A` a nonzerodivisor with `ϖ^p | p` and a compatible system of `p`-power roots,
and `𝒫` a set of monic polynomials of positive degree in `A[T]`. Define the *André root extension*:
`A_0 = A[T_P^{1/pⁿ} : P ∈ 𝒫, n ≥ 0]`; `A_∞ = A_0[P(T_P)/ϖᵐ : P ∈ 𝒫, m ≥ 0] ⊆ A_0[1/ϖ]` with the ideal
`I_∞` generated by the `P(T_P)/ϖᵐ`; `A' = pIntegralClosure` of `A_∞` in `A_∞[1/ϖ] = A_0[1/ϖ]`
(PerfectoidQuotients §0.5) with the ideal `I'` generated by the `P(T_P)/ϖᵐ`. Prove that `I_∞` and `I'`
are `ϖ`-divisible, `A_∞/I_∞ = A_0/(P(T_P) : P ∈ 𝒫)` inside its localization at `ϖ`, `A'/I'` is
`ϖ`-torsion-free and is the `p`-integral closure of `A_∞/I_∞` in `(A_∞/I_∞)[1/ϖ]`, `A'/I'` is integral
over `A`, `(A'/I')[1/ϖ]` is a filtered colimit of finite free `A[1/ϖ]`-algebras, and the class of
`T_P` in `A'/I'` is a root of `P` with compatible `p`-power roots the classes of `T_P^{1/pⁿ}`
(Česnavičius–Scholze §2.3.6, first and second paragraphs, pp. 25–26). No completeness or perfectoid
hypothesis is needed.

*Construction.* `A_∞[1/ϖ] = A_0[1/ϖ]` since the adjoined elements lie there; `I_∞` is `ϖ`-divisible
because `P(T_P)/ϖᵐ = ϖ · P(T_P)/ϖ^{m+1}`. Each `P` is monic, so `ϖ, P(T_P)` is a regular sequence on
`A_0`, `A_0/(P(T_P))_P` embeds in its localization at `ϖ`, and every element of that subring lifts
to `A_0`; hence `A_∞/I_∞ = A_0/(P(T_P))_P`, integral over `A` and ind-finite-free after inverting `ϖ`.
`ϖ`-divisibility of `I'` and `perfectoid_p_integral_closedness` identify `A'/I'` with the
`p`-integral closure of `A_∞/I_∞`, which lies in its integral closure.

*Needs:* PerfectoidQuotients §0.5 (`pIntegralClosure` and the injectivity criterion
for Frobenius in terms of ambient root closure); Mathlib polynomial algebras, `Polynomial.Monic`,
`Localization.Away`, ideals, integral elements and regular sequences.

Its basic API consists of the following facts.

- the canonical injective `A`-algebra map `A' → A_0[1/ϖ]` extends the inclusion of `A_∞`; inside that
  ambient ring `A'` is the least subring containing `A_∞` and closed under ambient `p`-th roots;
- the ideal `I'` is `ϖ`-divisible: every element is `ϖ` times an element of `I'`;
- the root classes satisfy `α_{P,n+1}^p = α_{P,n}` and `P(α_{P,0}) = 0` in `A'/I'`;
- `A'/I'` is integral over `A`, and is the `p`-integral closure of `A_0/(P(T_P))_P` in its
  localization at `ϖ`;
- a map of data `(A, ϖ, 𝒫) → (B, f(ϖ), f(𝒫))` induces `A' → B'` carrying `I'` into `I'` and roots to
  roots, compatibly with identities and composition;
- two `A`-algebra maps from `A'` to a `ϖ`-torsion-free `A`-algebra that agree on `A_0` are equal.

**Checks.**

- For `𝒫 = ∅`, `A'` is the `p`-integral closure of `A` in `A[1/ϖ]` and `I' = 0`; for `A = 𝒪_C`,
  `ϖ = p^{1/p}`, `A' = A`.
- For `𝒫 = {T − a}`, `α_{T−a}` is the class of `a`, and the classes of `T^{1/pⁿ}` are compatible
  `p`-power roots of `a` in `A'/I'`.
- For `A = 𝒪_C`, `ϖ = p^{1/p}` and `𝒫 = {T}`, `α_T = 0` while the class of `T^{1/p}` is nonzero
  nilpotent (after inverting `ϖ` the ideal is `(T)`, which does not contain `T^{1/p}`); since
  `T^{1/p} = ϖ^{m/p}(T/ϖᵐ)^{1/p}` in `A'`, its class is divisible by every `ϖ^{m/p}` and vanishes in
  the completion.
- Positive degree is essential: `P = 1` forces `1/ϖ ∈ A_∞`, `I' = A'` and `A'/I' = 0`, not faithfully
  flat over a nonzero `A`.

### Q9.2 The `p`-integral closure for one polynomial

Let `A` be `ϖ`-Henselian, `ϖ` a nonzerodivisor with `ϖ^p | p` and compatible `p`-power roots, with
integral perfectoid `ϖ`-adic completion. Let `P ∈ A[T]` be monic of positive degree, `m > 0`,
`A_0 = A[T^{1/p^∞}]` and `A'_m` the `p`-integral closure of `A_0[P/ϖᵐ]` in `A_0[1/ϖ]`. Prove that there
are `t ≥ 0` and `q_j ∈ A_0` (`j ≥ 0`) such that `ϖ^{m/pʲ}, q_j` is an `A_0`-regular sequence,
`q_{j+1}^p ≡ q_j mod ϖ^{mp}A_0`, the image of `q_j` in `(A/ϖ^{1/p^{j+t}})[T^{1/pⁿ}]` is monic for large
`n`, the subalgebras `A_0[q_j/ϖ^{m/pʲ}] ≅ A_0[X_j]/(ϖ^{m/pʲ}X_j − q_j)` increase with `j`, and `A'_m` is
their union; consequently `A'_m` is ind-syntomic over `A` (Česnavičius–Scholze §2.3.6, third to last
paragraphs, (2.3.6.1)–(2.3.6.10), pp. 26–28).

*Proof route.* `Â_0` is integral perfectoid (`perfectoid_completed_root_polynomial`). By Q8.3 there is
`Q ∈ Â_0` with compatible roots and `|P − Q| < max(|Q|, |ϖᵐ|)` for every continuous valuation on
`Â_0[1/ϖ]` bounded on `Â_0`; then the continuous valuations of `Â_0[P/ϖᵐ]` and `Â_0[Q/ϖᵐ]` agree and,
by Q8.4, a power of `P/ϖᵐ − Q/ϖᵐ` lies in `ϖ` times either algebra; also `P − Q ∈ ϖ^{1/p^t}Â_0`, by
iterating the bijection `x ↦ x^p : Â_0/π → Â_0/π^p` of PerfectoidSpaces P1.24 at `π = ϖ^{1/pʲ}`,
`1 ≤ j ≤ t` (each `π^p = ϖ^{1/p^{j−1}}` divides `p`, `Â_0` is `π`-adically complete as `π^{pʲ} = ϖ`,
and no torsion-freeness is assumed, so `p = 0` is allowed; Česnavičius–Scholze (2.1.2.4),
p. 11). So `Q^{1/pʲ}` is
monic modulo `ϖ^{1/p^{j+t}}`, `ϖ^{m/pʲ}, Q^{1/pʲ}` is regular (Stacks Lemma 10.68.9), Q7.5 describes
`Â_0[Q^{1/pʲ}/ϖ^{m/pʲ}]`, and the union over `j` has perfectoid completion, hence is `p`-integrally
closed; it is the `p`-integral closure of both `Â_0[P/ϖᵐ]` and `Â_0[Q/ϖᵐ]`. Descend to `A_0` with
`q ≡ Q mod ϖ^{mpᵈ}` and `q_j ≡ Q^{1/pʲ} mod ϖ^{mp}`. Ind-syntomicity: each
`A[T^{1/pⁿ}][X_j]/(ϖ^{m/pʲ}X_j − q_j)` is syntomic over `A` by Q7.6, and filtered colimits of
ind-syntomic algebras are ind-syntomic (Q7.3).

*Needs:* Q9.1, Q8.3, Q8.4, Q7.3, Q7.5, Q7.6; PerfectoidQuotients §§0.4–0.6; PerfectoidSpaces P1.24;
Mathlib `RingTheory.Sequence.IsRegular`.

**Checks.**

- For `P = T`: `Q = T`, `t = 0`, `q_j = T^{1/pʲ}`, and each stage `A_0[X_j]/(ϖ^{m/pʲ}X_j − T^{1/pʲ})` is
  ind-syntomic over `A`: for fixed `j` it is the filtered colimit over `n ≥ j` of the syntomic
  `A`-algebras `A[T^{1/pⁿ}][X_j]/(ϖ^{m/pʲ}X_j − T^{1/pʲ})` (Q7.6, the relation being monic of degree
  `p^{n−j}` in `T^{1/pⁿ}` modulo `ϖ`). It is not syntomic: for `A = 𝒪_C`, `ϖ = p^{1/p}`, `m = 1` and
  `j = 0`, inverting `ϖ` gives `C[T^{1/p^∞}]`, which is not finitely generated over `C`, since finitely
  many elements all lie in some `C[T^{1/p^N}]`, which does not contain `T^{1/p^{N+1}}`; each finite
  stage becomes `C[T^{1/pⁿ}]`, finitely presented of relative dimension one.
- The union is needed: for `P = T`, `m = 1`, `T^{1/p}/ϖ^{1/p}` is `p`-integral over `A_0[T/ϖ]` (its
  `p`-th power is `T/ϖ`) but not in `A_0[T/ϖ]`, whose elements have integral `T^{1/p}`-coefficient.
- For `m = 0` the algebra `A_0[P]` is `A_0`, `p`-integrally closed in `A_0[1/ϖ]` already when `A` is;
  the statement is for `m > 0`.

### Q9.3 The ind-syntomic André lemma

**Theorem** (`exists_indSyntomic_andre`). Let `ϖ ∈ A` satisfy `ϖ^p | p` and have a compatible system of
`p`-power roots, and suppose either (i) `A` is integral perfectoid and `ϖ`-adically complete, or
(ii) `A` is `ϖ`-Henselian, `ϖ` is a nonzerodivisor and the `ϖ`-adic completion of `A` is integral
perfectoid. Then there are a faithfully flat, ind-syntomic, `ϖ`-Henselian `A`-algebra `A'` whose
`ϖ`-adic completion `Â'` is integral perfectoid and a `ϖ`-divisible ideal `I' ⊆ A'` with `A'/I'`
faithfully flat over `A`, such that every monic `P ∈ A'[T]` of positive degree has a root
`α_P ∈ A'/I'` with a compatible system of `p`-power roots in `A'/I'`; in particular these exist in
`Â' ≅ (A'/I')^∧` (Česnavičius–Scholze Theorem 2.3.4, p. 25, with monic read as monic of positive
degree).

*Proof route.* Reduce (i) to (ii): by Q6.8 (`exists_surjective_of_isSMulRegular_of_roots`) `A` is a
quotient of a `ϖ̃`-torsion-free, `ϖ̃`-complete integral perfectoid `Ã` with roots lifting those of
`ϖ`; a solution `(Ã', Ĩ')` for `Ã` gives `A' = Ã' ⊗_Ã A` with the image of `Ĩ'`
(`perfectoid_completed_tensor`). In case (ii) it suffices to treat monic `P ∈ A[T]`: iterate
countably, `A'_∞ = colim A'_n` with `I'_∞ = Σ I'_i A'_∞`, each `A'_n/Σ I'_i` faithfully flat over the
previous one. `ϖ`-Henselianity is restored by `ϖ`-Henselization (Tau Ceti
`TauCeti.Henselization.algebra`, henselian by the instance `TauCeti.Henselization.henselian`), which
is ind-étale, hence flat (`TauCeti.Henselization.indEtale`, `TauCeti.Algebra.IndEtale.flat`), and
leaves the quotient by `ϖ` unchanged (`TauCeti.Henselization.quotientPowEquiv`); the composite from
`A` is therefore faithfully flat because `ϖ` lies in every maximal ideal of `A` (Stacks
Lemma 10.39.15). For
`𝒫` the monic polynomials over `A` take `A'`, `I'` of Q9.1. Its completion is integral perfectoid by
`completion_pIntegralClosure_perfectoid`, as every element of `A_∞/ϖ^p` is a `p`-th power. `A'/I'` is
integral over `A` and `ϖ`-torsion-free with ind-finite-free localization, so
`Spec(A'/I') → Spec A` is surjective, and `A'/I'` is `A`-flat by Q7.4 once `(A'/I')/ϖ ≅ A'/ϖ` is
`A/ϖ`-flat; that follows from ind-syntomicity of `A'`, which reduces by filtered colimits to one
polynomial and to Q9.2.

*Needs:* Q9.1, Q9.2, Q6.8, Q7.3, Q7.4; PerfectoidQuotients §§0.5–0.6; Tau Ceti
`TauCeti.Henselization.algebra`, `TauCeti.Henselization.indEtale`,
`TauCeti.Henselization.quotientPowEquiv`; Mathlib `Module.FaithfullyFlat`, `HenselianRing`,
`AdicCompletion`.

**Checks.**

- For `A = 𝒪_C` and `ϖ = p^{1/p}`, `A' = A`, `I' = 0` satisfy the conclusion.
- For `p` odd, `A` the completion of `ℤ_p[p^{1/p^∞}]` (residue field `𝔽_p`), `ϖ = p^{1/p}` and
  `P = T² − u` with `u ∈ ℤ_p^×` a non-square, `P` has no root in `A`, while `A'/I'` has one with
  compatible `p`-power roots.
- Faithful flatness of `A'/I'`, not only of `A'`, is asserted: for the construction of Q9.1 with
  `𝒫 = {T}` over `𝒪_C`, `A'/I'` contains the nonzero nilpotent class of `T^{1/p}` and the same proof
  makes it faithfully flat over `𝒪_C`.
- Degree zero is excluded: the constant `1` has no root in the nonzero ring `A'/I'`.
- For `A = 0` everything is zero.

### Q9.4 Consequences of the ind-syntomic André lemma

In the situation of Q9.3, prove that `Â'` contains compatible `p`-power roots of every element of
`A` and that `Â'/ϖ` is faithfully flat over `A/ϖ`; so `A → Â'` is a `ϖ`-completely faithfully flat
map to an integral perfectoid ring in which every element of `A` has compatible `p`-power roots,
which recovers André's lemma in Bhatt's form (Bhatt Theorem 1.5), with faithful flatness modulo `ϖ`
in place of almost faithful flatness, and refines the `p`-completely faithfully flat cover of
PerfectoidSpaces P4.15.4 and the modulo-`p` ind-syntomic cover of PerfectoidQuotients §1.2
(Česnavičius–Scholze Remark 2.3.5, p. 25, and §2.3, p. 22).

*Proof route.* Apply Q9.3 to the polynomials `T − a`, `a ∈ A`. `Â'/ϖ = A'/ϖ = (A'/I')/ϖ` is
faithfully flat over `A/ϖ`.

*Needs:* Q9.3; PerfectoidSpaces P4.15.4; PerfectoidQuotients §§1.2 and 1.4.

**Checks.**

- For a perfect `𝔽_p`-algebra `A` and `ϖ = 0`, every element has unique compatible `p`-power roots
  and the assertion is faithful flatness of `A'` over `A`.
- Over the `p`-adic completion `ℤ_p^{cycl}` of `ℤ_p[ζ_{p^∞}]`, which is integral perfectoid (BMS1
  Example 3.6, p. 21), a unit multiple of `p` has compatible `p`-power roots (BMS1 Lemma 3.9, p. 22),
  but for `p` odd neither `p` nor `1 + p` has a `p`-th root there. Neither is a `p`-th power in `ℚ_p`
  (`p` has valuation one, and `1 + p ∉ 1 + p²ℤ_p`), so for `a ∈ {p, 1 + p}` the polynomial `X^p − a`
  is irreducible over `ℚ_p`. A root of it in the completion would, by Krasner's lemma, lie in
  `ℚ_p(ζ_{p^∞})` and generate a subextension of degree `p` of this abelian extension, hence a normal
  one, containing every root of `X^p − a` and so `ζ_p`, whose degree `p − 1` does not divide `p`.
  Q9.4 supplies compatible `p`-power roots of both in `Â'`.
- Almost faithful flatness (Bhatt Theorem 1.5; PerfectoidQuotients §1.4) is weaker: the nonzero
  `𝒪_C`-module `k̄ = 𝒪_C/𝔪` is almost zero, so an almost statement cannot conclude `M = 0` from
  `M ⊗ Â'/ϖ = 0` for `M = k̄`, whereas faithful flatness modulo `ϖ` does.

### Q9.5 `p`-Zariski rings and `p`-Zariskization

Define `IsPZariski`: a ring `A` is *`p`-Zariski* if `1 + pA ⊆ A^×`, equivalently if `p` lies in the
Jacobson radical (every maximal ideal) of `A`. The *`p`-Zariskization* of a ring `B` is the
localization `B_{1+pB}` at the multiplicative set `1 + pB` (Česnavičius–Scholze Corollary 2.3.7 and
first paragraph of its proof, p. 28).

*Construction.* `1 + pB` is multiplicatively closed: `(1 + pb)(1 + pc) = 1 + p(b + c + pbc)`. The
Jacobson-radical form is the characterization of `Ideal.jacobson ⊥` by units of `1 + xA`.

*Needs:* Mathlib `Ideal.jacobson`, `Localization`, `Module.FaithfullyFlat`,
`IsAdicComplete.le_jacobson_bot` and `HenselianRing`.

Its basic API consists of the following facts.

- `A` is `p`-Zariski iff `(p : A) ∈ Ideal.jacobson ⊥`;
- the `p`-Zariskization of `B` is `p`-Zariski, and every ring map `B → C` to a `p`-Zariski ring
  extends uniquely through `B → B_{1+pB}`;
- a `p`-adically complete ring is `p`-Zariski (Mathlib `IsAdicComplete.le_jacobson_bot`), and so is
  every `A` with `(A, pA)` henselian;
- quotients of `p`-Zariski rings are `p`-Zariski;
- for `p`-Zariski `A` and a faithfully flat `A`-algebra `B`, the `p`-Zariskization `B_{1+pB}` is
  faithfully flat over `A`: it is flat as a localization of `B`, and for a maximal ideal `𝔪` of `A`
  a maximal ideal of `B` containing `𝔪B` contains `p ∈ 𝔪`, so it meets no `1 + pb` and survives in
  `B_{1+pB}`; the nonzero-fibre criterion (Stacks Lemma 10.39.15) concludes.

**Checks.**

- `ℤ/pⁿ` is `p`-Zariski (`p` nilpotent); the zero ring is `p`-Zariski.
- The `p`-Zariskization of `ℤ` is `ℤ_(p)`: every `n` prime to `p` has `n^{p−1} ∈ 1 + pℤ`.
- `ℚ` is not `p`-Zariski: `1 + p · (−1/p) = 0`.
- `ℤ` is not `p`-Zariski: `1 + p` is not a unit.
- Faithful flatness of `B`, not flatness alone: over `A = ℤ_p` the flat algebra `B = ℚ_p` has
  `p`-Zariskization `0` (as `1 + p · (−1/p) = 0`), which is not faithfully flat; for `B = ℤ_p[T]`
  every `1 + pb` is `1` modulo `p`, so `B_{1+pB}/p = 𝔽_p[T] ≠ 0` and `B_{1+pB}` is faithfully flat
  over the local ring `ℤ_p`.
- The `p`-Zariski hypothesis on `A` is needed: `B = A = ℤ` is faithfully flat over `ℤ`, but its
  `p`-Zariskization `ℤ_(p)` is not, since `ℓ · ℤ_(p) = ℤ_(p)` for a prime `ℓ ≠ p`.

### Q9.6 Semiperfectoid covers of `p`-Zariski rings

**Theorem** (`exists_semiperfectoid_cover`). Every `p`-Zariski ring `A` admits a faithfully flat map
`A → A_∞` such that the `p`-adic completion of `A_∞^red` is integral perfectoid, and `A_∞` is a
quotient of a `p`-torsion-free, `p`-Henselian ring `Ã_∞` with integral perfectoid `p`-adic completion
in which every monic polynomial of positive degree has a root; hence so do `A_∞` and `A_∞^red`
(Česnavičius–Scholze Corollary 2.3.7 and proof, pp. 28–29).

*Proof route.* Replace `A` by the `p`-Zariskization of the countable iteration of
`A ↦ A[X_a^{1/p^∞} : a ∈ A]/(X_a − a : a ∈ A)` (faithfully flat: each step is free), so that every
`a ∈ A` has compatible `p`-power roots; then `A` is a quotient of the `p`-torsion-free
`ℤ_(p)`-algebra `Ã`, the `p`-Zariskization of `ℤ[p^{1/p^∞}][X_a^{1/p^∞} : a ∈ A]`, whose completion
is integral perfectoid (`perfectoid_completed_root_polynomial`). Apply Q9.3 (ii) to the
`p`-Henselization `Ã^h` with `ϖ = p^{1/p}`, giving `B` and `J`, and take `Ã_∞ = B/J`: it is `Ã_∞`,
not `B`, that has roots of all monic polynomials of positive degree, by lifting coefficients to `B`;
`Ã^h → B/J` is faithfully flat, so `B/J` is `p`-torsion-free; it is `p`-Henselian as a quotient of
`B` (Tau Ceti `RingHom.henselianRing_of_surjective`), and henselianity along `ϖ` and along `p` agree
because `√(ϖ) = √(p)` (`Ideal.henselianRing_radical_iff`); and `J` being `ϖ`-divisible, its
completion is that of `B`. `Ã → Ã^h` is faithfully flat because `Ã` is `p`-Zariski, that is, `p`
lies in its Jacobson radical (`TauCeti.Henselization.faithfullyFlat_of_le_jacobson`). Put
`A_∞ = Ã_∞ ⊗_Ã A`, faithfully flat over `A` and a quotient of `Ã_∞`. Every element of the nilradical
of `A_∞`, and of the kernel `K` of `Ã_∞ → A_∞^red`, has a `p`-th root in `K` (a root of `T^p − s`), so
the completion of `A_∞^red = Ã_∞/K` is integral perfectoid by `perfectoid_completed_root_quotient`
(Česnavičius–Scholze Proposition 2.1.11 (c); the source's proof cites part (d), which concerns
products).

*Needs:* Q9.3, Q9.5; PerfectoidQuotients §0.6; Tau Ceti `TauCeti.Henselization.algebra`,
`TauCeti.Henselization.faithfullyFlat_of_le_jacobson`, `RingHom.henselianRing_of_surjective`,
`Ideal.henselianRing_radical_iff`; Mathlib `Module.FaithfullyFlat`, `nilradical`, `HenselianRing`.

**Checks.**

- For `A = ℤ_(p)`, the integral closure `ℤ̄_p` of `ℤ_p` in an algebraic closure of `ℚ_p` is a valid
  `A_∞ = Ã_∞`: faithfully flat over `ℤ_(p)`, `p`-torsion-free, henselian along `p`, absolutely
  integrally closed, with completion `𝒪_{ℂ_p}`.
- For `A = 𝔽_p`, `A_∞ = ℤ̄_p/p` works, with `A_∞^red = 𝔽̄_p`.
- `A = 0` gives `A_∞ = 0`.
- `A = ℤ` is not `p`-Zariski (`1 + p` is not a unit), so the theorem does not apply to it; its
  `p`-Zariskization `ℤ_(p)` is covered by the first Check. The hypothesis makes `Ã → Ã^h` faithfully
  flat.

### Examples

`𝒪_C` is its own André extension; the completion of `ℤ_p[p^{1/p^∞}]` with `P = T² − u` shows that the
extension is nontrivial; `ℤ̄_p` is the model semiperfectoid cover of `ℤ_(p)`.

### Dependencies

*Needs:* Layers Q6–Q8; PerfectoidQuotients §§0.4–0.6, 1.2 and 1.4; PerfectoidSpaces P1.24 and P4.15.4;
Tau Ceti `TauCeti.Perfectoid.IsIntegralPerfectoid`, the henselization of a pair
(`TauCeti.Henselization.algebra`) and the permanence of henselian pairs.

## Layer Q10: Regular local rings: prismatic covers and almost vanishing of `Tor`

For regular local rings the layer refines the residue tower of PerfectoidSpaces P7.16a, constructs
Bhatt–Scholze's perfectoid faithfully flat cover by perfecting a prism, and derives Bhatt–Scholze's
almost vanishing of `Tor` along finite subextensions of `R⁺` from almost purity along an arbitrary
ideal. The derivation needs a perfectoid cover mapping to `(R⁺)^∧`; it is constructed for
`F`-finite residue fields (Q10.4), and Q10.5 states the theorem for any such cover.

### Q10.1 Unramified residue towers

Let `(R, 𝔪)` be a complete regular local ring that is unramified (mixed characteristic `(0, p)`,
`p ∉ 𝔪²`). Prove that the filtered system `(R_i)` of regular local finite flat `R`-algebras with
`𝔪_i = 𝔪R_i` and algebraically closed residue field of the colimit, supplied by PerfectoidSpaces
P7.16a (`exists_residueTower`), can be chosen with every `R_i` unramified (Česnavičius–Scholze
Lemma 3.1.1 (a), p. 29, and §1.4, p. 8; Česnavičius Lemma 5.1 and proof, pp. 11–12). The perfect-
residue-field tower of Lemma 3.1.1 (b) is PerfectoidSpaces P7.17.

*Proof route.* In the unramified case `R ≅ W⟦x_2, …, x_d⟧` with `W` a Cohen ring (`cohen_unramified`),
and the stages of P7.16a's construction are `W_i⟦x_2, …, x_d⟧` with `W_i` complete discrete valuation
rings with uniformizer `p` finite flat over `W`; in each stage `p` is a regular parameter not in
`𝔪_i²`.

*Needs:* PerfectoidSpaces P7.16a; Mathlib `IsRegularLocalRing`.

**Checks.**

- For `R = ℤ_p`, the stages are `W(𝔽_{pⁿ})`, unramified with residue fields `𝔽_{pⁿ}`.
- For the ramified `R = ℤ_p⟦x⟧/(p − x²) = ℤ_p[√p]` the stages `W(𝔽_{pⁿ})[√p]` are ramified: the
  clause needs `R` unramified.
- For `R = 𝔽_p⟦x⟧` (equal characteristic) the stages are `𝔽_{pⁿ}⟦x⟧` and the colimit is not complete;
  unramifiedness is not defined there.

### Q10.2 Perfectoid covers of regular local rings via prisms

**Theorem** (`exists_faithfullyFlat_isIntegralPerfectoid`). Every regular local ring `R` with
`p ∈ 𝔪_R` admits a faithfully flat map `R → R_∞` to an integral perfectoid ring (Bhatt–Scholze
Remark 3.11, pp. 32–33, for complete `R` of mixed characteristic; Bhatt Proposition 5.2 with
modification (a) of the paragraph following its statement, p. 8, for `p`-torsion-free `R`; in
equal characteristic `p` the cover is the perfection of `R`, faithfully flat by Kunz's theorem).

For complete `R` of mixed characteristic `(0, p)` with residue field `k` (not necessarily perfect),
the cover is the following. Choose a Cohen ring `W` for `k` (PerfectoidSpaces P7.16a) and a
Frobenius lift `φ_W` of `W`, a ring endomorphism with `φ_W(w) ≡ w^p mod p`; it exists by the
compatible coefficient lifting of DeformationAndDerivedPatchingAlgebra §1.10 applied to the
complete local ring `W` and the residue map `x ↦ x^p` of `k`, and it is not unique when `k` is
imperfect (Bhatt–Scholze Remark 3.11, p. 32, chooses one). Write
`R = A/(f)` with `A = W⟦x_1, …, x_d⟧`, `d = dim R`, and `f ∈ 𝔪_A ∖ 𝔪_A²`. Writing
`f ≡ a_0 p + Σ a_i x_i` in `𝔪_A/𝔪_A²`: if `a_0 ≠ 0`, the δ-structure on `A` extending `φ_W` with
`φ(x_i) = x_i^p` makes `f` distinguished; if `a_0 = 0`, after a change of variables `f = x_1 − p` and
the same δ-structure makes `f` distinguished. Then `(A, (f))` is a prism, its perfection
`(A_∞, (f))` is a perfect prism, `R_∞ = A_∞/(f)` is integral perfectoid, and `R → R_∞` is faithfully
flat.

*Proof route.* Reduce to complete `R` (`R → R^∧` is faithfully flat and `R^∧` is regular local). In
equal characteristic `p`, take the perfection `colim_F R`: it is faithfully flat by Kunz
(`frobenius_flat_of_isRegular`, EnhancedDerivedSheaves §E1.6) and perfect, hence integral
perfectoid. In mixed characteristic: if `a_0 ≠ 0`, evaluation at `x = 0` is a δ-map `A → W` with
kernel in the Jacobson radical carrying `f` to an element of `p`-adic valuation one, so `δ(f)` is a
unit and `f` is distinguished (PrismaticCohomology §§0.61–0.63); the case `a_0 = 0` is the same after
the change of variables. `A` is `p`-torsion-free and `A/p = k⟦x⟧` is regular, so `φ_A` is
`p`-completely faithfully flat (Kunz), hence so is `A → A_∞` (a completed colimit of faithfully flat
maps); `R_∞` is integral perfectoid by PerfectoidSpaces P4.15.2, and `R → R_∞` is `p`-completely
faithfully flat. Since `p` is regular on `R` and `R_∞[p] = 0`, both are `p`-torsion-free and
`p`-complete, and DerivedDeRhamCohomology §1.10 gives ordinary faithful flatness.

*Needs:* PerfectoidSpaces P4.15.2 and P7.16a (`cohen_unramified`, `cohen_ramified`,
`cohen_equalCharacteristic`); DeformationAndDerivedPatchingAlgebra §1.10 (the Frobenius lift
`φ_W`); PrismaticCohomology §§0.61–0.63, §0.79; EnhancedDerivedSheaves §E1.6;
DerivedDeRhamCohomology §1.10; Mathlib `IsRegularLocalRing`, `PowerSeries`, `AdicCompletion`.

**Checks.**

- For `R = ℤ_p` (`d = 1`): `A = ℤ_p⟦x_1⟧`, `f = p − x_1` has `a_0 = 1`; the perfection is the completed
  `ℤ_p⟦x_1^{1/p^∞}⟧` and `R_∞` is the completion of `ℤ_p[p^{1/p^∞}]`.
- The presentation matters: the crystalline prism `(ℤ_p, (p))` is perfect with reduction `𝔽_p`, and
  `ℤ_p → 𝔽_p` is not flat; it is the presentation `ℤ_p = ℤ_p⟦x_1⟧/(p − x_1)` with `d = dim R`
  variables that perfects to a cover.
- For `R = 𝔽_p⟦t⟧` (equal characteristic), `R_∞ = colim_F R = ⋃ 𝔽_p⟦t^{1/pⁿ}⟧`, perfect and
  faithfully flat over `R`.
- For `R` a field of characteristic `p` (`d = 0`), `R_∞` is its perfect closure.
- The Frobenius lift is a choice when `k` is imperfect: for `k = 𝔽_p(t)` and `W` the `p`-adic
  completion of `ℤ_p[t]_{(p)}`, both `t ↦ t^p` and `t ↦ t^p + p` extend to Frobenius lifts (an
  element of `ℤ_p[t]` outside `pℤ_p[t]` goes to one whose residue is a nonzero element of `𝔽_p[t]`,
  a unit of `W`), while the identity of `W` is not one, as `t ≢ t^p mod p`. For `k = 𝔽_{p²}`,
  `W = W(𝔽_{p²})` and the identity is again not a lift: a primitive `(p² − 1)`-st root of unity
  `ζ` has `ζ^p ≢ ζ mod p`; the Witt vector Frobenius, `ζ ↦ ζ^p`, is the only lift.

### Q10.3 The completed absolute integral closure is perfectoid

Let `R` be a domain whose fraction field has characteristic `0`, with `p` a nonunit of `R`. Prove
that `R⁺` is `p`-torsion-free, every monic polynomial of positive degree over `R⁺` has a root in
`R⁺`, every element of `R⁺` has compatible `p`-power roots in `R⁺`, and `(R⁺)^∧` is integral
perfectoid (Bhatt–Scholze Remark 10.13, p. 83; Česnavičius Lemma 4.7, p. 8). `R` need not be
noetherian or complete.

*Proof route.* `R⁺` is a domain of characteristic `0`, integrally closed in its algebraically closed
fraction field, so monic polynomials have roots; in particular `π = p^{1/p} ∈ R⁺`, Frobenius of
`R⁺/p` is surjective and roots can be chosen successively. With `(π^p) = (p)` and `R⁺` integrally
closed in `R⁺[1/p]`, `completion_integrally_closed_perfectoid` (PerfectoidQuotients §0.5) applies.

*Needs:* PerfectoidQuotients §0.5; Mathlib `integralClosure`, `AlgebraicClosure`, `IsAlgClosed`.

**Checks.**

- For `R = ℤ_p`, `R⁺ = ℤ̄_p` and `(R⁺)^∧ = 𝒪_{ℂ_p}`.
- For `R = 𝔽_p⟦t⟧` the characteristic-`0` hypothesis fails: `R⁺` is perfect, `(R⁺)^∧ = R⁺` is
  integral perfectoid with `π = 0`, but `R⁺` is not `p`-torsion-free (`p = 0`), so the first
  assertion is false there.
- If `p` is a unit in `R` (e.g. `R = ℚ`), `(R⁺)^∧ = 0`.

### Q10.4 A perfectoid cover inside the completed absolute integral closure

Let `(R, 𝔪)` be a complete regular local ring of mixed characteristic `(0, p)` whose residue field
`k` is `F`-finite, that is, `k` is a finite module over its subfield `k^p` of `p`-th powers. Write
`R = A/(f)` with `A = W⟦x_1, …, x_d⟧`, the presentation of Q10.2 (after its change of variables
when `a_0 = 0`, so that `f(0)` has `p`-adic valuation one) and its δ-structure `φ_A` (`φ_A` extends
the Frobenius lift `φ_W` of the Cohen ring `W` chosen in Q10.2, which exists by
DeformationAndDerivedPatchingAlgebra §1.10, and sends each `x_i` to `x_i^p`), and let
`R_n := A/(φ_A^n(f))`, an `R`-algebra through `φ_A^n`. Prove: (1) `W` is a finite free module over
`φ_W^n(W)` of rank `[k : k^p]^n`, hence `A` is finite free over `φ_A^n(A)` with basis the products
`w·x^a` of a basis `w` of `W` over `φ_W^n(W)` and the monomials `x^a` with `0 ≤ a_i < pⁿ`, and
`R_n = R ⊗_{A, φ_A^n} A` is finite free over `R` of rank `[k : k^p]^n pⁿᵈ`; (2) `φ_A^n(f) ∉ 𝔪_A²`, so
each `R_n` is a complete regular local ring, in particular a normal domain; (3) `R_∞ := colim_n R_n`
is a domain integral over `R`, so it embeds `R`-linearly into `R⁺` (Q10.3), and
`R_∞ ∩ pⁿR⁺ = pⁿR_∞` for all `n`; (4) the `p`-adic completion `R̂_∞` is the cover `A_∞/(f)` of
Q10.2, hence integral perfectoid, `R → R̂_∞` is faithfully flat, and `R̂_∞ → (R⁺)^∧` is an injective
`R`-algebra map. For perfect `k` and the presentations `f = x_1 − p` (unramified) and `f = p − g`
with `g ∈ (p, x)²` (ramified), `R_n` is the stage `W(k)[p^{1/pⁿ}]⟦x_2^{1/pⁿ}, …, x_d^{1/pⁿ}⟧`,
resp. `W(k)⟦x^{1/pⁿ}⟧/(p − g)`, of PerfectoidSpaces P7.17 after identifying `W(k)` with itself
through the automorphism `φ_W^n` (Bhatt–Scholze Remark 3.11, pp. 32–33, and Remark 10.13, p. 83;
Česnavičius Lemma 5.2 and proof, p. 12).

**Theorem** (`exists_faithfullyFlat_isIntegralPerfectoid_injective_completion`). In particular,
a complete regular local ring `R` of mixed characteristic `(0, p)` with `F`-finite residue field
admits a faithfully flat map `R → R'` to an integral perfectoid ring together with an injective
`R`-algebra map `R' → (R⁺)^∧`; by (4), `R' = R̂_∞` works. This is the cover that Q10.6 feeds into
Q10.5. Q10.2 alone gives a faithfully flat perfectoid cover with no map to `(R⁺)^∧`.

*Proof route.* `W` is `p`-adically complete and `p`-torsion-free with `W/p = k` and `φ_W(p) = p`.
As `k` is finite over `k^p`, the complete form of Nakayama's lemma makes `W` finite over `φ_W(W)`;
a lift of a `k^p`-basis of `k` generates, and the kernel `K` of the surjection from the free
module satisfies `K = pK` because `W` is `p`-torsion-free, so `K = 0` by Nakayama. The monomial
decomposition `W⟦x⟧ = ⊕_a W⟦x^{pⁿ}⟧ x^a` gives (1), and base change of `R = A/(f)` along the finite
free map `φ_A^n : A → A` is `A/(φ_A^n(f))`. For (2), at `n = 0` the element `φ_A^0(f) = f` is not
in `𝔪_A²` by the choice of presentation; its class `a_0 p + Σ a_i x_i` need not be a multiple of the
class of `p`. For `n ≥ 1`, `φ_A^n` sends each `x_i` to `x_i^{pⁿ} ∈ 𝔪_A²`, so
`φ_A^n(f) ≡ φ_W^n(f(0))` modulo `𝔪_A²`. In both cases of Q10.2 `f(0)` has `p`-adic valuation one
(`a_0 ≠ 0`, or `f = x_1 − p` with `f(0) = −p`), hence so does `φ_W^n(f(0))`, and the class of
`φ_A^n(f)` in `𝔪_A/𝔪_A²` is a unit multiple of the class of `p`, which is nonzero because
`p, x_1, …, x_d` is a regular system of parameters of `A`. For (3), the transition maps
`R_n → R_{n+1}` are injective (finite free, hence faithfully flat), so `R_∞` is a filtered union of
normal domains finite over `R`; an element of `R_∞ ∩ pⁿR⁺` is `pⁿ` times an element of `Frac(R_m)`
integral over `R`, which lies in `R_m`. For (4), `(colim_{φ_A} A)/(f) = colim_n R_n` because the
ideal generated by `f` in the `n`-th copy of `A` is `(φ_A^n(f))`, and `f` is a nonzerodivisor on
`colim_{φ_A} A` and on `A_∞`, so `A_∞/(f) = (colim_n R_n)^∧_p`; `R → R_∞` is faithfully flat as a
filtered colimit of finite free maps, `R/p → R̂_∞/p` is faithfully flat, and `R`, `R̂_∞` are
`p`-torsion-free and `p`-complete, so DerivedDeRhamCohomology §1.10 gives faithful flatness;
injectivity of the completed map follows from (3).

*Needs:* Q10.2, Q10.3; PerfectoidSpaces P4.15.2, P7.16a and P7.17; DeformationAndDerivedPatchingAlgebra
§1.10 (the Frobenius lift `φ_W`); DerivedDeRhamCohomology §1.10; Mathlib `Module.FaithfullyFlat`,
`Module.Finite`, `integralClosure`, `IsIntegrallyClosed`, `IsRegularLocalRing`, `Subfield`,
`AdicCompletion`.

**Checks.**

- For `R = ℤ_p` (`k = 𝔽_p`, `f = p − x_1`): `R_n = ℤ_p⟦x_1⟧/(p − x_1^{pⁿ}) = ℤ_p[p^{1/pⁿ}]`, of rank
  `pⁿ`, `R_∞ = ℤ_p[p^{1/p^∞}] ⊆ ℤ̄_p` and `R̂_∞ ⊆ 𝒪_{ℂ_p}`.
- Regularity of the stages in the same example: in the basis `([p], [x_1])` of the `𝔽_p`-vector
  space `𝔪_A/𝔪_A²` the class of `f = p − x_1` is `(1, −1)`, and for `n ≥ 1` the class of
  `φ_A^n(f) = p − x_1^{pⁿ}` is `(1, 0)` (for `p = 2`: `(1, 1)` and `(1, 0)`). Both are nonzero, but
  only the second is a multiple of `[p]`: the stage `n = 0` is regular by the choice of `f`, not by
  the computation that serves `n ≥ 1`.
- The normalisation of Q10.2 is needed for (2): `ℤ_p = ℤ_p⟦x_1⟧/(p² − x_1)` is a presentation with
  `f ∉ 𝔪_A²` but `a_0 = 0` and `f(0) = p²`; for it `φ_A(f) = p² − x_1^p ∈ 𝔪_A²`, and
  `ℤ_p⟦x_1⟧/(x_1^p − p²)` is not regular (its maximal ideal `(p, x_1)` needs two generators in
  dimension one; for `p = 2` it is not a domain, as `(x_1 − 2)(x_1 + 2) = 0`). Q10.2 replaces this
  presentation by `f = x_1 − p`.
- The intersection formula: for `R = ℤ_p`, `p^{1/p} ∈ R_∞` is not in `pR⁺` (its valuation is
  `1/p < 1`), and `p^{1+1/p} ∈ pR⁺ ∩ R_∞` equals `p · p^{1/p} ∈ pR_∞`, as normality of `R_∞` predicts.
- An `F`-finite imperfect residue field: `k = 𝔽_p(t)`, `W` the `p`-adic completion of `ℤ_p[t]_{(p)}`
  with `φ_W(t) = t^p`, `R = W⟦x⟧` (`d = 2`, `A = W⟦x_1, x_2⟧`, `f = x_1 − p`). Then `[k : k^p] = p`,
  `W` is free over `φ_W^n(W)` with basis `1, t, …, t^{pⁿ−1}`, and `R_n = W⟦x_1, x_2⟧/(x_1^{pⁿ} − p)`
  with `R` acting through `φ_A^n`, finite free over `R` of rank `pⁿ · p^{2n} = p^{3n}`; a count that
  forgot the factor `[k : k^p]^n` would give `p^{2n}`.
- The hypothesis is needed for the stages to be finite: for `k = 𝔽_p(t_1, t_2, …)`, `[k : k^p]` is
  infinite, `W` is not finite over `φ_W(W)`, and `R_1 = A/(φ_A(f))` is not finite over `R`; Q10.2
  still gives a faithfully flat perfectoid cover of `R`, but no map to `(R⁺)^∧` is constructed, and
  Q10.5 takes such a map as a hypothesis.

### Q10.5 Almost vanishing of `Tor` along finite subextensions of `R⁺`

**Theorem** (`tor_map_mul_root_eq_zero_of_cover`). Let `R` be a complete regular local ring of mixed
characteristic `(0, p)`, `S ⊆ R⁺` a finite `R`-subalgebra, `n > 0`, and `c ∈ pR` with
`R[1/c] → S[1/c]` finite étale. Suppose given a faithfully flat map `R → R_∞` to an integral
perfectoid ring and an `R`-algebra map `R_∞ → (R⁺)^∧`. Then for every `i > 0` and every
`R/pⁿ`-module `N`, the image of
`Tor_i^{R/pⁿ}(S/pⁿ, N) → Tor_i^{R/pⁿ}(R⁺/pⁿ, N)` is annihilated by every `c_k` in any compatible
system `(c_k)` of `p`-power roots of `c` in `R⁺` (Bhatt–Scholze Remark 10.13, pp. 83–84; with the
cover of Q10.4 this is Q10.6, Heitmann–Ma's theorem). `c = 0` is allowed (the statement is then
empty). As in Q10.6, `Suggested.lean` writes `S/pⁿ` and `R⁺/pⁿ` as base changes to
`R/pⁿ` and lets `c_k` act through the first argument of `Tor`.

*Proof route.* First enlarge the cover so that it contains compatible roots of `c` mapping to the
given `c_k`. `R_∞` is `p`-torsion-free (flat over the domain `R`), so `ϖ := ((p♭)^{1/p})♯ ∈ R_∞` is
a nonzerodivisor with `ϖ^p` a unit multiple of `p` and with compatible `p`-power roots. Apply Q9.1
to `(R_∞, ϖ, {T − c})`: with `A'` the `p`-integral closure of `R_∞[T^{1/p^∞}][(T − c)/ϖ^m : m ≥ 0]`
in `R_∞[T^{1/p^∞}][1/ϖ]` and `I'` its `ϖ`-divisible ideal, `A'/I'` is faithfully flat over `R_∞`
(Q9.2 with Q7.4, as in the proof of Q9.3), `R'_∞ := (A'/I')^∧ = Â'` is integral perfectoid
(`completion_pIntegralClosure_perfectoid`) and `ϖ`-torsion-free, and `R_∞/ϖ → R'_∞/ϖ` is
faithfully flat; so `R/pⁿ → R'_∞/pⁿ` is flat for every `n`, and `R → R'_∞` is faithfully flat
(DerivedDeRhamCohomology §1.10). The map `R_∞[T^{1/p^∞}] → (R⁺)^∧` over `R_∞ → (R⁺)^∧` sending
`T^{1/pᵏ} ↦ c_k` kills `T − c`, so after inverting `ϖ` it carries `R_∞[T^{1/p^∞}][(T − c)/ϖ^m]` into
`(R⁺)^∧`; since `(R⁺)^∧` is `p`-torsion-free and integral perfectoid (Q10.3), it is `p`-integrally
closed in `(R⁺)^∧[1/p]` (`perfectoid_p_integral_closedness`), so `A'` maps into `(R⁺)^∧` with `I'`
mapping to `0`, and completing gives an `R`-algebra map `R'_∞ → (R⁺)^∧` with `T^{1/pᵏ} ↦ c_k`. Thus
`R'_∞` satisfies the hypotheses on `R_∞`, and it suffices to prove the theorem for `R'_∞`.

Now `T = S ⊗_R R'_∞` is a finitely presented finite `R'_∞`-algebra, finite étale after inverting
`c`. By almost purity along `(c)` (PrismaticCohomology §2.31), `R'_∞/pⁿ → T_perfd/pⁿ` is almost
finite projective for `J := (cR'_∞)_perfd = ker(R'_∞ → (R'_∞/c)_perfd)`, and `T_perfd` is integral
perfectoid (integral perfectoidization, PrismaticCohomology §2.31). As `R/pⁿ → R'_∞/pⁿ` is flat,
`Tor_i^{R/pⁿ}(T_perfd/pⁿ, N) = Tor_i^{R'_∞/pⁿ}(T_perfd/pⁿ, R'_∞ ⊗_R N)`, which is killed by `J` for
`i > 0`, using that `c ∈ pR` and that the `p`-torsion of `T_perfd` is killed by all `p`-power roots
of a unit multiple of `p` (Q5.4 (2) with PerfectoidQuotients §0.4). The root `T^{1/pᵏ}` is nilpotent
in `R'_∞/c`, so it maps to zero in the integral perfectoid, hence reduced, ring `(R'_∞/c)_perfd`
(Bhatt–Scholze, proof of Theorem 7.4, p. 62) and lies in `J`. The map `S/pⁿ → R⁺/pⁿ` factors as
`S/pⁿ → T/pⁿ → T_perfd/pⁿ → R⁺/pⁿ`, the last by the universal property of `T → T_perfd`
(PrismaticCohomology §2.30) applied to `T → (R⁺)^∧`; the image of `Tor_i^{R/pⁿ}(S/pⁿ, N)` in
`Tor_i^{R/pⁿ}(R⁺/pⁿ, N)` lies in the image of `Tor_i^{R/pⁿ}(T_perfd/pⁿ, N)`, a `T_perfd`-submodule
killed by `J`, in particular by `T^{1/pᵏ}`, which acts on `R⁺/pⁿ` as `c_k`. Without the enlargement
the image is only known to be killed by the image of `(cT_perfd)_perfd`, which need not generate an
ideal of `(R⁺)^∧` containing `c_k`.

*Needs:* Q10.3, Q5.4, Q9.1, Q9.2, Q7.4; PerfectoidQuotients §§0.4–0.5; PrismaticCohomology
§§2.30–2.31; PerfectoidSpaces P0.1–P0.2 and P0.11; DerivedDeRhamCohomology §1.10; Mathlib
`CategoryTheory.Tor`, `Module.Flat`.

**Checks.**

- If `S = R`, the source `Tor_i^{R/pⁿ}(R/pⁿ, N)` vanishes for `i > 0`.
- If `R → S` is finite étale, `S/pⁿ` is flat over `R/pⁿ`, the source vanishes, and every `c ∈ pR`
  works.
- For `c = 0` the roots are all `0` in the domain `R⁺`, and multiplication by `0` kills everything.
- Positive Tor degree matters: for `R = S = ℤ_p`, `n = 1`, `N = 𝔽_p` and `c = p`, the degree-zero
  map followed by multiplication by `c_1 = p^{1/p}` sends `1` to a nonzero class in `R⁺/p`,
  because its valuation `1/p` is less than `1`. At `n = 0` the coefficient ring is zero,
  so both Tor groups are zero; the theorem concerns `n > 0`.
- The roots are taken in `R⁺`, not in `S`: for `R = ℤ_p` with `p` odd, `S = ℤ_p[√p]` and `c = p`,
  `R[1/p] → S[1/p]` is finite étale while `S` contains no `p`-th root of `p`: the `p`-adic valuations
  of nonzero elements of `S` lie in `(1/2)ℕ`, which does not contain `1/p`. Over a ramified `R` the
  example fails: for `R = ℤ_p[p^{1/p}]`, `S = R[√p]` already contains `p^{1/p}`.
- The enlargement of the cover matters only beyond unit multiples of elements with roots in `R_∞`.
  An integral perfectoid `R_∞` contains compatible `p`-power roots `b_k = ((p♭)^{1/pᵏ})♯` of
  `b_0 = vp` for a unit `v` of `R_∞` (Conventions; BMS1 Lemma 3.9), but need not contain a `p`-th
  root of `p` itself: for `R = ℤ_p`, `p` odd, the completed `ℤ_p^{cycl}` of Q9.4 is a faithfully flat
  integral perfectoid `R_∞` with a map to `(R⁺)^∧ = 𝒪_{ℂ_p}`, and contains none. For `c = pu` with
  `u ∈ R^×` (for instance `c = p(1 + x)` in `R = ℤ_p⟦x⟧`), let `b̄_k` and `v̄` be the images of `b_k`
  and `v` in `(R⁺)^∧`; then `c_k^{pᵏ} = (u/v̄) b̄_k^{pᵏ}`, so `c_k/b̄_k ∈ (R⁺)^∧[1/p]` has a unit
  `pᵏ`-th power and is a unit of `(R⁺)^∧`, which is `p`-integrally closed in `(R⁺)^∧[1/p]` (as in
  the proof route); and `b_k`
  lies in `√(pR_∞) ⊆ (pR_∞)_perfd`, as `b_k^{pᵏ} = vp`. For `c = px` in `R = ℤ_p⟦x⟧` the roots
  `p^{1/pᵏ}x^{1/pᵏ}` lie in the cover of Q10.4, which contains actual roots of `p` and `x`, up to
  units of `R⁺`; for `c = p(x + p)` the roots of `x + p` are adjoined by no stage of Q10.4, and it is
  the enlarged `R'_∞` that carries `T^{1/pᵏ} ↦ c_k`.
- The image is annihilated through `R'_∞ → (R⁺)^∧`: a proof that only showed `J`-almost vanishing
  of the middle `Tor` would conclude annihilation by the image of `J`, not by `c_k`, unless some
  element of `J` maps to a unit multiple of `c_k`; the enlargement supplies `T^{1/pᵏ}`.

### Q10.6 Almost vanishing of `Tor` for an `F`-finite residue field

**Theorem** (`tor_map_mul_root_eq_zero`). Let `R` be a complete regular local ring of characteristic
`0` whose residue field `k` has characteristic `p` and is `F`-finite, a finite module over its
subfield `k^p` of `p`-th powers (in `Suggested.lean`, `Module.Finite` of `k` over the field range of
`frobenius k p`), `S ⊆ R⁺` a finite `R`-subalgebra and
`c ∈ pR` with `R[1/c] → S[1/c]` finite étale. For `n > 0`, `i > 0`, every `R/pⁿ`-module `N` and every
compatible system `(c_k)` of `p`-power roots of `c` in `R⁺`, the map
`Tor_i^{R/pⁿ}(S/pⁿ, N) → Tor_i^{R/pⁿ}(R⁺/pⁿ, N)` followed by multiplication by `c_k` is zero. In
`Suggested.lean`, `S/pⁿ` and `R⁺/pⁿ` are the base changes `R/pⁿ ⊗_R S` and `R/pⁿ ⊗_R R⁺`, and
multiplication by `c_k` acts through the first argument of `Tor`. This is Bhatt–Scholze
Remark 10.13, pp. 83–84, from which Heitmann–Ma Theorem 1.3, p. 2, follows in its own generality
of `F`-finite residue fields.

*Proof route.* Q10.5 with the cover of Q10.4.

*Needs:* Q10.4, Q10.5.

**Checks.**

- For `R = ℤ_p`, `S = ℤ_p[ζ_p]` and `c = p`, `ℚ_p → ℚ_p(ζ_p)` is finite étale; `S` is free over
  `ℤ_p`, so the source `Tor` vanishes and the statement is empty. The same holds for every
  one-dimensional `R`, since finite torsion-free modules over a discrete valuation ring are free.
- Over a two-dimensional `R` every finite normal `S` is Cohen–Macaulay, hence free over `R`
  (Auslander–Buchsbaum), so the source vanishes for normal `S`. For non-normal `S` it need not:
  for `R = ℤ_p⟦x⟧`, `S = R ⊕ (p, x)·√x ⊆ R[√x]` (a subring, as `(p, x)²·x ⊆ R`) and `c = px`,
  `S[1/c] = R[1/c][√x]` is finite étale over `R[1/c]`, and since `S ≅ R ⊕ 𝔪` is `p`-torsion-free,
  `Tor_1^{R/pⁿ}(S/pⁿ, k) ≅ Tor_1^R(𝔪, k) ≅ Tor_2^R(k, k) ≅ k ≠ 0`. For normal `S` a nonzero source
  needs `dim R ≥ 3`, where normal domains need not be Cohen–Macaulay.
- The cover used is that of Q10.4: for `R = ℤ_p⟦x⟧` it is the `p`-adic completion of
  `colim_m ℤ_p[p^{1/p^m}]⟦x^{1/p^m}⟧`, embedded in `(R⁺)^∧` by compatible roots of `p` and `x`.
- The hypothesis is Heitmann–Ma's: `[k : k^p] = 1` for perfect `k` and `[k : k^p] = p` for
  `k = 𝔽_p(t)`, and Q10.4 applies to both; for `k = 𝔽_p(t_1, t_2, …)` it is infinite and Q10.6 does
  not apply, while Q10.5 applies to any cover mapping to `(R⁺)^∧`. A perfect-residue-field
  hypothesis would exclude `k = 𝔽_p(t)`, where the theorem holds.

### Examples

`ℤ_p ⊆ ℤ_p[p^{1/p^∞}]^∧ ⊆ 𝒪_{ℂ_p}` is Q10.2–Q10.4 for `R = ℤ_p`; `ℤ̄_p` is `R⁺`.

### Dependencies

*Needs:* Layers Q5, Q7 and Q9; PerfectoidQuotients §§0.4–0.5; PerfectoidSpaces P0.1–P0.2, P0.11,
P4.15.2, P7.16a and P7.17; PrismaticCohomology §§0.61–0.63, §0.79 and §§2.30–2.31; EnhancedDerivedSheaves §E1.6;
DeformationAndDerivedPatchingAlgebra §1.10; DerivedDeRhamCohomology §1.10; Tau Ceti
`TauCeti.Perfectoid.IsIntegralPerfectoid`.

## Worked examples

- `𝒪_C` and `𝒪_{C♭}` (for `C` complete and algebraically closed) are perfectoid valuation rings with
  the same value group; their tilting is the field case of Q6.4 and Q6.7, and the André lemma is
  trivial for `𝒪_C` (Q9.3).
- The completion of `ℤ_p[p^{1/p^∞}]` is a perfectoid valuation ring whose tilt is the `t`-adic
  completion of `𝔽_p[t^{1/p^∞}]`; neither fraction field is algebraically closed (Q6.7). It is the
  completed tower of PerfectoidSpaces P7.17 and the prismatic cover of Q10.2 for `R = ℤ_p`.
- A perfect `𝔽_p`-algebra is its own tilt with `♯` the identity, and every statement of Q5–Q6
  specializes to a characteristic-`p` identity.
- `𝒪_C/(p^{1/p^∞}) = k̄` and products of perfectoid valuation rings show that integral perfectoid
  rings may have `p`-torsion and need not be domains (Q5.4, Q6.4).
- `W(k)⟦x_1^{1/p^∞}, …, x_d^{1/p^∞}⟧/(p − g)` with `g = x_1` (unramified) or `g ∈ (p, x)²` (ramified)
  is the tower of PerfectoidSpaces P7.17 for perfect `k`; its `p`-adic completion is perfectoid, and
  inside `R⁺` it is the cover of Q10.4 for the defining element `f := p − g` of `R = A/(f)` (for
  `g = x_1` this is Q10.4's `x_1 − p` up to sign), whose stages `A/(φ_A^n(p − g))` are defined for
  every `F`-finite `k`. For `p = 2`, `d = 1`: with `g = x` the first stage is
  `ℤ₂⟦x⟧/(2 − x²) ≅ ℤ₂[√2]`, of rank two over `R = ℤ₂`, and the class of `2 − x²` in the basis
  `([2], [x])` of `𝔪_A/𝔪_A²` is `(1, 0)`; with `g = x²` it is `ℤ₂⟦x⟧/(2 − x⁴) ≅ ℤ₂[2^{1/4}]`,
  again Eisenstein. Applying `φ_A` to `g` alone instead would give `ℤ₂⟦x⟧/(x²)` and
  `ℤ₂⟦x⟧/(x⁴)`, which have nonzero nilpotents.

## Downstream consumers

- PurityForFlatCohomology (Česnavičius–Scholze §§3–6) uses the tilts and torsion of products
  (Q5.2, Q5.4), the tilting of valuation rings and of their localizations (Q6.3–Q6.7), the ind-fppf
  ring maps (Q7.1, Q7.3) and the unramified residue towers (Q10.1 with PerfectoidSpaces
  P7.16a–P7.17).
- SchemeAndStackFoundationsPartII (flat cohomology and the pro-fppf site of Česnavičius–Scholze
  §4.1.1) uses the ind-fppf and ind-syntomic ring maps of Q7.1–Q7.3.
- EtaleDualityAndPerverseSheavesPartII uses the tilting identities (Q5.1–Q5.3), the transfer of
  completeness (Q6.2) and the tilting of valuation rings (Q6.3–Q6.7) for its algebraic tilting of
  étale cohomology of henselian perfectoid pairs (its §§8.1–8.5; Česnavičius–Scholze
  Theorem 2.2.7).

## References

- **CS24**: Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*, Annals of
  Mathematics 199 (2024), 51–180; read in [arXiv:1912.10932v3](https://arxiv.org/abs/1912.10932v3).
  §1.4, p. 8; §2.1, pp. 9–18; §2.3, pp. 22–29; Lemma 3.1.1, p. 29.
- **BS22**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*, Annals of
  Mathematics 196 (2022); read in [arXiv:1905.08229v4](https://arxiv.org/abs/1905.08229v4).
  Remark 3.11, pp. 32–33; Theorem 7.4, p. 56, and its proof, p. 62; Theorems 10.9 and 10.11 and
  Remark 10.13, pp. 80–84.
- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral p-adic Hodge theory*,
  Publ. Math. IHÉS 128 (2018); read in [arXiv:1602.03148v3](https://arxiv.org/abs/1602.03148v3).
  Lemma 3.2, p. 19; Definition 3.5 and Example 3.6, p. 21; Lemmas 3.9–3.10, p. 22.
- **Bha18**: Bhargav Bhatt, *On the direct summand conjecture and its derived variant*, Invent.
  Math. 212 (2018); read in [arXiv:1608.08882v2](https://arxiv.org/abs/1608.08882v2). Theorem 1.5,
  p. 2; Propositions 5.1–5.2, p. 8.
- **Wedhorn**: Torsten Wedhorn, *Adic spaces*, [arXiv:1910.05934v1](https://arxiv.org/abs/1910.05934v1).
  Lemma 7.4, p. 57; Definition 7.7, p. 58; Theorem 7.10, p. 59; Proposition 7.18, pp. 60–61.
- **Sch12**: Peter Scholze, *Perfectoid spaces*, Publ. Math. IHÉS 116 (2012); read in
  [arXiv:1111.4914v1](https://arxiv.org/abs/1111.4914v1). Theorem 3.7 and Proposition 3.8, p. 17.
- **Ces19**: Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168 (2019); read in
  [arXiv:1711.06456v4](https://arxiv.org/abs/1711.06456v4). Lemma 4.7, p. 8; Lemmas 5.1–5.2,
  pp. 11–12.
- **HM17**: Raymond C. Heitmann and Linquan Ma, *Extended plus closure in complete local rings*,
  read in [arXiv:1708.05761v3](https://arxiv.org/abs/1708.05761v3). Theorem 1.3, p. 2.
- **Stacks**: The Stacks Project Authors, *The Stacks Project*,
  [stacks.math.columbia.edu](https://stacks.math.columbia.edu). Lemma 10.17.2 (00E0), Lemma 10.30.5
  (00FK), Lemma 10.39.15 (00HP), Lemma 10.50.2 (00IA), Lemma 10.68.9 (07DV), Lemma 10.96.8 (090T),
  Lemma 10.96.10 (031A),
  Lemma 10.99.16 (0H7N), Lemma 10.127.4 (07C3), Definition 10.136.1 (00SL), Lemma 10.136.4 (00SO),
  Lemmas 10.136.12–10.136.13 (00SV, 00SW), Lemma 10.136.15 (00SY), Lemma 10.136.17 (00SZ),
  Lemmas 10.160.6–10.160.7 (0328, 0329), Lemma 10.168.9 (0C33),
  Lemma 15.32.2 (0BIQ).
