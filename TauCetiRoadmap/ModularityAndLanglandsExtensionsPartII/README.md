# Roadmap: modularity and Langlands extensions, part II — the proof of symmetric power functoriality

**Summary.** [ModularityAndLanglandsExtensions](../ModularityAndLanglandsExtensions/README.md)
states symmetric power functoriality for holomorphic modular forms and for Hilbert modular forms
(its §§4.12, 4.29, 4.30), the steps of Newton–Thorne's and Clozel–Thorne's proofs as theorems in
their own right (its §§4.5–4.11, 4.23) and their reductions (its §§4.15, 4.22), each with a
one-line route. This Part II starts where that roadmap stops: it builds the four methods behind
those statements and proves them. **Analytic continuation along eigenvarieties** (Layers 0–3):
the rigid spaces of conjugate self-dual pseudocharacters, the continuation of symmetric power
functoriality along irreducible components of definite unitary eigenvarieties, its transport to
the Coleman–Mazur eigencurve, and Newton–Thorne's ping-pong on Buzzard–Kilford's boundary annuli,
proving that automorphy of `Sym^{n−1}` for one level-one form gives it for all (Theorem D).
**Level raising on definite unitary groups** (Layers 4–7): the local representation theory of
unitary groups at inert and ramified places, level raising to prescribed depth-zero types by the
stabilised trace formula, level raising to Steinberg by residually reducible deformation theory
and by Thorne's `p`-adic method, the residually CM seed of Newton–Thorne, and Clozel–Thorne's
sixth and eighth symmetric powers. **Automorphy lifting for symmetric powers** (Layers 8–10):
congruences to forms with `n`-regular refinements, the automorphy lifting theorem in which
regularity of a pseudodeformation ring at an automorphic point replaces control of a dual Selmer
group, and the induction on supercuspidal primes through seasoned representations.
**Tensor-product functoriality lifting** (Layers 11–13): the untwisted tensor
`r_π ⊗ Sym^{r−1} r_σ` by comparing deformation problems with congruent special fibres, the
functoriality lifting theorem for tensor products with one factor fixed, residual witnesses for
the coefficient-Frobenius twisted tensor, and the Bertrand induction proving `SP_n` for every `n`
over every totally real field. Layer 14 assembles the endpoints over `ℚ`: Theorem E and Theorem A
in level one, Theorem B, symmetric power functoriality for every non-CM newform, and the
holomorphy of `L(s, Sym^n f)` for level-one eigenforms and, away from the level, for every non-CM
newform of weight at least `2`, the statements this roadmap's Lean file records.

| Layer | Title | What it builds |
|---|---|---|
| 0 | Rigid spaces of pseudocharacters | analytic continuation along components, `𝒳_ps` with its irreducible locus, polarized lifts and tangent spaces |
| 1 | Continuation between unitary eigenvarieties | non-critical and ordinary continuation, non-criticality of symmetric powers, automorphy along components of `ℰ_2` |
| 2 | From the eigencurve to unitary eigenvarieties | the twin involution, trivialising character families, the base-change morphism, constancy of symmetric-power automorphy on eigencurve components, the bad locus |
| 3 | Level one and ping-pong | Buzzard–Kilford annuli, boundary weights, twins, level-one refinements, local images, Theorem D |
| 4 | Local representation theory for unitary level raising | unitary groups and inner twists, character identities, stable base change, depth-zero types, fixed-type rings, chamber-fixer Hecke algebras of ramified unitary groups, the Kazhdan–Lusztig modules and their signs |
| 5 | Level raising to prescribed types | level raising to depth-zero types at inert places and to Iwahori-spherical components at ramified places, by the stabilised trace formula |
| 6 | Level raising to Steinberg | Steinberg level raising for sums of characters, for two constituents, from a long Jordan block, and by `p`-adic methods |
| 7 | Seeds | the CM form `σ₀`, residually CM symmetric powers with a Steinberg place, Theorem E in 2-power rank, `Sym^6` and `Sym^8` |
| 8 | Killing ramification | the non-regular divisor, congruences to `n`-regular forms, Theorem B relative to a level-one seed |
| 9 | Automorphy lifting for symmetric powers | simultaneous patching of the rank-two deformation ring and the symmetric-power pseudodeformation ring, automorphy lifting for `Sym^{n−1}` |
| 10 | Seasoned representations | removing supercuspidal primes, symmetric power functoriality for non-CM forms relative to a seed |
| 11 | The untwisted tensor | automorphy of `r_π ⊗ Sym^{r−1} r_σ` by congruent special fibres and generic primes |
| 12 | Tensor functoriality lifting | automorphy lifting for `r_π ⊗ r_σ` with `σ` fixed, by simultaneous patching |
| 13 | Residual twisted tensors and the induction | large image from tamely dihedral places, residual witnesses for the coefficient-Frobenius twisted tensor, lifting from two ordinary blocks, `SP_n` for all `n` |
| 14 | Endpoints over `ℚ` | Theorems A, B, E for every rank, symmetric power functoriality for every non-CM newform, holomorphy of `L(s, Sym^n f)` in level one and, away from the level, for non-CM newforms of weight at least `2` |

## Scope and ownership

This roadmap owns the proofs of the theorems that ModularityAndLanglandsExtensions states in
§4.5 (automorphy of `Sym^{n−1}` is constant on eigencurve components), §4.6 (Buzzard–Kilford),
§4.7 (Theorem D), §4.8 (level raising to Steinberg for symmetric powers of theta series), §4.9
(Theorem E), §4.10 (congruences to `n`-regular forms), §4.11 (automorphy lifting for symmetric
powers), §4.23 (tensor-product functoriality lifting and the residual twisted-tensor witness),
and of the routes of its §§4.12, 4.20, 4.29, 4.30 and 4.31. The statements stay in that roadmap;
the targets here restate them only to the extent needed to fix hypotheses for their proofs, and
each says which section it proves. It also owns every intermediate object of those proofs that no
earlier roadmap states: the pseudocharacter spaces of Layer 0, the twin involution and the
base-change morphism of the eigencurve, the depth-zero types and the Kazhdan–Lusztig modules of
Layer 4, the deformation data of Layers 6, 9, 11 and 12, seasoned representations, the
companion forms of Newton–Thorne 2026 Lemmas 5.6 and 5.7 and the hypotheses `S5-global`,
`S5-local`.

It imports, by section and never re-plans:

- from ModularityAndLanglandsExtensions: the automorphy predicate in Newton–Thorne's sense (§0.2),
  accessible and `n`-regular refinements (§1.1), the projective image condition (§1.7), the
  symmetric power lift and `SP_n` (§§1.10, 1.12), the tensor and low-rank lifts (§§1.11, 1.13–1.15),
  Moret–Bailly with Galois control (§2.13), Mok's and Kaletha–Mínguez–Shin–White's classifications
  and Arthur's local packets (§§3.12, 3.15, 3.16), characteristic-zero enormous image and adjoint
  Selmer vanishing (§4.1), potential diagonalizability and its criteria (§2.1), potentially
  diagonalizable lifting (§2.16), ordinary lifting with several residual constituents (§4.2), the
  definite-unitary eigenvarieties with their closed realization, Emerton's Jacquet functor, family
  triangulations, trianguline deformations and classicality (§4.3), Anastassiades–Thorne's level
  raising for `GL_{2n}` (§4.4), the one-prime criterion (§4.15) and the Clozel–Thorne reductions
  with Newton–Thorne 2026 Proposition 6.1 and Thorne 2024 §8 (§4.22);
- from PotentialAutomorphyInfrastructurePartII: ι-ordinarity, soluble descent and auxiliary
  characters (Layer 0), connection of local lifts and potential diagonalizability (Layer 1), Schur
  residual representations and the determinant subring (Layer 2), definite unitary groups,
  algebraic modular forms, Hecke algebras, ordinary parts and Hida theory (Layer 3), Taylor–Wiles
  data and ordinary `R = T` (Layer 4), ordinary automorphy lifting and finiteness (Layer 5), residually reducible deformation rings, generic primes and the
  generic `R = T` theorem (Layers 7, 8), adjoint Bloch–Kato Selmer groups and semistable
  pseudodeformation rings (Layer 9); auxiliary cyclic CM extensions with prescribed split places from
  PotentialAutomorphyInfrastructure §2.5, and soluble extensions with prescribed completions and the
  ordinary companion of Newton–Thorne 2026 Lemma 3.1 from PotentialModularityAndCompatibleSystems
  §§2.16, 9.2;
- the deformation theory of LocalGaloisDeformationRings, GlobalGaloisDeformations and
  DeformationAndDerivedPatchingAlgebra; the eigencurve and eigenvariety machine of PadicFamilies;
  irreducible components of rigid spaces from AdicSpacesPartV Layer 1; unitary endoscopy,
  base change and the trace formula from EndoscopicTransferAndUnitaryTraceComparison; Iwahori–Hecke
  algebras, induction and cuspidal support from SmoothRepresentationsOfLocalGroups; the Springer
  resolution and the Steinberg variety from SpringerResolutionAndCharacteristicCycles; algebraic
  Jacobson–Morozov homomorphisms from NilpotentOrbits; adequacy,
  Clebsch–Gordan decompositions, Dickson's classification and enormous subgroups from
  ArithmeticGaloisRepresentations; the exponent-two ramification fields and the reciprocity of the
  two auxiliary splitting conditions from ArithmeticGaloisDuality §R02.3.5 (this is Newton–Thorne
  2026 Lemma 5.3, which is therefore not restated here); quaternionic patching for `GL_2` from
  GL2ModularityLifting; Chevalley's congruence theorem for finite-index subgroups of `S`-units from
  GL2AutomorphicRepresentationsAndTransfer §R16.1.7, and the non-CM self-twist condition on cuspidal
  classes of `GL_2` from its §R16.4.6 (§14.5 keeps only the coefficient form of that condition on
  Tau Ceti newforms, the carrier its Lean statement needs); the remaining suppliers are listed with
  their sections below.

This roadmap owns the Kazhdan–Lusztig classification of Iwahori-spherical representations of
split adjoint groups over non-archimedean local fields, together with its pullback to the simply
connected cover (§4.9), for every split adjoint group and not only for `PSp_{2k}`; other roadmaps
that need the classification cite §4.9. The level-one cuspidal cohomology of `GL_n(ℤ)`
and the local theory of `GSp_4`, which use symmetric power functoriality as an input but
different methods, are outside this roadmap; Sato–Tate and the Bianchi and CM-field results of
the parent are not touched.

Newton–Thorne I proves Theorem 7.1 for odd rank by an induction whose rank-two block is not
conjugate self-dual as printed (nt21, proof of Proposition 7.4, pp. 86–88: the block
`τ₀ ⊗ |·|^{(n−2)/2} ιω₁ω₀^{n−1}` differs from its required polarized dual by `δ_{K/ℚ}|_{G_{F₀}}`).
This roadmap therefore proves Theorem 7.1 in rank `2^r` by Anastassiades–Thorne alone (§7.5),
records the odd inductive step with the missing block as an explicit hypothesis (§7.4), and
obtains Theorem 7.1, Theorem E and every endpoint over `ℚ` in all ranks from the independent
Newton–Thorne 2026 induction of Layer 13 (Layer 14). The theorems of Layers 8 and 10 are stated
relative to a level-one seed, the automorphy of `Sym^{n−1}` of one level-one form, which is the only
input they take from the seed layers; §7.6 (for `n = 2^r`) and §14.1 (for every `n`) discharge it.

## Conventions

- Galois conventions follow ModularityAndLanglandsExtensions (its Conventions and §0.2):
  geometric Frobenius; local reciprocity sends uniformisers to geometric Frobenius;
  `rec^T(π_v) = rec(π_v ⊗ |det|^{(1−n)/2})`; the cyclotomic character `ε` has Hodge–Tate weight
  `−1`. RAESDC, RACSDC, RAECSDC and ι-ordinary are as in PotentialAutomorphyInfrastructurePartII
  Layer 0. For a cuspidal `π` of `GL_2`, `r_{π,ι}` is its `p`-adic Galois representation.
  "`Sym^{n−1} r_{π,ι}` is automorphic" means it is `r_{Π,ι}` for a RAESDC (totally real base) or
  RACSDC (CM base) `Π` of `GL_n`, as in ModularityAndLanglandsExtensions §0.2; "`Sym^{n−1}π`
  exists" means the all-place lift of its §1.10. `SP_n` is its §1.12 statement: for every totally
  real `F` and every non-CM RAESDC `π` of `GL_2(𝔸_F)`, `Sym^{n−1}π` exists. `TP_r` is tensor
  functoriality `GL_2 × GL_r → GL_{2r}` for RAECSDC representations over CM fields whose tensor is
  irreducible and Hodge–Tate regular (Clozel–Thorne's conjecture, as used in th24 §7, p. 42).
- `𝒢_n = (GL_n × GL_1) ⋊ {1, j}` is the group of Clozel–Harris–Taylor with multiplier `ν`;
  polarized representations take values in `𝒢_n` (GlobalGaloisDeformations §8.1).
  Pseudocharacters are Chenevier determinants (IntegralHeckeAndGaloisDeterminants §0.2); when `n!`
  is invertible they are determined by their traces (§0.5 there).
- `φ_p ∈ G_{ℚ_p}` is a lift of arithmetic Frobenius acting on coefficients; `φ_p r̄` and
  `^{φ_p} r̄` denote the coefficient twist, never evaluation at a Frobenius element. `a₀(p) ≥ 3` is
  the adequacy threshold of ArithmeticGaloisRepresentations §7.9 (Newton–Thorne 2026 Lemma 2.3,
  Thorne 2024 Lemma 7.3).
- Symmetric powers `Sym^d` of integral representations are the quotient symmetric powers of
  ArithmeticGaloisRepresentations §7.1; the mod-`p` decompositions of §7.8 there are statements
  about semisimplifications.
- In residually reducible arguments "primitive" means weakly primitive in the sense of
  PotentialAutomorphyInfrastructurePartII Layer 7, tested over an algebraic closure of the residue
  field. Before integral coefficient rings are fixed, the residue field is enlarged to a common
  finite splitting field for every subgroup of the residual image ("Weak primitivity over a
  splitting coefficient field", Layer 7); primitivity over an arbitrary finite field is never used
  in place of this.
- An eigencurve or eigenvariety point is written `z = (π, χ)`, with `χ` a refinement; `s(z)` is
  its slope and `κ(z)` its weight. Slopes use the normalization of ModularityAndLanglandsExtensions
  §4.3. For `p = 2` the weight coordinate is `w = κ(5) − 1`.
- Locators are to the versions listed under References: arXiv versions by PDF page for
  Newton–Thorne I (arXiv v3), Newton–Thorne II (arXiv v2), Newton–Thorne 2026 (arXiv v2), Thorne
  2024 (arXiv v2), Anastassiades–Thorne and Buzzard–Kilford; Clozel–Thorne III and Clozel–Thorne
  II by the page numbers of the authors' manuscripts; Conrad by internal pagination. Where a
  printed argument needs repair, the target says what the printed text does and what is used
  instead, at the claim.

## Exact supplier contracts

### From Mathlib

- `Nat.multiplicity_pow_two_sub_one` (`Mathlib/NumberTheory/Multiplicity.lean`): for odd `x > 1`
  and even `n ≠ 0`, `v₂(x^n − 1) + 1 = v₂(x + 1) + v₂(x − 1) + v₂(n)`, stated with `multiplicity 2`
  for `v₂`; with `x = 5` this is
  `v₂(5^j − 1) = 2 + v₂(j)` for even `j > 0`, used for the boundary weights of §3.2. It says
  nothing about odd `j`, where `v₂(5^j − 1) = 2` is checked directly.
- `Polynomial.discr` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`): the discriminant of
  a polynomial over a commutative ring, applied in §8.1 to the characteristic polynomial of
  `Sym^{n−1}` of a Frobenius; its vanishing over a field detects a repeated root only for a
  polynomial of the expected degree, which holds for a characteristic polynomial.
- `GaussianInt` (`Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean`): `ℤ[i]` with its conjugation,
  for the coefficients of the CM form `σ₀` of §7.1.
- `Nat.exists_prime_lt_and_le_two_mul` (`Mathlib/NumberTheory/Bertrand.lean`): Bertrand's
  postulate, for the choice `n/2 < p < n` in §13.10 (applied to `⌊n/2⌋`: a prime `p` with
  `⌊n/2⌋ < p ≤ 2⌊n/2⌋` satisfies `p < n` for `n ≥ 6`, since an even `n > 2` is not prime).
- `NumberField.abs_discr_gt_two` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`):
  a number field of degree `> 1` has `|d_K| > 2`, so some prime ramifies; used in §13.4 to see
  that the Galois group of a coefficient field is generated by its inertia subgroups.
- `HasProd`, `Differentiable`, `Complex.cpow`: the analytic carriers of the statements of §§14.4–14.5.
- `DirichletCharacter` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`): `MulChar (ZMod M) ℂ`,
  whose identity `1` is `1` on units and `0` on non-units; modulo `0` it is a character of `ℤ`, which
  is why §14.5 requires a positive modulus. Every character vanishes on non-units
  (`MulChar.map_nonunit`, `Mathlib/NumberTheory/MulChar/Basic.lean`).
- `DirichletCharacter.changeLevel` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`): for
  `n ∣ m`, the monoid homomorphism from characters modulo `n` to characters modulo `m` that composes
  with the unit-group map `ZMod.unitsMap` and extends by zero; it is injective for `m ≠ 0`
  (`DirichletCharacter.changeLevel_injective`, `DirichletCharacter.changeLevel_eq_one_iff`) and
  agrees with the original character on integers prime to `m`
  (`DirichletCharacter.changeLevel_eq_cast_of_dvd'`). It is the enlargement of the modulus in the
  API of §14.5.
- `UpperHalfPlane.qExpansion` (`Mathlib/NumberTheory/ModularForms/QExpansion.lean`): the
  `q`-expansion of a function on the upper half-plane with a given period, here `1`; its prime
  coefficients are the `a_p` of §14.5.

### From Tau Ceti

- `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`): a
  normalised newform of level `Γ₁(N)` and weight `k`, with nebentypus; for `N = 1` these are the
  normalised Hecke eigenforms of level one.
- `HeckeRing.GL2.Newform.satakeParameters`,
  `HeckeRing.GL2.Newform.exists_satakeParameters_eq_pair`,
  `HeckeRing.GL2.Newform.LSeries_eulerProduct_hasProd_satakeParameters`
  (`TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean`): the Satake parameters at `p` are the
  multiset of roots of `X² − a_p X + χ(p) p^{k−1}`, an unordered pair, and they factor the Euler
  product of `L(s, f)` for `Re s > (k + 1)/2`;
  `HeckeRing.GL2.Newform.prod_map_one_sub_mul_satakeParameters` is the factorisation
  `(1 − α_p x)(1 − β_p x) = 1 − a_p x + χ(p) p^{k−1} x²` used in §14.4. At a prime dividing the level
  the parameters are `a_p` and `0`, which is why §14.5 takes its product over `p ∤ N` only. No
  Ramanujan–Deligne bound is supplied and none is used: the half-plane of §§14.4–14.5 comes from
  AutomorphicLFunctionsAndLocalFactors AL.3.6.1.
- `CuspForm.hasEntireExtension_qExpansion_coeff`
  (`TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean`): the `L`-series of a cusp form of positive
  weight has an entire extension; it is the case `n = 1` of §14.4.
- `TauCeti.exists_isSl2Triple_of_isNilpotent_ad` and `IsSl2Triple.exists_isSl2Triple_iff_sub_mem`
  (`TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean`): over a field of characteristic zero, a nonzero
  `ad`-nilpotent element of a finite-dimensional Lie algebra with nondegenerate Killing form is the
  nilpositive element of an `sl_2`-triple, and the neutral elements of the triples with a given
  nilpositive element `e` form an affine space under `ker(ad e) ∩ [e, L]`; used in §4.9 for
  `s`-adapted homomorphisms.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

- §0.2 (automorphy predicate), §1.1 (accessible and `n`-regular refinements; accessibility of
  symmetric-power refinements after Zelevinsky and Rodier), §1.7 (projective image sandwich),
  §1.10 (symmetric power lift with its all-place predicate), §1.11 (Ramakrishnan's
  `GL_2 × GL_2`), §1.12 (`SP_n`), §1.13 (Kim–Shahidi), §1.14 (Kim), §1.15 (`SP_n` for `n ≤ 5`),
  §2.1 (potential diagonalizability for potentially crystalline full character flags and for
  crystalline representations over unramified local fields with labelled weights in an interval
  of length `l − 2`), §2.16 (potentially diagonalizable polarized lifting over imaginary CM fields:
  odd `l`, regular algebraic irreducible polarized lift, potentially diagonalizable above `l`,
  cyclotomically irreducible residual representation, `ζ_l ∉ F`, `l ≥ 2(d + 1)` for the maximal
  constituent dimension `d` on the Sylow-pro-`l`-generated subgroup, and an ordinary or potentially
  diagonalizable automorphic residual pair), §2.25 (lifts with prescribed potentially diagonalizable
  local components over imaginary CM fields: odd `l`, `ζ_l ∉ F`, a polarized
  residual representation unramified outside a finite set of split places, cyclotomically
  irreducible, `l ≥ 2(d + 1)`, and potentially diagonalizable local lifts with `n` distinct labelled
  weights above `l`; no residual automorphy is assumed), §2.13 (Moret–Bailly with prescribed local extensions),
  §3.12 (Mok), §3.15 (local Arthur
  packets), §3.16 (Kaletha–Mínguez–Shin–White), §4.1 (enormous image and adjoint Selmer
  vanishing), §4.2 (ordinary lifting with several residual constituents, Allen–Newton–Thorne),
  §4.3 (definite-unitary eigenvarieties `ℰ_n(τ̄)` with weight map, Hecke pseudocharacter and closed
  realization in `𝒳_ps × 𝒯_n`; Emerton's Jacquet functor; family triangulations; trianguline
  deformations and the trianguline tangent bound of nt21 Proposition 2.11; the symmetric-power
  character and pseudocharacter maps `σ_{n,p}`, `σ_{n,g}`; classicality of non-critical
  `n`-regular points, nt21 Lemma 2.30), §4.4 (Anastassiades–Thorne, the odd-rank type data of
  Newton–Thorne I Theorem 4.1 and its Clozel–Thorne II input, ct15 §6, pp. 27–31), §4.13 (symmetric powers of CM and
  weight-one forms, the case that §14.2(2) excludes), §4.15 (one prime suffices),
  §4.22 (Clozel–Thorne reductions, Newton–Thorne 2026 Proposition 6.1, Thorne 2024 §8), and the
  convention "Automorphic induction and its cuspidality criterion" with the strong cyclic base
  change it imports from EndoscopicTransferAndUnitaryTraceComparison §6.24. These are used as
  stated there.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

§2.5 ("Auxiliary soluble and cyclic extensions"): cyclic extensions of a number field of prescribed
degree, disjoint from a given Galois extension, with a given finite set of places split completely,
and CM when the base is imaginary CM. Extensions in which a finite set of places splits completely
come from here; soluble extensions with prescribed non-trivial completions come from
PotentialModularityAndCompatibleSystems §2.16, as §2.5 itself directs.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

Cited by layer and by the title of the target in that layer; the titles are those of the
supplier's sections.

- Layer 0: "Ordinary Galois representations of weight `λ`" (§0.1); "Automorphic polarized
  representations and their levels" (§0.3); "`ι`-ordinary automorphic representations have
  ordinary Galois representations" (§0.4) and its converse (§0.5); "Ordinarity of a regular
  algebraic isobaric sum" (§0.7); "Automorphy is invariant under algebraic twists" (§0.8);
  "Soluble base change and descent of polarized automorphy" (§0.9); "Automorphy of an induced
  representation descends" (§0.10); "Algebraic characters with prescribed conjugate norm and
  local behaviour" (§0.11).
- Layer 1: "Strong connection and component deformation problems" (§1.1) and "Properties of
  strong connection; Choi's lemma and the filtration lemma" (§1.2); "Generic local representations
  are smooth points, and smooth points are dense" (§1.3); "Two-dimensional
  potentially Barsotti–Tate representations are potentially diagonalizable" (§1.4, stated for
  `l > 2`).
- Layer 2: "Schur `𝒢_n`-valued residual representations" (§2.1); "The subring `P_𝒮` generated by
  characteristic polynomials" (§2.2).
- Layer 3: the definite unitary group (§3.1), algebraic modular forms (§3.2), "Hecke algebras of
  definite unitary groups" (§3.3), "Exactness and group-ring freeness at level without
  `l`-torsion" (§3.4), base change and descent with `GL_n` (§3.5), constituents' Galois
  representations (§3.6), "Residual and `𝒢_n`-valued Galois representations of Hecke maximal
  ideals" (§3.7), "Iwahori levels at `l`, the `U`-operators and ordinary parts" (§3.8), the big
  ordinary Hecke algebra (§3.9), ordinary deformation data with the surjection `P_D → 𝕋_D` when
  every local ring is a fixed-type or unipotent ring (§3.10), "Hida classicality and
  independence of the characters `χ_v` modulo `λ`" (§3.12, which contains Clozel–Thorne II
  Proposition 3.10, ct15 p. 14). These are stated for odd `l`.
- Layer 4: Taylor–Wiles data with a residual eigenspace (§4.1); Taylor–Wiles level structures and
  the parahoric projection (§4.2); the ordinary `R = T` theorem with Taylor's Ihara avoidance
  (§4.6).
- Layer 5: "Adequacy relaxed to the vanishing of `H¹(H, ad)`" (§5.4), "Ordinary automorphy lifting
  with relaxed-adequate image" (§5.5), "Finiteness of ordinary polarized deformation rings with
  relaxed-adequate image" (§5.7), "Characteristic-zero lifts from finiteness and the dimension bound"
  (§5.8).
- Layer 7: "Weakly and strongly primitive representations" (§7.1), "Sums of characters with large
  ratios are primitive" (§7.2), "Restriction of pseudodeformations to a finite-index subgroup is
  finite" (§7.5), "Split deformation ideals and determinant reducibility ideals" (§7.6), "The
  reducible locus is small in the presence of Steinberg places" (§7.7), "Generic primes of an
  ordinary deformation ring" (§7.8), "Large quotients contain generic primes" (§7.9), "Twisting
  and soluble base change for residually reducible rings and Hecke algebras" (§7.11),
  "Absolute irreducibility at a generic prime survives restriction" (§7.13), "Weak primitivity
  over a splitting coefficient field" (§7.15), "The weak-primitive generic `R = T` theorem" (§7.19). "Primitive" below means
  weakly primitive in the sense of §7.1 (Conventions).
- Layer 8: "Connectedness: every minimal prime is potentially pro-automorphic" (§8.5, with its
  connectedness bound from the local and global presentations), "Finiteness of ordinary
  deformation rings of sums of characters" (§8.9), "The reducible
  locus is small" (§8.12), "Generic primes in large quotients" (§8.13), "Global lifts with
  prescribed local components (Schur form)" (§8.14), "Automorphic lifts of prescribed type from
  residual automorphy over a soluble extension" (§8.15), "The ANT lifting theorem with weak
  primitivity" (the supplier's explicit §8.17 alias for ModularityAndLanglandsExtensions §4.2),
  "Finiteness of ordinary locally Steinberg deformation rings" (§8.7), "Thorne's automorphy lifting
  for two adequate constituents" (§8.8), "Finiteness with an unobstructed auxiliary place" (§8.16).
- Layer 9: "Generic Galois representations" (§9.1), "Bloch–Kato local conditions at generic
  places" (§9.2), "Semistable conjugate self-dual pseudodeformation rings" (§9.4), "The
  pseudodeformation ring is its residue field at an automorphic point" (§9.7), "Ordinary tangent
  vectors of trivial weight lie in `H¹_g`" (§9.8). The residue-field theorem retains semistability
  in the fixed Hodge interval, the fixed multiplier, splitting of `S` in the CM field and
  enormous cyclotomic image; the tangent theorem retains the lifted ordinary flag, constant
  inertial graded characters and genericity when identifying `H¹_g` with `H¹_f`. Adjoint Selmer
  vanishing is imported from ModularityAndLanglandsExtensions §4.1.

What PotentialAutomorphyInfrastructurePartII must provide (gap:dyadic-definite-unitary-forms): the Layer 3 constructions for `l = 2` used by Newton–Thorne II §2 and Newton–Thorne 2026 §4 at `p = 2`: algebraic modular forms on the definite unitary group, exactness and group-ring freeness at sufficiently small level, Taylor–Wiles level structures, and the Hecke-valued determinant of the localized Hecke algebra (the `𝒢_n`-valued lift is not needed).

What PotentialAutomorphyInfrastructurePartII must provide (gap:auxiliary-place-reducible-lifting): beside §8.16 (Layer 8), the lifting form of its auxiliary-place variant (Thorne 2024 Theorem 7.5, th24 p. 44, proof p. 45): under the hypotheses of ModularityAndLanglandsExtensions §4.2 with its clause `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}` replaced by a place `w ∤ l` of `F` at which `ρ̄^{ss}` is unramified and `H⁰(G_{F_w}, ad ρ̄^{ss}(1)) = 0`, with weak primitivity tested over `k̄` and with `ρ̄^{ss}(G_{F(ζ_l)})` without nontrivial quotient of `l`-power order (the added hypothesis of §8.16), `ρ` is the Galois representation of an ι-ordinary RACSDC automorphic representation of `GL_n(𝔸_F)`; the finiteness of §8.16 and the route of ModularityAndLanglandsExtensions §4.2 are its inputs, and only this lifting conclusion is requested.

### From TauCetiRoadmap.AdicSpacesPartII, AdicSpacesPartIII and AdicSpacesPartV

- AdicSpacesPartII §R1.9 (dimension and the identity principle on connected normal rigid spaces).
- AdicSpacesPartIII §R2.9 (Berthelot's generic fibre of formal schemes of Conrad's type `FS_C`,
  which includes the formal spectrum of a complete Noetherian local `W(k)`-algebra).
- AdicSpacesPartV Layer 1: §1.1 (the normalization of a rigid space), §1.4 (its irreducible
  components as images of connected components of the normalization) and §1.5 (the irreducibility
  criterion: a proper Zariski closed subset of an irreducible space is nowhere dense).

What AdicSpacesPartV must provide (gap:components-under-field-extension): in Layer 1, the behaviour of irreducible components of a quasi-separated rigid space over a complete field `E` under extension of the ground field to a finite extension and to `ℂ_p`: every component over `ℂ_p` lies in the base change of a component over `E`, and if there are finitely many components then after a finite extension `E′/E` all components are geometrically irreducible (Conrad, con99 Theorem 3.4.2, internal pp. 26–27).

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§0.2 (Chenevier determinants and the determinant of a matrix representation), §0.5 (a determinant
is determined by its trace when `d!` is invertible), §1.1 (Cayley–Hamilton algebras), §1.3
(Henselian lifting: a residually split absolutely irreducible Cayley–Hamilton quotient over a
Henselian local ring is a matrix algebra), §1.4 (reducibility ideals: for a determinant `D` over a
Henselian local ring `A` with split multiplicity-free residual law and a partition `P` of its
residual constituents, an ideal `I_P` such that, for every ideal `J` in the maximal ideal, `D mod J`
is a product of determinants with the prescribed residual products exactly when `I_P ⊆ J`, and then
the factors are unique; so reducibility of type `P` is the Zariski closed condition `V(I_P)` and
the decomposition of a residually multiplicity-free determinant is unique), §1.5 (universal
algebras; base change to an absolutely irreducible point is a matrix algebra, after chen14 §1.22
and Proposition 1.23).

### From TauCetiRoadmap.LocalGaloisDeformationRings

§F.1.5 (strict and full conjugacy agree for Schur residual representations), §F.1.9 and §F.2.11
(the determinant deformation functor and its pro-representability), §1.1 (local framed rings),
§1.4 (tangent and obstruction description), §1.10 (fixed determinant), §1.18 (completed local
rings at generic-fibre points are framed rings), Layer 2: §2.13 (unrestricted rings away from `p`
are complete intersections), §2.15 (Ihara avoidance components), §2.18 (inertial types with
monodromy), §2.24 (fixed-type rings in rank `n`), §2.26 (the Steinberg ring is a domain), §2.27
(Breuil–Mézard cycles for division algebras away from `p`); §6.10 (Clozel–Thorne partition rings
`R^m`), §8.12 (Newton–Thorne local quotients), §8.14 (torsion semistable lifts form a stable
condition).

### From TauCetiRoadmap.GlobalGaloisDeformations

Layer G7: §8.1 (polarized deformation problems), §8.3 (tangent and obstruction spaces), §8.4
(presentations of polarized deformation rings over their local tensor ring), §8.5 (Taylor–Wiles
places in rank `n` and the diamond action); §§5.3–5.4
(linear disjointness for dyadic auxiliary primes; dyadic Taylor–Wiles sets and their generator
counts), §5.5 (inertia at Taylor–Wiles places and the `Δ_Q`-module structure of the framed and trace
rings), §5.7 (Taylor–Wiles primes for odd `p` in rank two); §4.6 (quotients of complete local
functors by free actions of formally smooth group functors, with formally smooth quotient map) and
§4.11 (for a free `Ĝ_m^γ`-action on `Sp R′` and a map `d` to `Ĝ_m^γ` with `d(λx) = λ²d(x)`, the fibre
`Sp R = d^{−1}(1)` is a `Ĝ_m^γ[2]`-torsor over `Sp (R′)^{Ĝ_m^γ}`, finite flat of degree `2^γ` at `p = 2`).

What GlobalGaloisDeformations must provide (gap:tensor-taylor-wiles-primes): in Layer G7, the Taylor–Wiles prime selection of Newton–Thorne 2026 §4 (nt26 pp. 29–30; Propositions 4.8–4.9, pp. 34–36): from rank-two large residual image and a perfect subgroup of the rank-`2r` tensor image containing an element with `2r` distinct eigenvalues, arbitrarily deep places `q_v ≡ 1 mod p^N` at which the tensor Frobenius has `2r` distinct ordered eigenvalues and which control the rank-two dual Selmer group, for simultaneous patching; together with Newton–Thorne II Lemmas 2.7 and 2.9 (nt21b pp. 14, 18) under `p^a > max(5, 2n − 1)`, including `p = 2`.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§5.4 (the limit presentation and its actions), §5.6 (patching a ring and a based free module), §5.5
(numerical depth), §6.1 (near faithfulness on native support, and support invariance under a group
action transitive on minimal primes), §6.6 (connectedness dimension and arithmetic rank), §6.7 (generic and special
components).

What DeformationAndDerivedPatchingAlgebra must provide (gap:formal-torus-patching): in §5.4 and Layer 6, extend the rank-two free patched torus action of GL2ModularityLifting §§6.1, 6.6 and its determinant-one fibre and torsor of §6.7 and GlobalGaloisDeformations §4.11 to simultaneous patching with the pseudodeformation rings and both modules in Newton–Thorne II Proposition 2.8 and Newton–Thorne 2026 Proposition 4.9 (kw09 Proposition 9.3): assume the supplied compatible free action chunks on cofinal Artinian truncations of `Sp R′_N`, detecting every stabilizer on an Artinian test algebra, square-equivariant determinant maps whose fibre comparison kernels tend to zero, compatible `Ĝ_m^γ[2]`-actions on `Sp P_N` making `Sp R_N → Sp P_N` equivariant, and semilinear `Ĝ_m^γ[2](𝒪)`-actions on both finite-level modules commuting with their scalar and transition maps; retain these actions on `P_∞`, `H_{D,∞}` and `H_{G,∞}` in the simultaneous limit, and prove that if `R′_∞` is an `𝒪`-flat domain then `{±1}^γ` acts transitively on the irreducible components of `Spec R_∞`; the free rank-two action and its torsor are supplied inputs, not conclusions from square-equivariance alone.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§R07.4.20 (crystalline representations with Hodge–Tate weights in `{0,1}` come from
`p`-divisible groups), §R07.1.40 (Raynaud's embedding), §R07.5.10 (residual types of potentially
Barsotti–Tate representations of tame type), §R07.5.11 (Fontaine–Laffaille residual types).

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:artinian-crystalline-quotients): in Layer R07.4, Raynaud's embedding theorem (bbm82 Théorème 3.1.1; §R07.1.40: a finite flat group scheme over the ring of integers embeds in an abelian scheme) applied as in Newton–Thorne II Lemma 2.2 (nt21b p. 7) and Newton–Thorne 2026 Lemma 4.2: every finite flat Artinian rank-two point of Hodge type `{0,1}` is a quotient of a Galois-stable lattice in a crystalline representation with Hodge–Tate weights in `{0,1}`, functorially in the coefficient quotient and compatibly with tensor products and symmetric powers with fixed lattices.

### From TauCetiRoadmap.GL2ModularityLifting

Layer 2 (§§2.5, 2.8: quaternionic Hecke modules at Taylor–Wiles levels and their freeness),
Layer 3 (§§3.1–3.7: the arithmetic patching template), Layer 6 (§§6.1, 6.6, 6.7: dyadic patching
with the free determinant torus action and the torsor structure).

What GL2ModularityLifting must provide (gap:unobstructed-auxiliary-prime): in Layer 3, the input of Newton–Thorne I Proposition 8.3 not covered by the template: unobstructedness of the local deformation problems at the ramified primes for all but finitely many `p` (Weston, wes04 Proposition 3.2 with Remark 3.3, pp. 5–6, for principal-series and supercuspidal components and Proposition 5.3, p. 10, for special components: `H⁰(ℚ_l, ad⁰ r̄(1)) = 0` at each ramified prime `l ≠ p`) together with an auxiliary prime `q_a > p` with formally smooth local lifting ring, giving patched modules of full support (nt21 pp. 92–96).

What GL2ModularityLifting must provide (gap:slope-zero-one-dimension-count): in Layer 3, the dimension count of Newton–Thorne II Lemma 3.4 (nt21b pp. 20–22): for a definite or indefinite quaternion algebra over `ℚ`, a neat level and a non-Eisenstein maximal ideal `𝔪`, the localized cohomology at level `U₀(p³)` with coefficients twisted by characters `χ_1 ⊗ χ_2`, `χ_1/χ_2` of conductor `p³`, has a non-zero part of slope strictly between `0` and `1`, by Hida's comparison of the slope-`0` and slope-`1` parts with ordinary parts at level `U₀(p)` and the multiplicities of `χ_1 ⊗ χ_2` and `χ_2 ⊗ χ_1` in the induction from `U₀(p³)` to `U₀(p)`.

### From TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

§2.11 (Hilbert Hida weight change with fixed residual determinant). Hida's control theorem is
taken from PadicFamilies §5.8.

### From TauCetiRoadmap.PadicFamilies

§2.8 (classicality of small-slope points), §2.10 (comparison with the Coleman–Mazur–Buzzard
eigencurve), §2a.4 (Newton polygons and fibre-degree loci), §2a.5 (strict neighbourhoods with a
fixed slope block), §2a.13 (points and finite-slope eigenpackets), §2a.14 (equidimensionality and
components of the eigenvariety), §5.8 (Hida's control theorem).

### From TauCetiRoadmap.PadicHodgeTheory and PhiGammaModulesAndIwasawaCohomology

PadicHodgeTheory §4.4 (Sen's theorem: the Lie algebra of the inertia image is the smallest
subspace whose extension to `ℂ_p` contains the Sen operator), §5.3 (potentially semistable
periods, Fontaine's recipe for the Weil–Deligne parameter). PhiGammaModulesAndIwasawaCohomology
§7.5 (saturated and strict triangulations).

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

§2.16 (soluble prescribed-completion extensions: for a finite set of places of a number field, a
finite Galois avoidance extension and finite Galois local extensions with soluble groups at those
places, a finite soluble Galois extension linearly disjoint from the avoidance extension whose
completions above each place are the prescribed ones, totally real when the base is and the real
completions are kept real; complete splitting is the trivial prescribed completion), §9.2 (points on
prescribed Newton–Thorne components: Newton–Thorne 2026 Lemma 3.1, the ι-ordinary companion `σ` of
weights `{0, 2}` and determinant `ε^{−2}ω_p` with the residual representation of `π`, an unramified
Steinberg twist at `v_0` and `r_σ ∼ r_π` locally away from `p v_0`, by the Khare–Wintenberger
argument), §10.10 (prescribed-type local-to-global lifting in weight two, `p` odd).

### From TauCetiRoadmap.SerreWeightAndLevelOptimisation

§2.4 (Diamond's level-raising criterion), §6.9 (quaternionic
level raising), §6.11 (Khare–Wintenberger prescribed-local-type modular lifts).

What SerreWeightAndLevelOptimisation must provide (gap:level-raising-prescribed-components): in Layer 2, level raising for `GL_2(𝔸_ℚ)` with simultaneously prescribed Steinberg components and supercuspidal components of given tame inertial type at auxiliary primes satisfying the level-raising congruences (Diamond–Taylor's non-optimal levels, as used in nt21, proof of Proposition 7.4, p. 86).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.8 (Brauer–Nesbitt for groups and monoids), §§3.3, 3.6 (Weil–Deligne conductors and their
behaviour under reduction), §4.4 (Dickson's classification and its consequences for residual
images), §7.1 (continuous symmetric, exterior and tensor powers), §7.6 (Zariski closures,
monodromy groups, Goursat), §7.8 (Clebsch–Gordan and Pieri in characteristic `p`), §7.9 (adequate
subgroups, the threshold `a₀(p)`, and adequacy of `Sym^{n−1}` of a finite image containing
`SL_2(𝔽_t)` when `t ≥ 2n + 2`, its symmetric-power clause (3); `t ∣ n` excludes adequacy), §7.10
(enormous images, with its hypothesis that every
characteristic polynomial splits over the coefficient field).

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.3.5: exponent-two ramification fields `F(S)`; one new ramified prime and quadratic
reciprocity (Newton–Thorne 2026 Lemma 5.3, with the symmetric splitting criterion); the antiunit
class-field rank `d₀` and Maire's lower bound.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations and AutomorphicGaloisRepresentationsPartII

AutomorphicGaloisRepresentations §1.5 (rank-two newform realisation), §6.2 (comparison of the
DFG reduction with the residual attachment of AlgebraicModularFormsAndSerreWeights §7.3), §7.4 (Dimitrov's residual large
image), §7.5 (Ribet–Momose large image). AutomorphicGaloisRepresentationsPartII AG2.3 ("The
polarization sign of the constructed system", Bellaïche–Chenevier) and AG2.6 ("Complex and local
coefficient conjugation"; "Coefficient independence of tensor automorphy", for untwisted tensors
of two RAESDC factors).

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

§7.3 (residual attachment for reduction eigensystems): a nonzero reduction in the integral
q-expansion lattice image, integer weight `k ≥ 1`, level `N ≥ 1`, an `𝒪`-valued q-expansion and
character in `𝒪ˣ`, a coefficient number field and complex embedding, a DVR `𝒪` at a fixed place
above `l`, and a residue map to a finite field with kernel the maximal ideal; the reduced
coefficients satisfy the good-prime Hecke equations. The attached residual representation is
continuous and semisimple, unramified outside `Nl`, with arithmetic-Frobenius polynomial
`X² − a_q X + ε(q)q^{k−1}` after reduction for `q ∤ Nl`. Stable lattice independence is at the
same coefficient place; coefficient conjugation transports both the place and the residue
embedding. Use the dual attachment when expressing this polynomial at geometric Frobenius in
our convention. A Katz eigensystem requires a justified Hasse shift into the reduction image;
the classical normalized level-one forms of §3.4 already lie in that image, with nonzero
reduction since `a_1 = 1`. Comparisons are of residual semisimplifications.

### From TauCetiRoadmap.ClassicalSerreModularity and GL2AutomorphicRepresentationsAndTransfer

ClassicalSerreModularity Layer R27.1 ("Good-dihedral primes"; "Lemma 6.3: image and
propagation"). GL2AutomorphicRepresentationsAndTransfer §R16.1.7 (Chevalley's congruence theorem:
for a number field `M`, a finitely generated subgroup `Γ ⊂ M^×`, an integer `n > 0` and a finite set
`T` of finite places, a modulus with empty infinite part and support disjoint from `T` whose
congruence subgroup meets `Γ` inside `Γ^n`, hence inside any subgroup `H ⊂ Γ` of finite index once
`n` is the exponent of `Γ/H`; used in §2.2 with `Γ = 𝒪_F^×` and `T` the `p`-adic places), §R16.3.1
(principal-series parameters),
§R16.3.2 (Steinberg monodromy), §R16.3.3 (supercuspidal parameters), §R16.3.5 (conductors),
§R16.3.7 (tamely dihedral representations of prime order), §R16.3.8 (their supercuspidality),
§R16.4.4 (the comparison of Hecke data of newforms and automorphic representations, with strong
multiplicity one), §R16.4.6 (the non-CM self-twist condition on cuspidal classes of `GL_2`, whose
coefficient form on newforms is the predicate of §14.5).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§2.8 (twisted transfer factors), §2.10 (Euler–Poincaré functions and pseudo-coefficients), §2.11
(matching test functions), §2.14 (transfer at the real place), §2.15 (transfer of Euler–Poincaré
functions to endoscopic groups, used in §5.6), §§4.9–4.10 (stable base change: fundamental lemma and
transfer), §6.4 (twisted characters), §6.10 (archimedean Euler–Poincaré and twisted Lefschetz
functions), §6.24 (strong cyclic base change for `GL_n`), §6.27 (base change and descent between
unitary groups and `GL_n`), §6.29 (Labesse's cohomological weak base change and descent), §11.2 (tempered local
unitary packets), §§13.1, 13.3, 13.5 (weak unitary base change, automorphic induction of a
quadratic Hecke character, local unitary base change).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:explicit-tempered-unitary-packets): in §11.2, Mœglin's explicit description of tempered representations of `p`-adic unitary groups at an inert place: the extended cuspidal support and stable base change with finite fibres (moe07 §§5.4, 5.7), the twisted character identity for `θ`-discrete parameters (moe07 §5.5) and its extension to all tempered parameters, the reducibility points of depth-zero supercuspidals in odd residue characteristic (Lust–Stevens, ls20 §8), and the hereditary Jacquet-module and socle computations of the induced representations used by Clozel–Thorne III §3.5 (ct17 pp. 24–27), including the full socle multiplicity of the induction after ct17 (3.9).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:deligne-lusztig-transfer): in §2.11, the endoscopic transfer of inflated Deligne–Lusztig functions for unramified groups when the residue characteristic exceeds the Coxeter number (Kazhdan–Varshavsky, kv12 Theorem 2.2.5 of the arXiv version), in the form used by Newton–Thorne I Proposition 1.16 (nt21 pp. 18–19).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups and ReductiveGroupsPartII

SmoothRepresentationsOfLocalGroups SR.1.4–SR.1.5 (Iwahori decompositions, Iwahori–Matsumoto and
Bernstein presentations, stated for split groups), SR.2.1–SR.2.3 (smooth and compact induction,
the irreducibility criterion for compact inductions, Jacquet functors, Iwahori invariants),
SR.3.1–SR.3.4 (cuspidal support, the Bernstein decomposition, tempered representations, the
Steinberg representation and the Iwahori block), SR.4.4 (unramified unitary groups).
ReductiveGroupsPartII §RG2.1.3 (valued root data, with the ramified quasi-split unitary example),
§RG2.3.3 (parahoric group schemes, with parahorics as the fixers in the Kottwitz kernel),
§§RG2.4.1–RG2.4.2 (the Iwahori–Weyl group, the affine Tits system of the subgroup generated by the
parahorics, and the Kottwitz quotient onto the length-zero group `Ω`). Parahoric and Iwahori
subgroups there are connected; for ramified `U_{2k+1}` the chamber fixer `B` of §4.8 contains the
Iwahori subgroup with index `2`.

What SmoothRepresentationsOfLocalGroups must provide (gap:iwahori-matsumoto-quasi-split): in SR.1.5, for a quasi-split connected reductive group `G` over a non-archimedean local field `F` with the affine Tits system `(G(F)_1, I, N(F)_1, S̃)` of ReductiveGroupsPartII §RG2.4.2 (`I` the Iwahori subgroup of an alcove, the integral points of the connected Bruhat–Tits model, and `G(F)_1` the subgroup generated by the parahoric subgroups), the Iwahori–Matsumoto presentation of `H(G(F)_1, I)` with parameters `q_s = [IsI : I]` (quadratic relations `(T_s − q_s)(T_s + 1) = 0` and braid relations, over `ℤ` with the positive braid monoid and over `ℤ[q_s^{−1}]` with the braid group) and the presentation of `H(G(F), I)` as its crossed product with the length-zero group `Ω`, in particular for the ramified quasi-split unitary groups `U_{2k+1}`, from which §4.8 derives the Hecke algebra of the chamber fixer.

### From TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles and NilpotentOrbits

SpringerResolutionAndCharacteristicCycles §6.2 (the Springer resolution) and §6.4 (the reduced
Steinberg variety), over `ℂ` for the complex dual group `G^∨` of §4.9. NilpotentOrbits N2 (item 1:
the algebraic `SL_2`-homomorphism integrating an `sl_2`-triple, and the conjugacy of triples with a
fixed nilpositive element under the centralizer), used in §4.9.

What SpringerResolutionAndCharacteristicCycles must provide (gap:steinberg-equivariant-k-theory): in Layer 6, for a connected complex reductive group `G^∨` with simply connected derived group and the Steinberg variety `Z` of §6.4, the convolution algebra `K^{G^∨ × ℂ^×}(Z)` and its isomorphism with the affine Hecke algebra of the dual root datum, `q` being the coordinate of `ℂ^×`; for semisimple `s ∈ G^∨` and `q` not a root of unity, the standard modules `Hom_{A(s,u)}(ρ, H_*(ℬ_u^s, ℂ))` obtained by localisation at `(s, q)`; the theorem that the simple modules with central character `(s, q)` are exactly their unique simple quotients, indexed by the `Z_{G^∨}(s)`-classes of pairs `(u, ρ)` with `s u s^{−1} = u^q` and `ρ` occurring in `H_*(ℬ_u^s, ℂ)` (kl87 Theorem 7.12); and the irreducibility of the standard module when the factor `s₀` of an `s`-adapted homomorphism lies in a compact subgroup (kl87 §8).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

AL.2.4.1 ("The global standard L-function": for unitary cuspidal `π` of `GL_n(𝔸_K)` with `n ≥ 2` the
completed standard `L`-function is entire, its Euler product converging in some right half-plane),
AL.3.3.8 (the Jacquet–Shalika bound: an unramified Satake parameter `α` of a unitary generic
representation satisfies `q^{−1/2} < |α| < q^{1/2}`) and AL.3.6.1 (after the Rankin–Selberg pole
criterion, the finite standard Euler product of a unitary cuspidal `π` of `GL_n`, `n ≥ 2`, converges
absolutely for `Re s > 1`), used in §§14.4–14.5; AL.3.7.1 (strong multiplicity one: cuspidal representations of `GL_n` whose
unramified components agree outside a finite set are isomorphic), used in §14.5 for the
comparison of the self-twist predicate with the non-CM condition.

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

§0.7 (definite unitary forms of rank `n` and their completed degree-zero cohomology).

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:drinfeld-steinberg-detection): in §0.7, the inputs of Thorne 2024 Theorem 6.11 from its §§3–6: Steinberg detection in `p`-adic automorphic forms on definite unitary groups (th24 Theorem 3.4, p. 16), the even-multiplicity weight theorem (Theorem 4.5, p. 20), concentration in degree `n − 1` of the Hecke-localized derived tensor product `RΓ_c(Ω^{n−1}, k) ⊗^L_{k[GL_n(F_{w₀})^0]} A_𝔪` of Drinfeld-space cohomology with the automorphic module under residual genericity (Theorem 5.2, p. 24; not a concentration statement for bare `RΓ_c(Ω^{n−1}, k)`), and the comparisons of Corollary 6.3 (p. 33) and Proposition 6.5 (p. 35).

### From TauCetiRoadmap.Chebotarev, ClassFieldTheory and RepresentationTheory/CharacterTheory

Chebotarev Layer 10 (Dirichlet-density Chebotarev). ClassFieldTheory Layer 7 (the absolute local
Artin map `K^× → G_K^{ab}`, the image of the units being that of inertia) and Layer 8 (its
injectivity in characteristic zero), which describe `G_{ℚ_p}^{ab}` in the Checks of §0.2; Layer 11 (global class
formation and Artin reciprocity), Layer 12 (global existence and the norm index), Layer 13 (norm
theorems and class fields), Layer 14 (Hilbert and quadratic reciprocity). CharacterTheory Layer 3
(character tables and orthogonality) and Layer 9 (the representation theory of `GL₂(𝔽_q)`).

What RepresentationTheory/CharacterTheory must provide (gap:deligne-lusztig-finite-unitary): beyond Layer 9, the finite-group inputs of Newton–Thorne I §1.8 (nt21 pp. 15–18): Deligne–Lusztig induction `R_T^G θ` for finite reductive groups with irreducibility of `±R_T^G θ` for `θ` in general position and its transitivity, Lusztig's cuspidal unipotent representation of `U_3(𝔽_q)`, the modular irreducibility of cuspidal unipotent characters in non-defining characteristic (Dudas–Malle, dm18 Theorem 1), and the decomposition of the reduction of `R_C^{U_3}θ` modulo `p` when `q` has order 6 modulo `p` (Geck's decomposition numbers for `U_3`, as used in nt21 Proposition 1.15, pp. 17–18).

## How to read the build

Layer 0 builds the rigid-analytic carriers (pseudocharacter spaces and the analytic continuation
lemma) on which Layers 1–2 propagate automorphy of symmetric powers from a point of a definite
unitary eigenvariety, or of the eigencurve, to its whole irreducible component; Layer 3 connects
all level-one forms through the 2-adic boundary of weight space. Layers 4–6 are independent of
Layers 0–3: Layer 4 is local representation theory at inert and ramified places, Layer 5 uses it
with the stabilised trace formula to raise the level to depth-zero types, and Layer 6 raises the
level to Steinberg by residually reducible deformation theory and by Thorne's `p`-adic method.
Layer 7 combines them into the residually CM seed and the Clozel–Thorne powers. Layers 8–10 kill
ramification and supercuspidal primes relative to a level-one seed, through the automorphy lifting
theorem of Layer 9. Layers 11–13 use Layers 6 and 9 only and prove `SP_n` for all `n` over every
totally real field. Layer 14 discharges the seeds of Layers 7, 8 and 10 by Layer 13 and assembles
the endpoints over `ℚ`. Each target's `*Needs:*` line lists what its statement and its route use,
so an implementer who proves it another way is not blocked behind an unrelated layer.

## Layer 0: rigid spaces of pseudocharacters and analytic continuation along components

This layer supplies the rigid-analytic carriers of the continuation argument: an analytic
continuation lemma for morphisms into a Zariski closed subspace, the
rigid generic fibres of conjugate self-dual and local pseudodeformation rings with their
absolutely irreducible loci, the correspondence between polarized lifts and conjugate self-dual
traces, and the tangent spaces of these spaces at absolutely irreducible points.

### 0.1 Analytic continuation along irreducible components of rigid spaces

Let `E` be a finite extension of `ℚ_p`, `α : 𝒳 → 𝒢` a closed immersion and `β : 𝒴 → 𝒢` a morphism
of rigid analytic spaces over `E`, and `y ∈ 𝒴` a point with `β(y) ∈ α(𝒳)`. Prove that if
`β^{−1}(𝒳)` contains an affinoid open neighbourhood of `y`, then `β(𝒞) ⊂ α(𝒳)` for every
irreducible component `𝒞` of `𝒴` containing `y` (nt21 Lemma 2.2, §2.1, p. 24). The neighbourhood
is an affinoid open subset of `𝒴` containing `y`. In Layers 1–2 the lemma is applied after
extending scalars, to components over finite extensions of `E` and over `ℂ_p`; the passage between
these uses the behaviour of components under extension of the ground field, which
AdicSpacesPartV Layer 1 supplies (see the supplier contracts; nt21 proof of Theorem 2.24,
p. 41, and Corollary 2.28 with its footnote, pp. 43–44).

*Proof sketch.* `β^{−1}(𝒳)` is Zariski closed in `𝒴`, as the pullback of a closed immersion.
Let `𝒞` be a component through `y` and `𝒞̃ → 𝒞` its normalization; `𝒞̃` is connected and maps onto
`𝒞`. The preimage of `β^{−1}(𝒳) ∩ 𝒞` in `𝒞̃` is Zariski closed and contains a non-empty admissible
open subset, namely the part of the preimage of the affinoid neighbourhood lying over `y`. A proper
Zariski closed subset of an irreducible space is nowhere dense, so the preimage is all of `𝒞̃`, and
`β(𝒞) ⊂ α(𝒳)`.

**Checks.**

- Take `𝒴 = 𝒢` the closed unit disc, `β` the identity and `𝒳 = {0}`. No affinoid neighbourhood of
  `0` lies in `β^{−1}(𝒳) = {0}`, and indeed the disc is not contained in `{0}`: the hypothesis
  fails and so does the conclusion.
- Take `𝒴 = 𝒢` the union of the two coordinate axes in the closed bidisc and `𝒳` one axis. At a
  point `y ≠ 0` of that axis the hypothesis holds and the lemma forces only that axis into `𝒳`;
  at `y = 0` the hypothesis fails, because every neighbourhood of `0` meets the other axis outside
  `𝒳`.
- If `𝒴` is irreducible the conclusion is `β(𝒴) ⊂ α(𝒳)`; for `𝒴` a point it is the hypothesis.

*Needs:* AdicSpacesPartV Layer 1 (normalization, irreducible components, irreducibility
criterion); AdicSpacesPartII §R1.9 (identity principle).

### 0.2 Rigid spaces of conjugate self-dual pseudocharacters and their absolutely irreducible loci

Fix a CM field `F` with maximal totally real subfield `F⁺`, a finite set `S` of places of `F⁺`
containing the `p`-adic places, a finite field `k` of characteristic `p`, a conjugate self-dual
pseudocharacter `τ̄` of `G_{F,S}` of dimension `n` over `k`, and for each `v ∈ S_p` a place `ṽ` of
`F` above `v`. Let `R_ps` be the universal deformation ring of `τ̄` as a conjugate self-dual
pseudocharacter of `G_{F,S}`, and `R_{ps,v}` the universal (unrestricted) pseudodeformation ring of
`τ̄|_{G_{F_ṽ}}`; both are complete Noetherian local `W(k)`-algebras. Define `𝒳_ps` and `𝒳_{ps,v}` as
their rigid generic fibres, with the restriction morphism
`𝒳_ps → 𝒳_{ps,p} = ∏_{v ∈ S_p} 𝒳_{ps,v}`. Define `𝒳_{ps,v}^{v-irr}` as the locus where the universal
pseudocharacter is absolutely irreducible and `𝒳_ps^{p-irr}` as the preimage of
`∏_v 𝒳_{ps,v}^{v-irr}`. Prove that `𝒳_{ps,v}^{v-irr}` is Zariski open and carries an Azumaya algebra
`𝒜` of rank `n²` with a continuous `ρ^u_v : G_{F_ṽ} → 𝒜^×` whose reduced trace is the universal
pseudocharacter; and that if `ρ_v : G_{F_ṽ} → GL_n(E)` is absolutely irreducible over `E` with
`z = tr ρ_v`, then `𝒜 ≅ M_n(𝒪_𝒰)` on some affinoid neighbourhood `𝒰` of `z` (nt21 §2.11.1,
definitions and Lemma 2.13, pp. 30–31; chen14 §4.2). The local problem carries no conjugate
self-duality condition, although the global pseudocharacter is polarized. Splitting needs `ρ_v`
defined over `E`: an `E`-point of the irreducible locus alone does not split the fibre of `𝒜`.

*Proof sketch.* Conjugate self-dual determinant deformations of `τ̄` are pro-represented by a
closed quotient of the determinant deformation ring (LocalGaloisDeformationRings §§F.1.9, F.2.11;
the polarization condition is closed). Pass to rigid generic fibres by Berthelot's construction
(AdicSpacesPartIII §R2.9). Over the absolutely irreducible locus the Cayley–Hamilton quotient of
the group algebra is Azumaya of rank `n²` and its reduced trace recovers the universal determinant
(IntegralHeckeAndGaloisDeterminants §§1.1, 1.5; chen14 §4.2). At `z` the stalk of `𝒜` is an
Azumaya algebra over a Henselian local ring whose fibre is split by `ρ_v`, hence split
(IntegralHeckeAndGaloisDeterminants §1.3), and the splitting spreads to an affinoid neighbourhood.

**API.**

- The space `𝒳_ps` with its universal pseudocharacter, functorial in `τ̄` and `S`.
- The local spaces `𝒳_{ps,v}` and the restriction morphism `𝒳_ps → ∏_{v ∈ S_p} 𝒳_{ps,v}`; at every
  `E`-point the local universal determinant is the restriction of the global one to `G_{F_ṽ}`.
- The Zariski open absolutely irreducible loci, the Azumaya algebra `𝒜` and the universal
  representation `ρ^u_v` into `𝒜^×`, whose reduced trace is the universal pseudocharacter.
- `E`-points of `𝒳_ps` are the conjugate self-dual `E`-valued Chenevier determinants of `G_{F,S}`
  reducing to `τ̄`.
- At a point given by an absolutely irreducible `ρ_v` over `E`, `𝒜` is a matrix algebra on an
  affinoid neighbourhood, so there is a universal matrix representation
  `G_{F_ṽ} → GL_n(𝒪(𝒰))` lifting `ρ_v`.

**Checks.**

- For `n = 1` and `F_ṽ = ℚ_p` with `p` odd, `𝒳_{ps,v}` is the space of continuous characters of
  `G_{ℚ_p}^{ab}` lifting a fixed residual character `χ̄`. Local reciprocity identifies `G_{ℚ_p}^{ab}`
  with the profinite completion `ℤ_p^× × ℤ̂` of `ℚ_p^×` (ClassFieldTheory Layer 7, the absolute local
  Artin map, with the units going onto the image of inertia; Layer 8, its injectivity in
  characteristic zero). A lift is the Teichmüller lift of `χ̄` times a character with values in
  `1 + 𝔪`, which factors through the maximal pro-`p` quotient `(1 + pℤ_p) × ℤ_p ≅ ℤ_p²`; so
  `𝒳_{ps,v}` is an open polydisc of dimension `2`. In general it is a finite union of open polydiscs
  of dimension `[F_ṽ : ℚ_p] + 1`, one for each character of the `p`-power roots of unity of `F_ṽ`
  after enlarging `E`.
- The full group `ℤ_p^× × ℤ̂` and its pro-`p` deformation quotient differ. For `p = 3` the unramified
  extension of degree `5` gives a continuous surjection `G_{ℚ_3}^{ab} → C_5`: `Hom(ℤ_3^× × ℤ̂, C_5)`
  has `5` elements, while `Hom(ℤ_3^× × ℤ_3, C_5)` has `1`, since `ℤ_3^× ≅ C_2 × ℤ_3`. Both have the
  pro-`3` quotient `ℤ_3²`, which is all the deformation space sees, so the dimension `2` is the same.
- If `τ̄|_{G_{F_ṽ}}` is absolutely irreducible, the whole space `𝒳_{ps,v}` is absolutely
  irreducible: openness of the irreducible locus does not make it a proper subset. An ordinary
  upper-triangular lift is a reducible point even when the extension is non-split.
- If the fibre of `𝒜` at an `E`-point is a non-split quaternion algebra over `E` (the
  pseudocharacter is the reduced trace of a representation into a division algebra), local
  splitting does not hold at that point: `ρ_v` over `E` is required.
- At a point given by `ρ : G_{F,S} → GL_n(E)` the universal pseudocharacter specialises to the
  Chenevier determinant `det ∘ ρ` of IntegralHeckeAndGaloisDeterminants §0.2.

*Needs:* IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1, 1.3, 1.5; LocalGaloisDeformationRings
§§F.1.9, F.2.11; AdicSpacesPartIII §R2.9.

### 0.3 Polarized lifts correspond to conjugate self-dual traces

Let `ρ : G_{F,S} → GL_n(E)` be absolutely irreducible with `ρ^c ≅ ρ^∨ ⊗ ε^{1−n}`, extended to
`ρ_1 : G_{F⁺,S} → 𝒢_n(E)` with multiplier `ν ∘ ρ_1 = ε^{1−n} δ_{F/F⁺}^a`, `a ∈ {0, 1}`. Prove that
for every complete Noetherian local `E`-algebra `A` with residue field `E`, restriction to
`G_{F,S}` is a bijection from conjugacy classes, under `1 + M_n(𝔪_A)`, of lifts
`ρ′_1 : G_{F⁺,S} → 𝒢_n(A)` of `ρ_1` with `ν ∘ ρ′_1 = ε^{1−n} δ^a` onto conjugacy classes of lifts
`ρ′ : G_{F,S} → GL_n(A)` of `ρ` satisfying `tr(ρ′ ∘ c) = tr(ρ′^∨) · ε^{1−n}` (nt21 Lemma 2.12,
§2.11.1, p. 30). The multiplier, and with it the sign `a`, is fixed as part of the problem: it is
not recovered from the trace on `G_F`. The category is that of complete Noetherian local
`E`-algebras with residue field `E`, as used on nt21 p. 43. The printed proof concludes that two
extensions with the same restriction are equal after finding a scalar discrepancy at complex
conjugation; the argument here shows they are strictly conjugate.

*Proof sketch.* Surjectivity: the trace condition and absolute irreducibility give an isomorphism
`ρ′^c ≅ ρ′^∨ ε^{1−n}` over `A` (Carayol–Serre for absolutely irreducible residual representations),
and its matrix extends `ρ′` to `𝒢_n` (GlobalGaloisDeformations §8.1). Injectivity: two extensions
of the same restriction with the prescribed multiplier differ at complex conjugation by a scalar
`λ ∈ 1 + 𝔪_A`; since `2` is invertible in `A`, Hensel's lemma gives `α ∈ 1 + 𝔪_A` with
`α² = λ^{−1}`, and conjugation by `(α, 1)` identifies the two extensions. Strict and full conjugacy
agree here by LocalGaloisDeformationRings §F.1.5.

**Checks.**

- For `n = 1`: a character `χ` of `G_F` with `χ χ^c = 1` and a lift `χ′` with `χ′ χ′^c = 1` extend
  to `𝒢_1 = (GL_1 × GL_1) ⋊ {1, j}` uniquely up to conjugacy; the scalar `λ` is then a square in
  `1 + 𝔪_A` because `2` is a unit.
- For `A = E[ε]/(ε²)` the bijection identifies the tangent space of the polarized deformation
  functor with `H¹(G_{F⁺,S}, ad ρ_1)`, as used in §0.4.
- For `A = E` both sides are single points. The sign `a` is determined by `ρ`: the pairing
  realising `ρ^c ≅ ρ^∨ ε^{1−n}` is unique up to a scalar by absolute irreducibility, hence
  symmetric or alternating, and this fixes `ν(ρ_1(c))`; a lift `ρ′_1` with the other multiplier
  sign would restrict to a lift `ρ′` whose pairing changes type, which is impossible over a local
  ring with residue field `E`.

*Needs:* GlobalGaloisDeformations §8.1; LocalGaloisDeformationRings §F.1.5;
IntegralHeckeAndGaloisDeterminants §0.5.

### 0.4 Tangent spaces of pseudocharacter spaces at absolutely irreducible points

Prove: (1) at an `E`-point `z` of `𝒳_{ps,p}^{p-irr}` given by absolutely irreducible
`ρ_v : G_{F_ṽ} → GL_n(E)` (`v ∈ S_p`), the tangent space is `⊕_{v ∈ S_p} H¹(F_ṽ, ad ρ_v)`; (2) at an
`E`-point of `𝒳_ps^{p-irr}` given by `ρ : G_{F⁺,S} → 𝒢_n(E)` with every `ρ|_{G_{F_ṽ}}` absolutely
irreducible, the tangent space is `H¹(G_{F⁺,S}, ad ρ)`, and the differential of
`𝒳_ps → 𝒳_{ps,p}` is the restriction map to `⊕_v H¹(F_ṽ, ad ρ_v)` (nt21 Lemma 2.14, §2.11.1,
p. 31). Here `ad ρ` carries the conjugation action of `𝒢_n` through the polarization.

*Proof sketch.* On the absolutely irreducible locus pseudodeformations are deformations of
representations (§0.2; chen14 §4.1). Deformations of an absolutely irreducible representation over
`E[ε]` are classified by `H¹` of the adjoint (LocalGaloisDeformationRings §§1.4, 1.18). For (2),
§0.3 identifies conjugate self-dual pseudodeformations with polarized deformations, whose tangent
space is `H¹(G_{F⁺,S}, ad ρ)` (GlobalGaloisDeformations §8.3).

**Checks.**

- For `n = 1` and `F_ṽ = ℚ_p`, `dim H¹(ℚ_p, E) = 2`, matching the dimension of the character space
  of §0.2.
- For `n = 2` and `ρ_v` absolutely irreducible with `H²(ℚ_p, ad ρ_v) = 0`, the local Euler
  characteristic gives `dim H¹ = dim H⁰ + dim H² + [ℚ_p : ℚ_p]·4 = 1 + 0 + 4 = 5`.
- At a reducible point (outside the irreducible locus) the pseudocharacter tangent space can be
  strictly smaller than `H¹(ad)` of a representation with that trace, which is why the statement is
  restricted to absolutely irreducible points.

*Needs:* §0.2; §0.3; LocalGaloisDeformationRings §§1.4, 1.18; GlobalGaloisDeformations §8.3.

### Examples

- For `n = 1` every point is absolutely irreducible, `𝒜 = 𝒪`, §0.3 is the extension of characters
  to `𝒢_1`, and the tangent space of §0.4(1) at a `ℚ_p`-point has dimension `2`.
- For `n = 2`, `F_ṽ = ℚ_p` and `τ̄` absolutely irreducible, `𝒳_{ps,v}` is smooth of dimension `5`
  at points with `H²(ℚ_p, ad ρ_v) = 0`.

### Dependencies

AdicSpacesPartII §R1.9; AdicSpacesPartIII §R2.9; AdicSpacesPartV Layer 1;
IntegralHeckeAndGaloisDeterminants Layers 0–1; LocalGaloisDeformationRings §§F.1.5, F.1.9, F.2.11,
1.4, 1.18; GlobalGaloisDeformations §§8.1, 8.3.

## Layer 1: analytic continuation of symmetric power functoriality between unitary eigenvarieties

Throughout, `ℰ_m(τ̄_m)` is the eigenvariety of the definite unitary group `G_m` with weight map,
Hecke pseudocharacter and closed realization `i_m : ℰ_m → 𝒳_{ps,m} × 𝒯_m`, and
`σ_n = σ_{n,g} × σ_{n,p} : 𝒳_{ps,2} × 𝒯_2 → 𝒳_{ps,n} × 𝒯_n` is the symmetric-power map on
pseudocharacters and refinement characters, all as in ModularityAndLanglandsExtensions §4.3. A
point `z_m = γ_m(π_m, χ_m)` of `ℰ_m` is attached to a refined automorphic representation
`(π_m, χ_m)` of `G_m`. This layer proves that symmetric power functoriality continues along
irreducible components of the eigenvariety, in the non-critical case and in the ordinary case, that
non-criticality passes to symmetric powers, and their combination along a component of `ℰ_2`
(§§1.1–1.4).

### 1.1 Analytic continuation of symmetric power functoriality: the non-critical case

Let `n ≥ 3`, `τ̄_2` a residual conjugate self-dual pseudocharacter of dimension `2` and
`τ̄_n = Sym^{n−1} τ̄_2`. Let `(π_2, χ_2)` be a refined automorphic representation of `G_2` with
`tr r̄_{π_2,ι} = τ̄_2` and point `z_2 ∈ ℰ_2(τ̄_2)`. Suppose (1) `χ_2` is numerically non-critical
and `n`-regular; (2) there is a refined automorphic `(π_n, χ_n)` of `G_n` with
`(σ_n ∘ i_2)(z_2) = i_n(z_n)`; (3) for every `v ∈ S_p` the Zariski closure of
`r_{π_2,ι}(G_{F_ṽ})` contains `SL_2`. Prove that every irreducible component `𝒞` of
`ℰ_2(τ̄_2)_{ℂ_p}` through `z_2` satisfies `(σ_n ∘ i_2)(𝒞) ⊂ i_n(ℰ_n(τ̄_n)_{ℂ_p})` (nt21 Theorem 2.24
and proof, pp. 40–42; Remark 2.25, p. 42). Numerically non-critical means that the slopes of the
refinement are small compared with the gaps between Hodge–Tate weights, so that the attached
triangulation is non-critical.

*Proof sketch.* `r_{π_n,ι}|_{G_{F_ṽ}}` is trianguline with parameter `σ_{n,p}(δ_2)`, regular and
non-critical by (1) and (3): (3) keeps every symmetric power locally irreducible (Remark 2.25).
Choose an affinoid `U` around `z_n` inside the absolutely irreducible, regular parameter locus,
and let `𝒵` be the Zariski closure in `U` of the points whose local representations are
trianguline with the prescribed parameters. Family triangulation on the dense classical locus puts
the eigenvariety in this closure near `z_n`. The trianguline tangent bound
(ModularityAndLanglandsExtensions §4.3, nt21 Proposition 2.11), the genericity of the local
Weil–Deligne parameters and the vanishing of `H¹_f(F⁺, ad r_{π_n,ι})` give
`dim T_{z_n} 𝒵 ≤ dim 𝒲_n`; the eigenvariety is equidimensional of that dimension, so its closed
realization equals `𝒵` near `z_n` and is smooth there. Symmetric powers of the family
triangulation of `ℰ_2` at its accumulating classical points lie in the pointwise trianguline locus,
hence in `𝒵`; Zariski density and closedness give the containment of an affinoid neighbourhood of
`z_2`, and §0.1 treats every component through `z_2`.

**Checks.**

- For `n = 3` and a refinement with Frobenius ratio `α/β`, `3`-regularity says `α/β` is not a root
  of unity of order `1` or `2`, that is `α ≠ ±β`; hypothesis (1) is this together with the
  non-critical slope condition.
- If `H¹_f(F⁺, ad r_{π_n,ι}) ≠ 0` the tangent bound fails and the argument gives nothing; the
  vanishing enters through ModularityAndLanglandsExtensions §4.1.
- At `z_2` itself the conclusion is weaker than hypothesis (2): it says only that
  `(σ_n ∘ i_2)(z_2)` lies in `i_n(ℰ_n(τ̄_n)_{ℂ_p})`, while (2) makes that point a classical `z_n`. At
  another classical point `z′_2` of `𝒞` the conclusion gives only a point of `ℰ_n(τ̄_n)_{ℂ_p}` whose
  Galois pseudocharacter is `Sym^{n−1}` of that of `z′_2`; that this point is classical, hence
  attached to a refined automorphic `(π′_n, χ′_n)`, is not part of the statement and needs the
  further hypotheses of §1.4 on `z′_2` (`n`-regularity of `χ′_2`, non-criticality of every
  triangulation and the local Zariski-closure condition). For `n = 3`, a classical `z′_2` with
  Frobenius ratio `−1` is not covered.

*Needs:* ModularityAndLanglandsExtensions §§1.1, 4.1, 4.3; PotentialAutomorphyInfrastructurePartII
Layer 9 ("Generic Galois representations"; "Bloch–Kato local conditions at generic places"); PadicFamilies §2a.14; §0.1; §0.4.

### 1.2 Analytic continuation of symmetric power functoriality: the ordinary case

Let `n ≥ 3` and `(π_2, χ_2)`, `z_2` be as in §1.1. Suppose (1) `χ_2` is ordinary; (2) there is a
refined automorphic `(π_n, χ_n)` of `G_n` with `(σ_n ∘ i_2)(z_2) = i_n(z_n)`; (3) the Zariski
closure of `r_{π_2,ι}(G_F)` contains `SL_2`. Prove that every irreducible component `𝒞` of
`ℰ_2(τ̄_2)_{ℂ_p}` through `z_2` satisfies `(σ_n ∘ i_2)(𝒞) ⊂ i_n(ℰ_n(τ̄_n)_{ℂ_p})` (nt21 Theorem 2.27
and proof, pp. 42–43). Ordinary means that the normalized `U_p`-eigenvalues are `p`-adic units. The
printed proof uses the chosen neighbourhood as if regularity and irreducibility held throughout
it; the argument here first shrinks `U` into `𝒳^{irr}_{ps,n} × (𝒯^{reg}_n ∩ 𝒯^{HT-reg}_n)`, which is
Zariski open and contains `δ_n`.

*Proof sketch.* Replace the trianguline locus by the closed subspace `𝒵^{ord}` of the flag variety
of `G_{F_ṽ}`-stable flags in the universal representation over `U` whose graded pieces are the
characters `δ_{z,v,i}`. After the shrinking above, `𝒵^{ord} → U` is a closed immersion; tangent
vectors of `𝒵^{ord}` at `z_n` with fixed weight lie in `H¹_g`
(PotentialAutomorphyInfrastructurePartII Layer 9, "Ordinary tangent vectors of trivial weight lie in
`H¹_g`"). Vanishing of `H¹_f(F⁺, ad r_{π_n,ι})` gives `dim T_{z_n} 𝒵^{ord} ≤ dim 𝒲_n`, and one
concludes as in §1.1 with §0.1.

**Checks.**

- A CM form fails (3): the Zariski closure of its image is the normaliser of a torus, which does
  not contain `SL_2`.
- No slope condition is imposed, in contrast with §1.1: an ordinary refinement of a form of weight
  `k` has slopes `0` and `k − 1`.
- For `n = 2` the statement is empty (`σ_2` is the identity on pseudocharacters), which is why
  `n ≥ 3` is assumed.

*Needs:* ModularityAndLanglandsExtensions §4.3; PotentialAutomorphyInfrastructurePartII Layer 0
("Ordinary Galois representations of weight `λ`"), Layer 9 ("Ordinary tangent vectors of trivial
weight lie in `H¹_g`"); ModularityAndLanglandsExtensions §4.1;
PadicFamilies §2a.14; §0.1; §0.2.

### 1.3 Non-criticality passes to symmetric powers

Let `ρ_v : G_{F_ṽ} → GL_2(ℚ̄_p)` be continuous, de Rham with distinct Hodge–Tate weights at every
embedding, such that `WD(ρ_v)` has distinct Jordan–Hölder characters `χ_1`, `χ_2` with
`(χ_1/χ_2)^i ≠ 1` for `1 ≤ i ≤ n − 1`, and suppose every triangulation of `ρ_v` is non-critical.
Prove that every triangulation of `Sym^{n−1} ρ_v` is non-critical (nt21 Lemma 2.29 and proof,
pp. 44–46). The ratio condition is `n`-regularity of the Weil–Deligne parameter.

*Proof sketch.* Work with the filtered `(φ, N, Gal(L/K))`-module of `ρ_v` (PadicHodgeTheory §5.3)
and the dictionary between triangulations and refinements (PhiGammaModulesAndIwasawaCohomology
§7.5). If `N ≠ 0` the triangulation is unique and non-criticality is read off directly. If `N = 0`
the refinements of `Sym^{n−1}` are orderings of the monomials `χ_1^a χ_2^b` (`a + b = n − 1`),
pairwise distinct by `n`-regularity, and the Hodge filtration of `Sym^{n−1}` at an embedding `τ` is
spanned by powers of the line `l_τ = ⟨e_1 + a_τ e_2⟩`. Non-criticality of every triangulation of
`ρ_v` means `a_τ ≠ 0, ∞`. Scale the polynomial variable so that divisibility by
`(1 + a_τ x)^{|I|}` becomes vanishing of the first `|I|` derivatives at `1`. For the
monomials indexed by `i ∈ I`, the derivative matrix has entries
`i(i − 1)⋯(i − h + 1)` in row `h = 0, …, |I| − 1`. Its determinant is, up to ordering sign,
`∏_{i<j}(j − i)`, the Vandermonde product in the distinct indices. It is nonzero in
characteristic zero, so every triangulation flag is in general position with the Hodge filtration
(nt21 Lemma 2.29, pp. 44–46).

**Checks.**

- For `a_τ = 1` and indices `{0, 2}`, the scaled derivative matrix is `[[1, 1], [0, 2]]`,
  with determinant `2 ≠ 0`, including over a 2-adic coefficient field; being an integral unit
  is unnecessary. A Vandermonde matrix on the parameter powers `(1, 1)` would have determinant `0`.
- For `n = 2` the statement is the hypothesis itself.
- If `χ_1/χ_2` has order `2` and `n = 3`, then `χ_1² = χ_2²`, two monomials coincide, two
  refinements of `Sym²` have the same parameter and the argument fails: `n`-regularity is
  necessary.
- If `a_τ = 0` for some `τ` (a critical triangulation of `ρ_v`), the line `l_τ = ⟨e_1⟩` is
  `φ`-stable and the flag through `e_1^{n−1}` is critical for `Sym^{n−1}` as well, so the
  hypothesis cannot be weakened to one triangulation.

*Needs:* PadicHodgeTheory §5.3; PhiGammaModulesAndIwasawaCohomology §7.5;
ModularityAndLanglandsExtensions §1.1.

### 1.4 Symmetric power automorphy along an irreducible component of ℰ₂

Let `n ≥ 3` and `(π_2, χ_2)`, `(π′_2, χ′_2)` refined automorphic representations of `G_2` with
points `z_2`, `z′_2` on a common irreducible component of `ℰ_{2,ℂ_p}`, refinements accessible in the
sense of ModularityAndLanglandsExtensions §1.1. Suppose either (non-critical case) `χ_2` is
numerically non-critical and `n`-regular, every triangulation of `r_{π′_2,ι}|_{G_{F_ṽ}}`
(`v ∈ S_p`) is non-critical, `χ′_2` is `n`-regular, and the Zariski closures of
`r_{π_2,ι}(G_{F_ṽ})` and `r_{π′_2,ι}(G_{F_ṽ})` contain `SL_2`; or (ordinary case) `χ_2` is ordinary
and the Zariski closure of `r_{π_2,ι}(G_F)` contains `SL_2`. If `Sym^{n−1} r_{π_2,ι} ≅ r_{π_n,ι}` for
an automorphic `π_n` of `G_n`, prove that `Sym^{n−1} r_{π′_2,ι} ≅ r_{π′_n,ι}` for an automorphic
representation `π′_n` of `G_n(𝔸_{F⁺})` (nt21 Corollary 2.28 and proof with its footnote,
pp. 43–44).

*Proof sketch.* The refinement
`χ_n = χ_{2,v,1}^{n−1} ⊗ χ_{2,v,1}^{n−2} χ_{2,v,2} ⊗ ⋯ ⊗ χ_{2,v,2}^{n−1}` of `π_n` is accessible
(ModularityAndLanglandsExtensions §1.1), so `z_n` exists with `(σ_n ∘ i_2)(z_2) = i_n(z_n)`. §1.1 or
§1.2 puts the image of the common component into `i_n(ℰ_n)`, the passage to `ℂ_p` using the
behaviour of components under field extension (AdicSpacesPartV Layer 1). The image point
`z′_n` of `z′_2` is classical: in the ordinary case by Hida classicality
(PotentialAutomorphyInfrastructurePartII Layer 3), in the non-critical case because by §1.3 every
triangulation of `Sym^{n−1} r_{π′_2,ι}` is non-critical and non-critical points with `n`-regular
refinement are classical (ModularityAndLanglandsExtensions §4.3, nt21 Lemma 2.30). A classical point
of `ℰ_n` is attached to an automorphic `π′_n` with `r_{π′_n,ι} ≅ Sym^{n−1} r_{π′_2,ι}`
(PotentialAutomorphyInfrastructurePartII Layer 3, "Galois representations attached to constituents
of algebraic modular forms").

**Checks.**

- Taking `z′_2 = z_2` recovers the hypothesis.
- The ordinary case applies to two points of one Hida family; the non-critical case needs both
  refinements `n`-regular, and fails for a point whose Frobenius ratio is `−1` when `n = 3`.
- For `n = 3, 4, 5` the conclusion is also a consequence of the low-rank lifts
  (ModularityAndLanglandsExtensions §1.15) after base change to `F`, a consistency check on the
  shape of `π′_n`.

*Needs:* §1.1; §1.2; §1.3; §0.1; ModularityAndLanglandsExtensions §§1.1, 4.3;
PotentialAutomorphyInfrastructurePartII Layer 3 ("Hida classicality and independence of the
characters `χ_v` modulo `λ`"; "Galois representations attached to constituents of algebraic modular
forms"); AdicSpacesPartV Layer 1 (gap:components-under-field-extension).

### Examples

- For a refined `(π_2, χ_2)` with numerically non-critical `n`-regular refinement, local images at
  `S_p` whose Zariski closures contain `SL_2`, and automorphic `Sym^{n−1}`, §1.4 makes `Sym^{n−1}`
  automorphic at every classical point `z′_2` of its component whose refinement is `n`-regular, all
  of whose triangulations at `S_p` are non-critical, and whose local images at `S_p` have Zariski
  closures containing `SL_2`.
- At `n = 3`, `n`-regularity of `χ′_2` excludes exactly the points with Frobenius ratio `±1`.

### Dependencies

Layer 0; ModularityAndLanglandsExtensions §§1.1, 1.15, 4.1, 4.3; PotentialAutomorphyInfrastructurePartII
Layers 0, 3, 9; PadicFamilies §2a.14; PadicHodgeTheory §5.3; PhiGammaModulesAndIwasawaCohomology
§7.5; AdicSpacesPartV Layer 1.

## Layer 2: from the eigencurve to definite unitary eigenvarieties

`ℰ_0` is the Coleman–Mazur–Buzzard eigencurve of tame level `N` at `p` (PadicFamilies §2.10), with
weight map `κ` to the weight space `𝒲_0`. This layer constructs the twin involution, trivialises
families of characters over CM fields, builds the base-change morphism from `ℰ_0` to a unitary
eigenvariety, and proves that, under non-criticality and regularity hypotheses or ordinarity,
automorphy of `Sym^{n−1}` is constant on irreducible components of `ℰ_0`, the statement of ModularityAndLanglandsExtensions §4.5, together with the Zariski closedness
of the locus where its hypotheses fail (nt21 Theorem 2.33 and §2.31, pp. 49–53).

### 2.1 The twin involution on the eigencurve

Let `Z_0^{pc} ⊂ ℰ_0` be the set of classical points `z` attached to `(π_0, χ_{0,1} ⊗ χ_{0,2})` with
`χ_{0,1}` unramified and `π_{0,p}` not a twist of Steinberg. Every classical point of `ℰ_0` has
`χ_{0,1}` unramified: the refinements parametrised by the eigencurve are the points of
`𝒯_0 = Hom(ℚ_p^×/ℤ_p^× × ℚ_p^×, 𝔾_m)` (nt21 §2.31, p. 48), the first character being read off the
`U_p`-eigenvalue. Let `ψ` be the finite-order Hecke character of `ℚ`, unramified
outside `p`, whose `p`-component restricts on `ℤ_p^×` to `χ_{0,2}^{−1}|_{ℤ_p^×}`, and `ψ_p` its
`p`-component, a character of `ℚ_p^×`. Define the twin `τ(z) ∈ Z_0^{pc}` as the point attached to
`π_0 ⊗ ιψ` with refinement `χ_{0,2}ψ_p ⊗ χ_{0,1}ψ_p`. Prove that `τ² = 1`, that for `π_{0,p}`
unramified the twin is the companion point of the other refinement, and (nt21 Lemma 2.32) that
`s(z) + s(τ(z)) = k − 1` and `v_p(κ(z)(1 + q) − 1) = v_p(κ(τ(z))(1 + q) − 1)`, where `k` is the
weight of `π_0` and `q = p` for odd `p`, `q = 4` for `p = 2` (nt21 §2.31, definition of the twin
and Lemma 2.32, p. 49). The printed definition inserts the global character `ψ` in the local
refinement; the local component `ψ_p` is meant, since `ψ` is not a character of `ℚ_p^×` until
restricted.

*Proof sketch.* Both refinements of the twisted principal series are accessible. The product of
the two normalized `U_p`-eigenvalues has valuation `k − 1`, which gives the slope sum. Write the
weight character on `1 + q` as `(1 + q)^{k−2} η` with `η` of `p`-power order; the twin replaces `η`
by `η^{−1}`. If `η = 1` the valuations coincide. If `η ≠ 1`, then `v_p(η(1 + q) − 1)` is strictly
smaller than `v_p((1 + q)^{k−2} − 1)` (when the latter is finite), and the same holds for `η^{−1}`,
so both weight valuations equal `v_p(η(1+q) − 1) = v_p(η^{−1}(1+q) − 1)`.

**API.**

- The twin `τ : Z_0^{pc} → Z_0^{pc}` of a classical non-Steinberg point, an involution.
- The slope identity `s(z) + s(τ(z)) = k − 1` for `z` of weight `k`.
- The weight identity `v_p(κ(z)(1 + q) − 1) = v_p(κ(τ(z))(1 + q) − 1)`.
- `r_{τ(z)} ≅ r_z ⊗ ψ`: the twin has the same Galois representation up to a finite-order twist,
  so automorphy of every symmetric power is the same at `z` and `τ(z)`.

**Checks.**

- For `π_{0,p}` unramified with `U_p`-roots `α`, `β`, `ψ` is trivial, the twin exchanges `α` and
  `β`, and `s(α) + s(β) = k − 1`. For `Δ` at `p = 2` (`k = 12`, `a_2 = −24`) the slopes are `3` and
  `8`, with sum `11`.
- A point is never its own twin when `s(z) ≠ (k − 1)/2`, since the slopes of `z` and `τ(z)` then
  differ.
- For `k = 2` the slopes of `z` and `τ(z)` sum to `1`.
- The restriction `ψ|_{ℤ_p^×}` has no value at `p`; substituting it in the refinement is not a
  character of `ℚ_p^×`, which is why the full component `ψ_p` appears.
- The clause "`χ_{0,1}` unramified" is what makes `τ` an involution. For a pair `(π_0, χ_{0,1} ⊗ χ_{0,2})`
  with `χ_{0,1}` ramified, applying the recipe twice twists `π_0` by the finite-order character
  `ψψ′` with `(ψψ′)_p|_{ℤ_p^×} = χ_{0,2}^{−1} · (χ_{0,1}χ_{0,2}^{−1})^{−1}|_{ℤ_p^×} = χ_{0,1}^{−1}|_{ℤ_p^×} ≠ 1`,
  so `τ²` would move the point; on `𝒯_0` the twist is trivial and `τ² = 1`.

*Needs:* PadicFamilies §§2.10, 2a.13; ModularityAndLanglandsExtensions §1.1.

### 2.2 Trivialising a family of characters over a CM field

Let `F` be a CM field in which every `p`-adic place of `F⁺` splits, `S̃_p` a set of `p`-adic places
of `F` with `S̃_p ⊔ S̃_p^c` the set of all `p`-adic places, `W` a connected rigid space over `E`, and
`χ : G_ℚ → 𝒪(W)^×` a continuous character unramified almost everywhere. Prove that there are a
finite étale surjective morphism `η : W̃ → W` and a continuous character `ψ : G_F → 𝒪(W̃)^×`,
unramified almost everywhere and at every `ṽ ∈ S̃_p`, with `ψ ψ^c = η^*(χ)|_{G_F}` (nt21 Lemma 2.34
and proof, pp. 51–52). The printed statement asks only for a finite étale `η`; the cover its proof
constructs is surjective, and §§2.3–2.4 use surjectivity to lift points of `W`. The proof uses
Chevalley's theorem in the form: every finite-index subgroup of `𝒪_F^×` contains the units
congruent to `1` modulo some non-zero ideal prime to `p` (GL2AutomorphicRepresentationsAndTransfer
§R16.1.7, with the `p`-adic places as the excluded set).

*Proof sketch.* On the `p`-adic units prescribe a character `L` equal to `χ^{−1}` on the
conjugates of the chosen places and trivial on the chosen places; its restriction to global units
is trivial on a finite-index subgroup by the CM norm-one unit calculation. Chevalley's theorem
(GL2AutomorphicRepresentationsAndTransfer §R16.1.7, applied to the finitely generated group
`𝒪_F^×`, that finite-index subgroup and the set of `p`-adic places) gives a modulus `𝔪` with support
prime to `p`, hence the compact open subgroup `U^p = ∏_{w∤p} U_w(𝔪)` of the units away from `p`, such
that `L` is trivial on `𝒪_F^× ∩ (U^p × ∏_{w|p} 𝒪_{F_w}^×)`; in the idele class quotient by `U^p` the
image of the `p`-adic units has finite index by finiteness of the ray class group (ClassFieldTheory
Layers 11–12). Restriction between rigid character spaces for that finite-index inclusion is finite
étale and surjective: over an algebraically closed field of characteristic zero every continuous
character of a finite-index (hence open) subgroup extends, because the multiplicative group is
divisible and continuity on an open subgroup gives continuity. Pulling back along it gives a finite
étale surjective `W′ → W` over which `L` extends to a character `λ`, and `χ λ λ^c` has finite order,
since it is unramified at `p` and outside finitely many places. A connected component of `W′` still
maps onto the connected `W` (its image is open and closed), and a finite constant coefficient
extension is surjective; after one write `χ λ λ^c` as `φ φ^c` (PotentialAutomorphyInfrastructurePartII
Layer 0, auxiliary characters) and put `ψ = φ λ^{−1}`.

**Checks.**

- For `W` a point the lemma is the existence of a character `ψ` with `ψ ψ^c = χ|_{G_F}`
  unramified at `S̃_p` (Layer 0, "Algebraic characters with prescribed conjugate norm and local
  behaviour").
- If some `p`-adic place of `F⁺` is inert in `F`, `S̃_p` cannot be chosen and the lemma is not
  claimed.
- For `χ` trivial take `W̃ = W` and `ψ = 1`: `η` has degree `1` and every fibre one point.
- The empty cover is excluded by surjectivity. For `W` a point, `W̃ = ∅` with the empty map is finite
  étale, `𝒪(∅)` is the zero ring, and the identity `ψ ψ^c = η^*(χ)|_{G_F}` holds trivially in it, but
  no point of `W` lifts; §§2.3–2.4 would have nothing to transport.
- For the finite-index inclusion `pℤ_p ⊂ ℤ_p`, characters are determined by their value at `1`
  (resp. `p`) in the open disc `|t − 1| < 1`, and restriction is `t ↦ t^p`, finite étale of degree
  `p` in characteristic zero; every geometric point `y` of the disc has `p` preimages (the `p`-th roots
  of `y` stay in the disc), so the restriction is surjective.
- The modulus must avoid `p`, not merely be non-zero. For the group `⟨2⟩ ⊂ ℚ^×`, its subgroup `⟨4⟩`
  of index `2` and the excluded prime `2`, congruence modulo `3` cuts out exactly the even powers of
  `2` (as `2^a ≡ (−1)^a`) and avoids `2`, whereas the unit modulus cuts out all of `⟨2⟩`, which is not
  contained in `⟨4⟩`.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §R16.1.7; ClassFieldTheory Layers 11–12;
PotentialAutomorphyInfrastructurePartII Layer 0 ("Algebraic characters with prescribed conjugate norm
and local behaviour").

### 2.3 The base-change morphism from the eigencurve to a unitary eigenvariety

Let `F′` be an abelian CM field in which the primes dividing `Np` split, with `[F′⁺ : ℚ]` even and
`F′/F′⁺` everywhere unramified; `F ⊃ F′` a soluble Galois CM extension of `ℚ` in which every prime
dividing `Np` splits and `F/F⁺` is everywhere unramified, chosen so that the character `ψ` below is
unramified away from `p`; `ψ` the family of §2.2 over `W̃ → 𝒲_0`; and `𝒯̃ = 𝒯_0 ×_{𝒲_0} W̃`. With
`b_p : 𝒯̃ → 𝒯_2` the twist of the refinement parameter by `ψ^{−1}` at the places of `S̃_p`, define
`b : 𝒳_{0,ps} × 𝒯̃ → 𝒳_{2,ps} × 𝒯_2`, `(τ, μ) ↦ (τ|_{G_F} ⊗ ψ^{−1}, b_p(μ))`. Prove that `b` maps
the classical points of the lift of `ℰ_0` into `i_2(ℰ_2)`, where `G_2` is the definite unitary group
of PotentialAutomorphyInfrastructurePartII Layer 3 over `F⁺` (nt21 proof of Theorem 2.33,
pp. 50–51).

*Proof sketch.* At a classical point `(π_0, χ_0)` the base change `π_{0,F} ⊗ ψ^{−1}` to `GL_2(𝔸_F)`
is conjugate self-dual, since `ψ ψ^c` is the determinant twist, and cuspidal: a non-cuspidal base
change would make `π_0` induced from an imaginary quadratic subfield of `F`, which ramifies at a
prime dividing `Np` and so cannot lie in `F`. Labesse's descent (EndoscopicTransferAndUnitaryTraceComparison
§§6.27, 6.29; PotentialAutomorphyInfrastructurePartII Layer 3, base change and descent) gives an
automorphic representation of `G_2` with refinement `b_p(χ_0)`, so `b` sends the point into
`i_2(ℰ_2)`. `b` is a morphism because restriction of pseudocharacters and twisting by the family `ψ`
are.

**API.**

- The morphism `b : 𝒳_{0,ps} × 𝒯̃ → 𝒳_{2,ps} × 𝒯_2`; its pseudocharacter component is
  `τ|_{G_F} ⊗ ψ^{−1}`.
- `b` sends classical points of the lift of `ℰ_0` into `i_2(ℰ_2)` with the twisted refinement.
- `b` maps each irreducible component of the lift of `ℰ_0` into a single irreducible component of
  the Zariski closure of its classical image.

**Checks.**

- At a classical point of weight `k` the image has labelled Hodge–Tate weights `{0, k − 1}` at
  every embedding of `F`, before the `ψ^{−1}` twist.
- Where `ψ` is trivial at a point, the pseudocharacter part of `b` there is the restriction
  `τ|_{G_F}`.
- If `F` contained the imaginary quadratic field `K` from which a classical form is induced, the
  base change would decompose as a sum of two characters and give no cuspidal point; the splitting
  condition at `Np` excludes this, while a CM form whose inducing field is not in `F` is not
  excluded merely for being CM.

*Needs:* §2.2; §0.2; PotentialAutomorphyInfrastructurePartII Layer 3 ("Base change and descent
between definite unitary groups and `GL_n`"); EndoscopicTransferAndUnitaryTraceComparison §§6.27,
6.29, 13.1; PadicFamilies §2.10; ModularityAndLanglandsExtensions §4.3.

### 2.4 Automorphy of symmetric powers is constant on components of the eigencurve

Let `n ≥ 2` and `(π_0, χ_0)`, `(π′_0, χ′_0)` refined cuspidal automorphic representations of
`GL_2(𝔸_ℚ)` whose points `z_0`, `z′_0` of `ℰ_0` lie on a common irreducible component of
`ℰ_{0,ℂ_p}`. Suppose either (1) `χ_0` is numerically non-critical and `n`-regular, (2) `χ′_0` is
`n`-regular, (3) the Zariski closures of `r_{π_0,ι}(G_{ℚ_p})` and `r_{π′_0,ι}(G_{ℚ_p})` contain
`SL_2`, and (4) `Sym^{n−1} r_{π_0,ι}` is automorphic; or (1ord) `χ_0` is ordinary, (2ord) `π_0` and
`π′_0` are not CM, and (3ord) `Sym^{n−1} r_{π_0,ι}` is automorphic. Prove that
`Sym^{n−1} r_{π′_0,ι}` is automorphic (nt21 Theorem 2.33 and proof, pp. 50–51). This proves
ModularityAndLanglandsExtensions §4.5.

*Proof sketch.* For `n = 2` both forms are automorphic. For `n ≥ 3` choose `F′`, `F`, `ψ` and `b` as
in §2.3. After a finite coefficient extension the selected component is geometrically irreducible
(AdicSpacesPartV Layer 1); its pullback along the surjective `W̃ → W` of §2.2 is finite étale and
each component of the pullback maps onto it, so lifts of both points lie on one geometrically
irreducible component, whose image lies in the unitary eigenvariety by density of classical points
and closedness. Large
local image at `p` (3) makes every triangulation non-critical (nt21 Example 2.10), so the hypotheses
of §1.4 hold for the base-changed points; in the ordinary case (2ord) gives large global image. `b`
maps the common component into a component of `ℰ_2` through `b(z_0)` and `b(z′_0)` (§0.1);
`Sym^{n−1}` of the base change of `π_0` is automorphic on `G_n` by (4) and Labesse descent. §1.4
gives automorphy of `Sym^{n−1} r_{π′_0,ι}|_{G_F}` on `G_n`, hence on `GL_n(𝔸_F)`, and soluble
descent (PotentialAutomorphyInfrastructurePartII Layer 0;
EndoscopicTransferAndUnitaryTraceComparison §6.24) returns to `ℚ`.

**Checks.**

- `n = 2`: the conclusion holds for every `z′_0`, since `Sym^1 r = r` is automorphic.
- Two points of one Hida family of non-CM forms satisfy the ordinary hypotheses.
- Two points of a CM Hida family are excluded by (2ord): the Zariski closure of the image of a CM
  form is the normaliser of a torus, so the large global image used by §1.2 fails, and indeed
  `Sym^2` of a CM form is not cuspidal.

*Needs:* §2.3; §1.4; §0.1; ModularityAndLanglandsExtensions §0.2; EndoscopicTransferAndUnitaryTraceComparison
§6.24; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of
polarized automorphy"); AdicSpacesPartV Layer 1 (gap:components-under-field-extension).

### 2.5 The locus where the hypotheses of Theorem 2.33 fail is Zariski closed

Fix `n ≥ 1`. Prove that the set `Z ⊂ ℰ_0` of points `x` whose pseudocharacter `t_x` is absolutely
reducible, or is the trace of an absolutely irreducible `ρ_x` whose image has Zariski closure not
containing `SL_2`, or satisfies `t_x|_{G_{ℚ_l}} = χ_1 + χ_2` with `(χ_1/χ_2)^i = 1` for some prime
`l | N` and some `1 ≤ i ≤ n − 1`, is Zariski closed in `ℰ_0` (nt21 Lemma 2.35 and proof,
pp. 52–53).

*Proof sketch.* Absolute reducibility is a Zariski closed condition on pseudocharacters (§0.2;
IntegralHeckeAndGaloisDeterminants §1.4). For absolutely irreducible `ρ_x`, the Zariski closure of
the image contains `SL_2` exactly when `Sym^6 ρ_x` is absolutely irreducible: the identity component
of the Zariski closure is then a torus or finite, and finite subgroups of `PGL_2` and normalisers of
tori have no irreducible `Sym^6` (ArithmeticGaloisRepresentations §§4.4, 7.6, where a connected
reductive irreducible subgroup of `GL_2` is shown to be `SL_2` or `GL_2`); this is again a
reducibility condition, on `Sym^6 t_x`. For a prime `l | N` and `1 ≤ i ≤ n − 1`, let `Z_{3,l,i}` be the
intersection of the locus where `t_x|_{G_{ℚ_l}}` is absolutely reducible (Zariski closed by the same
criterion applied to the restriction to `G_{ℚ_l}`) with the common zero locus of the analytic
functions `x ↦ discr(det(X − g^i))`, the discriminant of the characteristic polynomial of `g^i` under
`t_x`, for all `g ∈ G_{ℚ_l}` (Mathlib `Polynomial.discr`; on each affinoid the ideal they generate is
finitely generated, so finitely many `g` suffice there). For `t_x|_{G_{ℚ_l}} = χ_1 + χ_2` these
discriminants all vanish exactly when `χ_1^i = χ_2^i`, so `Z_{3,l,i}` is the ratio locus for `(l, i)`, and
`Z` is the finite union of the locus of the first two conditions with the `Z_{3,l,i}` (nt21 proof of
Lemma 2.35, p. 53). The reducibility condition cannot be dropped: the vanishing of discriminants
alone does not detect a sum of two characters.

**Checks.**

- The CM points of a CM family lie in `Z`: their images have Zariski closure the normaliser of a
  torus.
- For `n = 1` the ratio condition is empty and `Z` is the reducible-or-small-image locus.
- Discriminants without local reducibility are not enough. For the faithful two-dimensional
  representation of `Q_8`, every `g²` is `±1`, a scalar, so for the index `i = 2` every discriminant
  `discr(det(X − g²))` vanishes, although the representation is irreducible and not a sum of
  characters; for `i = 1` a non-central `g` has eigenvalues `±√−1` and discriminant `−4 ≠ 0`. The
  absolute-reducibility condition in `Z_{3,l,2}` rejects it.
- A sum `1 ⊕ η` with `η` of order `2` lies in `Z_{3,l,2}`: `g²` has eigenvalues `1, 1`, so every
  discriminant vanishes; it is not in `Z_{3,l,1}`, since `g` with `η(g) = −1` has eigenvalues `1, −1` and
  discriminant `4 ≠ 0`.
- `Sym^6` cannot be replaced by `Sym^2`: the octahedral group `S_4 ⊂ PGL_2(ℂ)` acts irreducibly on
  `Sym^2` (its three-dimensional representation), while its representations have dimension at most
  `3`, so `Sym^6` (dimension `7`) is reducible; the icosahedral group `A_5` acts irreducibly on
  `Sym^2` and `Sym^4` but its largest irreducible representation has dimension `5`, so `Sym^6`
  detects it.

*Needs:* §0.2; IntegralHeckeAndGaloisDeterminants §1.4; ArithmeticGaloisRepresentations §§4.4,
7.6; PadicFamilies §2.10; Mathlib `Polynomial.discr`.

### Examples

- For `p = 2`, `N = 1` and `Δ`, the two refinements have slopes `3` and `8`; they are twins, and
  both are non-critical since `0 < 3, 8 < 11`.
- At `p = 3`, `N = 1`, `Δ` has `a_3 = 252 = 2² · 3² · 7`, so `v_3(a_3) = 2` and the refinements have
  slopes `2` and `9`, summing to `11`.

### Dependencies

Layers 0–1; PadicFamilies §§2.10, 2a.13; ClassFieldTheory Layers 11–12;
GL2AutomorphicRepresentationsAndTransfer §R16.1.7; PotentialAutomorphyInfrastructurePartII Layers 0,
3; EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.27, 6.29, 13.1;
IntegralHeckeAndGaloisDeterminants §1.4; ArithmeticGaloisRepresentations
§§4.4, 7.6; ModularityAndLanglandsExtensions §§0.2, 1.1, 4.3; AdicSpacesPartV Layer 1.

## Layer 3: level one — the 2-adic boundary of weight space and ping-pong

Throughout `p = 2`, `N = 1`, and `ℰ_0` is the cuspidal 2-adic eigencurve of tame level one. This
layer proves Buzzard–Kilford's description of `ℰ_0` over the boundary annulus (the statement of
ModularityAndLanglandsExtensions §4.6), locates classical weights and twins there, and runs
Newton–Thorne's ping-pong to prove Theorem D, the statement of ModularityAndLanglandsExtensions
§4.7 (nt21 §3, pp. 53–57).

### 3.1 Buzzard–Kilford: the 2-adic eigencurve of tame level one over the boundary annulus

Prove that `ℰ_0` lies over the component `𝒲_0⁺` of weight space where `χ(−1) = 1`, that
`w = χ(5) − 1` identifies `𝒲_0⁺` with the open unit disc `{|w| < 1}`, and that over the annulus
`𝒲_0(b) = {|8| < |w| < 1}` the preimage `ℰ_0(b) = κ^{−1}(𝒲_0(b))` is a disjoint union `⊔_{i≥1} X_i`
of admissible opens, each `κ|_{X_i} : X_i → 𝒲_0(b)` an isomorphism, with slope `i · v_2(w)` on
`X_i` (nt21 Theorem 3.2, pp. 53–54; bk05 Theorem B). Prove also the consequence that there is no
newform of level `4` and odd slope (bk05, Corollary of Theorem B; used in nt21 proof of
Theorem 7.6, p. 90). This proves ModularityAndLanglandsExtensions §4.6.

*Proof sketch.* Buzzard–Kilford compute the `U_2` operator on overconvergent forms of weight `χ`
with `|8| < |w(χ)| < 1` in the basis of powers of a 2-adic Hauptmodul and show that its Newton
polygon has slopes `v_2(w), 2v_2(w), 3v_2(w), …`, each with multiplicity one. The spectral curve
over `𝒲_0(b)` therefore splits into pieces of degree one over weight space (PadicFamilies
§§2a.4–2a.5), the `X_i`, and the comparison of PadicFamilies §2.10 transfers this to `ℰ_0`. The
Eisenstein family, which over the annulus is the only part of slope `0`, is not in the cuspidal
eigencurve.

**Checks.**

- At a weight with `v_2(w) = 1/2` (the case `m = 2` of §3.2) the slopes are `1/2, 1, 3/2, …`.
- At `κ(5) = 5` (weight `3`, `m = 0`), `w = 4`, `v_2(w) = 2` and the slopes are `2, 4, 6, …`: all
  even, consistent with the absence of odd slopes in level `4`.
- At `w = 0` (weight `2`, trivial character) the point is outside the annulus and nothing is
  asserted.

*Needs:* PadicFamilies §§2.10, 2a.4, 2a.5; ModularityAndLanglandsExtensions §4.3.

### 3.2 Classical weights in the 2-adic boundary annulus

Let `z` be a classical point of weight `k` whose weight character satisfies `κ(z)(5) = 5^{k−2}ζ`
with `ζ` a primitive `2^m`-th root of unity (`m ≥ 0`). Prove that `κ(z) ∈ 𝒲_0(b)` exactly when `k`
is odd or `m ≥ 1`; that `v_2(w(z)) = 2^{1−m}` for `m ≥ 1` and `v_2(w(z)) = 2` for `m = 0` with `k`
odd; and that in all these cases `(k − 1)/v_2(w(z))` is an integer (nt21, remark after Lemma 3.3,
p. 54).

*Proof sketch.* For odd `j = k − 2`, `5^j − 1 = 4(5^{j−1} + ⋯ + 1)` with an odd number of odd terms,
so `v_2 = 2`. For even `j > 0` lifting the exponent (Mathlib
`Nat.multiplicity_pow_two_sub_one`) gives `v_2(5^j − 1) = 2 + v_2(j) ≥ 3`. For `k = 2`, `m = 0` one has `w = 0`, outside the annulus. For
`m ≥ 1`, `v_2(ζ − 1) = 2^{1−m} ≤ 1 < 2 ≤ v_2(5^{k−2} − 1)`, so `v_2(5^{k−2}ζ − 1) = 2^{1−m}`.
Integrality: `(k − 1)/2` for `m = 0` and `k` odd, `(k − 1)2^{m−1}` for `m ≥ 1`.

**Checks.**

- `k = 3`, `m = 0`: `w = 4`, `v_2(w) = 2`, `(k − 1)/v_2(w) = 1`.
- `k = 4`, `m = 0`: `w = 24`, `v_2(w) = 3`, not in the annulus.
- `k = 2`, `m = 1`: `w = −2`, `v_2(w) = 1`, `(k − 1)/v_2(w) = 1`.
- `k = 6`, `m = 0`: `w = 5⁴ − 1 = 624 = 2⁴ · 39`, `v_2(w) = 4 = 2 + v_2(4)`, not in the annulus.

*Needs:* §3.1; Mathlib `Nat.multiplicity_pow_two_sub_one`.

### 3.3 The twin of a point on a boundary annulus

Let `z ∈ Z_0^{pc} ∩ ℰ_0(b)` be of weight `k` with `z ∈ X_i`, and `z′ = τ(z)` its twin (§2.1). Prove
that `z′ ∈ X_{i′}` with `i + i′ = (k − 1)/v_2(w(z))` (nt21 Lemma 3.3 and proof, p. 54). The printed
statement writes `z ∈ X_{i′}`; the twin `z′` is meant, as its proof says.

*Proof sketch.* By §2.1, `v_2(w(z′)) = v_2(w(z))`, so `z′` also lies over `𝒲_0(b)`, on some
`X_{i′}`. By §3.1, `s(z) = i v_2(w(z))` and `s(z′) = i′ v_2(w(z))`; §2.1 gives `s(z) + s(z′) = k − 1`,
and one divides by `v_2(w(z))`, the quotient being an integer by §3.2.

**Checks.**

- Weight `3`, `m = 0`: `v_2(w) = 2`, so `i + i′ = 1`, impossible for `i, i′ ≥ 1`; hence no classical
  non-Steinberg point of weight `3` with `m = 0` lies over the annulus.
- Weight `2`, `m = 1`: `i + i′ = 1` likewise excludes such points.
- Weight `5`, `m = 0`: `i + i′ = 2`, so `i = i′ = 1` and the point and its twin have equal slope
  `2 = (k − 1)/2`.

*Needs:* §2.1; §3.1; §3.2.

### 3.4 Refinements of level-one forms at 2 are non-critical and regular

Let `π` be an everywhere unramified cuspidal automorphic representation of `GL_2(𝔸_ℚ)` of weight
`k ≥ 2`, and `α`, `β` the roots of `X² − a_2 X + 2^{k−1}`. Prove that every accessible refinement of
`π` at `2` is numerically non-critical and `n`-regular for every `n ≥ 2` (nt21 Lemma 3.4 and proof,
pp. 54–55). The inputs are that no level-one cusp form is `2`-ordinary, and that for `l ∈ {5, 7}`
the semisimplified mod-`l` representation of a level-one eigenform is a twist of that of `E_4` or
`E_6` (`l = 5`) or of `E_4`, `E_6` or `E_8` (`l = 7`), so that the reduction of `α/β` is `2³` or `2⁵`
modulo `5` and `2³`, `2⁵` or `2⁷` modulo `7`.

*Proof sketch.* Both slopes are positive and add up to `k − 1`, so both lie in `(0, k − 1)`:
numerical non-criticality. If `α/β` were a root of unity `ζ`, the mod-`5` congruence makes the
reduction of `ζ` an element of order `4` of `𝔽_5^×` (`2` has order `4`), so the prime-to-`5` part of
the order of `ζ` is `4`; the mod-`7` congruence makes the reduction of order dividing `3` (`2` has
order `3` in `𝔽_7^×`), so the prime-to-`7` part of the order divides `3`. These are incompatible
(the factor `4` is prime to `7`). The residual semisimplifications come from AlgebraicModularFormsAndSerreWeights §7.3:
choose the coefficient place above `l ∈ {5, 7}`, its residue embedding and a stable lattice;
normalization `a_1 = 1` gives nonzero reduction in the integral lattice image, with weight
`k ≥ 2`, level `1` and trivial character. Compare the reduced full good-prime polynomials,
transporting the place and residue embedding with any coefficient conjugation.
AutomorphicGaloisRepresentations §6.2 identifies this attachment with its DFG realization.

**Checks.**

- For `Δ` (`k = 12`), `a_2 = −24`, `v_2(a_2) = 3`, the slopes are `3` and `8`, both in `(0, 11)`.
  Modulo `5`, `τ(n) ≡ n σ_1(n)`, so the Frobenius eigenvalues at `2` reduce to `2` and `2² = 4`,
  ratio `2^{±1}`, and `2 ≡ 2⁵`, `2^{−1} ≡ 3 ≡ 2³` modulo `5`.
- At `2` the mod-`5` polynomial of `Δ` is `X² − X + 3`: `−24 ≡ 1` and
  `2¹¹ ≡ 3` modulo `5`, also `(X − 2)(X − 4) = X² − X + 3`. Thus trace and determinant
  both match the attached residual semisimplification.
- At level `Γ_0(2)` forms can be `2`-ordinary (slope `0`), and the argument fails.
- `3`-regularity alone needs only `α ≠ ±β`, which already follows from `α/β` not being a root of
  unity.

*Needs:* AlgebraicModularFormsAndSerreWeights §7.3; AutomorphicGaloisRepresentations §6.2; ModularityAndLanglandsExtensions §1.1.

### 3.5 Local reducibility and local image criteria for modular forms

Let `π` be cuspidal on `GL_2(𝔸_ℚ)` of weight `k ≥ 2` and `p` a prime. Prove: (1)
`r_{π,ι}|_{G_{ℚ_p}}` is reducible exactly when `π` is ι-ordinary; (2) if either
`r_{π,ι}|_{G_{ℚ_p}}` is irreducible and `π_p` admits a `3`-regular refinement, or `k > 2` and
`r_{π,ι}|_{G_{ℚ_p}}` is not potentially crystalline, then the Zariski closure of `r_{π,ι}(G_{ℚ_p})`
in `GL_2` contains `SL_2`; (3) if `p = 2` and `π` is everywhere unramified, the Zariski closure of
`r_{π,ι}(G_{ℚ_2})` contains `SL_2` (nt21 Lemma 3.5 and proof, pp. 55–56). The input is Sen's
theorem: a Hodge–Tate representation with distinct weights has a regular torus in the Zariski
closure of its image (PadicHodgeTheory §4.4).

*Proof sketch.* (1): ordinary forms have reducible local representations, and conversely
(PotentialAutomorphyInfrastructurePartII Layer 0, the two comparisons between ι-ordinarity and
ordinarity). (2): by Sen the Zariski closure `H` contains a regular torus; if `H` does not contain
`SL_2` its identity component is a torus, so `r` is induced or a sum of characters
(ArithmeticGaloisRepresentations §7.6); the `3`-regularity or non-potentially-crystalline hypothesis
excludes both. (3): an induced local representation at `2` forces `a_2 = 0`, excluded by §3.4;
reducibility is excluded by non-ordinarity.

**Checks.**

- A CM form at a prime inert in its CM field has induced local representation, Zariski closure the
  normaliser of a torus, and refinement ratio `−1`, which is not `3`-regular, consistent with (2).
- A weight-two form with good supersingular reduction at `p` is potentially crystalline; (2) then
  needs the `3`-regular hypothesis.
- An ordinary form has reducible local representation; its Zariski closure is contained in a Borel
  subgroup and does not contain `SL_2`, so the irreducibility hypothesis in (2) cannot be dropped.

*Needs:* §3.4; PotentialAutomorphyInfrastructurePartII Layer 0 ("`ι`-ordinary automorphic
representations have ordinary Galois representations" and its converse);
ArithmeticGaloisRepresentations §7.6; PadicHodgeTheory §§4.4, 5.3.

### 3.6 Moving within one annulus

Let `z`, `z′` be classical points of one Buzzard–Kilford annulus `X_i`, attached to `(π, χ)`,
`(π′, χ′)` with `χ` and `χ′` `n`-regular. Prove that if `Sym^{n−1} r_{π,ι}` is automorphic then so is
`Sym^{n−1} r_{π′,ι}` (nt21 Lemma 3.6 and proof, p. 56).

*Proof sketch.* For `n = 2` there is nothing to prove; let `n ≥ 3`. `X_i` is geometrically
irreducible, so both points lie on one component. There are no ordinary cuspidal points over the
annulus, so each refinement has positive slope; slopes summing to `k − 1` make them numerically
non-critical, and in the Steinberg case the slope is `(k − 2)/2`. Non-ordinarity gives local
irreducibility; an `n`-regular refinement with `n ≥ 3` is `3`-regular, so §3.5 gives large local
image, and §2.4 applies.

**Checks.**

- Two classical points of `X_1` of different weights with `n`-regular refinements are linked.
- A point whose refinement is not `n`-regular is not covered: e.g. for `n = 3` a refinement with
  ratio `−1`.
- For `n = 2` the statement is the modularity of `r_{π′,ι}`.

*Needs:* §2.4; §3.1; §3.5.

### 3.7 The ping-pong move

Let `π` be everywhere unramified of weight `k ≥ 2` with an accessible refinement `χ` at `2`. Prove
that there is `m_π ≥ 1` such that for every `m ≥ m_π` there is a cuspidal `π′` of `GL_2(𝔸_ℚ)`,
unramified outside `2`, with two accessible refinements of distinct slopes, and a refinement `χ′` of
`π′`, such that `(π, χ)` and `(π′, χ′)` lie on one irreducible component of `ℰ_{0,ℂ_p}`, the point
`z′` of `(π′, χ′)` lies over `𝒲_0(b)`, its twin `z″ = τ(z′)` (attached to a twist `π″` of `π′`) lies
on `X_{2^m−1}`, and automorphy of any one of `Sym^{n−1} r_{π,ι}`, `Sym^{n−1} r_{π′,ι}`,
`Sym^{n−1} r_{π″,ι}` implies all three (nt21 Lemma 3.7 and proof, pp. 56–57).

*Proof sketch.* The component of `(π, χ)` meets `ℰ_0(b)` in some `X_i` (ModularityAndLanglandsExtensions
§4.6). Let `m_π` be the least `m ≥ 1` with `2^{m+1} > 2i + 3`. For `m ≥ m_π` put
`k′ = 2i + 2^{m+1} − 1` (odd) and let `z′ ∈ X_i` be the point with `κ(z′)(5) = 5^{k′−2}`; then
`v_2(w(z′)) = 2` and `s(z′) = 2i < (k′ − 2)/2`, so `z′` is classical by the small-slope criterion
(PadicFamilies §2.8) and not Steinberg at `2` (a Steinberg point has slope `(k′ − 2)/2`); its two
refinements have the distinct slopes `2i` and `k′ − 1 − 2i`. §3.3 places `z″` on `X_{i′}` with
`i′ = (k′ − 1)/2 − i = 2^m − 1`. Distinct slopes make the refinements of `π′` `n`-regular for every
`n` (their ratio is not a root of unity), and non-ordinarity with §3.5 gives large local image; the
original point uses §3.4. Apply §2.4 between `z` and `z′`; the finite-order twist relating `z′` and
`z″` preserves symmetric-power automorphy.

**Checks.**

- The index `2^m − 1` depends only on `m`, so two level-one forms are connected through a common
  annulus by choosing the same `m`.
- For `i = 1`: `m_π` is the least `m ≥ 1` with `2^{m+1} > 5`, so `m_π = 2`, `k′ = 9`, `s(z′) = 2`,
  `(k′ − 2)/2 = 7/2`, and the twin lies on `X_3` with slope `9 − 1 − 2 = 6 = 3 · 2`.
- The small-slope bound used is `s(z′) < k′ − 1`, implied by `2i < (k′ − 2)/2`.

*Needs:* §3.3; §3.2; §3.6; §2.4; PadicFamilies §2.8; ModularityAndLanglandsExtensions §4.6.

### 3.8 Theorem D: symmetric powers for one level-one form give them for all

Fix `n ≥ 2`. Prove that if `π_0` is an everywhere unramified cuspidal automorphic representation of
`GL_2(𝔸_ℚ)` of weight `k ≥ 2` with `Sym^{n−1} r_{π_0,ι}` automorphic for some (equivalently every)
prime `p` and `ι`, then `Sym^{n−1} r_{π,ι}` is automorphic for every everywhere unramified cuspidal
`π` of weight `≥ 2` (nt21 Theorem 3.1 and proof, pp. 53, 57; Introduction, Theorem D, p. 3). This
proves ModularityAndLanglandsExtensions §4.7.

*Proof sketch.* Work at `p = 2`. Choose refinements of `π_0` and `π`; by §3.7 with a common
`m ≥ max(m_{π_0}, m_π)` both are linked to points `z″_0`, `z″` of `X_{2^m−1}`, whose refinements have
unequal slopes and hence are `n`-regular. Apply §3.6 on `X_{2^m−1}` and chain the equivalences; pass
between primes with the one-prime criterion (ModularityAndLanglandsExtensions §4.15).

**Checks.**

- `n = 2` is modularity of every level-one form.
- For `n = 3, 4, 5` the conclusion also follows from the low-rank lifts
  (ModularityAndLanglandsExtensions §1.15), a consistency check.
- The hypothesis cannot be weakened to a CM form: there are no CM forms of level one, so the
  statement concerns non-CM forms only.

*Needs:* §3.7; §3.6; §3.4; ModularityAndLanglandsExtensions §§0.2, 1.15, 4.15.

### Examples

- `Δ` and the unique normalised eigenform of weight `16` are linked by §3.8: at `p = 2` their
  refinements have slopes `{3, 8}` and (since `a_2 = 216 = 2³ · 27`) `{3, 12}`.
- Over the annulus the classical points of weight `9` with `m = 0` and slope `2` lie on `X_1`, and
  their twins on `X_3`.

### Dependencies

Layer 2; PadicFamilies §§2.8, 2.10, 2a.4, 2a.5; AlgebraicModularFormsAndSerreWeights §7.3; AutomorphicGaloisRepresentations §6.2;
PotentialAutomorphyInfrastructurePartII Layer 0; ArithmeticGaloisRepresentations §7.6;
PadicHodgeTheory §§4.4, 5.3; ModularityAndLanglandsExtensions §§0.2, 1.1, 1.15, 4.3, 4.6, 4.15;
Mathlib `Nat.multiplicity_pow_two_sub_one`.

## Layer 4: local representation theory for unitary level raising

At an inert place of a definite unitary group this layer builds the quasi-split unitary groups and
the pure inner twist, the endoscopic character identities
at archimedean, unramified and split places, stable base change with its `L`-packets, the
depth-zero cuspidal representations of `U_3` and `GL_3`, the level-raising types and their
congruence, the endoscopic transfer of the test function, and the fixed-type local lifting rings
(nt21 pp. 8–23). At a ramified place it identifies the Hecke algebra of the
chamber fixer of `U_{2k+1}` (which contains the Iwahori subgroup with index `2`) with the
Iwahori–Hecke algebra of `Sp_{2k}`, states the Kazhdan–Lusztig classification for split
adjoint groups with its pullback to the simply connected cover, constructs the modules `X`, `Y`, `Z`
with their integral structures, and computes their endoscopic signs (ct17 pp. 4–28).

### 4.1 Quasi-split unitary groups and the pure inner twist of the definite group

For a quadratic extension `E/F` of local or global fields with conjugation `c`, let `Φ_n` be the
antidiagonal matrix with entries `1, −1, …, (−1)^{n−1}` and `θ_n(g) = Φ_n c(g)^{−t} Φ_n^{−1}`.
Define the quasi-split unitary group `U_n` as the fixed points of `θ_n` on `Res_{E/F} GL_n`, with its
`θ`-stable standard pinning and `L`-group `^L U_n = GL_n(ℂ) ⋊ W_F`, where `w_c` acts by
`g ↦ Φ_n g^{−t} Φ_n^{−1}`; for `2(n_1 + ⋯ + n_{k−1}) + n_k = n` its standard Levi subgroups are
`Res GL_{n_1} × ⋯ × Res GL_{n_{k−1}} × U_{n_k}`. Under the standard assumptions (`F/F⁺` CM and
everywhere unramified, `[F⁺ : ℚ]` even, `S ⊇ S_p` split), define the pure inner twist `(ξ, u)` of
`U_n` to the definite unitary group `G_n` over `F⁺` (compact at infinity, quasi-split at finite
places; PotentialAutomorphyInfrastructurePartII Layer 3) by `ξ(g_1, g_2) = (g_1, Φ_n^{−1} g_2 Φ_n)`
and `u_c = (Φ_n, Φ_n)` for `n` odd (for `n` even, `(ζΦ_n, ζ^{−1}Φ_n)` with `tr ζ = 0`), and fix a
continuous character `μ : F^× \ 𝔸_F^× → ℂ^×` whose restriction to `𝔸_{F⁺}^×` is the quadratic
character of `F/F⁺` and whose restriction to `F_w^×` is unramified at every place `w` of `F` inert over
`F⁺`; it fixes the `L`-embeddings (nt21 §1, the data fixed under the standard assumptions, p. 9). Prove that this gives isomorphisms `ι_v : G_n(F⁺_v) ≅ U_n(F⁺_v)` at finite places
and the canonical `ι_w : G_n(F⁺_v) ≅ GL_n(F_w)` at split `v = w w^c`, compatible with base change to
a totally real `L⁺/F⁺` (nt21, Notation, pp. 7–8; §1, standard assumptions and the pure inner twist,
pp. 8–10).

*Proof sketch.* `U_n`, its pinning and the Levi description are block-diagonal computations. The
class of `u` is trivial in `H¹(F⁺_v, U_n)` at finite places (Hilbert 90 and the computation of the
local Galois cohomology of unitary groups), so `ι_v` exists; at infinity the twist realises the
compact form. The pure inner twist datum normalises the transfer factors
(EndoscopicTransferAndUnitaryTraceComparison §2.8).

**API.**

- `U_n` as the `θ_n`-fixed subgroup of `Res_{E/F} GL_n` with its standard pinning and `L`-group.
- The standard Levi subgroups and parabolic induction `π_1 × ⋯ × π_k`.
- The pure inner twist `(ξ, u)` of `U_n` to `G_n`, the character `μ` (quadratic on `𝔸_{F⁺}^×`,
  unramified at the places inert over `F⁺`) and the induced `L`-embeddings; at an inert place the
  embedding of an unramified parameter of `U_n` is an unramified parameter of `GL_n(F_w)`.
- The local isomorphisms `ι_v` (inert or ramified `v`) and `ι_w` (split `v = w w^c`), compatible
  with base change to totally real extensions.

**Checks.**

- `U_1` is the norm-one torus: `U_1(F) = {x ∈ E^× : x c(x) = 1}`, and `G_1 = U_1`.
- For `n = 2`, `Φ_2 = antidiag(1, −1)` satisfies `Φ_2^t = −Φ_2 = Φ_2^{−1}`; the two signs cancel in
  `θ_2²`, so `θ_2` is an involution, and its fixed group is the quasi-split `U(1, 1)`.
- At a split place `U_n(F⁺_v) ≅ GL_n(F_w)` by projection to the `w`-factor.
- At an infinite place `G_n(ℝ)` is the compact `U(n)`, not the quasi-split
  `U(⌈n/2⌉, ⌊n/2⌋)`, for `n ≥ 2`; for `n = 3` the Levi subgroups of `U_3` are `U_3` and
  `Res GL_1 × U_1`.
- The restriction condition alone does not make `μ` unramified at inert places. For an unramified
  quadratic extension `F_w/F⁺_v` with residue fields `𝔽₉/𝔽₃`, a character `ν` of `F_w^×` trivial on
  a uniformizer of `F⁺_v` and inflated on units from a character of `𝔽₉^×/𝔽₃^×` (cyclic of order
  `8/2 = 4`) of order `4` is trivial on `F⁺_v^×` but takes the value `i` on a generator of `𝔽₉^×`, so it
  is nontrivial on inertia. Multiplying an admissible `μ` by such a `ν` (realised globally by a
  character trivial on `𝔸_{F⁺}^×` with this local component) keeps the restriction to `𝔸_{F⁺}^×` and
  sends the embedded image of an unramified parameter to a ramified one, so the spherical identity of
  §4.2 at `w` loses its domain; the unramified condition gives inertial scalar `1` instead.

*Needs:* PotentialAutomorphyInfrastructurePartII Layer 3 ("The definite unitary group attached to a
CM field"; "Base change and descent between definite unitary groups and `GL_n`");
EndoscopicTransferAndUnitaryTraceComparison §2.8.

### 4.2 Archimedean, unramified and split endoscopic character identities

Let `n` be odd and `ℰ = (H, s, η)` an extended endoscopic triple for `G = G_n`. Prove:
(archimedean) for `v | ∞` and a Langlands parameter `φ_H` with `η ∘ φ_H` the parameter of an
irreducible `σ_v` of `G(F⁺_v)`, `π` the tempered `θ`-invariant representation of `H(F_ṽ)` of
parameter `φ_H|_{W_{F_v}}`, there is a sign `ϵ(v, ℰ, φ_H) ∈ {±1}` with
`π̃(f̃_v^H) = ϵ(v, ℰ, φ_H) σ_v(f_v)` for every matrix coefficient `f_v` of `σ_v` (both sides are linear
in `f_v`), for the Whittaker-normalised twisted trace, compatible with totally real base change; in
particular `π̃(f̃_v^H) = ϵ(v, ℰ, φ_H)` when `f_v` is normalised by `σ_v(f_v) = 1`, as is
`f_v(g) = dim σ_v · c(g)` with `c(g)` the complex conjugate of `⟨σ_v(g)e, e⟩` for a unit vector `e`
and the Haar measure of total volume `1` on the compact group `G(F⁺_v)` (by Schur orthogonality the
operator `∫ f_v(g) σ_v(g) dg` is then the orthogonal projection onto `ℂe`, of trace `1`); (unramified inert)
for `f_v` unramified and an unramified `φ_H`, `π̃(f̃_v^H) = σ_{v,H}(f_v^H) = σ_v(f_v)`, with the
twisted trace normalised to fix the spherical vector (the `L`-embedding is unramified at `v` because
`μ` is unramified at the place of `F` above the inert `v`, §4.1); (split) the same identities at split `v` for
bounded parameters with the Whittaker normalisation (nt21 Propositions 1.6 and 1.7, §1.5,
pp. 12–13). Transfer factors are normalised by the pure inner twist of §4.1.

*Proof sketch.* Archimedean: Shelstad's real transfer and the Lefschetz functions
(EndoscopicTransferAndUnitaryTraceComparison §§2.14, 6.10), with the sign fixed by the pure inner
twist as in nt21 p. 12. Unramified: the fundamental lemmas for stable base change and for standard
endoscopy (EndoscopicTransferAndUnitaryTraceComparison §§4.9–4.10). Split: constant terms reduce
to `GL_n` (EndoscopicTransferAndUnitaryTraceComparison §6.4).

**Checks.**

- Under a totally real base extension the archimedean sign at a lifted real place equals the sign
  at the original place.
- The unramified identity uses the spherical normalisation and the split identity the Whittaker
  normalisation; exchanging them changes the identities by the scalar by which the normalised
  intertwining operator acts on the spherical vector.
- For `H = G` (the stable case) the sign is `+1`.
- The archimedean value `ϵ` needs the normalised coefficient. For `G(F⁺_v) = U_1(ℝ)` with total
  volume `1` and `σ_v` trivial, the constant `1` is the normalised coefficient, of trace `1`; the
  constant `2` is also a matrix coefficient, of trace `2`, so for it the right-hand side is `2ϵ`, not
  `ϵ`. For `σ_v` the character `z ↦ z^m`, the normalised coefficient is `z ↦ z^{−m}`, of trace `1` on
  `σ_v` and `0` on every character `z ↦ z^{m′}` with `m′ ≠ m`.

*Needs:* §4.1; EndoscopicTransferAndUnitaryTraceComparison §§2.10, 2.14, 4.9–4.10, 6.4, 6.10.

### 4.3 Stable base change and L-packets of U_n at an inert place

Let `v` be a place of `F⁺` inert in `F`. Identify irreducible admissible representations of
`GL_n(F_ṽ)` with parameters `W_{F_ṽ} × SL_2(ℂ) → GL_n(ℂ)`, and let `A^θ_t(GL_n(F_ṽ))⁺` be the
tempered conjugate self-dual ones whose parameter extends to `W_{F⁺_v} × SL_2(ℂ) → ^L U_n` (the
extension is unique up to conjugacy when it exists). Writing
`φ = ⊕ ρ_i^{l_i} ⊕ σ_j^{m_j} ⊕ (τ_k ⊕ τ_k^{w_c,∨})^{n_k}` with `ρ_i` conjugate self-dual of sign
`(−1)^{n−1}` and `σ_j` of sign `(−1)^n`, the extension exists exactly when every `m_j` is even.
Define Mœglin's extended cuspidal support `esc(τ)` of a tempered `τ` of `U_n(F⁺_v)` and stable base
change `BC : τ ↦ π_τ`, where `π_τ ∈ A^θ_t(GL_n(F_ṽ))⁺` is the unique element with
`sc(π_τ) = esc(τ)`. Prove that `BC` is surjective with finite fibres, that the `L`-packets
`Π(π) = BC^{−1}(π)` partition the tempered dual, and that for an extension `π̃` of `π` to
`GL_n ⋊ θ` there are non-zero constants `c_τ` with `π̃(f) = Σ_{τ ∈ Π(π)} c_τ τ(f^{U_n})`
(nt21 §1.8, Propositions 1.9–1.11, pp. 14–15). These are the local statements at inert places of
Mok's classification (ModularityAndLanglandsExtensions §3.12) in Mœglin's explicit form.

*Proof sketch.* For `θ`-discrete `π` (the extended parameter has finite centraliser in `GL_n(ℂ)`: all
`l_i = 1`, no `σ_j` and no `τ_k`; nt21 p. 14) the existence and uniqueness of
`π_τ` and the finiteness of fibres are Mœglin's (moe07 §§5.4, 5.7), extended to all tempered `π` by
parabolic induction; the twisted character identity is Mœglin's for `θ`-discrete `π` (moe07 §5.5)
and follows in general from constant terms and disjointness of Jordan–Hölder factors. These inputs
are supplied by EndoscopicTransferAndUnitaryTraceComparison §11.2 together with its local unitary
base change (§13.5).

**API.**

- The criterion for `φ ∈ A^θ_t(GL_n(F_ṽ))⁺`: every conjugate self-dual summand of the wrong sign has
  even multiplicity.
- Mœglin's extended cuspidal support `esc(τ)` of a tempered `τ` of `U_n(F⁺_v)`.
- Stable base change `BC(τ) = π_τ`, surjective with finite fibres, and the packets
  `Π(π) = BC^{−1}(π)` partitioning the tempered dual.
- The twisted character identity `π̃(f) = Σ_{τ ∈ Π(π)} c_τ τ(f^{U_n})` with non-zero constants.

**Checks.**

- For `n = 1`, `BC` sends a character `χ` of `U_1(F⁺_v)` to the character `z ↦ χ(z/c(z))` of
  `F_ṽ^×`; packets are singletons, and the trivial character goes to the trivial character.
- For `n = 2` a parameter `σ ⊕ σ′` with `σ`, `σ′` distinct conjugate self-dual characters of sign
  `(−1)^n = +1` does not extend to `^L U_2` (multiplicities `1` are odd).
- For `n = 2` the parameter `σ ⊕ σ`, with `σ` a conjugate self-dual character of sign `+1`, does
  extend (multiplicity `2` is even) but is not `θ`-discrete: `σ` has the sign opposite to
  `(−1)^{n−1} = −1`, so the centraliser of the extension contains `Sp_2(ℂ)`. Its packet comes from
  parabolic induction of `σ` from the Levi `Res GL_1` (the diagonal torus of the quasi-split
  `U(1, 1)`), not from Mœglin's discrete case; a definition of `θ`-discreteness that only asked
  for `l_i = 1` and no `τ_k` would wrongly include it.
- `St_2(χ) ⊞ 1` with `χ` the non-trivial unramified quadratic character lies in
  `A^θ_t(GL_3(F_ṽ))⁺` and is the base change of the depth-zero supercuspidal `τ_v` of §4.4.

*Needs:* §4.1; ModularityAndLanglandsExtensions §§3.12, 3.15; SmoothRepresentationsOfLocalGroups
SR.3; EndoscopicTransferAndUnitaryTraceComparison §§11.2, 13.5 (gap:explicit-tempered-unitary-packets).

### 4.4 Depth-zero cuspidal representations of U₃ and GL₃ and their base change

Let `v` be inert of odd residue characteristic, `k(v)` its residue field of cardinality `q` and
`k(ṽ)` the quadratic extension. Let `τ(v)` be the cuspidal unipotent representation of `U_3(k(v))`.
For `k_3/k(v)` cubic let `C = ker(N : Res_{k_3 k(ṽ)/k(v)} 𝔾_m → Res_{k_3/k(v)} 𝔾_m)`, an anisotropic
torus of `U_3` unique up to conjugacy, of order `q³ + 1`; for a prime `p` such that `q` is a primitive
sixth root of unity modulo `p` and `θ : C(k(v)) → ℂ^×` of order `p`, define
`λ(v, θ) = −R_C^{U_3} θ`. With `C̃ = Res_{k_3 k(ṽ)/k(ṽ)} 𝔾_m` and `θ̃(z) = θ(z/z^c)`, define
`λ̃(ṽ, θ̃) = R_{C̃}^{GL_3} θ̃`. Define the compact inductions
`τ_v = c-Ind_{U_3(𝒪)}^{U_3(F⁺_v)} τ(v)`, `λ_v(θ)` similarly, and
`λ̃_ṽ(θ̃) = c-Ind_{F_ṽ^× GL_3(𝒪)}^{GL_3(F_ṽ)} λ̃(ṽ, θ̃)` (the finite type extended trivially on
`F_ṽ^×`). Prove that `λ(v, θ)` and `λ̃(ṽ, θ̃)` are irreducible cuspidal, that `τ_v`, `λ_v(θ)` and
`λ̃_ṽ(θ̃)` are irreducible supercuspidal, that `BC(τ_v) = St_2(χ) ⊞ 1` (`χ` the non-trivial
unramified quadratic character) and `BC(λ_v(θ)) = λ̃_ṽ(θ̃)` (nt21 Proposition 1.12, p. 16); and,
for `n = 2k + 1` and `π = St_2(χ) ⊞ 1 ⊞ (⊞_{i=1}^{2k−2} χ_i) ∈ A^θ_t(GL_n)⁺` with `χ_i|_{𝒪^×}` of
order `2`, relabelled so that `χ_i = χ_{2k−1−i}^{w_c,∨}`, that `Π(π)` contains every irreducible
subquotient of `χ_1 × ⋯ × χ_{k−1} × τ_v` (nt21 Corollary 1.13, pp. 16–17). The hypothesis
`π ∈ A^θ_t(GL_n)⁺` (with its sign and multiplicities) is part of the statement: arbitrary characters
that are quadratic on units need not satisfy it.

*Proof sketch.* `−R_C^{U_3} θ` is irreducible cuspidal for `θ` in general position, and `θ` of order
`p` is in general position because `q` has order `6` modulo `p`; `C` lies in no proper rational
parabolic (RepresentationTheory/CharacterTheory, see the supplier contracts). Compact inductions of
irreducible cuspidal depth-zero types are irreducible supercuspidal (SmoothRepresentationsOfLocalGroups
SR.2.1, irreducibility criterion for compact induction). The reducibility points of depth-zero
supercuspidals in odd residue characteristic leave two possibilities for `BC(τ_v)`, and the sign
condition `BC(τ_v) ∈ A^θ_t⁺` selects `St_2(χ) ⊞ 1`; the same computation gives `BC(λ_v(θ))`
(EndoscopicTransferAndUnitaryTraceComparison §11.2; ls20 §8). Corollary 1.13 follows from Jacquet
modules (SmoothRepresentationsOfLocalGroups SR.2.2) and §4.3.

**API.**

- `τ(v)`, the cuspidal unipotent representation of `U_3(k(v))`, of degree `q(q − 1)`.
- `λ(v, θ) = −R_C^{U_3} θ` for `θ` of order `p` with `q` of order `6` modulo `p`, of degree
  `(q + 1)(q² − 1)`.
- `λ̃(ṽ, θ̃) = R_{C̃}^{GL_3} θ̃` with `θ̃(z) = θ(z/z^c)`: the cuspidal representation of
  `GL_3(k(ṽ))` attached to the regular character `θ̃` of `(k_3 k(ṽ))^×` by Green's parametrisation.
- The compact inductions `τ_v`, `λ_v(θ)`, `λ̃_ṽ(θ̃)`, irreducible supercuspidal, with
  `BC(τ_v) = St_2(χ) ⊞ 1` and `BC(λ_v(θ)) = λ̃_ṽ(θ̃)`.

**Checks.**

- For `k(v) = 𝔽_3`, `dim τ(v) = q(q − 1) = 6`.
- `dim λ(v, θ)` is the part of `|U_3(𝔽_q)|` prime to the characteristic of `𝔽_q`, divided by
  `|C(𝔽_q)|`: with `|U_3(𝔽_q)| = q³(q + 1)(q² − 1)(q³ + 1)` this is `(q + 1)(q² − 1)`, e.g. `32`
  for `q = 3`.
- For `θ` trivial, `−R_C^{U_3}(1) = −1 + τ(v) + St` is a virtual character of degree
  `−1 + q(q − 1) + q³ = (q + 1)(q² − 1)`, not irreducible: the order-`p` hypothesis is needed.
- If `q ≡ 1` modulo an odd `p`, then `|C(k(v))| = q³ + 1 ≡ 2` modulo `p`, so no character of order
  `p` exists.

*Needs:* §4.3; SmoothRepresentationsOfLocalGroups SR.2.1, SR.2.2, SR.3; CharacterTheory Layers 3,
9 (gap:deligne-lusztig-finite-unitary); EndoscopicTransferAndUnitaryTraceComparison §11.2
(gap:explicit-tempered-unitary-packets).

### 4.5 The types τ(v, n) and λ(v, θ, n) and their congruence

Let `v` be inert of odd residue characteristic, `n = 2k + 1`, `𝔭_v ⊂ U_n(F⁺_v)` the parahoric with
Levi quotient `(Res GL_1)^{k−1} × U_3` over `k(v)`, and `ω(ṽ)` the non-trivial quadratic character of
`k(ṽ)^×`. Define `τ(v, n)` (resp. `λ(v, θ, n)`) as the representation of `𝔭_v` inflated from
`ω(ṽ) ⊗ ⋯ ⊗ ω(ṽ) ⊗ τ(v)` (resp. `⊗ λ(v, θ)`), and the test function `φ(v, θ, n)`, supported on
`𝔭_v` and inflated from the character of `λ(v, θ, n)^∨`, so that `π(φ)` is a positive multiple of
`dim Hom_{𝔭_v}(λ(v, θ, n), π|_{𝔭_v})`. Prove that when `q` is a primitive sixth root of unity
modulo `p`: (1) the reduction `τ̄(v, n)` is irreducible; (2) the semisimplified reduction of
`λ(v, θ, n)` contains `τ̄(v, n)` with multiplicity one (nt21 §1.8 and Proposition 1.15,
pp. 17–18). `𝒪`-lattices in these finite-dimensional representations exist and their
semisimplified reductions are independent of the lattice (ArithmeticGaloisRepresentations §1.8,
Brauer–Nesbitt applied to the finite group `𝔭_v/𝔭_v^+`).

*Proof sketch.* Inflate from the Levi quotient through the pro-unipotent radical of `𝔭_v`.
(1) is the modular irreducibility of cuspidal unipotent characters (dm18 Theorem 1). (2): `θ ≡ 1`
modulo `p`, so `R_C θ ≡ R_C 1` on `p`-regular classes; decompose `R_C 1` into unipotent characters and
use the decomposition numbers of `U_3` in non-defining characteristic for `q` of order `6`
(RepresentationTheory/CharacterTheory, supplier contracts).

**API.**

- `τ(v, n)` inflated from `ω(ṽ)^{⊗(k−1)} ⊗ τ(v)`, and `λ(v, θ, n)` inflated from
  `ω(ṽ)^{⊗(k−1)} ⊗ λ(v, θ)`, with `𝒪`-lattices.
- The test function `φ(v, θ, n) ∈ C_c^∞(U_n(F⁺_v))`, with `π(φ)` a positive multiple of the
  `λ(v, θ, n)`-multiplicity.
- `τ̄(v, n)` is irreducible.
- `τ̄(v, n)` occurs in the semisimplified reduction of `λ(v, θ, n)` with multiplicity one.

**Checks.**

- For `n = 3`, `𝔭_v = U_3(𝒪)`, `τ(v, 3) = τ(v)` and `λ(v, θ, 3) = λ(v, θ)`.
- `dim λ(v, θ, n) = (q + 1)(q² − 1)` independently of `n`; `dim τ(v, n) = q(q − 1)`.
- For `q = 3` and `p = 7` (`3` has order `6` modulo `7`), `|C(𝔽_3)| = 28` is divisible by `7`, so
  characters `θ` of order `7` exist.

*Needs:* §4.4; SmoothRepresentationsOfLocalGroups SR.1.4; ArithmeticGaloisRepresentations §1.8;
CharacterTheory (gap:deligne-lusztig-finite-unitary).

### 4.6 Endoscopic transfer of the test function φ(v, θ, n)

Assume `char k(v) > n`. Let `φ = φ(v, θ, n)`, `ℰ = (H, s, η)` with `H = U_a × U_b` (`a + b = n`),
and `π_a ∈ A^θ_t(GL_a(F_ṽ))⁺`, `π_b ∈ A^θ_t(GL_b(F_ṽ))⁺` with `(π_a ⊗ π_b)~(φ̃^H) ≠ 0`. Prove that
`sc(π_a) + sc(π_b) = λ̃_ṽ(θ̃) + χ_1 + ⋯ + χ_{2k−2}` with each `χ_i|_{𝒪^×} = ω(ṽ)` (nt21
Proposition 1.16 and proof, pp. 18–19). The input is the transfer of Deligne–Lusztig functions: for
`char k(v) > n` the transfer `φ^H` can be taken to be a weighted sum of inflations to `H(𝒪)` of the
Deligne–Lusztig characters `R_{C_i}^{H_{k(v)}}(θ^{−1} ⊗ ω(ṽ)^{⊗(k−1)})`, one for each conjugacy class
of embeddings `C_i` of `C × (Res 𝔾_m)^{k−1}` into `H_{k(v)}` (kv12 Theorem 2.2.5, arXiv version).

*Proof sketch.* Compute `φ^H` as above (EndoscopicTransferAndUnitaryTraceComparison §2.11);
transitivity of Deligne–Lusztig induction and cuspidality of `λ̃(ṽ, θ̃)` identify the depth-zero
supercuspidal support of the representations on which `φ^H` has non-zero twisted trace (nt21
Proposition 1.14); combine with the twisted character identity of §4.3.

**Checks.**

- In the stable case `H = U_n` the supercuspidal support contains `λ̃_ṽ(θ̃)`, while the unipotent
  type `τ(v, n)` has support built from `St_2(χ) ⊞ 1`: the two compact types are distinguished by
  their supports, which is what level raising uses.
- The hypothesis `char k(v) > n` fails for `n = 3`, `q = 3`; such places are excluded from `T_1`
  in §5.1.
- If `(π_a ⊗ π_b)~(φ̃^H) = 0` nothing is asserted: the statement does not exclude representations
  containing both compact types.

*Needs:* §4.5; §4.3; §4.4; EndoscopicTransferAndUnitaryTraceComparison §2.11
(gap:deligne-lusztig-transfer).

### 4.7 Splitting of lifts and Frobenius on fixed-type lifting rings

Let `ṽ` be a place of `F` split over `F⁺` with `char k(ṽ)` odd, `p` an odd prime different from
`char k(ṽ)`, `1 ≤ n_1 ≤ n`, `n_2 = n − n_1`, `q_ṽ` a primitive `n_1`-th root of unity modulo `p`, and
`Θ` a character of `k_{n_1}^×` of order `p`. Let `ρ̄_ṽ = σ̄_{ṽ,1} ⊕ σ̄_{ṽ,2}` with
`σ̄_{ṽ,1} ≅ Ind_{G_{F_{ṽ,n_1}}}^{G_{F_ṽ}} ψ̄_ṽ` (`ψ̄_ṽ` unramified) and `σ̄_{ṽ,2} ⊗ ω(ṽ) ∘ Art^{−1}`
unramified on inertia. Prove (nt21 Lemma 1.21 and Proposition 1.22(3)–(4), pp. 20–21): (Lemma 1.21)
every lift of `ρ̄_ṽ` to a complete Noetherian local `𝒪`-algebra `R` is `(1 + M_n(𝔪_R))`-conjugate to
`σ_{ṽ,1} ⊕ σ_{ṽ,2}` with `σ_{ṽ,i}` lifting `σ̄_{ṽ,i}`, each unique up to conjugacy; on the fixed-type
ring `R(ṽ, Θ, ρ̄_ṽ)` (lifts of inertial type `τ_ṽ`, the type being read through the Artin map of
`F_{ṽ,n_1}` on the first summand): (3) with `α_ṽ` the reduction of
`(−1)^{n_1+1} det σ_{ṽ,1}(φ_ṽ)`, `det(X − σ_{ṽ,1}(φ_ṽ^{n_1})) ≡ (X − α_ṽ)^{n_1}` modulo `ϖ`, and
`α_ṽ` in `R(ṽ, Θ, ρ̄_ṽ)/(ϖ)` is independent of the Frobenius lift `φ_ṽ`; (4) for `L_ṽ/F_ṽ` finite with
`τ_ṽ|_{I_{L_ṽ}}` trivial, the map from the framed ring of `L_ṽ` factors through its unramified
quotient. The case `n_1 = 1` (`q_ṽ ≡ 1` modulo `p`, `λ̃ = Θ`) is included. The printed proof of (3)
uses a Hensel argument; the argument here checks the polynomial identity at characteristic-zero
points and reduces, and for `n_1 = 1` claims independence of `α_ṽ` only modulo `ϖ`.

*Proof sketch.* The hypotheses make `H⁰` and `H¹` of `Hom(σ̄_1, σ̄_2)` and `Hom(σ̄_2, σ̄_1)` vanish
(they fail for `p = char k(ṽ)` or `p = 2`), which gives the splitting and uniqueness by deformation
theory of extensions (LocalGaloisDeformationRings §§1.1, 1.4). For (3), fix a Frobenius lift: at
characteristic-zero points the induced first block has scalar `n_1`-th Frobenius power and
characteristic polynomial `(X − (−1)^{n_1+1} det σ_1(φ))^{n_1}`; the fixed-type ring is reduced and
`𝒪`-flat (LocalGaloisDeformationRings §§2.18, 2.24), so the identity spreads; reducing modulo `ϖ`,
the determinant on inertia becomes trivial because `Θ` has `p`-power order, so `α_ṽ` does not depend
on the Frobenius lift. (4): on restriction to `G_{L_ṽ}` the type becomes trivial, so lifts are
unramified.

**Checks.**

- For `n_1 = n` the second summand is zero, Lemma 1.21 is empty, and (3) says the `n`-th Frobenius
  power is scalar modulo `ϖ` on the induced summand.
- For `n_1 = 1` the determinant can involve the ramified order-`p` character `Θ`, so `α_ṽ` is
  independent of the Frobenius lift only after reduction modulo `ϖ`.
- For `p = 2` the twist by `ω(ṽ)` is trivial residually and the cross cohomology need not vanish;
  `p` is odd throughout.

*Needs:* LocalGaloisDeformationRings §§1.1, 1.4, 2.18, 2.24.

### 4.8 The Hecke algebra of the chamber fixer of ramified `U_{2k+1}` is the Iwahori–Hecke algebra of `Sp_{2k}`

Let `E/F` be ramified quadratic of odd residue characteristic with residue cardinality `q`. Fix a
uniformizer `ϖ_E` of `E` with `ϖ_F := ϖ_E² ∈ F`; since `E/F` is ramified, `ϖ_F` is a uniformizer of `F`
and `c(ϖ_E) = −ϖ_E` (ct17 §2.1, p. 4; the bare letter `ϖ` stays reserved for coefficient
rings). Let `U_{2k+1}` be the ramified quasi-split unitary group, `K = U_{2k+1}(𝒪_F)` the special
maximal compact subgroup of the special vertex `0` of the standard apartment, `C` the chamber
`0 < a_k < ⋯ < a_1 < 1/4` (`a_1, …, a_k` the coordinates dual to the cocharacters `e_i` of the maximal
split torus, ct17 p. 5), and `K → O(J)(k_F)` the reduction onto the (disconnected) orthogonal
group in `2k + 1` variables over `k_F`. Let `I ⊂ K` be the Iwahori subgroup of `C` (the integral
points of the connected Bruhat–Tits model, ReductiveGroupsPartII §RG2.3.3), the preimage of the
upper-triangular subgroup of `SO(J)(k_F)`, and `B ⊃ I` the pointwise fixer of `C`, the preimage of
the upper-triangular subgroup of `O(J)(k_F)` (ct17 §2.1, p. 6); `H_B` is the algebra of
`B`-bi-invariant compactly supported functions, `B` of measure `1`. Let `ζ = −1_{2k+1}`,
`U_{2k+1}(F)_1` the subgroup generated by the parahoric subgroups, `Λ ≅ ℤ^k` the quotient of the
maximal torus `Z` (the centraliser of the maximal split torus) by its maximal compact subgroup `Z_c`,
spanned by `ε_i = diag(1, …, ϖ_E, …, −ϖ_E^{−1}, …, 1)` (`ϖ_E` in the `i`-th and `−ϖ_E^{−1}` in the
`(−i)`-th entry; ct17 p. 5), `N` the normaliser of the maximal split torus and `W = N/Z_c`, and `B′`
the Iwahori subgroup of split `Sp_{2k}(F)` with `Λ′ = S′/S′_c ≅ ℤ^k` spanned by
`ε′_i = diag(1, …, ϖ_F, …, ϖ_F^{−1}, …, 1)` (`ϖ_F` in the `i`-th entry; ct17 p. 7). Prove:
(i) `ζ` is central of order two, `ζ ∈ B` and `ζ ∉ I`, `B = I × ⟨ζ⟩` (so `[B : I] = 2`),
`U_{2k+1}(F) = U_{2k+1}(F)_1 × ⟨ζ⟩` and `B ∩ U_{2k+1}(F)_1 = I`; (ii) restriction of functions to
`U_{2k+1}(F)_1` is an algebra isomorphism `H_B ≅ H(U_{2k+1}(F)_1, I)`, and
`H(U_{2k+1}(F), I) ≅ H_B ⊗ ℤ[⟨ζ⟩]` with `[Iζ] = [IζI]` central of square `1`; for a smooth
representation `π` on which `ζ` acts by a scalar, `π^B = π^I` when `ζ` acts by `1` and `π^B = 0`
when it acts by `−1`; (iii) `(U_{2k+1}(F), B, N)` is a Tits system with Weyl group `W`, the
identifications `Λ ≅ Λ′` (`ε_i ↦ ε′_i`) and `W_0 ≅ W′_0` extend to an isomorphism of affine Weyl
groups `W ≅ W′` carrying the simple affine reflections `s_0, …, s_k` to those of `Sp_{2k}`, with the
same parameter `q = [Bs_iB : B]` at every simple reflection, and induce an isomorphism
`H_B ≅ H_{B′}` with `[Bε_iB] ↦ [B′ε′_iB′]` (ct17 §2.1, pp. 6–7, Proposition 2.2, p. 7). The
statement concerns the chamber fixer `B`, not the Iwahori subgroup `I`, whose Hecke algebra is
twice as large. The printed presentation (ct17 pp. 6–7) uses invertible braid-group generators
over `ℤ` and a quadratic relation with reversed signs; the presentation used here is
`T_s² = (q − 1)T_s + q`, equivalently `(T_s − q)(T_s + 1) = 0`, with the positive braid monoid over
`ℤ` (the braid group form needs `q` invertible).

*Proof sketch.* (i) The Kottwitz homomorphism of ReductiveGroupsPartII §RG2.4.2 identifies
`U_{2k+1}(F)/U_{2k+1}(F)_1` with `Ω ≅ π₁(U_{2k+1})_I = ℤ/2` (inertia acts on `π₁ = ℤ` by `−1`); its
value on the centre `U_1(F) = E^1` is the reduction `E^1 → {±1}`, and composed with the scalar
embedding it is multiplication by `2k + 1`, an isomorphism on `ℤ/2`; so `ζ` maps to the generator.
A central element of `Z_c` fixes the building pointwise, so `ζ ∈ B`, and the parahoric of `C` is the
part of its fixer in `U_{2k+1}(F)_1` (§RG2.3.3). (ii) A `B`-bi-invariant function is `ζ`-invariant and
is determined by its restriction to `U_{2k+1}(F)_1`, which is `I`-bi-invariant; the Haar measures
correspond. (iii) The Tits system `(U_{2k+1}(F)_1, I, N ∩ U_{2k+1}(F)_1, S̃)` of
ReductiveGroupsPartII §RG2.4.2 times `⟨ζ⟩` is `(U_{2k+1}(F), B, N)`, with `B ∩ N = Z_c`. Compute the
affine root system of ramified `U_{2k+1}` from its valued root datum (ReductiveGroupsPartII
§RG2.1.3) and check that it matches that of `Sp_{2k}` with equal parameters at all simple
reflections; the Iwahori–Matsumoto presentation of `H(U_{2k+1}(F)_1, I)`
(SmoothRepresentationsOfLocalGroups SR.1.5, for quasi-split groups) and of `H_{B′}` (SR.1.5, split
case) with (ii) give the isomorphism.

**Checks.**

- The element `ζ = −1_{2k+1}` reduces to `−1 ∈ O(J)(k_F)`, of determinant `(−1)^{2k+1} = −1`, so it
  lies in `B` but not in `I`; `B/I ≅ ℤ/2`, matching the index `2` of ct17 p. 6.
- Rank zero (`k = 0`, the anisotropic `U_1`): `B = U_1(F) = E^1` and `I` is the kernel of
  `E^1 → {±1}`; `H_B = ℤ = H(Sp_0)`, while `H(U_1(F), I) = ℤ[ℤ/2]` has rank `2`. Over `ℂ` the latter
  has the two central idempotents `(1 ± [Iζ])/2`, and `H_B` is the corner of `(1 + [Iζ])/2`. The
  connected-Iwahori algebra is therefore not the Hecke algebra of `Sp_{2k}`.
- The character `χ(g) = (det g mod ϖ_E) ∈ {±1}` of `U_{2k+1}(F)` is trivial on `I` and takes the
  value `(−1)^{2k+1} = −1` at `ζ`: `dim χ^I = 1` and `dim χ^B = 0`.
- For `k = 1` both `H_B` and `H_{B′}` are the affine Hecke algebra of type `Ã_1` with equal
  parameters `q`.
- The uniformizer convention fixes the lattice. For `k = 1`, `E = F(√ϖ_F)` and `ϖ_E = √ϖ_F`:
  `v_F(ϖ_E²) = 1`, so `ε′_1 = diag(ϖ_F, ϖ_F^{−1})` generates `Λ′ ≅ ℤ`, matching the generator `ε_1` of
  `Λ`. Writing `ε′_1` with the square `ϖ_F²` of an `F`-uniformizer gives valuation `2` and an element
  generating only `2ℤ ⊂ Λ′`, so `ε_1 ↦ ε′_1` would not be onto.
- The double-coset computation gives `[BsB]² = (q − 1)[BsB] + q`: for a nonunit `q` (over `ℤ`, or
  over `ℤ_l` with `l | q`) `T_s` is not invertible, so the braid-group presentation is not available
  integrally.
- The generic-parameter algebras specialise to `H_B` and `H_{B′}` at the same `q`; with unequal
  parameters (as for the unramified `U_{2k+1}`) the statement fails.

*Needs:* ReductiveGroupsPartII §§RG2.1.3, RG2.3.3, RG2.4.1–RG2.4.2; SmoothRepresentationsOfLocalGroups
SR.1.4, SR.1.5 (gap:iwahori-matsumoto-quasi-split), SR.4.4.

### 4.9 The Kazhdan–Lusztig classification of Iwahori-spherical representations

Let `G` be a split adjoint group over a non-archimedean local field with residue cardinality `q`,
`B` an Iwahori subgroup (for split `G` it is the whole pointwise fixer of its alcove, since the
maximal bounded subgroup `T(𝒪_F)` of the split torus is connected) and `G^∨` the complex dual
group. Prove that irreducible smooth representations of `G` with non-zero `B`-fixed vectors are in
bijection with `G^∨`-conjugacy classes
of triples `(s, u, ρ)` with `s ∈ G^∨` semisimple, `u ∈ G^∨` unipotent with `s u s^{−1} = u^q`, and `ρ`
an irreducible representation of the component group `A(s, u)` of `Z_{G^∨}(s, u)` occurring in the
homology `H_*(ℬ_u^s, ℂ)` of the variety of Borel subgroups containing `s` and `u`; that the
`H_B`-module of `B`-fixed vectors of the representation attached to `(s, u, ρ)` is the unique simple
quotient of the standard module `Hom_{A(s,u)}(ρ, H_*(ℬ_u^s, ℂ))`. Choose an `s`-adapted
Jacobson–Morozov homomorphism `φ : SL_2(ℂ) → G^∨` with `φ((1, 1; 0, 1)) = u`, meaning that
`s₀ = s φ(diag(q^{1/2}, q^{−1/2}))^{−1}` centralizes `φ(SL_2(ℂ))`; here `q^{1/2}` is the
positive real square root. Prove existence of such a homomorphism and that the representation
is tempered exactly when this commuting factor `s₀` lies in a compact subgroup of `G^∨`, in
which case the standard module is irreducible (kl87 Theorem 7.12 and §8). This condition is
independent of the adapted choice. The factor `s₀` is not the compact factor of the polar
decomposition of `s`. The Bernstein subalgebra `ℂ[Λ]` acts on the standard module through the decomposition of `ℬ_u^s` into
fixed-point components of a maximal torus, which computes the semisimplified normalised Jacquet
module (the exponents) of the representation.

Prove also the pullback to the simply connected cover. Let `p : G_sc → G` be the simply connected
cover, with residue characteristic prime to `|ker p|`; `Q^∨ = X_*(T_sc) ⊂ X_*(T)` the coroot lattice
(`T_sc = p^{−1}(T)`); `Ω = X_*(T)/Q^∨`, identified with the length-zero subgroup of the extended affine
Weyl group `W_aff ⋊ Ω` of `G`, and its characters `χ` with the elements `z_χ ∈ T^∨ = Hom(X_*(T), ℂ^×)`
equal to `χ` on `X_*(T)`, which are trivial on `Q^∨` and so lie in `Z(G^∨)`; `κ : G(F) → Ω` the
homomorphism sending `IwI` to `w` modulo `W_aff`; `I_sc ⊂ G_sc(F)` an Iwahori subgroup and `I ⊂ G(F)`
the Iwahori subgroup containing `p(I_sc)`. Then: (a) `p` induces an algebra isomorphism of
`H(G_sc, I_sc)` onto the span of the `T_w`, `w ∈ W_aff`, in `H(G, I)`, sending `θ_λ` to `θ_λ` for
`λ ∈ Q^∨`, and `H(G, I)` is the crossed product of this subalgebra with `Ω`; (b) for an irreducible
smooth `π` of `G(F)` with `π^I ≠ 0`, `(p^*π)^{I_sc} = π^I` as `H(G_sc, I_sc)`-modules through (a), so
the exponents of `p^*π` are the restrictions to `Q^∨` of those of `π`; (c) `p^*π` is irreducible
exactly when `π^I` is simple over `H(G_sc, I_sc)`, exactly when `π ⊗ (χ ∘ κ) ≇ π` for every
non-trivial character `χ` of `Ω`, and twisting by `χ ∘ κ` multiplies `θ_λ` by `χ(λ)`, hence the
central character `s` by `z_χ`; (d) if `s` is real positive, `s = μ(q^{1/2})` for a cocharacter `μ` of
`T^∨` (for instance `s = φ(diag(q^{1/2}, q^{−1/2}))` and `u = φ((1, 1; 0, 1))` for a homomorphism
`φ : SL_2(ℂ) → G^∨`), then `z_χ s` is not `W`-conjugate to `s` for `χ ≠ 1`, so `p^*π` is irreducible
for every `π` with central character `s`. The Clozel–Thorne construction applies (a)–(d) to
`p : Sp_{2k} → PSp_{2k}`, with dual groups `SO_{2k+1}(ℂ)` and `Spin_{2k+1}(ℂ)` and `Ω ≅ ℤ/2` (ct17 proof
of Theorem 2.5, p. 10).

*Proof sketch.* The Iwahori block is equivalent to `H_B`-modules (SmoothRepresentationsOfLocalGroups
SR.3.4), and `H_B` has the Bernstein presentation (SR.1.5). The realisation of `H_B` in the
`G^∨ × ℂ^×`-equivariant `K`-theory of the Steinberg variety of `G^∨`, the standard modules obtained
by localisation at `(s, q)`, the classification of simple modules as their unique simple quotients and
the irreducibility of tempered standard modules are supplied by SpringerResolutionAndCharacteristicCycles
(gap:steinberg-equivariant-k-theory); temperedness is Casselman's criterion on the exponents of the
standard module (SR.3.3). Adapted homomorphisms: for `u = 1` take `φ` trivial, so `s₀ = s`. For
`u ≠ 1` put `e = log u`, so `Ad(s)e = qe`. By Jacobson–Morozov (Tau Ceti
`TauCeti.exists_isSl2Triple_of_isNilpotent_ad`) `e` lies in a triple `(h_1, e, f_1)`, and the neutral
elements of triples with nilpositive `e` form the affine space `h_1 + (ker(ad e) ∩ [e, 𝔤^∨])` (Tau Ceti
`IsSl2Triple.exists_isSl2Triple_iff_sub_mem`). The Zariski closure `D` of `⟨s⟩` is diagonalizable and
scales `e`, so `Ad(d)` carries this affine space to itself and the linear space `ker(ad e) ∩ [e, 𝔤^∨]`
is a sum of `D`-weight spaces; as `Ad(d)h_1 − h_1` lies in it for every `d ∈ D`, so does every
non-trivial weight component of `h_1`, and the weight-zero component `h` of `h_1` is a neutral element
with `Ad(s)h = h`. The `f` completing `(h, e)` is unique, hence `Ad(s)f = q^{−1}f`. Integrate
`(h, e, f)` to `φ : SL_2(ℂ) → G^∨` (NilpotentOrbits N2; `SL_2` is simply connected); then
`φ(diag(q^{1/2}, q^{−1/2}))` acts on `e, h, f` by `q, 1, q^{−1}`, as `s` does, so `s₀` centralizes
`φ(SL_2(ℂ))`. Pullback: (a) is the Iwahori–Matsumoto presentation of
SR.1.5 for `G` and for `G_sc`, whose affine Weyl groups `p` identifies with their lengths; since the
residue characteristic is prime to `|ker p|`, `I = T(𝒪_F) p(I_sc)`, so `p(I_sc) w p(I_sc)/p(I_sc) → IwI/I`
is a surjection between sets of `q^{ℓ(w)}` elements, hence a bijection. (b) By SR.3.4 `π` embeds in an
unramified principal series `i_B χ`; `T(𝒪_F)` normalises `p(I_sc)` and acts trivially on
`(i_B χ)^{p(I_sc)}` because `χ` is unramified, so `π^{p(I_sc)} = π^I`. (c) `p(G_sc(F))` is open, normal and
of finite index in `G(F)`, so `p^*π` is a finite direct sum of `G(F)`-conjugate irreducibles, all
Iwahori-spherical since `G_sc(F)` is transitive on alcoves; the Iwahori block of `G_sc` is equivalent to
`H(G_sc, I_sc)`-modules (SR.3.4), and Clifford theory for a crossed product by the finite abelian group
`Ω` (with `T_ω` invertible) gives the criterion. (d) In the polar decomposition
`T^∨ = Hom(X_*(T), ℝ_{>0}) × Hom(X_*(T), S¹)`, `W` preserves both factors, the weights of `π^I` lie in
`W·s` inside the first and `z_χ ≠ 1` lies in the second, so `W·s` and `z_χ W·s` are disjoint.

**API.**

- An adapted `φ : SL_2(ℂ) → G^∨` takes the standard upper unipotent to `u` and makes
  `s₀ = s φ(diag(q^{1/2}, q^{−1/2}))^{−1}` centralize its image.
- The compact-subgroup condition on `s₀` is independent of the adapted choice and gives
  exactly the tempered representations; the polar compact factor of `s` is not substituted.
- In the tempered case the standard module itself is the irreducible Iwahori-fixed module.

**Checks.**

- For `PGL_2`: `(s, 1, triv)` gives the unramified principal series with Satake parameter `s`
  (irreducible when `s` has eigenvalue ratio `≠ q^{±1}`), and
  `s = diag(q^{1/2}, q^{−1/2})`, `u ≠ 1` gives the Steinberg representation, with one exponent and
  `dim St^B = 1`.
- For `s = diag(q^{1/2}, q^{−1/2})` and `u = 1` in the `PGL_2` example, `φ` is trivial and
  `s₀ = s`, with eigenvalue moduli `q^{1/2}, q^{−1/2}`. The trivial representation is
  not tempered, although the polar compact factor of `s` is `1`. For regular `u` and the
  standard `φ`, the same `s` instead gives `s₀ = 1`, with moduli `1, 1`, and tempered Steinberg.
- A triple with `s = 1` and `u ≠ 1` does not satisfy `s u s^{−1} = u^q`, since `u ≠ u^q` for a
  non-trivial unipotent `u` and `q > 1`.
- The two lattices differ. For `G = PGL_2`, `X_*(T) = ℤϖ^∨` with `ϖ^∨(t) = diag(t, 1)` and
  `Q^∨ = ℤα^∨ = X_*(T_{SL_2})` with `α^∨ = 2ϖ^∨`: index `2`, `Ω ≅ ℤ/2` generated by the class of
  `(0, 1; ϖ_F, 0)`, of length `0`, whose `T_ω` lies outside the image of `H(SL_2, I_sc)`. Identifying the
  Iwahori–Hecke algebras of `SL_2` and `PGL_2` by Lie type would erase this index.
- Without real positivity the pullback can split. The unramified principal series of `PGL_2(F)`
  with `χ(diag(ϖ_F, 1)) = i` has `s = diag(i, −i)`, eigenvalue ratio `−1 ≠ q^{±1}`, so it is irreducible
  with `dim π^I = 2`; but `z s = −s = diag(−i, i)` is `W`-conjugate to `s`, and the pullback is the
  principal series of `SL_2(F)` induced from `t ↦ χ(diag(t², 1))`, the unramified quadratic character
  (value `i² = −1` at `ϖ_F`), which is the sum of two irreducibles with one-dimensional Iwahori
  invariants: `2 = 1 + 1`. Condition (d) excludes this `s`.
- For the Clozel–Thorne parameter with `n = 7` (`G^∨ = Spin_7(ℂ)`, `s = φ(diag(q^{1/2}, q^{−1/2}))`) the
  weights are the real positive exponents `|·|^{m_i}`, while `z s` acts on the spin representation with
  negative eigenvalues; the pullbacks keep `dim X^B = 1` and `dim Y^B = 7`.

*Needs:* SmoothRepresentationsOfLocalGroups SR.1.5, SR.3.3, SR.3.4; ReductiveGroupsPartII
§RG2.4.2; SpringerResolutionAndCharacteristicCycles §§6.2, 6.4 (gap:steinberg-equivariant-k-theory);
NilpotentOrbits N2; Tau Ceti `TauCeti.exists_isSl2Triple_of_isNilpotent_ad`,
`IsSl2Triple.exists_isSl2Triple_iff_sub_mem`.

### 4.10 The Kazhdan–Lusztig modules X, Y, Z with parameter `St_{n−4} ⊞ St_3 ⊞ St_1`

For `n = 2k + 1 ≥ 7` let `Π_E = St_{n−4,E} ⊞ St_{3,E} ⊞ St_{1,E}`, a tempered representation of
`GL_n(E)` whose conjugate orthogonal parameter `φ_E` extends uniquely to a parameter `φ` of `U_n`,
and `Π_φ` the fibre of the local Langlands correspondence of Mœglin and Mok over `φ`. Exponents `[m_1, …, m_k]` denote characters
`|·|^{m_1} ⊗ ⋯ ⊗ |·|^{m_k} ⊗ 1` of the torus `(E^×)^k × (E^×)^{N=1}`, and `j` the semisimplified
normalised Jacquet module for the upper-triangular Borel. Using §4.9 for `PSp_{2k}` (dual group
`Spin_{2k+1}(ℂ)`; `s = φ(diag(q^{1/2}, q^{−1/2}))` and `u = φ((1, 1; 0, 1))` for the homomorphism `φ`
attached to the orthogonal partition `(n − 4) + 3 + 1`, with component group `{±1}` for `n = 7` and
`{±1}²` for `n ≥ 9`), the pullback of §4.9 to `Sp_{2k}` (irreducible by §4.9(d) since `s` is real
positive, with the same Iwahori invariants and the exponents restricted to `X_*(T_{Sp_{2k}})`) and the
identification `H_B ≅ H_{B′}` of §4.8 for the chamber fixer `B`, construct irreducible tempered
representations `X`, `Y` (`n = 7`) and `X`, `Y`, `Z` (`n ≥ 9`) with non-zero `B`-fixed vectors,
with: for `n = 7`, `dim X^P = dim X^B = 1`, `dim Y^B = 7`, `jX = [1, 0, −1]`, `jY = [1, 0, −1] +
2[1, 0, 1] + 4[1, 1, 0]`; for `n = 9`, `dim X^B = 1`,
`dim Y^B = 11`, `dim Z^B = 2`, `jX = [2, 1, 0, −1]`,
`jY = [2,1,0,−1] + 2[2,1,0,1] + 4[2,1,1,0] + [1,0,2,1] + [1,2,0,1] + 2[1,2,1,0]`,
`jZ = [1,0,2,1] + [1,2,0,1]`; and for `k ≥ 4`, with `L_k` the multiset obtained by inserting `0` in
positions `2` through `k − 1` of `[1, k − 2, k − 3, …, 1]`: `jX_k = [k − 2, k − 3, …, 0, −1]`,
`jY_k = L_k + 2[1, k − 2, k − 3, …, 0] + prepend(k − 2, jY_{k−1})`,
`jZ_k = L_k + prepend(k − 2, jZ_{k−1})`, so `dim Y_k^B = dim Y_{k−1}^B + k` and
`dim Z_k^B = dim Z_{k−1}^B + k − 2`. Prove that `Π_φ` has exactly these members for `n = 7` and one
further, non-Iwahori-spherical member `W` for `n ≥ 9` (ct17 §2.2, Theorem 2.3, pp. 8–9; Theorem 2.5
and proof, pp. 10–11; §3.5, pp. 25–26). Every member of `Π_φ` has central character
trivial at `ζ = −1_n`: the central character of a member is `z/c(z) ↦ ω_{Π_E}(z)` on `E^1`, and
`ζ = ϖ_E/c(ϖ_E)` with `ω_{Π_E} = 1`; so by §4.8(ii) its `B`-fixed and Iwahori-fixed vectors agree,
and "Iwahori-spherical" for members of `Π_φ` means `π^B ≠ 0`. Here `P ⊃ B` is the pointwise fixer of
the facet `0 = a_k < a_{k−1} < ⋯ < a_1 < 1/4` of the closure of the chamber of §4.8, a panel
(codimension one) fixed by the simple reflection `s_k`, so `P = B ∪ Bs_kB` and `[P : B] = q + 1`;
it is the preimage in `K` of the block upper-triangular subgroup of `O(J)(k_F)` with diagonal blocks
of sizes `1, …, 1, 3, 1, …, 1` (ct17 §2.1, p. 6). For `k ≥ 2` it is not a maximal compact
subgroup: the maximal compact subgroups containing `B` are the fixers of the vertices of the
chamber.

*Proof sketch.* By §4.9 the irreducible Iwahori-spherical tempered modules of `PSp_{2k}` with this
`(s, u)` correspond to the `ρ` occurring in `H_*(ℬ_u^s)`; dimensions and exponents are read off from an
explicit decomposition of `ℬ_u^s`, not from a general paving theorem. Realise `ℬ_u^s` as the variety
of isotropic flags `F_1 ⊂ ⋯ ⊂ F_k` in `ℂ^n = V(n − 4) ⊕ V(3) ⊕ V(1)` (`V(i)` the `i`-dimensional
irreducible orthogonal representation of `SL_2(ℂ)`) stable under `s` and `N = log u`: `s` acts on the
weight-`j` vectors by `q^j`, `N` raises weights by `1`, the weight-`j` and weight-`(−j)` spaces are in
duality, and the weights `(m_1, …, m_k)` of the quotients `F_i/F_{i−1}` are the exponent of the
component containing the flag (ct17 proof of Theorem 2.5, pp. 10–12). Write `a_j`, `b_j` for the
weight-`j` vectors of the two summands of dimension `n − 4` and `3`, and `c` for `V(1)`. For `n = 7`
the isotropic eigenvectors in `ker N` span `E_1 = ⟨a_1, b_1⟩`, so `F_1 ⊂ E_1`; the flags with
`F_2 = E_1` and `F_3 = E_1 ⊕ ℂy`, `y` on the conic of isotropic lines in `E_0 = ⟨a_0, b_0, c⟩`, form
`X_3 ≅ ℙ¹ × ℙ¹` (`[1, 1, 0]`); those with `F_2 = ⟨Nx, x⟩`, `x` on that conic, and `F_3 = E_1 ⊕ ℂx` form
`X_2 ≅ ℙ¹` (`[1, 0, 1]`); those with `F_2 = ⟨Nx, x⟩` and `F_3 = F_2 ⊕ ℂy`, `y` of weight `−1` with
`Ny ∈ ℂx`, exist only for the two isotropic `x ∈ ⟨a_0, b_0⟩` and form `X_1`, two points exchanged by
the component group (`[1, 0, −1]`). Total homology dimension `2 + 2 + 4 = 8 = 1 + 7`. For `n ≥ 9` the
isotropic eigenvectors in `ker N` are `a_{k−2}` and `b_1` up to scalars. Flags with `F_1 = ℂa_{k−2}`
are flags in `a_{k−2}^⊥/ℂa_{k−2} ≅ V(n − 6) ⊕ V(3) ⊕ V(1)`: a copy of the variety for `n − 2`, with
`k − 2` prepended to each exponent. Flags with `F_1 = ℂb_1` are flags in
`b_1^⊥/ℂb_1 ≅ V(n − 4) ⊕ V(1) ⊕ V(1)`: each further step takes either the next top vector
`a_{k−2}, a_{k−3}, …` or one of the two isotropic lines of the plane `⟨b_0, c⟩`, after which the flag is
unique (a regular nilpotent remains), and the last step takes an isotropic line in `⟨a_0, b_0, c⟩`, a
conic. This gives `k − 2` pairs of points, the `i`-th with exponent `[1, k − 2, …, 1]` with `0`
inserted in position `i + 1`, and one `ℙ¹` with exponent `[1, k − 2, …, 1, 0]` (ct17 pp. 11–12).
Hence `dim H_*(ℬ_u^s) = 2(k − 2) + 2 + dim H_*(ℬ_u^s for n − 2)`.
Membership in `Π_φ`: the stable base change of each module is semistable with `θ`-stable exponent,
forcing the parameter `⊕ sp(n_i) ⊗ χ_i` to have trivial `χ_i` and `{n_i} = {n − 4, 3, 1}` (ct17 §3.5).

**API.**

- The member `X` of `Π_φ` with `dim X^P = dim X^B = 1`.
- The member `Y` with `dim Y^B = 7` (`n = 7`), `11` (`n = 9`), and `dim Y_k^B = dim Y_{k−1}^B + k`.
- The member `Z` for `n ≥ 9`, with `dim Z^B = 2` (`n = 9`) and `dim Z_k^B = dim Z_{k−1}^B + k − 2`.
- The semisimplified normalised Jacquet modules of `X`, `Y`, `Z` as the exponent multisets above.
- `X`, `Y` (and `Z`) are the Iwahori-spherical members of `Π_φ`; for `n ≥ 9`
  the fourth member `W` has `W^B = 0` and is not semistable.

**Checks.**

- `n = 7`: `dim X^B + dim Y^B = 1 + 7 = 8 = dim H_*(ℬ_u^s)`, and the exponent multiset of `Y` has
  `1 + 2 + 4 = 7` terms.
- `n = 9`: `1 + 11 + 2 = 14`, equal to the homology of the explicit components
  `2 + 2 + 2` (three pairs of points) `+ 2 + 2 + 4` (two `ℙ¹` and one `ℙ¹ × ℙ¹`); the recursion gives
  `dim Y_5^B = 11 + 5 = 16` and `dim Z_5^B = 2 + 3 = 5` for `n = 11`, and
  `1 + 16 + 5 = 22 = 2·3 + 2 + 14`, the homology count for `k = 5`.
- Smooth and projective alone does not give these counts: a smooth projective elliptic curve has
  `dim H_1 = 2`, whereas a variety paved by affine spaces has no odd homology. The counts use the
  explicit components (points, `ℙ¹`, `ℙ¹ × ℙ¹`), whose homology is even.
- The recursion at `k = 4` reproduces the `n = 9` lists: `L_4 = [1,0,2,1] + [1,2,0,1]`, and
  `prepend(2, jY_3) = [2,1,0,−1] + 2[2,1,0,1] + 4[2,1,1,0]`.
- `Y` is the generic member of `Π_φ`; `X` is not generic although `dim X^B = 1`.
- `P` is a panel fixer, not a vertex fixer. For `n = 7` (`k = 3`) its facet has dimension `2` in the
  `3`-dimensional apartment, and for `q = 3`, `[P : B] = q + 1 = 4`, while the fixer `K` of the
  special vertex has `[K : B] = (1 + q)(1 + q + q² + q³)(1 + q + ⋯ + q⁵) = 4 · 40 · 364 = 58240`.
- For `n = 7` the base change `Π_E = St_3 ⊞ St_3 ⊞ St_1` has trivial central character, so every
  member of `Π_φ` has `ζ = −1_7` acting by `ω_{Π_E}(ϖ_E) = 1`; a representation on which `ζ` acts by
  `−1` (as on the character `χ` of §4.8) has no `B`-fixed vector and does not enter the count.

*Needs:* §4.8; §4.9; SmoothRepresentationsOfLocalGroups SR.2.2; ModularityAndLanglandsExtensions
§3.12.

### 4.11 Integral structures, localisations and duality for the Kazhdan–Lusztig modules

Let `l = n − 2` be prime (`n ∈ {7, 9}`), `K/ℚ_l` finite containing `√q` over which `X`, `Y` (and `Z`)
are defined, with integers `𝒪` and residue field `k`. Prove: (Proposition 2.6) if `q` is a primitive
root modulo `l`, there are `H_{B,𝒪}`-lattices `X^B_𝒪`, `Y^B_𝒪` (and `Z^B_𝒪`) whose reductions have
pairwise no common Jordan–Hölder factor, with `Y^B_𝒪 ⊗ k` absolutely irreducible; (Corollary 2.8) if
`q` is a primitive root modulo `l`, a finite flat `H_{B,𝒪}`-module `M` with
`M ⊗ K ≅ (X^B)^a ⊕ (Y^B)^b (⊕ (Z^B)^c)` is the direct sum of its intersections with the isotypic
parts. Let `ȷ` be the anti-involution `[BgB] ↦ [Bg^{−1}B]`, `𝒪[Λ]` the Bernstein subalgebra, and
`M(χ̄)`, `M(χ̄ȷ)` localisations at residual characters. (Proposition 2.9) If `q ≡ −1` modulo `l` and
`χ̄` is the reduction of the character of `𝒪[Λ]` on `X^B`: `X^B_K = X^B_K(χ̄) = X^B_K(χ̄ȷ)`,
`dim Y^P_K ∩ Y^B_K(χ̄) = dim Y^P_K ∩ Y^B_K(χ̄ȷ) = 1`, and `Z^B_K(χ̄) = 0` for `n = 9`. (Duality)
Self-duality of `Y_K` gives a perfect `K`-valued pairing on `Y^B_K` with `⟨tx, y⟩ = ⟨x, ȷ(t)y⟩`,
under which `Y^B_K(χ̄ȷ)` annihilates the other localisations and `(1 − e_P)Y^B_K` annihilates
`Y^P_K`; no integral perfect pairing is claimed (ct17 Proposition 2.6, p. 12; Remark 2.7 and
Corollary 2.8, p. 17; §2.3 and Proposition 2.9, pp. 17–18). The two congruence conditions concern
different places (`v_i` and `v_0` in §5.7), and `e_P = [P]/(q + 1)` exists over `K` but is not
integral when `q ≡ −1` modulo `l`. In the printed rank-nine matrix of `T_{s_2}` (ct17 Proposition
2.6(2), pp. 14–16) the `(10, 10)` entry must be `−1/(1 + q)`, with the matching sign in the
corresponding relation.

*Proof sketch.* Proposition 2.6: write `Y^B` by explicit matrices for the `T_{s_i}` and the
Bernstein generators, reduce, and check irreducibility and disjointness; with the corrected entry
the relevant `2 × 2` block has trace `q − 1` and determinant `−q`, hence satisfies the quadratic
relation of §4.8, and the remaining presentation relations are checked on the matrices.
Corollary 2.8: Brauer–Nesbitt for the multiplicative monoid of `H_{B,𝒪}`
(ArithmeticGaloisRepresentations §1.8) and disjointness of the reductions. Proposition 2.9: compute
the Bernstein-character exponents modulo `l` with `q ≡ −1`; duality from the self-duality of `Y_K`
(ct17 Theorem 3.3).

**Checks.**

- For `n = 7`, `Y^B` has rank `7` and its reduction is absolutely irreducible of dimension `7`.
- With `q ≡ −1` modulo `l` the `X`-isotypic part lies in both localisations, while `Y` has
  one-dimensional `P`-fixed parts in each; this asymmetry drives the count of §5.10.
- The printed block, with `(10, 10)` entry of the wrong sign, has determinant `≠ −q` and fails the
  quadratic relation, so it does not define an `H_B`-module.

*Needs:* §4.10; §4.8; SmoothRepresentationsOfLocalGroups SR.1.5; ArithmeticGaloisRepresentations §1.8.

### 4.12 Identification of the members of `Π_φ` and their endoscopic signs

Suppose `E/F` ramified of odd residue characteristic and `n = m + 4` with `m ≥ 3` odd. Prove that
the members `X`, `Y` (`m = 3`) or `X`, `Y`, `Z` (`m ≥ 5`) of `Π_φ` are semistable with the Jacquet
exponents of §4.10, that `W` is not semistable, and: for `m ≥ 5`, with the characters `ε_1`, `ε_2` of
the component group `S_φ` and `ε = ε_1 ε_2`, `ε(Y) = ε(Z) = 1`, `ε(X) = ε(W) = −1`,
`ε_1(X) = ε_1(Y) = 1`, `ε_1(Z) = ε_1(W) = −1`; for `m = 3` the component group has one non-trivial
character `ε`, with `ε(Y) = 1` and `ε(X) = −1` (ct17 Theorem 3.3 and sign table, p. 21; §3.4,
Lemma 3.6, pp. 23–24; §3.5, (3.7)–(3.8), pp. 24–27; Proposition 3.7, p. 27). Transfer factors on the
maximally split torus are normalised as in ct17 Lemma 3.6:
`Δ(t_H, t) = μ(z_1)μ(z_2)Δ_IV(t_H, t)` for `t_H = (t_0, z_1, z_2) ∈ U(m) × U(4)`. The printed theorem
gives `X` the exponent `[1, 0, 1]` for `m = 3`, inconsistent with the module computation, which
gives `[1, 0, −1]`; and it interchanges a component-character subscript in the sign comparison,
where `ε_1` is meant.

*Proof sketch.* Compute transfer factors on the maximally split torus (`Δ_I = Δ_{III,1} = 1`,
`Δ_II = 1` for trivial `χ`-data, `Δ_IV` the discriminant ratio; EndoscopicTransferAndUnitaryTraceComparison
§2.8). Express traces through Jacquet modules on the regular part of the split torus and compare the
stable identity with the endoscopic identity `Σ ε(π)⟨tr π, f⟩ = ⟨tr π_H, f^H⟩` for
`H = U(m) × U(4)`: the right side is `2 Σ_w w([k − 2, …, 1, 1, 0])` over shuffles, which equals
`jY − jX + jZ` for `m = 5`; the members of `U(4)` with parameter `St_3 ⊞ St_1` have total Jacquet module
`2μ^{−1}(z_1 z_2) ⊗ [1, 0]` (EndoscopicTransferAndUnitaryTraceComparison §6.4). The `ε_1` computation
uses Mœglin's hereditary Jacquet formula. The printed identification of `Z` asserts that a certain
induced representation has a unique irreducible submodule (ct17, after (3.9), p. 26); this fails as
written, since `Y` embeds with the same exponent, and the identification instead counts the full
socle of that induction and isolates its other constituent before assigning the sign
(EndoscopicTransferAndUnitaryTraceComparison §11.2, supplier contracts).

**Checks.**

- For `m = 5` (`n = 9`, `k = 4`): `jY − jX + jZ = 4[2,1,1,0] + 2[2,1,0,1] + 2[1,2,1,0] + 2[1,2,0,1]
  + 2[1,0,2,1]`, which is twice the sum over the six shuffles of `(2, 1)` with `(1, 0)`:
  `[2,1,1,0]` twice, `[2,1,0,1]`, `[1,2,1,0]`, `[1,2,0,1]`, `[1,0,2,1]`.
- The counts agree: `11 − 1 + 2 = 12 = 2 · 6`.
- For `m = 3` the signs give `jY − jX = 2[1, 0, 1] + 4[1, 1, 0]`, and the endoscopic side is twice
  the sum over the three shuffles of `(1)` with `(1, 0)`, namely `2([1,1,0] + [1,1,0] + [1,0,1])`:
  the two agree. With the printed exponent `[1, 0, 1]` for `X` one would get
  `[1, 0, −1] + [1, 0, 1] + 4[1, 1, 0]`, which does not.

*Needs:* §4.10; ModularityAndLanglandsExtensions §3.12; EndoscopicTransferAndUnitaryTraceComparison
§§2.8, 6.4, 11.2 (gap:explicit-tempered-unitary-packets); SmoothRepresentationsOfLocalGroups SR.2.2.

### Examples

- `q = 3`, `p = 7`: `3` has order `6` modulo `7`, `|C(𝔽_3)| = 28`, `dim τ(v) = 6`, `dim λ(v, θ) = 32`.
- `n = 7`, `l = 5`: `q` a primitive root modulo `5` (e.g. `q = 3` with `E/F` ramified) gives the
  lattices of §4.11 at the places `v_i`, and `q ≡ −1` modulo `5` (e.g. `q = 9`) gives the
  localisation statement at `v_0`.

### Dependencies

ModularityAndLanglandsExtensions §§3.12, 3.15; PotentialAutomorphyInfrastructurePartII Layer 3;
EndoscopicTransferAndUnitaryTraceComparison §§2.8, 2.10, 2.11, 2.14, 4.9–4.10, 6.4, 6.10, 11.2,
13.5; SmoothRepresentationsOfLocalGroups SR.1–SR.4; ReductiveGroupsPartII §§RG2.1.3, RG2.3.3,
RG2.4.1–RG2.4.2; SpringerResolutionAndCharacteristicCycles §§6.2, 6.4
(gap:steinberg-equivariant-k-theory); NilpotentOrbits N2; LocalGaloisDeformationRings §§1.1, 1.4,
2.18, 2.24; ArithmeticGaloisRepresentations §1.8; RepresentationTheory/CharacterTheory Layers 3, 9;
Tau Ceti `TauCeti.exists_isSl2Triple_of_isNilpotent_ad`, `IsSl2Triple.exists_isSl2Triple_iff_sub_mem`.

## Layer 5: level raising to prescribed types on definite unitary groups

This layer raises the level of an isobaric sum `π_2 ⊞ π_{n−2}` to a cuspidal representation with
prescribed depth-zero types at inert places, by the stabilised trace formula and the congruence of
types of §4.5 (nt21 Theorem 4.1, pp. 59–65), and raises the level at a ramified place by counting
automorphic representations of a definite unitary group with given stable base change and an
isotropy argument in the Iwahori–Hecke modules of §§4.10–4.12 (ct17 Theorem 4.2, pp. 21–37).
Sections 5.1–5.4 prove the odd-rank level-raising statement of ModularityAndLanglandsExtensions
§4.4; §§5.5–5.10 prove level raising for `l = 5` and `l = 7` at ramified places.

### 5.1 The level-raising datum: places, types and levels

Fix `n = 2k + 1 ≥ 3`, the standard assumptions of §4.1, `ι : ℚ̄_p ≅ ℂ`, and cuspidal conjugate
self-dual `π_2` on `GL_2(𝔸_F)` and `π_{n−2}` on `GL_{n−2}(𝔸_F)`. Define a level-raising datum as
these together with: (1) `π = π_2 ⊞ π_{n−2}` regular algebraic, with `ρ̄ = r̄_{π,ι} = ρ̄_2 ⊕ ρ̄_{n−2}`,
`ρ̄_2 = r̄_{π_2|·|^{(2−n)/2},ι}`, `ρ̄_{n−2} = r̄_{π_{n−2}|·|^{−1},ι}`; (2) `π` ι-ordinary; (3) pairwise
disjoint non-empty sets `T_1`, `T_2`, `T_3` of places of `F⁺` outside `S` of odd residue
cardinality, with `π` unramified outside `S ∪ T`, such that: at `v ∈ T_1`, `v` is inert, `q_v` has
order `6` modulo `p`, `char k(v) > n`, `π_{2,ṽ} ≅ St_2(χ_ṽ)` and
`π_{n−2,ṽ} ≅ ⊞_{i=0}^{2k−2} χ_{ṽ,i}` with `χ_ṽ`, `χ_{ṽ,0}` unramified and `χ_{ṽ,i}|_{𝒪^×} = ω(ṽ)`
for `i ≥ 1`; at `v ∈ T_2`, `v` splits, `q_v ≡ −1` modulo `p`, `π_{2,ṽ} ⊇ λ̃(ṽ, Θ_ṽ)` and
`π_{n−2,ṽ} ⊇ ω(ṽ) ∘ det`; at `v ∈ T_3`, `v` splits, `q_v` has order `n − 2` modulo `p`,
`π_{n−2,ṽ} ⊇ λ̃(ṽ, Θ_ṽ)` and `π_{2,ṽ} ⊇ ω(ṽ) ∘ det`; and characters `θ_v` of `C(k(v))` of order `p`
for `v ∈ T_1`. Define the level `U = ∏ U_v` with `U_v = ι_v^{−1} 𝔭_v` (`v ∈ T_1`),
`ι_ṽ^{−1} 𝔮_ṽ` (`v ∈ T_2 ∪ T_3`), the ordinary Iwahori level at `S_p` and hyperspecial elsewhere
outside `S`, the `p`-adic level being small enough that finite double-coset stabilisers have order
prime to `p`; and the global types `τ_g = ⊗_{T_1} τ(v, n) ⊗ ⊗_{T_2 ∪ T_3} λ̃(ṽ, Θ_ṽ, n)` and
`λ_g = ⊗_{T_1} λ(v, θ_v, n) ⊗ ⊗_{T_2 ∪ T_3} λ̃(ṽ, Θ_ṽ, n)` with `𝒪`-lattices (nt21 §4, data before
Theorem 4.1, pp. 59–60; the level and types, p. 62). Here, for a place `ṽ` of odd residue
characteristic, an integer `1 ≤ n_1 ≤ n` with `q_ṽ` of order `n_1` modulo `p`, `n_2 = n − n_1`, the
degree-`n_1` extension `k_{n_1}/k(ṽ)` and a character `Θ_ṽ` of `k_{n_1}^×` of order `p`:
`λ̃(ṽ, Θ_ṽ) = (−1)^{n_1−1} R^{GL_{n_1}}_{Res_{k_{n_1}/k(ṽ)} 𝔾_m} Θ_ṽ` is the Deligne–Lusztig
cuspidal representation of `GL_{n_1}(k(ṽ))` (irreducible because `Θ_ṽ` differs from its
`Gal(k_{n_1}/k(ṽ))`-conjugates; for `n_1 = 3` it is the `λ̃(ṽ, θ̃)` of §4.4, for `n_1 = 1` the
character `Θ_ṽ` itself); `𝔮_ṽ ⊂ GL_n(𝒪_{F_ṽ})` is the standard parahoric subgroup of block type
`(n_1, n_2)`, the preimage under reduction modulo `ϖ_ṽ` of the standard parabolic `P_{(n_1, n_2)}(k(ṽ))`;
`λ̃(ṽ, Θ_ṽ, n)` is the representation of `𝔮_ṽ` inflated from `λ̃(ṽ, Θ_ṽ) ⊗ (ω(ṽ) ∘ det)` on its Levi
quotient `GL_{n_1}(k(ṽ)) × GL_{n_2}(k(ṽ))`, which is not a type unless `n_2 ≤ 1`; and `𝔯_ṽ ⊂ 𝔮_ṽ` is the
standard parahoric subgroup of block type `(n_1, 1, …, 1)` (nt21 §1.17, p. 19). At `T_2`, `n_1 = 2`;
at `T_3`, `n_1 = n − 2`. `π` is tempered at every place, since `π_2` and `π_{n−2}` are.

**API.**

- The level-raising datum `(π_2, π_{n−2}, T_1, T_2, T_3, (θ_v), (Θ_ṽ))` with conditions (1)–(3).
- The parahoric subgroups `𝔯_ṽ ⊂ 𝔮_ṽ ⊂ GL_n(𝒪_{F_ṽ})` of block types `(n_1, 1, …, 1)` and
  `(n_1, n_2)`, and the representation `λ̃(ṽ, Θ_ṽ, n)` of `𝔮_ṽ` inflated from its Levi quotient.
- The level `U`, with `𝔭_v` at `T_1` and `𝔮_ṽ` at `T_2 ∪ T_3`.
- The global types `τ_g` and `λ_g` with their `𝒪`-lattices.
- The residual decomposition `ρ̄ = ρ̄_2 ⊕ ρ̄_{n−2}` with the stated twists.

**Checks.**

- For `n = 3`, `π_{n−2} = π_1` is a Hecke character, `λ̃(ṽ, Θ_ṽ)` at `T_3` is an order-`p` character
  of `k(ṽ)^×`, and `q_v ≡ 1` modulo `p` there (order `n − 2 = 1`).
- For `n = 5`, `ρ̄_2 = r̄_{π_2|·|^{−3/2}}` and `ρ̄_3 = r̄_{π_3|·|^{−1}}`; the twists make
  `ρ̄ = r̄_{π,ι}` for the isobaric sum.
- `q_v ≡ 1` modulo `p` is not allowed at `T_2`: an order-`p` character `Θ` of `k_2^×` is regular
  only if `Θ^{q_v} ≠ Θ`, and `Θ^{q_v} = Θ^{−1} ≠ Θ` when `q_v ≡ −1` and `p` is odd.
- With `q = q_ṽ = |k(ṽ)|`: for `n = 3` and `n_1 = 2`,
  `[GL_3(𝒪) : 𝔮_ṽ] = [GL_3(k(ṽ)) : P_{(2,1)}(k(ṽ))] = q² + q + 1`, the number of points of `ℙ²(k(ṽ))`
  (`13` for `q = 3`), so `𝔮_ṽ ≠ GL_3(𝒪)`; for `n_1 = n`, `𝔮_ṽ = 𝔯_ṽ = GL_n(𝒪)`.
- `[𝔮_ṽ : 𝔯_ṽ]` is the number of complete flags in `k(ṽ)^{n_2}`: for `n = 5`, `n_1 = 3`, `n_2 = 2` it is
  `q + 1`, and for `n_2 = 1` the two parahorics coincide.
- `dim λ̃(ṽ, Θ_ṽ, n) = dim λ̃(ṽ, Θ_ṽ) = ∏_{i=1}^{n_1−1}(q^i − 1)` (the degree of a Deligne–Lusztig
  cuspidal of `GL_{n_1}(𝔽_q)`): `q − 1` for `n_1 = 2`, `(q − 1)(q² − 1)` for `n_1 = 3`, `1` for `n_1 = 1`.
  For `n_2 ≥ 2`, `ω(ṽ) ∘ det` is not cuspidal on `GL_{n_2}(k(ṽ))`, which is why the pair
  `(𝔮_ṽ, λ̃(ṽ, Θ_ṽ, n))` is not a type; and a representation of the Levi quotient
  `GL_{n_1}(k(ṽ)) × GL_{n_2}(k(ṽ))` inflates to `𝔮_ṽ`, not to `GL_n(𝒪)`.

*Needs:* §§4.1, 4.5; PotentialAutomorphyInfrastructurePartII Layer 0 ("Automorphic polarized
representations and their levels"), Layer 3 ("Iwahori levels at `l`, the `U`-operators and ordinary
parts"); ModularityAndLanglandsExtensions §4.4.

### 5.2 Local components at inert places and box sums with the same residual representation

In the setting of §5.1 prove: (Lemma 4.3) if `v` is inert in `F` then
`π_ṽ ∈ A^θ_t(GL_n(F_ṽ))⁺`; consequently, for `v ∈ T_1`, `χ_ṽ` is the non-trivial unramified quadratic
character and `χ_{ṽ,0}` is trivial; (Lemma 4.5) if `π′ = π′_1 ⊞ ⋯ ⊞ π′_r` is regular algebraic with
`π′_i` cuspidal conjugate self-dual, `r̄_{π′,ι} ≅ r̄_{π,ι}` and `π′_ṽ|_{𝔮_ṽ} ⊇ λ̃(ṽ, Θ_ṽ, n)` for
`v ∈ T_2 ∪ T_3`, then either `π′` is cuspidal, or `r = 2` and after reordering `π′` has blocks of sizes
`n − 2` and `2` with the `T_2`, `T_3` types distributed as for `π` and the residual blocks
`ρ̄_{n−2}`, `ρ̄_2` (nt21 Lemma 4.3 and Remark 4.4, p. 61; Lemma 4.5 and proof, pp. 61–62).

*Proof sketch.* Lemma 4.3: the polarization sign of the Galois representation of a conjugate
self-dual cuspidal representation (AutomorphicGaloisRepresentationsPartII AG2.3, Bellaïche–Chenevier)
makes the local parameter at an inert place extend to `^L U_n`; with §4.3 and the sign condition
for `St_2(χ) ⊞ 1` this gives the conclusion. Lemma 4.5: at `T_3` the regular induced local type
forces an entire `(n − 2)`-dimensional local block into one isobaric constituent; comparing
semisimplified residual inertia (the two residual blocks have the quadratic and the trivial inertial
characters there) puts the residual `(n − 2)`-block into that constituent, whether or not it is
globally irreducible. At `T_2` the same comparison forces the residual `2`-block into a constituent
of rank at least two. Only one cuspidal constituent, or ranks `(n − 2, 2)`, remain.

**Checks.**

- A box sum with three blocks cannot carry both the `T_2` and `T_3` types and the residual
  representation `ρ̄_2 ⊕ ρ̄_{n−2}`.
- `π` itself is of shape `(n − 2, 2)`, so the second alternative occurs.
- At `v ∈ T_1` the trivial `χ_ṽ` would give `St_2 ⊞ 1`, whose parameter `sp(2) ⊕ 1` has the
  conjugate self-dual summand `1` of sign `+1 = (−1)^{n−1}` but `sp(2)` of the wrong sign with odd
  multiplicity; twisting by the unramified quadratic character corrects the sign.

*Needs:* §5.1; §4.3; AutomorphicGaloisRepresentationsPartII AG2.3; PotentialAutomorphyInfrastructurePartII
Layer 3 ("Galois representations attached to constituents of algebraic modular forms").

### 5.3 A form of the definite group with prescribed types, via the trace formula

In the setting of §5.1, prove that for every `(S ∪ T)`-split totally real quadratic `L⁺/F⁺`
(`L = L⁺F`) either there is an automorphic `σ` of `G(𝔸_{F⁺})` with base change `π`,
`σ_v^{U_v} ≠ 0` for `v ∉ T` and `σ_T|_{U_T} ⊇ τ_g`, or there is such a `σ` of `G(𝔸_{L⁺})` with base
change `π_L`, `σ_v^{U_{L,v}} ≠ 0` for `v ∉ T_L` and `σ_{T_L}|_{U_{L,T_L}} ⊇ τ_{g,L}` (nt21
Proposition 4.6 and proof, pp. 62–64).

*Proof sketch.* The stabilised trace formula for `G` gives
`Σ m(σ_i) σ_i(f) = ½(π̃(f̃) + (π_{n−2} ⊗ (π_2 ⊗ μ^{−1} ∘ det))~(f̃^{U_{n−2} × U_2}))` for test
functions matching `π` (EndoscopicTransferAndUnitaryTraceComparison §6.29 and the classification of
ModularityAndLanglandsExtensions §3.16). With `f` built from `τ_g` at `T`, from the normalised
archimedean coefficients of §4.2 (trace `1`) at the infinite places, and with the identities of §4.2
elsewhere, the multiplicity is `m(σ) = ½(∏ϵ ∏c_{τ_v} + ∏ϵ ∏d_{v,1})`, using §§4.3, 4.6. If it
vanishes over `F⁺`, quadratic base change to `L⁺` squares the local constants and gives
`m(σ) = ∏c_{τ_v}² ≠ 0`.

**Checks.**

- The multiplicity over `F⁺` is a half-sum of two signed products and can vanish; then
  `∏c_{τ_v}² = ∏d_{v,1}²` and over `L⁺` the multiplicity is `∏c_{τ_v}² ≠ 0`.
- If both products have the same sign the first alternative holds with multiplicity
  `|∏c_{τ_v}|`.
- `L⁺` must split at `S ∪ T`: otherwise the local types at `T` change under base change and
  `τ_{g,L}` is not defined.

*Needs:* §5.1; §§4.2, 4.3, 4.6; EndoscopicTransferAndUnitaryTraceComparison §6.29;
ModularityAndLanglandsExtensions §3.16.

### 5.4 Level raising to a type on a definite unitary group (Newton–Thorne I Theorem 4.1)

In the setting of §5.1, prove that for every `(S ∪ T)`-split totally real quadratic `L⁺/F⁺` with
`L = L⁺F` there is a RACSDC automorphic representation `Π` of `GL_n(𝔸_L)` with (1) `Π` ι-ordinary,
of the weight of `π`, and unramified outside `S ∪ T`; (2) `r̄_{Π,ι} ≅ r̄_{π,ι}|_{G_L}`; (3) for
`v ∈ T_{1,L}`, `Π_ṽ` restricted to `𝔯_ṽ` contains `λ̃(ṽ, θ̃_{v|_{F⁺}}, n)|_{𝔯_ṽ}`; (4) for
`v ∈ T_{2,L} ∪ T_{3,L}`, `Π_ṽ|_{𝔮_ṽ}` contains `λ̃(ṽ, Θ_ṽ|_F, n)`, with `n_1 = 2` on `T_{2,L}` and
`n_1 = n − 2` on `T_{3,L}` (nt21 Theorem 4.1, p. 60; Remark 4.2, p. 60; proof, pp. 64–65). This
proves the odd-rank level-raising statement of ModularityAndLanglandsExtensions §4.4. The printed
item (4) attaches the block sizes to the wrong sets (it prints `n_2`), and the printed statement does
not record that `Π` has the weight of `π`, which the construction gives and the applications use.

*Proof sketch.* §5.3 gives `σ` containing `τ_g`. The congruence of types (§4.5) and exactness of the
ordinary forms functor at `l`-torsion-free level (PotentialAutomorphyInfrastructurePartII Layer 3)
give `Σ` with the same Hecke eigensystem modulo `p` containing `λ_g`, of the same weight. Its base
change is cuspidal: §5.2 allows only shape `(n − 2, 2)`, which §4.6 excludes at `T_1`; `T_2 ∪ T_3`
force cuspidality (Remark 4.2). Ordinarity comes from the ordinary level at `S_p`, and local–global
compatibility gives (3)–(4).

**Checks.**

- For `n = 3` the theorem produces a cuspidal RACSDC representation of `GL_3` congruent to a
  `GL_2 × GL_1` isobaric sum.
- With `T_1 = ∅` the shape `(n − 2, 2)` could not be excluded, which is why `T_1` is non-empty.
- The residual representation of `Π` is that of `π`; the characteristic-zero representation is
  not, since `Π` is cuspidal and `π` is not.

*Needs:* §§5.2, 5.3; §§4.5, 4.6; PotentialAutomorphyInfrastructurePartII Layer 3 ("Exactness and
group-ring freeness at level without `l`-torsion"; "Iwahori levels at `l`, the `U`-operators and
ordinary parts"; "Base change and descent between definite unitary groups and `GL_n`").

### 5.5 A conjugate-symplectic Hecke character with prescribed archimedean components

For a CM extension `E/F` of a totally real field, prove that there is a continuous character
`μ : E^× \ 𝔸_E^× → ℂ^×` with `μ|_{𝔸_F^×} = ε_{E/F}` (the quadratic character) and `μ(z) = z/|z|`
for `z ∈ E_w ≅ ℂ` at every archimedean place `w` (ct17 Lemma 3.4, p. 21). The archimedean
component is `(z/z̄)^{1/2}` with the branch `z/|z|`.

*Proof sketch.* On `E^× 𝔸_F^× E_∞^×` prescribe the quadratic character on `𝔸_F^×` and `z/|z|` at each
complex place; the prescriptions agree on intersections, and the CM unit computation gives a
compact open finite-idelic subgroup on which the prescription is trivial. The resulting character
of a subgroup of the discrete quotient extends to the whole quotient because `ℂ^×` is divisible
(ct17 proof of Lemma 3.4, pp. 21–22; ClassFieldTheory Layer 11).

**Checks.**

- For `F = ℚ` and `E` imaginary quadratic, `μ` has infinity type `(1/2, −1/2)` and restricts to the
  quadratic character of `E/ℚ`.
- Compatibility at a real place: for `x ∈ ℝ^× ⊂ ℂ^×`, `x/|x| = sign(x) = ε_{E/F,∞}(x)`; the formal
  expression `(x/x̄)^{1/2} = 1` with the principal branch would contradict the restriction condition.
- `μ^2` restricted to `𝔸_F^×` is trivial, and `μ μ^c = 1` on `𝔸_E^×` follows from the statement:
  `μ(x) μ(c x) = μ(N_{E/F} x) = ε_{E/F}(N_{E/F} x) = 1`, since `ε_{E/F}` is trivial on norms; at a
  complex place `(z/|z|)(z̄/|z|) = 1`. A character with `μ|_{𝔸_F^×} = 1` instead (conjugate-orthogonal)
  also satisfies `μ μ^c = 1`, so that identity does not distinguish the two signs; the restriction to
  `𝔸_F^×` does.

*Needs:* ClassFieldTheory Layer 11; PotentialAutomorphyInfrastructurePartII Layer 0 ("Algebraic
characters with prescribed conjugate norm and local behaviour").

### 5.6 Counting automorphic representations of the definite unitary group with given base change

Let `G` be the unitary group in `n = l + 2` variables over `F`, split by the CM field `E`, compact at
infinity and quasi-split at finite places, `[F : ℚ]` even, `l ≥ 5` prime. Let `v_0, …, v_s` be finite
places of `F` ramified in `E` of odd residue characteristic, and assume that `E/F` is unramified at
every finite place of `F` outside `{v_0, …, v_s}` and that every other place of `E` at which the
representations below ramify lies over a place of `F` split in `E`. Prove (ct17 Theorem 3.8,
pp. 28–29; Remark 3.9 and the remark after the proof, pp. 29–31; Theorem 3.10, pp. 31–32): (1) for
`σ_1`, `σ_2` conjugate self-dual cuspidal on `GL_4(𝔸_E)`,
`GL_m(𝔸_E)` (`m = l − 2`) with `σ_1 ⊞ σ_2` regular algebraic of infinity type
`((l + 1)/2, …, (−1 − l)/2)`, `∏_{v|∞} det(w_v) = 1`, `σ_{1,w_i} ≅ St_3 ⊞ St_1` and
`σ_{2,w_i} ≅ St_m`, there are exactly `4^{s+1}/2` (for `l > 5`) and `2^s` (for `l = 5`) automorphic
representations of `G(𝔸_F)` with stable base change `σ_1 ⊞ σ_2`, each of multiplicity one, in
bijection with the tuples `(σ_{v_i}) ∈ ∏ Π_{φ_{v_i}}` with `∏ ε_{v_i}(σ_{v_i}) = 1`; (2) for a RACSDC
`π` of `GL_n(𝔸_E)`, regular algebraic of the same infinity type `((l + 1)/2, …, (−1 − l)/2)` at every
infinite place, with `π_{w_i} ≅ St_m ⊞ St_3 ⊞ St_1`, there are exactly `4^{s+1}` (`l > 5`) and
`2^{s+1}` (`l = 5`), in bijection with `∏ Π_{φ_{v_i}}`. In both cases every counted `σ` has trivial
archimedean component `σ_∞`: the infinity type is that of the base change of the trivial
representation of the compact group `G(F ⊗ ℝ)`, whose archimedean `L`-packets are singletons.
Stable base change holds for representations with trivial `σ_∞`. The archimedean sign condition
holds when every place above `l` splits in `E` with `[F_v : ℚ_l]` even and the representation is
ι-ordinary (Remark 3.9).

*Proof sketch.* Stabilise the trace formula for `G` with pseudo-coefficients at infinity and the
chamber fixers `B_{v_i}` of §4.8 at the `v_i` (EndoscopicTransferAndUnitaryTraceComparison §§2.10,
6.10, 6.29), the endoscopic terms using the transfer of the archimedean Euler–Poincaré function to
the elliptic endoscopic groups (§2.15 there); at a finite place other than the `v_i` the extension `E/F` is unramified or split and
the local packet is a singleton (ct17 p. 29); insert the
stable and endoscopic local identities of §4.12 with the character `μ` of §5.5 in the
`L`-embedding; Mok's multiplicity formula (ModularityAndLanglandsExtensions §3.12) and
Kaletha–Mínguez–Shin–White for the inner form (§3.16 there) give multiplicity one and the sign
condition.

**Checks.**

- For `s = 0` and `l > 5`: packets have four members, giving `4/2 = 2` endoscopic and `4` cuspidal
  contributions; for `l = 5` the packets have two members, giving `1` and `2`.
- The endoscopic count is half the cuspidal count for every `s`, because the sign condition
  `∏ ε_{v_i} = 1` cuts out half of `∏ Π_{φ_{v_i}}`.
- For `l = 5` the set `Π_φ` has the two members `X`, `Y` of §4.10 (`n = 7`); for `l = 7`
  (`n = 9`) four.
- The unramifiedness of `E/F` outside the `v_i` is a separate hypothesis from the condition on the
  representations. At an extra finite place `v′` ramified in `E` where `π` is unramified, the local
  packet of the ramified unitary group need not be a singleton, so the counts are not claimed; the
  splitting condition on the representations alone does not exclude such a `v′`.
- The infinity type is a hypothesis in case (2) as in case (1). For `l = 5` the trivial
  representation of the compact `U(7)` has parameter exponents `3, 2, 1, 0, −1, −2, −3`; a regular
  `π` with exponents `4, 3, 2, 0, −2, −3, −4` would come from the archimedean representation of
  highest weight `(1, 1, 1, 0, −1, −1, −1)` (subtract `ρ = (3, 2, 1, 0, −1, −2, −3)`), not from the
  trivial one, and contributes no `σ` with trivial `σ_∞`.

*Needs:* §4.12; §5.5; ModularityAndLanglandsExtensions §§3.12, 3.16;
EndoscopicTransferAndUnitaryTraceComparison §§2.10, 2.15, 6.10, 6.29.

### 5.7 Places, levels and algebraic modular forms for level raising at ramified places

Let `l ≥ 5` be prime, `ι : ℚ̄_l ≅ ℂ`, `E` a CM field with totally real `F` such that every place
`v | l` of `F` splits in `E` with `[F_v : ℚ_l]` even, and `v_0, …, v_s` (`s ≥ 1`) places of `F`
ramified in `E` of odd residue characteristic with `q_{v_0} ≡ −1` modulo `l` and each `q_{v_i}`
(`i ≥ 1`) a primitive root modulo `l`, all other places unramified in `E`. Let `n = l + 2`,
`m = l − 2`, `G` as in §5.6, and `π_1`, `π_2` cuspidal conjugate self-dual on `GL_m(𝔸_E)`,
`GL_4(𝔸_E)` with `π_{1,w_i} ≅ St_m`, `π_{2,w_i} ≅ St_3 ⊞ St_1`, `π = π_1 ⊞ π_2` regular algebraic and
ι-ordinary of infinity type `((n − 1)/2, …, (1 − n)/2)`, `r̄_ι(π) = ρ̄_1 ⊕ ρ̄_2` with `ρ̄_i` absolutely
irreducible and the tame inertia generator acting at `w_i` as a regular unipotent on `ρ̄_1` and with
Jordan type `3 + 1` on `ρ̄_2`. Define the levels `U_0` (with `P_{v_0}` at `v_0` and `B_{v_i}` at
`v_i`, `i ≥ 1`) and `U_1` (equal to `U_0` except `B_{v_0}` at `v_0`), where `B_v` is the chamber fixer
of §4.8 (containing the Iwahori subgroup with index `2`) and `P_v` the panel fixer of §4.10 at the
ramified place `v`, so `[U_0 : U_1] = q_{v_0} + 1`;
the module `S(U, A)` of `A`-valued functions on `G(F) \ G(𝔸_F^∞)/U`, with Hecke algebra `T(U, 𝒪)`
generated by the spherical operators at split places and the `U_v^j` at `v | l`; and the maximal
ideals `𝔪`, `𝔪^∨` of a fixed ordinary automorphic `σ` with base change `π_1 ⊞ π_2` (supplied by
§5.6) and of `σ^∨` (ct17 §4.1, pp. 33–34). Away from `v_0` the level is chosen small enough for
`l`-integral exactness and for the unweighted double-coset pairing; the weight is zero, with ordinary
parts at the places above `l` as in PotentialAutomorphyInfrastructurePartII Layer 3.

**API.**

- The levels `U_0 ⊃ U_1` with `[U_0 : U_1] = q_{v_0} + 1`.
- The modules `S(U, A)` and Hecke algebras `T(U, 𝒪)` with the maximal ideals `𝔪`, `𝔪^∨`.
- A representation `Σ` with trivial `Σ_∞` contributes to `N ⊂ S(U, 𝒪)` exactly when
  `N ∩ ι^{−1}Σ^{∞,U,ord} ≠ 0`.
- For sufficiently small level, changing an `𝒪`-lattice in the coefficient types commutes with the
  ordinary forms functor and localisation, and the dual pairing passes to the contragredient
  lattice.

**Checks.**

- `[U_0 : U_1] = [P_{v_0} : B_{v_0}] = q_{v_0} + 1`, divisible by `l` since `q_{v_0} ≡ −1` modulo `l`.
- For `l = 5`: `n = 7`, `m = 3`, and `q_{v_0} ≡ −1` modulo `5`, e.g. `q_{v_0} ∈ {9, 19, 29}`.
- `q_{v_i} ≡ 1` modulo `l` is not allowed at `v_i` (`i ≥ 1`): the lattices of §4.11 need a primitive
  root.

*Needs:* PotentialAutomorphyInfrastructurePartII Layer 3 ("Algebraic modular forms on a definite
unitary group"; "Hecke algebras of definite unitary groups"; "Iwahori levels at `l`, the
`U`-operators and ordinary parts"); §4.11; §5.6.

### 5.8 Local types of representations contributing to S(U₁, 𝒪)_𝔪

In the set-up of §5.7, prove that if `Σ` contributes to `S(U_1, 𝒪)_𝔪` and `Π` is its stable base
change to `GL_n(𝔸_E)`, then `Π` is ι-ordinary and its components at the places above
`v_0, …, v_s` are semistable; moreover either (1) `Π_{w_i} ≅ St_m ⊞ St_3 ⊞ St_1` for every `i`, or
(2) for some `i` the monodromy of `r_ι(Π)` at `w_i` has Jordan type `(n − 2) + 1 + 1` or `n`, and `Π`
is cuspidal (ct17 Proposition 4.1 and proof, pp. 34–35).

*Proof sketch.* Semistability: from `Σ c(σ)⟨tr σ, f_v⟩ = ⟨tr π_w × I_c, f_{E_w}⟩` with `c(σ) > 0` and
the twisted Jacquet trace (EndoscopicTransferAndUnitaryTraceComparison §6.4); this replaces the
argument of Clozel–Thorne II Lemma 4.3 (ct15 p. 22). Residual monodromy has Jordan types `m` and `3 + 1`; the
closure order on nilpotent classes (`dim ker N^j ≤ dim ker N̄^j`), Mok's parity condition and
quadratic characters congruent to `1` modulo `λ` leave only the listed possibilities.

**Checks.**

- `π = π_1 ⊞ π_2` itself falls in case (1).
- For `n = 7` the partitions dominating `3 + 3 + 1` with the parity constraint are `3 + 3 + 1`,
  `5 + 1 + 1` and `7`; the first is case (1), the others case (2).
- A contributing `Σ` with unramified local component at some `w_i` is excluded: the residual
  monodromy is non-trivial there.

*Needs:* §5.7; §5.6; ModularityAndLanglandsExtensions §3.12; EndoscopicTransferAndUnitaryTraceComparison
§6.4; PotentialAutomorphyInfrastructurePartII Layer 3 ("Galois representations attached to
constituents of algebraic modular forms").

### 5.9 The pairing on S(U₁) and the module structure at the level-raising place

For `i = 1, …, s` choose an Iwahori-spherical member `R_i` of the `L`-packet of `G(F_{v_i})` with base
change `St_m ⊞ St_3 ⊞ St_1` such that `∏_{i=1}^{s} ε_{v_i}(R_i) = −1` (ct17 p. 36), with `ε_{v_i}` the
endoscopic sign of §4.12. Let `M` be the intersection of the `R_i^{B_{v_i}}`-isotypic parts of
`S(U_1, 𝒪)_𝔪` and `N` the intersection of the `(R_i^∨)^{B_{v_i}}`-isotypic parts of
`S(U_1, 𝒪)_{𝔪^∨}`. By §5.6 the global sign condition `∏_{i=0}^{s} ε_{v_i} = 1` then forces every
endoscopic representation contributing to `M` to have the member of sign `−1`, namely `X`, at `v_0`,
and some endoscopic representation (one with base change `π_1 ⊞ π_2` and these local members)
contributes to `M`. Prove that the pairing
`⟨f, g⟩ = Σ_{x ∈ G(F) \ G(𝔸_F^∞)/U_1} f(x) g(x)` on `S(U_1, 𝒪)` satisfies
`⟨af, g⟩ = ⟨f, ȷ(a)g⟩` for `a ∈ H_{B_{v_0},𝒪}` and induces (1) perfect pairings
`S(U_1, 𝒪)_𝔪 × S(U_1, 𝒪)_{𝔪^∨} → 𝒪` and modulo `l`; (2) a pairing vanishing on
`S(U_0, k)_𝔪 × S(U_0, k)_{𝔪^∨}`, because `q_{v_0} ≡ −1` modulo `l`; (3) a perfect pairing
`M × N → 𝒪` whose reduction vanishes on `M^{U_0} ⊗ k × N^{U_0} ⊗ k`; and (Lemma 4.4) if no
contributing representation falls in case (2) of §5.8, then `M ⊗ ℂ ≅ (X^B)^a ⊕ (Y^B)^b ⊕ (Z^B)^c ≅ N ⊗ ℂ` as
`H_{B_{v_0}}`-modules with `a > b = c ≥ 0` (`l = 7`), respectively `M ⊗ ℂ ≅ (X^B)^a ⊕ (Y^B)^b` with
`a > b ≥ 0` (`l = 5`) (ct17 Proposition 4.3, p. 36; Lemma 4.4, p. 36). The level `U_1` is small enough
that `l` does not divide the orders of the stabilisers. The printed proof uses `N` before specifying
its coefficient types; it is the contragredient-type module above, as the double-coset pairing pairs
dual types.

*Proof sketch.* Perfectness from the finite double-coset sum and smallness of `U_1`. Vanishing on
`U_0`-invariants: averaging over `P_{v_0}` multiplies the pairing by `[U_0 : U_1] = q_{v_0} + 1 ≡ 0`
modulo `l`. Lemma 4.4: by the sign choice, endoscopic base changes contribute only `X` at `v_0`
(§5.6), cuspidal ones `X ⊕ Y ⊕ Z`; the endoscopic contribution is non-empty because of
`π_1 ⊞ π_2`, which gives `a > b`.

**Checks.**

- If `U_1 = U_0` there is no vanishing modulo `l`: it comes from `q_{v_0} + 1 ≡ 0` modulo `l`.
- With `c` endoscopic and `d` cuspidal contributors (counted with the choices of local members) one
  gets `a = c + d`, `b = d`, so `a > b` exactly when `c > 0`.
- The sign product is essential. For `l = 5`, `s = 1`, choosing `R_1` with `ε_{v_1}(R_1) = +1`
  forces the endoscopic contributors to carry the member `Y` (sign `+1`) at `v_0`, giving
  `(a, b) = (d, d + c)` in place of `(d + c, d)`; for `c = 1`, `d = 0` the two choices give `(0, 1)`
  and `(1, 0)`, and the strict inequality `a > b` holds only for the product `−1`.
- For `l = 5` there is no `Z`, and the conclusion concerns the `X`, `Y` multiplicities only.

*Needs:* §5.7; §5.8; §4.11; §5.6; PotentialAutomorphyInfrastructurePartII Layer 3 ("Exactness and
group-ring freeness at level without `l`-torsion").

### 5.10 Level raising for l = 5 and l = 7 (Clozel–Thorne III Theorem 4.2)

In the set-up of §5.7 with `l ∈ {5, 7}`, prove that there is an automorphic representation `Σ` of
`G(𝔸_F)` contributing to `S(U_1, 𝒪)_𝔪` whose stable base change is cuspidal with monodromy of Jordan
type `(n − 2) + 1 + 1` or `n` at some `w_i` (ct17 Theorem 4.2, p. 35; proof, pp. 35–37; Remark 4.5,
p. 37). The count below fails for `l > 7`, where `Z(χ̄) ≠ 0` (Remark 4.5).

*Proof sketch.* Suppose every contributing base change has the original monodromy. With the local
members `R_i` of §5.9 (product of signs `−1`), §5.9 gives `a > b` (with `b = c` for `l = 7`). Let `M`, `N` be the dual-type lattices of §5.9. The perfect pairing restricts to
`M(χ̄) × N(χ̄ȷ)`; §4.11 gives rank `a + 3b` for each, with `P`-fixed sublattices of rank `a + b` (using
the exponent `[2, 1, 0, −1]` for `l = 7` and `[1, 0, −1]` for `l = 5`; `Z` contributes nothing to these
localisations). Modulo `l` the two `P`-fixed subspaces annihilate one another by §5.9(3); in a perfect
pairing between spaces of dimension `a + 3b` this forces `2(a + b) ≤ a + 3b`, that is `a ≤ b`, a
contradiction. No self-pairing of `M` is used.

**Checks.**

- For `l = 5` the count compares the ranks `a + b` and `a + 3b` of modules over `H_{B_{v_0}}` for
  `n = 7`.
- With `a = 2`, `b = 1`: `2(a + b) = 6 > 5 = a + 3b`, so two mutually orthogonal `3`-dimensional
  subspaces cannot sit in a perfect pairing of `5`-dimensional spaces.
- If `a ≤ b` were allowed (no endoscopic contributor), the inequality `2(a + b) ≤ a + 3b` holds and
  there is no contradiction: the endoscopic seed `π_1 ⊞ π_2` is essential.

*Needs:* §5.9; §5.8; §4.11; §5.6.

### Examples

- `n = 3`, `T_3` a place with `q_v ≡ 1` modulo `p`: Theorem 4.1 raises `π_2 ⊞ χ` to a cuspidal `GL_3`.
- `l = 5`, `s = 1`: `π = π_1 ⊞ π_2` on `GL_3 × GL_4`, `q_{v_0} = 9`, `q_{v_1}` a primitive root modulo
  `5` (e.g. `3`); §5.6 counts `2^1 = 2` endoscopic and `4` cuspidal representations of the definite
  `U(7)` with the relevant local data.

### Dependencies

Layer 4; ModularityAndLanglandsExtensions §§3.12, 3.16, 4.4; PotentialAutomorphyInfrastructurePartII
Layer 0, Layer 3; AutomorphicGaloisRepresentationsPartII AG2.3;
EndoscopicTransferAndUnitaryTraceComparison §§2.10, 2.15, 6.4, 6.10, 6.29; ClassFieldTheory Layer 11.

## Layer 6: level raising to Steinberg by residually reducible deformation theory

Three level-raising theorems produce automorphic lifts that are Steinberg at a prescribed place:
for residual representations that are sums of characters (nt21 Theorem 6.1, pp. 75–82), for two
residual constituents and from a lift with a long Jordan block (ct17 Theorems 5.1 and 5.7,
pp. 37–44), and by `p`-adic methods (th24 Theorem 6.11, pp. 38–41).
The first two use the residually reducible deformation theory of
PotentialAutomorphyInfrastructurePartII Layers 2, 7 and 8: deformation rings `R_D`, their
pseudodeformation subrings `P_D`, ordinary Hecke algebras `𝕋_D` and the surjection `P_D → 𝕋_D` with
kernel `J_D`.

### 6.1 Schur and primitive residual representations after split extensions; cuspidal soluble base change

In the setting of §6.4 (`r̄ = r̄_{π,ι} = χ_1 ⊕ ⋯ ⊕ χ_n`), choose a finite set `Y_a` of places such that
every `Y_a`-split finite CM extension `L/F` is linearly disjoint from the field cut out by
`r̄|_{G_{F(ζ_p)}}`. Prove that for such `L`: (1) the polarized extension `r̄^{pol} : G_{F⁺} → 𝒢_n(k)`
restricted to `G_{L⁺(ζ_p)}` is Schur; (2) `r̄|_{G_L}` is primitive; (3) if `L/F` is soluble, the base
change of `π` to `L` is cuspidal; (4) more generally, for `L/F_0/F` with `L/F_0` soluble and `Π`
RACSDC on `GL_n(𝔸_{F_0})` with `r̄_{Π,ι} ≅ r̄|_{G_{F_0}}`, the base change of `Π` to `L` is cuspidal;
and (Lemma 6.3) there are infinitely many places `ṽ_a` of `F` prime to `S`, not split in `F(ζ_p)`,
with `r̄(Frob_{ṽ_a})` scalar (nt21 Lemma 6.2, p. 77; Lemma 6.3, p. 78).

*Proof sketch.* (1)–(2): the ratios `χ_i/χ_j` have order `> 2n` on `G_{F(ζ_p)}` and stay distinct
after disjoint extensions (PotentialAutomorphyInfrastructurePartII Layer 2, "Schur `𝒢_n`-valued
residual representations"; Layer 7, "Sums of characters with large ratios are primitive"). (3)–(4):
a non-cuspidal cyclic base change would make the Galois representation induced (the cuspidality
criterion for automorphic induction, ModularityAndLanglandsExtensions conventions, and
EndoscopicTransferAndUnitaryTraceComparison §6.24), contradicting primitivity. Lemma 6.3: Chebotarev
(Chebotarev Layer 10) applied to `τ = τ_0 τ_0^c` with `ε(τ_0)² ≠ 1`.

**Checks.**

- If two characters `χ_i`, `χ_j` agree on `G_{L(ζ_p)}`, `r̄|_{G_L}` is not Schur; the order
  hypothesis on `χ_i/χ_j` prevents this.
- A non-disjoint `L` (containing the fixed field of `χ_1/χ_2`) makes two characters coincide on
  `G_L`, and `r̄|_{G_L}` is then not multiplicity free.
- For `n = 1` the statements are empty except Lemma 6.3, where every Frobenius is scalar.

*Needs:* PotentialAutomorphyInfrastructurePartII Layer 2 ("Schur `𝒢_n`-valued residual
representations"), Layer 7 ("Weakly and strongly primitive representations"; "Sums of characters
with large ratios are primitive"); EndoscopicTransferAndUnitaryTraceComparison §6.24; Chebotarev
Layer 10.

### 6.2 Deformation data with Steinberg and fixed-type local conditions

Define a deformation datum `D = (L, {R_v}_{v ∈ X})` as a soluble CM extension `L/F`, split at the
auxiliary sets (`Y_a ∪ S̃_a` in nt21 §6; `V_0 ∪ S̃_a` for a good extension in ct17 §5), a finite
set `X` of permitted split places of `L⁺` away from `p` with chosen lifts `ṽ` compatible with
the fixed lifts over the base, and for each `v ∈ X` a local lifting ring `R_v`: the fixed-type ring
`R(ṽ, Θ_ṽ, r̄|_{G_{L_ṽ}})` of §4.7, the unipotent ring `R^1_v`, the Steinberg ring `R^{St}_v`
(`q_v ≡ 1` modulo `p` and `r̄` trivial at `v`), a ring `R^{χ_v}_v` of fixed characters, or the
partition ring `R^m_v` cut out by `det(X − ρ(φ_v)) ∈ Pol_n(m, q_v)`: its Frobenius polynomial is a
product of `q_v`-strings of the lengths given by `m`. This is a Frobenius-polynomial condition, not
an upper bound on the Jordan type of monodromy; at pure points the monodromy partition is `m`.
Attached are the global polarized deformation problem `𝒮_D` with ordinary conditions `R^Δ_v` at `p`
over the Iwasawa algebra `Λ_L`, its universal ring `R_D`, the pseudodeformation subring
`P_D ⊂ R_D` (`R_D` finite over `P_D`), the localised ordinary Hecke algebra `𝕋_D`, the surjection
`P_D → 𝕋_D` with kernel `J_D` when every `R_v` is a fixed-type, unipotent or fixed-character ring
(§6.3), and the reducible quotient `R_D^{red}`. Prove that when every `R_v` is a fixed-type, fixed-character,
unipotent or Steinberg ring (not a partition ring), every irreducible component of `R_D` has
dimension at least `1 + n[L⁺ : ℚ] = dim Λ_L` (nt21 §6 and Lemma 6.4, pp. 78–79; ct17 §5.1,
pp. 38–40). In nt21 `n ≥ 3` is odd and `p > 2n`, and require
`X ⊂ S_L ∖ S_{p,L}` for the fixed finite ramification set `S` of §6.1; the separate small-level
set `S_{a,L}` is excluded. A fixed-type ring is allowed only above `R` with the chosen lift
split over the original totally real field and with the specified type `Θ_ṽ`; unipotent and
Steinberg rings require `q_v ≡ 1 mod p` and trivial residual local representation
(nt21 §6, p. 78). In ct17 `n ≥ 2`, `l > 3` and `l ∤ n_1 n_2 n`; require
`X ⊂ T_L ∖ (S_{l,L} ∪ S_{a,L})`, where `T` is the fixed finite ramification set enlarged by
`S_l ∪ S_a`, disjoint from the excluded set `V_0`. Fixed-character, unipotent, Steinberg and
partition conditions require `q_v ≡ 1 mod l`; the fixed inertial characters reduce to `1`,
and the selected ring is the local lifting condition for the given residual restriction
(ct17 §5.1, pp. 38–40). The unrestricted small-level conditions at `S_{a,L}` remain separate
from `X` in both data.

*Proof sketch.* The objects `Λ_L`, `𝒮_D`, `R_D`, `P_D`, `𝕋_D`, `J_D`, `R_D^{red}` are those of
PotentialAutomorphyInfrastructurePartII Layer 3 ("Ordinary deformation data and their Hecke
comparison"), Layer 2 (`P_𝒮`), Layer 7 (reducibility ideals) and Layer 8; this target packages the
local conditions used for level raising. The dimension bound is the presentation of polarized
deformation rings over the local rings (GlobalGaloisDeformations §8.4) with the dimensions of the
local rings (LocalGaloisDeformationRings §§2.24, 2.26, 6.10).

**API.**

- A deformation datum: a soluble CM extension split at the specified auxiliary sets, a finite
  admissible `X` in the specified ramification set with compatible lifts, and local rings `R_v`
  satisfying the preceding residual, splitting, congruence and type conditions.
- The universal ring `R_D` of the polarized ordinary problem `𝒮_D` over `Λ_L`; maps `R_D → A`
  classify strict equivalence classes of lifts of the polarized residual representation satisfying
  exactly the local ordinary, type or partition conditions of `D`.
- The subring `P_D ⊂ R_D` generated by characteristic-polynomial coefficients, with `R_D` finite
  over `P_D`.
- The surjection `P_D → 𝕋_D` with kernel `J_D` when no `R_v` is a Steinberg or partition ring (§6.3).
- Without partition rings, every component of `R_D` has dimension `≥ 1 + n[L⁺ : ℚ]`.
- Restriction to a further soluble split extension `L′/L` gives a finite map `R_{D_{L′}} → R_D`.

**Checks.**

- For `n = 3` and `[L⁺ : ℚ] = 2` the bound is `1 + 3 · 2 = 7 = dim Λ_L`.
- In rank two, Iwahori conditions at `k` distinct places have index `∏_{i=1}^k(q_i + 1)`
  in the corresponding maximal compact; for `q_1 = 11`, `q_2 = 31` this is `12 · 32 = 384`.
  Infinitely many proper Iwahori factors are not open in the adelic restricted product:
  every basic neighbourhood leaves some constrained factor unrestricted. Such an `X` is not
  a deformation datum, and cannot define the asserted open compact level.
- For `X = ∅` there are no type or partition conditions; the ordinary conditions at `p`, the fixed
  polarization and the unramified-outside-`S` restriction remain.
- If some `R_v` is the Steinberg ring, `P_D → 𝕋_D` is not asserted: the level at `v` is Iwahori, as
  for the unipotent ring (nt21 §6, p. 79), so forms unramified at `v` contribute to `𝕋_D`, and their
  Galois representations need not be points of `R^{St}_v`. For `n = 3`, `p = 7` (so `p > 2n`),
  `q_v = 29 ≡ 1` modulo `7` and residual Frobenius `1`, the unramified lift with Frobenius `1` has
  eigenvalue ratios `1 ≠ 29`: an Iwahori-level point outside `R^{St}_v`.
- The partition ring `R^{(n)}_v` is the Steinberg ring and `R^{(1,…,1)}_v` the flat reduced
  unipotent ring (LocalGaloisDeformationRings §6.10).

*Needs:* §4.7; PotentialAutomorphyInfrastructurePartII Layer 3 ("Ordinary deformation data and their
Hecke comparison"; "The big ordinary Hecke algebra over `Λ`"), Layer 2 ("The subring `P_𝒮` generated
by characteristic polynomials"), Layer 7 ("Split deformation ideals and determinant reducibility
ideals"); GlobalGaloisDeformations §8.4; LocalGaloisDeformationRings §§2.24, 2.26, 6.10.

### 6.3 The Hecke comparison and a generic prime unramified outside p

With `𝕋_D = 𝕋^{ord}(D)_{𝔪_D}` and `P_D ⊂ R_D` as in §6.2: for data in the setting of nt21 §6 whose
rings `R_v` (`v ∈ X`) are all fixed-type rings `R(ṽ, Θ_ṽ, r̄|_{G_{L_ṽ}})` or unipotent rings `R^1_v`,
the natural surjection `P_D → 𝕋_D` of `Λ_L`-algebras is PotentialAutomorphyInfrastructurePartII
§3.10 (nt21 Lemma 6.6, p. 79, whose data have fixed-type, unipotent and Steinberg rings only). Prove
the comparison for every datum of §6.2 without Steinberg and partition rings, which adds
fixed-character rings and the setting of ct17 §5: if every `R_v` is a fixed-type ring or a
fixed-character ring `R^{χ_v}_v` (including the unipotent ring `R^1_v`), that is, no `R_v` is the
Steinberg ring and no `R_v` is a partition ring `R^m_v`, there is a natural surjection
`P_D → 𝕋_D` of `Λ_L`-algebras (ct17 §5.1, p. 40, for data whose rings are all fixed-character
rings). Partition rings enter only through §6.5, where the ideal `J_{D′}` comes from the datum `D′`
with unipotent rings in their place, never through this comparison. Prove also (Lemma 6.7) that
there are a deformation datum `D_1 = (L_1, ∅)` with `𝕋_{D_1} ≠ 0` and a generic prime `𝔭_1 ⊂ R_{D_1}` of
dimension `1` and characteristic `p` with `J_{D_1} ⊂ 𝔭_1` and `r_{𝔭_1}|_{G_{L_1,v_{St}}}` trivial
(nt21 Lemma 6.6, p. 79; Lemma 6.7 and proof, pp. 80–82). The auxiliary field is `L_0 = M_d F` with
`M_d/F⁺` cyclic totally real of odd degree `d > n + n²`, split at `R`, `Y_a` and `S_a` and totally
inert at `S_p`.

*Proof sketch.* The comparison follows the route of
PotentialAutomorphyInfrastructurePartII §3.10, in which the Hecke-valued determinant of the ordinary
Hecke algebra (PotentialAutomorphyInfrastructurePartII Layer 3, "Residual and `𝒢_n`-valued Galois
representations of Hecke maximal ideals") satisfies the local conditions of `D`. At a place with
`R_v = R^{χ_v}_v` the level is Iwahori and the forms carry the characters that
PotentialAutomorphyInfrastructurePartII §3.6(iv) matches with the inertial characteristic polynomial
`∏_i (X − χ_{v,i})` (the inverses `χ_v^{−1}` in its normalisation), so the Galois representation of
every constituent restricts there to a point of `R^{χ_v}_v`. Lemma 6.7: choose `L_0` so that the
antiunit class-field rank at each `R_i` exceeds `n + n²` (ArithmeticGaloisDuality §R02.3.5, Maire's
bound), then apply the generic-prime theorem (PotentialAutomorphyInfrastructurePartII Layer 8,
"Generic primes in large quotients") at `L_0`, and pass to `L_1`, where the types become unramified
(§4.7(4)). The printed proof applies a multiplicity-one argument to the whole set `R_i`; it is
applied to a single place of `R_i`, which bounds `d_{R_i}` by the antiunit rank there, since a union
of places can repeat characters.

**Checks.**

- The chosen prime lies in the characteristic-`p` special fibre by construction; finiteness of the
  Hecke algebra over `Λ` alone would not force an arbitrary prime to have characteristic `p`.
- Partition rings are excluded from the comparison. For `n = 3`, `p = 5`, `q_v = 11 ≡ 1` modulo `5`
  and residual Frobenius `1`, the unramified lift with Frobenius matrix `1` is a point of `R^1_v` and of
  the Iwahori-level Hecke support, but its eigenvalues `1, 1, 1` contain no pair with ratio `11`, so its
  Frobenius polynomial `(X − 1)³` is not in `Pol_3((2, 1), 11)` and the lift is not a point of
  `R^{(2,1)}_v`; a surjection `P_D → 𝕋_D` for a datum with `R_v = R^{(2,1)}_v` would force this point
  to satisfy the partition condition. The congruence `11 ≡ 1` modulo `5` makes the two conditions
  agree residually only.
- `d` odd keeps `M_d/F⁺` disjoint from the CM quadratic extension `F/F⁺`, so `L_0` is CM with
  `L_0⁺ = M_d`.
- For `d ≤ n + n²` the reducible locus could have dimension `≥ dim Λ_L − 1`, and no generic prime
  is guaranteed.

*Needs:* §6.2; §6.1; §4.7; PotentialAutomorphyInfrastructurePartII Layer 3 ("Residual and
`𝒢_n`-valued Galois representations of Hecke maximal ideals"; "Ordinary deformation data and their
Hecke comparison", §3.10; "Galois representations attached to constituents of algebraic modular
forms", §3.6), Layer 7 ("Generic primes of an
ordinary deformation ring"), Layer 8 ("Generic primes in large quotients"); ArithmeticGaloisDuality
§R02.3.5.

### 6.4 Level raising to Steinberg by Galois deformation theory (Newton–Thorne I Theorem 6.1)

Under the standard assumptions of §4.1, let `n ≥ 3` be odd, `p > 2n`, and `π` RACSDC on `GL_n(𝔸_F)`
with (1) `π` ι-ordinary; (2) `[F(ζ_p) : F] = p − 1`; (3) `r̄_{π,ι} ≅ χ_1 ⊕ ⋯ ⊕ χ_n` with
`χ_i^c = χ_i^∨ ε^{1−n}` and `χ_i/χ_j|_{G_{F(ζ_p)}}` of order `> 2n`; (4) `r̄_{π,ι}|_{G_{F_ṽ}}` trivial
and `[F_ṽ : ℚ_p] > n(n − 1)/2 + 1` for `v ∈ S_p`; (5) `R = R_1 ⊔ R_2 ⊂ S − S_p` with `R_1`, `R_2`
non-empty of odd residue characteristic, `π_ṽ|_{𝔮_ṽ} ⊇ λ̃(ṽ, Θ_ṽ, n)` (notation of §5.1; `n_1 = 3`, `q_v` of order `3`
modulo `p`, on `R_1`; `n_1 = n − 2`, `q_v` of order `n − 2`, on `R_2`), each `Θ_ṽ` of order `p`, and for
each non-trivial decomposition `r̄_{π,ι} = ρ̄_1 ⊕ ρ̄_2` there is `i ∈ {1, 2}` such that at every
`v ∈ R_i` both `ρ̄_1|_{G_{F_ṽ}}` and `ρ̄_2|_{G_{F_ṽ}}` have a non-trivial unramified subquotient. Let
`v_{St}` be a place above `S − (S_p ∪ R)` with `q_{v_{St}} ≡ 1` modulo `p` and `r̄` trivial there. Prove
that there is a RACSDC ι-ordinary `π′` on `GL_n(𝔸_F)` with `r̄_{π′,ι} ≅ r̄_{π,ι}`,
`HT_τ(r_{π′,ι}) = HT_τ(r_{π,ι})` for all `τ`, and `π′_{v_{St}}` an unramified twist of Steinberg
(nt21 Theorem 6.1, p. 76; proof, p. 82). In the applications `R_1`, `R_2` are the places above `T_1`,
`T_3` of §5.1 after the quadratic base change of §5.4. Primitivity is weak primitivity tested over
`k̄`, with the common splitting field of the Conventions.

*Proof sketch.* §6.3 gives a generic prime `𝔭_1` of `R_{D_1}` containing `J_{D_1}`, trivial at
`v_{St}`. Work in the problem with the unipotent condition at `v_{St}`, to which the weak-primitive
generic `R = T` theorem applies at the prime trivial at `v_{St}`
(PotentialAutomorphyInfrastructurePartII Layer 7). The Steinberg quotient meets this prime, and the
local dimension bound of §6.2 gives a component of the expected dimension in that quotient;
finiteness for sums of characters (Layer 8) and generic propagation give an automorphic
characteristic-zero point on the Steinberg component. Ordinary `R = T` (Layer 4) gives an
automorphic `π″` on that component, Steinberg at `v_{St}`; §6.1 and the prescribed-type lifts of
Layer 8 descend to `F`.

**Checks.**

- For `n = 3` the theorem raises the level of a residually reducible RACSDC representation of `GL_3`
  to Steinberg at a place with `q ≡ 1` modulo `p`.
- For `n = 3`: `p > 6`, so `p ≥ 7`, and (4) asks `[F_ṽ : ℚ_p] > 3 · 2/2 + 1 = 4` at every `p`-adic
  place; `n − 2 = 1`, so `q_v ≡ 1` modulo `p` on `R_2`, and `q_v` has order `3` on `R_1`.
- The conclusion fixes `r̄` and the Hodge–Tate weights; it says nothing about the characteristic-zero
  representation at the places of `R`.

*Needs:* §§6.1–6.3; §5.1 (the parahoric `𝔮_ṽ` and `λ̃(ṽ, Θ_ṽ, n)`); PotentialAutomorphyInfrastructurePartII
Layer 0 ("Soluble base change and descent of polarized automorphy"), Layer 4 ("The ordinary `R = T` theorem with Taylor's Ihara
avoidance"), Layer 7 ("The weak-primitive generic `R = T` theorem"; "Weak primitivity over a
splitting coefficient field"), Layer 8 ("Finiteness of ordinary deformation rings of sums of
characters"; "Automorphic lifts of prescribed type from residual automorphy over a soluble
extension").

### 6.5 The reducible locus with Steinberg-type conditions

Under the standing hypotheses of ct17 §5.1, fix a partition `m` with `m_1 > n_1 = dim ρ̄_1` and a
deformation datum `D = (L, {R_v}_{v ∈ R_0} ∪ {R^m_v}_{v ∈ R_1})` with `R_v ∈ {R^1_v, R^{St}_v, R^m_v}`
at every `v ∈ R_0` (`v ∤ l`, `q_v ≡ 1` modulo `l`). Let `Δ` (resp. `Δ′`) be the Galois group of the
maximal abelian `l`-extension of `L` unramified outside `l` (resp. also split at `R̃_1 ∪ R̃_1^c`) and
`d = dim_{ℚ_l} ker(Δ ⊗ ℚ_l → Δ′ ⊗ ℚ_l)^{c=−1}`. Prove: (Lemma 5.3) `dim R_D^{red} ≤ 1 + n[L⁺ : ℚ] − d`
and `R_D^{red}` is finite over `Λ_L`; (Lemma 5.4) for `D` with `R^m_v` at the places above `v_0`
(`m` the Jordan type of `N` in `rec^T(Π_{w_0})`) and `D′` with `R^1_v` there,
`dim R_D/J_{D′}R_D = dim Λ_L` (ct17 Lemma 5.3, p. 40; Lemma 5.4, p. 41). The printed Lemma 5.3 allows
arbitrary local characters at `R_0`; its monodromy argument uses unipotent inertia, so the local
conditions at `R_0` are restricted to the unipotent ones listed (the application has `R_0 = ∅`).

*Proof sketch.* For every distribution of ordinary characters between the two residual blocks the
fixed-determinant ordinary block deformation rings are finite over their weight algebras; let `A` be
their completed tensor product and adjoin universal determinant-twist characters `Ψ_1`, `Ψ_2` to
parametrise reducible deformations. Modulo the maximal ideal of `A` the blocks are `r̄_1 ⊗ Ψ_1` and
`r̄_2 ⊗ Ψ_2`; the partition condition with `m_1 > n_1` forces a common eigenvalue of the two blocks,
so `Ψ_1(Frob_ṽ) − Ψ_2(Frob_ṽ)` is nilpotent at `v ∈ R_1`, and the antiunit rank `d` gives the
dimension loss and finiteness (ArithmeticGaloisDuality §R02.3.5). Lemma 5.4: the pure automorphic
point furnished by `Π` lies on a unique component retained by the partition quotient; with the
`Λ`-finite ordinary Hecke algebra and the lower bound on component dimensions this gives the
equality (finiteness alone gives only an upper bound).

**Checks.**

- If `m = (1, …, 1)` the shared-eigenvalue argument gives nothing and the bound is not claimed.
- With `n_1 = 2`, `n_2 = 1` and `m = (3)`, a Frobenius polynomial that is a single `q`-string of
  length `3` cannot split as a `2`-block times a `1`-block without a common eigenvalue up to `q`.
- `d = 0` gives the trivial bound `dim R_D^{red} ≤ dim Λ_L`.

*Needs:* §6.2; PotentialAutomorphyInfrastructurePartII Layer 7 ("The reducible locus is small in the
presence of Steinberg places"), Layer 8 ("The reducible locus is small"); ArithmeticGaloisDuality
§R02.3.5.

### 6.6 Changing characters, and a characteristic-l prime giving a Steinberg lift

Prove: (Lemma 5.5) for `D_0^χ = (L_0, {R^{χ_v}_v}_{v ∈ R})` with pairwise distinct
`χ_{v,1}, …, χ_{v,n}` at each `v ∈ R`, and a good `L ⊃ L_0` over which every `χ_{v,i}` is unramified
above `R`, the datum `D = (L, ∅)` has `R_D ← P_D → 𝕋_D` compatible with
`R^{nil}_{D_0^χ} ← P^{nil}_{D_0^χ} → 𝕋_{D_0^χ}`; (Lemma 5.6) if `D = (L, ∅)` and a dimension-one
prime `𝔭 ⊂ R_D` of characteristic `l` satisfy (1) `r_𝔭 : G_L → GL_n(Frac A)` absolutely irreducible
(`A` the normalisation of `R_D/𝔭`), (2) the characters `ψ_1^v, …, ψ_n^v` of `I_{L_ṽ}`
(`v ∈ S_{l,L}`) pairwise distinct, (3) for some `v ∈ S_{l,L}` some `σ ∈ I_{L_ṽ}` with `r_𝔭(σ)` having
eigenvalues `λ_1, …, λ_n` satisfying `∏ λ_i^{a_i} = 1` only when every `a_i = 0`, (4) `J_D ⊂ 𝔭`,
(5) `r_𝔭|_{G_{L_ũ}}` trivial for some `u ∈ T_L − (S_{l,L} ∪ S_{a,L})`, then there is an ι-ordinary
RACSDC `Π_1` of `GL_n(𝔸_L)` with `r̄_ι(Π_1) ≅ r̄_ι(Π)|_{G_L}` and `Π_{1,ũ}` an unramified twist of
Steinberg (ct17 Lemma 5.5, pp. 41–42; Lemma 5.6, p. 42). Here `n_1 ≠ n_2` and `n_1 n_2` is even (for
soluble base change and descent on the definite group), and primitivity is weak primitivity over
`k̄` with the common splitting field.

*Proof sketch.* Lemma 5.5: soluble base change and descent for the definite group and for residually
reducible rings (PotentialAutomorphyInfrastructurePartII Layer 3, Layer 7 "Twisting and soluble base
change for residually reducible rings and Hecke algebras"). Lemma 5.6: the independent inertial
eigenvalues make `𝔭` generic; add a Steinberg condition at `u` and compare with the unipotent
problem; the weak-primitive generic `R = T` theorem and the local dimension bound give an
automorphic characteristic-zero point on a Steinberg component (independence does not assert
uniqueness of that local component).

**Checks.**

- Without (5) the lift need not be Steinberg anywhere; (5) places the Steinberg condition at `u`.
- Condition (3) fails when `r_𝔭(σ)` has two equal eigenvalues (`a = (1, −1, 0, …)` gives a
  relation), and then `𝔭` need not be generic.
- For `n = 2`, `n_1 = n_2 = 1` violates `n_1 ≠ n_2`, so the lemma does not apply to residually
  reducible `GL_2` with two characters.

*Needs:* §6.2; PotentialAutomorphyInfrastructurePartII Layer 3, Layer 7 ("Twisting and soluble base
change for residually reducible rings and Hecke algebras"; "The weak-primitive generic `R = T`
theorem"; "Absolute irreducibility at a generic prime survives restriction"; "Weak primitivity over a splitting coefficient
field").

### 6.7 Level raising to Steinberg for residually reducible representations (Clozel–Thorne III Theorem 5.1)

Let `E` be imaginary CM, `n ≥ 2`, and `Π` RACSDC on `GL_n(𝔸_E)` with `r̄_ι(Π) = ρ̄_1 ⊕ ρ̄_2`, the `ρ̄_i`
absolutely irreducible, non-isomorphic, with `ρ̄_i^c ≅ ρ̄_i^∨ ε^{1−n}`, `n_1 > n_2`, `r̄_ι(Π)`
primitive, and a place `w_0` where `Π_{w_0}` is Iwahori-spherical and the monodromy `N` of
`rec^T(Π_{w_0})` has a Jordan block of length `> n_1`. Assume (1) `Π` ι-ordinary; (2) `l > 3`,
`l ∤ n_1 n_2 n`, `n_1 n_2` even; (3) each `ρ̄_i|_{G_{E(ζ_l)}}` adequate and `E(ζ_l)` not contained in
the fixed field of `ad r̄_ι(Π)`; (4) a CM extension `E_0/E`, linearly disjoint from the extension of
`E(ζ_l)` cut out by `r̄_ι(Π)`, and ι-ordinary RAECSDC `(π_i, χ_i)` of `GL_{n_i}(𝔸_{E_0})` with
`r̄_ι(π_i) ≅ ρ̄_i|_{G_{E_0}}`. Prove that there are a soluble CM `E_1/E` linearly disjoint from that
extension and an ι-ordinary RACSDC `Π_1` on `GL_n(𝔸_{E_1})` with `r̄_ι(Π_1) ≅ r̄_ι(Π)|_{G_{E_1}}` and
`Π_{1,w_1}` an unramified twist of Steinberg at a place `w_1 | w_0` (ct17 Theorem 5.1, pp. 37–38;
proof, pp. 38–43). The printed proof uses primitivity of a generic lift without deriving it; the
argument here derives absolute irreducibility of its restriction from `n_1 ≠ n_2`.

*Proof sketch.* Reduce by soluble base change (§6.2). The reducible-locus bound (§6.5) gives an
absolutely irreducible generic representation `r_{𝔭_0}`. Over a good Galois extension the two
residual blocks remain absolutely irreducible; if `r_{𝔭_0}` became reducible after restriction,
Clifford theory would give a transitive set of conjugate constituents of equal dimension whose
residual semisimplifications distribute the two residual blocks, forcing `n_1 = n_2`, a
contradiction. §6.6 then gives the Steinberg lift.

**Checks.**

- `n_1 > n_2` together with a Jordan block longer than `n_1` excludes `Π_{w_0}` unramified.
- For `n = 7`, `(n_1, n_2) = (4, 3)` has `n_1 n_2 = 12` even, and a block of length `≥ 5` is needed
  at `w_0`; the Clozel–Thorne application has blocks `5 + 1 + 1` or `7`.
- `(n_1, n_2) = (3, 3)` is excluded, and then the Clifford argument would indeed allow a reducible
  restriction with two conjugate `3`-dimensional constituents.

*Needs:* §6.5; §6.6; §6.2; PotentialAutomorphyInfrastructurePartII Layer 7 ("Weak primitivity over a
splitting coefficient field"), Layer 8 ("Thorne's automorphy lifting for two adequate constituents";
"Finiteness of ordinary locally Steinberg deformation rings").

### 6.8 Automorphy lifting from a lift with a long Jordan block (Clozel–Thorne III Theorem 5.7)

Let `E` be CM and `ρ : G_E → GL_n(ℚ̄_l)` continuous with (1) `ρ^c ≅ ρ^∨ ε^{1−n}`; (2) finitely many
ramified places; (3) `ρ` ordinary of weight `λ`; (4) `l > 3` and `E(ζ_l)` not contained in the field
cut out by `ad ρ̄`; (5) `ρ̄ ≅ ρ̄_1 ⊕ ρ̄_2` with `ρ̄_i|_{G_{E(ζ_l)}}` adequate, `n_1 ≠ n_2`, `n_1 n_2`
even, `l ∤ n_1 n_2 (n_1 + n_2)`, `ρ̄` primitive; (6) a place `w_0 ∤ l` with
`ρ|^{ss}_{G_{E_{w_0}}} ≅ ⊕_{i=1}^n ψ ε^{n−i}`, `ψ` unramified; (7) an ι-ordinary RACSDC `Π` with
`r̄_ι(Π) ≅ ρ̄` whose monodromy at `w_0` has a Jordan block of length `> max(n_1, n_2)`; (8) hypothesis
(4) of §6.7. Prove that `ρ ≅ r_ι(π)` for a RACSDC `π` on `GL_n(𝔸_E)` (ct17 Theorem 5.7, p. 44).

*Proof sketch.* §6.7 gives `Π_1` Steinberg at `w_1 | w_0` over a soluble `E_1`. Residually reducible
automorphy lifting with a Steinberg place (PotentialAutomorphyInfrastructurePartII Layer 8,
"Thorne's automorphy lifting for two adequate constituents") shows `ρ|_{G_{E_1}}` automorphic; soluble
descent (Layer 0) returns to `E`.

**Checks.**

- The unramified sum `⊕ ψ ε^{n−i}` satisfies (6) with `N = 0`; so (6) does not force Steinberg
  monodromy, and the automorphic long-block witness (7) is essential.
- With `n_1 = n_2` hypothesis (5) fails; this is the case excluded in §6.7.
- `l = 3` is excluded by (4), where adequacy can fail for small images.

*Needs:* §6.7; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of
polarized automorphy"), Layer 7 ("Weak primitivity over a splitting coefficient field"), Layer 8
("Thorne's automorphy lifting for two adequate constituents").

### 6.9 Level raising to an ordinary Steinberg lift by p-adic methods (Thorne 2024 Theorem 6.11)

Let `F = F⁺F_0` be CM with `F_0` imaginary quadratic and `F/F⁺` everywhere unramified, `p` and `q`
primes split in `F_0`, `v_0` a `q`-adic place of `F⁺`, `ṽ_0` the place of `F` above `v_0` lying above a
fixed `q`-adic place `u_0` of `F_0`, and `ι : ℚ̄_p ≅ ℂ`. Let `n = n_1 + n_2` and `π_1`, `π_2` cuspidal
conjugate self-dual on `GL_{n_1}(𝔸_F)`, `GL_{n_2}(𝔸_F)` with `π = π_1 ⊞ π_2` regular algebraic and
ι-ordinary, and `S` a finite set of places of `F⁺` containing `S_p`, `v_0` and the places below the
ramification of `π`, with no other `q`-adic places, such that (1) `π` is ramified only at places split
over `F⁺`; (2) writing `λ_{i,τ}` for the dominant weight of `π_i|·|^{(n_i−n)/2}`, for each embedding
`τ_0 : F_0 → ℂ` and each pair of dominant weights `(μ_1, μ_2)` the number of `τ : F → ℂ` restricting
to `τ_0` with `(λ_{1,τ}, λ_{2,τ}) = (μ_1, μ_2)` is even; (3) at some finite place `w ∉ S` split over
`F⁺`, `r̄_ι(π)|^{ss}_{G_{F_w}} ≅ ⊕ χ̄_i` with unramified `χ̄_i` and `χ̄_i/χ̄_j ≠ ε̄` for `i ≠ j`; (4)
`π_{1,ṽ_0} ≅ St_{n_1}(ψ_1)`, `π_{2,ṽ_0} ≅ St_{n_2}(ψ_2)` with `ψ_1`, `ψ_2` unramified and
`ι^{−1}(ψ_1 ψ_2^{−1} |·|^{−n/2})` valued in `1 + 𝔪_{ℤ̄_p}`; (5) `π` is unramified at the `q`-adic places
not above `v_0`. Prove that there is an ι-ordinary RACSDC `Π` on `GL_n(𝔸_F)` with
`r̄_ι(Π) ≅ r̄_ι(π)`, `Π_{ṽ_0}` an unramified twist of `St_n`, unramified at the other `q`-adic places
and ramified only at places split over `F⁺` (th24 Theorem 6.11 and its assumptions, pp. 39–40;
proof, pp. 40–41; Lemma 6.10, p. 39).

*Proof sketch.* Suppose not; th24 Proposition 6.5 gives a maximal ideal `𝔪` in the support of the
`p`-adic forms `S(K^p, k)` with the residual eigensystem of `π` (PotentialAutomorphyInfrastructurePartII
Layer 3; CompletedCohomologyAndLocalGlobalCompatibility §0.7). The concentration of the
Hecke-localized derived tensor product of Drinfeld-space cohomology with the automorphic module
(th24 Theorem 5.2, using the genericity place `w`) and Steinberg detection (Theorem 3.4) show that a
non-zero middle-degree part would detect a Steinberg constituent, contrary to assumption; hence the
tensor vanishes, and Corollary 6.3 gives the vanishing of twisted `Hom`-spaces at every weight.
Choose an anticyclotomic `ψ ≡ 1` with the Frobenius value of Lemma 6.10 and twist the first block
only: `(r_{π_1|·|^{(n_1−n)/2}} ⊗ ψ) ⊕ r_{π_2|·|^{(n_2−n)/2}}`; Propositions 6.7 and 6.9 reduce its
local constituents at `ṽ_0` to Steinberg or the specified two-block constituent, either of which
gives non-zero derived `Hom` in a degree forbidden by that vanishing. The inputs from th24 §§3–6 are
supplied by CompletedCohomologyAndLocalGlobalCompatibility (supplier contracts).

**Checks.**

- For `n_1 = n_2 = 1`, (4) says `ψ_1 ψ_2^{−1} |·|^{−1} ≡ 1` modulo `𝔪` at `ṽ_0`: the classical
  level-raising congruence for `GL_2` in conjugate self-dual form.
- Condition (4) is ordered and sufficient, not necessary. Take `n_1 = n_2 = 1`, `ṽ_0` of norm
  `q_{ṽ_0} = 2`, `p = 5`, and residual values `ψ_1(ϖ) = 2`, `ψ_2(ϖ) = 1` in `𝔽_5`. The value of
  `ψ_1 ψ_2^{−1}|·|^{−1}` at `ϖ` is `2 · 2 = 4 ≠ 1`, yet `{2, 1}` is a `q_{ṽ_0}`-string; after exchanging
  `π_1` and `π_2` (the other hypotheses are symmetric in the two blocks) the value is `3 · 2 = 6 = 1`
  in `𝔽_5`, and the theorem applies.
- A necessary condition is that the residual Frobenius eigenvalues at `ṽ_0` form a single
  `q_{ṽ_0}`-string, as those of an unramified twist of `St_n` do; for `n_1 = n_2 = 1` their ratio must
  be `q_{ṽ_0}` or `q_{ṽ_0}^{−1}` in `k`. For `q_{ṽ_0} = 2` and `k = 𝔽_7`, the pair `{3, 1}` has ratios
  `3` and `5`, neither of which lies in `{2, 4}`, so no Steinberg lift exists, in either order.
- The conclusion is residual: `Π` is cuspidal while `π` is an isobaric sum.

*Needs:* §6.2; PotentialAutomorphyInfrastructurePartII Layer 0 ("Algebraic characters with
prescribed conjugate norm and local behaviour"), Layer 3 ("Algebraic modular forms on a definite
unitary group"; "The big ordinary Hecke algebra over `Λ`"); SmoothRepresentationsOfLocalGroups SR.3;
CompletedCohomologyAndLocalGlobalCompatibility §0.7 (gap:drinfeld-steinberg-detection).

### Examples

- `n = 3`, `p = 7`: a RACSDC representation of `GL_3` with `r̄ = χ_1 ⊕ χ_2 ⊕ χ_3` and ratios of order
  `> 6` is raised to Steinberg at a place with `q ≡ 1` modulo `7` (§6.4).
- `n_1 = 4`, `n_2 = 3`, `l = 5`: Clozel–Thorne's application at `v_0` (§6.7) with Jordan type
  `5 + 1 + 1` or `7`.

### Dependencies

Layers 4–5; PotentialAutomorphyInfrastructurePartII Layers 0, 2, 3, 4, 7, 8;
GlobalGaloisDeformations §8.4; LocalGaloisDeformationRings §§2.24, 2.26, 6.10;
ArithmeticGaloisDuality §R02.3.5; EndoscopicTransferAndUnitaryTraceComparison §6.24;
SmoothRepresentationsOfLocalGroups SR.3; CompletedCohomologyAndLocalGlobalCompatibility §0.7;
Chebotarev Layer 10.

## Layer 7: seeds — residually CM symmetric powers and one level-one form

This layer produces a level-one form with automorphic `Sym^{n−1}` from the CM form `σ_0` of weight
`5` (nt21 pp. 82–91): level raising for `GL_2` at a prime `q ≡ 3 mod 4`, a residually CM ordinary
representation of `GL_n` with a Steinberg place (nt21 Theorem 7.1), residually reducible automorphy
lifting, and two applications of §2.4. Theorem 7.1 is proved here in every rank of the
form `2^r m` from rank `m` (§7.5), hence unconditionally in rank `2^r`; the odd inductive step of
the source needs a conjugate self-dual rank-two block that its construction does not provide, and
is recorded with that block as a hypothesis (§7.4). Theorem 7.1 and Theorem E in every rank are
obtained in Layer 14 from Layer 13. The layer also proves automorphy of `Sym^{l+1}` for
`l ∈ {5, 7}` (§7.7; ct17 Theorem 6.2, pp. 44–46), the input of ModularityAndLanglandsExtensions §4.31.

### 7.1 The CM newform σ₀ of weight 5 and level Γ₁(4)

Let `K = ℚ(i)`. Define `σ_0` as the cuspidal automorphic representation of `GL_2(𝔸_ℚ)` attached to
the normalised newform `f_0 = q − 4q² + 16q⁴ − 14q⁵ − 64q⁸ + ⋯` of level `Γ_1(4)` and weight `5`,
the automorphic induction from `K` of the unramified Hecke character of infinity type `(4, 0)`
given on ideals by `(α) ↦ α⁴` for `α ∈ ℤ[i]` (Mathlib `GaussianInt`; independent of the generator
because units have fourth power `1`). Prove that for `p ≡ 1 mod 4`, `σ_0` is ι-ordinary,
`r_{σ_0,ι} ≅ Ind_{G_K}^{G_ℚ} ψ` for the `p`-adic avatar `ψ`, and `det r_{σ_0,ι} = δ_{K/ℚ} ε^{−4}`
(nt21 §7, definition of `σ_0`, pp. 82–83).

*Proof sketch.* `a_ℓ(f_0) = α⁴ + ᾱ⁴` for a prime `ℓ = αᾱ ≡ 1 mod 4`, `a_ℓ = 0` for `ℓ ≡ 3 mod 4`,
`a_2 = (1 + i)⁴ = −4`. Automorphic induction of a Hecke character of an imaginary quadratic field
(EndoscopicTransferAndUnitaryTraceComparison §13.3; ModularityAndLanglandsExtensions, convention
"Automorphic induction and its cuspidality criterion") and the newform realisation
(AutomorphicGaloisRepresentations §1.5); ordinarity at split `p` because the infinity type is
`(4, 0)`.

**API.**

- The Hecke character of `ℚ(i)` of infinity type `(4, 0)`, `(α) ↦ α⁴`.
- The coefficients: `a_ℓ(f_0) = α⁴ + ᾱ⁴` for `ℓ = αᾱ ≡ 1 mod 4`, `a_ℓ = 0` for `ℓ ≡ 3 mod 4`,
  `a_2 = −4`.
- `r_{σ_0,ι} ≅ Ind_{G_K}^{G_ℚ} ψ` with determinant `δ_{K/ℚ} ε^{−4}`.
- `σ_0` is ι-ordinary for `p ≡ 1 mod 4`.

**Checks.**

- `a_5 = (2 + i)⁴ + (2 − i)⁴ = (−7 + 24i) + (−7 − 24i) = −14`, matching the `q`-expansion.
- `a_3 = 0` since `3` is inert in `ℚ(i)`; `a_4 = a_2² = 16` since `2` divides the level.
- `f_0` is not of level one: its level is `4` and its nebentypus is the character of `ℚ(i)/ℚ`, of
  value `δ_{K/ℚ}(−1) = −1 = (−1)^5`, as weight `5` requires.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §13.3; ModularityAndLanglandsExtensions
(automorphic induction convention); AutomorphicGaloisRepresentations §1.5; Mathlib `GaussianInt`.

### 7.2 Properties of the residual symmetric powers of σ₀

Let `n ≥ 3`, `p ≡ 1 mod 48 n!`, `ω : G_K → ℚ̄_p^×` de Rham with `ω ω^c = ε³`, `F/K` a finite CM
extension linearly disjoint from the extension of `K(ζ_p)` cut out by `r̄_{σ_0,ι}|_{G_{K(ζ_p)}}`, and
`χ_i = ω̄^{n−1} ψ̄^{n−i} (ψ̄^c)^{i−1}`, so that `ρ̄ = ⊕ χ_i ≅ ω̄^{n−1} ⊗ Sym^{n−1} r̄_{σ_0,ι}|_{G_K}`.
Prove (1) `[F(ζ_p) : F] = p − 1`; (2) `ψ̄/ψ̄^c|_{G_{F(ζ_p)}}` has order `> 2n(n − 1)` and each
`χ_i/χ_j|_{G_{F(ζ_p)}}` order `> 2n`; (3) `χ_i χ_i^c = ε^{1−n}`; (4) `ζ_p ∉ F^{ker ad ρ̄}` and
`F ⊄ F⁺(ζ_p)`; (5) `ρ̄|_{G_F}` is primitive (nt21 Lemma 7.2, pp. 83–84).

*Proof sketch.* The extension cut out by `ψ̄/ψ̄^c` keeps degree at least `(p − 1)/8` after adjoining
`ζ_p` (the image of `r̄_{σ_0,ι} ⊕ ε̄` contains `{(diag(a⁴, (c/a)⁴), c^{−1})}`, nt21 p. 86), and the
disjointness hypothesis preserves this over `F`; since `p ≡ 1 mod 48 n!` this exceeds `2n(n − 1)`,
and `χ_i/χ_j = (ψ̄/ψ̄^c)^{j−i}` with `|j − i| ≤ n − 1` has order `> 2n`. On `G_K`, `ψψ^c = ε^{−4}`, so
`χ_i χ_i^c = (ωω^c)^{n−1}(ψψ^c)^{n−1} = ε^{3(n−1)−4(n−1)} = ε^{1−n}`. The avoidance statements follow
from disjointness, and primitivity from the criterion for sums of characters with large ratios
(PotentialAutomorphyInfrastructurePartII Layer 7), valid over every residue field extension.

**Checks.**

- For `n = 3` the congruence asks `p ≡ 1 mod 288`; `p = 577 = 2 · 288 + 1` is the smallest such
  prime (`289 = 17²` is not prime).
- (3) at `n = 1`: `χ_1 = 1`, `χ_1 χ_1^c = 1 = ε^0`.
- Without the disjointness of `F`, `F` could contain the fixed field of `ψ̄/ψ̄^c` and two `χ_i` would
  coincide on `G_F`.

*Needs:* §7.1; PotentialAutomorphyInfrastructurePartII Layer 7 ("Sums of characters with large
ratios are primitive"; "Weakly and strongly primitive representations").

### 7.3 A weight-5 form with automorphic symmetric powers (Newton–Thorne I Corollary 7.3)

Let `n ≥ 3` and suppose the statement of §7.5 (Theorem 7.1) holds in rank `n`. Prove that there is a
cuspidal automorphic representation `σ` of `GL_2(𝔸_ℚ)` of weight `5`, unramified away from `2` and a
prime `q ≡ 3 mod 4`, with `σ_2 ≅ i_{B_2}^{GL_2} χ_1 ⊗ χ_2` (`χ_1` unramified, `χ_2` of conductor `4`),
`σ_q` an unramified twist of Steinberg, and `Sym^{n−1} r_{σ,ι}` automorphic for every `p` and `ι`
(nt21 Corollary 7.3 and proof, pp. 84–85). Primitivity is weak primitivity over `k̄` with the common
splitting field.

*Proof sketch.* Choose `q ≡ 3 mod 4` with `q ≡ −1 mod p`; Diamond's level raising
(SerreWeightAndLevelOptimisation §2.4) gives `σ ≡ σ_0` modulo `p`, Steinberg at `q`. Theorem 7.1 in
rank `n` gives `Π` over a soluble CM `F`, residually `ω̄^{n−1} ⊗ Sym^{n−1} r̄_{σ_0}`, Steinberg above
`q`. Residually reducible lifting (ModularityAndLanglandsExtensions §4.2;
PotentialAutomorphyInfrastructurePartII Layer 8, "The ANT lifting theorem with weak primitivity")
with §7.2 shows `ω^{n−1} ⊗ Sym^{n−1} r_{σ,ι}|_{G_F}` automorphic; soluble descent and descent from
`K` (Layer 0) return to `ℚ`, and the one-prime criterion (ModularityAndLanglandsExtensions §4.15)
gives every `p` and `ι`.

**Checks.**

- `σ` is ι-ordinary at `p ≡ 1 mod 4`, being congruent to the ordinary `σ_0` in the same weight.
- Diamond's criterion at `q` asks `a_q(σ_0)² ≡ δ_{K/ℚ}(q) q³ (q + 1)²` modulo `p` (weight `5`,
  nebentypus `δ_{K/ℚ}`); `a_q(σ_0) = 0` for `q ≡ 3 mod 4`, so it holds exactly when `q ≡ −1` modulo
  `p`, whatever the sign `δ_{K/ℚ}(q) = −1`.
- `σ_2` is ramified (conductor of `χ_2` is `4`), so `σ` is not of level one; §7.6 removes the
  ramification.

*Needs:* §7.2; §7.5; SerreWeightAndLevelOptimisation §2.4; ModularityAndLanglandsExtensions §§4.2,
4.15; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of polarized
automorphy"; "Automorphy of an induced representation descends"), Layer 7 ("Weak primitivity over a
splitting coefficient field"), Layer 8 ("The ANT lifting theorem with weak primitivity").

### 7.4 The odd inductive step of Theorem 7.1, with the rank-two block as a hypothesis

Let `n = 2k + 1 ≥ 3`, let `p`, `q`, `X_0`, `ω` be as in §7.5, and assume the statement of §7.5 in rank
`n − 2`. Let `q_1`, `q_2`, `q_3`, `M_1`, `M_2`, `M_3`, `F_0`, `ω_0` and the RACSDC `π_0` of
`GL_{n−2}(𝔸_{F_0})` be constructed as in nt21, proof of Proposition 7.4, pp. 85–88 (Chebotarev primes
split in `K` with `q_1 > n` of order `6`, `q_2 ≡ −1` and `q_3` of order `n − 2` modulo `p` with
prescribed Frobenius ratios; real quadratic `M_i`; a soluble CM `F_0` with prescribed local behaviour
and a crystalline `ω_0` with `ω_0 ω_0^c = ε³ δ_{K/ℚ}|_{G_{F_0}}`; `π_0` from the induction hypothesis
and prescribed-type lifts). Suppose in addition that there is a cuspidal conjugate self-dual `π_2` of
`GL_2(𝔸_{F_0})` with `π_2 ⊞ π_{n−2}` regular algebraic (`π_{n−2}` the twist of `π_0` by a power of `|·|` and `ιω_0²` fixed on nt21 p. 88) and ι-ordinary, whose residual
representation and local components at the places above `q_1`, `q_2`, `q_3` are those that the
printed proof assigns to `τ_0 ⊗ |·|^{(n−2)/2} ιω_1 ω_0^{n−1}` (residually
`ω̄_0^{n−1} ω̄_1 ⊗ Ind_{G_K}^{G_ℚ} ψ̄^{2k}`, an unramified Steinberg twist above `q_1`, and the
`λ̃`-type and `ω(ṽ) ∘ det` conditions of §5.1 above `q_2`, `q_3`). Prove that the statement of §7.5
holds in rank `n` (nt21 Proposition 7.4 and proof, pp. 85–88). The printed proof takes
`π_2 = τ_0 ⊗ |·|^{(n−2)/2} ιω_1 ω_0^{n−1}` with `τ_0` the base change of a form `τ` with
`det r_{τ,ι} = ε^{−8k} δ_{K/ℚ}`; since `n − 1` is even and `ω_0 ω_0^c = ε³δ_{K/ℚ}`, this block differs
from its required polarized dual by the non-trivial character `δ_{K/ℚ}|_{G_{F_0}}`, so Theorem 4.1
(§5.4) does not apply to it, in rank three as well.

*Proof sketch.* With `π_2` as hypothesised, `π_2 ⊞ π_{n−2}` is a
level-raising datum (§5.1) with `T_1`, `T_2`, `T_3` the places above `q_1`, `q_2`, `q_3`; §5.4 raises
the level to a cuspidal RACSDC representation with the types, and §6.4 to Steinberg above `q`;
descend as in nt21 p. 88. The weight of the output is that of the input, as §5.4 records.

**Checks.**

- The defect, computed: put `r = r_τ|_{G_{F_0}} ⊗ ω_1 ω_0^{n−1}` (`ω_1` quadratic). Since
  `r_τ^c ≅ r_τ ≅ r_τ^∨ ⊗ det r_τ`, `det r_τ = ε^{−8k}δ_{K/ℚ}`, `ω_0^c = ε³δ_{K/ℚ}ω_0^{−1}` and
  `n − 1 = 2k`, one gets `r^c ≅ r^∨ ⊗ ε^{−2k} δ_{K/ℚ}`; after the cyclotomic twist corresponding to
  `|·|^{(n−2)/2}` this is `ε^{−1} δ_{K/ℚ}` against the `ε^{−1}` that conjugate self-duality of a
  rank-two block requires, and `δ_{K/ℚ}|_{G_{F_0}} ≠ 1` because `F_0` is linearly disjoint from `K`.
- For `n = 3` the rank-one constituent `π_0` is a character and its order-`p` local character at `q_3`
  exists (`q_3 ≡ 1` modulo `p`); the rank-two block still has the defect, so the hypothesis on `π_2`
  is not automatic in rank three.
- The hypothesis concerns a `GL_2`-form only; it does not contain the rank-`n` conclusion.

*Needs:* §5.4; §6.4; §7.2; SerreWeightAndLevelOptimisation §2.4 (gap:level-raising-prescribed-components);
PotentialAutomorphyInfrastructurePartII Layer 8 ("Automorphic lifts of prescribed type from residual
automorphy over a soluble extension"); Chebotarev Layer 10.

### 7.5 Residually CM symmetric powers with a Steinberg place (Newton–Thorne I Theorem 7.1)

For `n ≥ 1`, `p ≡ 1 mod 48 n!`, `ι : ℚ̄_p ≅ ℂ`, a prime `q ≠ p`, a finite set `X_0` of places of
`K = ℚ(i)` prime to `2pq` and `ω : G_K → ℚ̄_p^×` de Rham with `ω ω^c = ε³`, unramified at `X_0`, write
`TS_n(p, q, X_0, ω)` for the assertion: there are an `X_0`-split soluble CM extension `F/K` and a
RACSDC ι-ordinary `Π` on `GL_n(𝔸_F)` with (a) `r̄_{Π,ι} ≅ ω̄^{n−1}|_{G_F} ⊗ Sym^{n−1} r̄_{σ_0,ι}|_{G_F}`;
(b) `HT_τ(r_{Π,ι}) = HT_τ(ω^{n−1}|_{G_F} ⊗ Sym^{n−1} r_{σ_0,ι}|_{G_F})` for all `τ`; (c) `Π_v` an
unramified twist of Steinberg at some `v | q`. Prove that if `TS_m` holds for all such data, then
`TS_{2^r m}` holds for all such data and every `r ≥ 0`; in particular `TS_{2^r}` holds for every
`r ≥ 0` (nt21 Theorem 7.1, p. 83; proof, pp. 89–90; Remark 7.5, p. 90; at20 Theorem 5.1, p. 19). With
Layer 13 this gives `TS_n` for every `n ≥ 3` (§14.1), which is the statement of
ModularityAndLanglandsExtensions §4.8.

*Proof sketch.* Induction on `r`. For the step from `n` to `2n`, write
`ω̄^{2n−1} ⊗ Sym^{2n−1} r̄_{σ_0}` as the sum of two blocks of `n` characters, each realised (after
twisting `ω` and a soluble base change) by `TS_n`, giving `π_0 = π_1 ⊞ π_2` with Steinberg components
above `q` and the level-raising congruence there; Anastassiades–Thorne's level raising for `GL_{2n}`
of unitary type (ModularityAndLanglandsExtensions §4.4) gives a cuspidal RACSDC representation of
`GL_{2n}` with the same residual representation, Steinberg above `q`, ordinary when the input is.
`TS_1` holds with `Π = ω^0 = 1` over `F = K`, an unramified character being a Steinberg twist in rank
one.

**Checks.**

- `n = 4`: two steps from `n = 1`, using no odd case.
- `n = 6 = 2 · 3` needs `TS_3`, which is not supplied by this target; it comes from §7.4 under its
  hypothesis, or from §14.1.
- The residual identity (a) for `n = 2`: `ω̄ ⊗ r̄_{σ_0}|_{G_K} = ω̄ψ̄ ⊕ ω̄ψ̄^c`, the sum of the two
  characters `χ_1`, `χ_2` of §7.2.

*Needs:* §7.2; §7.4 (for odd `m > 1`); ModularityAndLanglandsExtensions §4.4;
PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of polarized
automorphy").

### 7.6 Theorem E in the ranks supplied by the seed

Let `n ≥ 3` and suppose `TS_n` (§7.5). Prove that there is a cuspidal, everywhere unramified
automorphic representation `π` of `GL_2(𝔸_ℚ)` of weight `k ≥ 2` such that `Sym^{n−1} r_{π,ι}` is
automorphic for every `ι` (nt21 Theorem 7.6 and proof, pp. 90–91; Introduction, Theorem E, p. 4). In
particular this holds for `n = 2^r`, `r ≥ 2`. Theorem E for every `n ≥ 3`, the statement of
ModularityAndLanglandsExtensions §4.9, is §14.1.

*Proof sketch.* Start from `σ` of §7.3: Steinberg at `q ≡ 3 mod 4` and of conductor `4` at `2`. On the
`q`-adic eigencurve of tame level `4` the Steinberg local representation at `q` is irreducible
because `σ` has weight `5`, so §3.5 gives Zariski closure containing `SL_2`; move to a point `σ′`
unramified at `q` of weight `k ≡ 3 mod 4` by the non-critical case of §2.4. At `2` there are no
ordinary cuspidal points of tame level one; if the two slopes of `σ′` coincided their common value
`(k − 1)/2` would be odd, which the absence of newforms of level `4` and odd slope (§3.1) excludes.
Unequal slopes give `n`-regularity, §3.5 gives large local image, and §2.4 at `2` reaches an
everywhere unramified point.

**Checks.**

- `n = 3, 4, 5`: `Δ` works, since `Sym²`, `Sym³`, `Sym⁴` of every non-CM form are automorphic
  (ModularityAndLanglandsExtensions §1.15), independently of this route.
- For `k ≡ 3 mod 4` the value `(k − 1)/2` is odd, which is what the level-`4` odd-slope exclusion
  needs.
- `n = 8` is covered by this target (`TS_8` from `TS_1` in three steps).

*Needs:* §7.3; §7.5; §2.4; §3.1; §3.5; ModularityAndLanglandsExtensions §1.15.

### 7.7 Automorphy of `Sym^{l+1}` for l ∈ {5, 7} (Clozel–Thorne III Theorem 6.2)

Let `l ∈ {5, 7}`, `F` totally real, `ι : ℚ̄_l ≅ ℂ`, and `(π, χ)` RAESDC on `GL_2(𝔸_F)` with (1) `π`
ι-ordinary of weight zero; (2) `ρ̄ = r̄_ι(π)` irreducible with image containing a conjugate of
`SL_2(𝔽_{l^a})` for some `a > 1`, and `(φρ̄ ⊗ ρ̄)|_{G_{F(ζ_l)}}` and `Sym^{l−3}ρ̄|_{G_{F(ζ_l)}}` adequate;
(3) a place `u_0 ∤ 2` with `π_{u_0}` an unramified twist of Steinberg, `q_{u_0}` a primitive root
modulo `l` and `ρ̄` ramified at `u_0`. Prove that `Sym^{l+1} ρ` is automorphic (ct17 Theorem 6.2,
p. 45; proof, pp. 45–46). Hypothesis (3) gives `u_0 ∤ l` and `[F(ζ_l) : F] = l − 1`, so the
cyclotomic avoidance needed in §6.8 holds. In the printed proof the compositum named `E_2` is totally
real while it is used as a CM field; the field is `E_2 = F_2 E_1 = F_2 E`, with places above `u_0`.

*Proof sketch.* `(Sym^{l+1} ρ̄)^{ss} ≅ (φρ̄ ⊗ ρ̄) ⊕ χ̄² Sym^{l−3} ρ̄` (ArithmeticGaloisRepresentations
§7.8, with `r = 2`). Pass to the CM field `E_2`; build `π′_2` from Hida theory on the definite `U_2`
(PotentialAutomorphyInfrastructurePartII §3.12 in Layer 3, which contains Clozel–Thorne II
Proposition 3.10, ct15 p. 14) with base change, Steinberg above `u_0`, and an isobaric `Π_1 ⊞ Π_2` of type `(4, l − 2)` with the
local components of §5.7. §5.10 gives a cuspidal congruent `Σ` with a long Jordan block; §6.8 shows
`Sym^{l+1} ρ|_{G_{E_2}}` automorphic; soluble descent.

**Checks.**

- For `l = 5` the conclusion is automorphy of `Sym^6`, and for `l = 7` of `Sym^8`, the inputs of
  ModularityAndLanglandsExtensions §4.31.
- Ranks: `l + 2 = 4 + (l − 2)`, `7 = 4 + 3` and `9 = 4 + 5`, matching `dim(φρ̄ ⊗ ρ̄) = 4` and
  `dim Sym^{l−3} ρ̄ = l − 2`.
- `a = 1` is excluded: with image only `SL_2(𝔽_l)`, `φρ̄ ⊗ ρ̄ ≅ ρ̄ ⊗ ρ̄` is reducible and the two blocks
  are not distinct absolutely irreducible constituents.

*Needs:* §5.10; §6.8; ArithmeticGaloisRepresentations §§7.8, 7.9; PotentialAutomorphyInfrastructurePartII
Layer 0 ("Soluble base change and descent of polarized automorphy"), Layer 3 ("Hida classicality and
independence of the characters `χ_v` modulo `λ`"); ModularityAndLanglandsExtensions §1.7.

### Examples

- `n = 3`, `p = 577`: `TS_3` is the first case not covered by §7.5 alone.
- `n = 4`, `p ≡ 1 mod 1152`: `TS_4` and hence Theorem E in rank `4` from §§7.5–7.6.

### Dependencies

Layers 2–6; ModularityAndLanglandsExtensions §§1.7, 1.15, 4.2, 4.4, 4.15; PotentialAutomorphyInfrastructurePartII
Layers 0, 3, 7, 8; SerreWeightAndLevelOptimisation §2.4; ArithmeticGaloisRepresentations §§7.8, 7.9;
EndoscopicTransferAndUnitaryTraceComparison §13.3; AutomorphicGaloisRepresentations §1.5; Chebotarev
Layer 10; Mathlib `GaussianInt`.

## Layer 8: killing ramification with n-regular refinements

This layer removes ramification relative to a level-one seed: a discriminant cuts out the
non-regular locus of a local lifting ring (nt21 Lemma 8.4), patching produces congruences to forms
with `n`-regular refinements (nt21 Proposition 8.3, the statement of ModularityAndLanglandsExtensions
§4.10), and an induction on the conductor along eigencurves gives Theorem B relative to a seed
(nt21 Proposition 8.2; nt21 pp. 91–96).

### 8.1 The non-regular locus of a local lifting ring is a principal divisor

Let `l ≠ p` be primes, `π_l` a representation with non-trivial Jacquet module, `R_l` the
fixed-determinant lifting ring of `r̄|_{G_{ℚ_l}}` on the component of `π_l`, formally smooth of
relative dimension `3`, and `φ_l` a Frobenius lift. Let `I_l ⊂ R_l` be the principal ideal generated
by the discriminant of the characteristic polynomial of `Sym^{n−1} r_l^{univ}(φ_l)` (Mathlib
`Polynomial.discr`). Prove that a `ℚ̄_p`-point `f` of `R_l` has eigenvalues `α_l`, `β_l` of
`ρ_f(φ_l)` with `(α_l/β_l)^i = 1` for some `1 ≤ i ≤ n − 1` exactly when `f(I_l) = 0`, and that
`dim R_l/I_l < dim R_l` (nt21 Lemma 8.4 and proof, pp. 95–96).

*Proof sketch.* The discriminant of the characteristic polynomial of `Sym^{n−1}` vanishes exactly
when two monomials `α^a β^b` (`a + b = n − 1`) coincide, that is when `(α/β)^i = 1` for some
`1 ≤ i ≤ n − 1`. The formally smooth ring is a domain (LocalGaloisDeformationRings §§1.1, 1.10,
2.13). If `π_l` is a Steinberg twist its Frobenius ratio is `l^{±1}`, so the discriminant is non-zero
at the given point; in the principal-series case with characters `χ_1`, `χ_2`, deform them to
`χ_1 ψ_T`, `χ_2 ψ_T^{−1}` with `ψ_T` unramified of Frobenius value `1 + T`, which preserves the
determinant and varies the ratio, so the discriminant is non-zero in the domain. A non-zero principal
ideal of a Noetherian local domain has quotient of strictly smaller dimension.

**Checks.**

- For `n = 2` the generator is `(α − β)²`, the discriminant of the Frobenius characteristic
  polynomial.
- For `n = 3` the eigenvalues of `Sym²` are `α², αβ, β²`, and the discriminant vanishes exactly when
  `α = β` or `α = −β`.
- At a Steinberg point the ratio is `l^{±1}`, never a root of unity, so the point lies off the
  divisor for every `n`.

*Needs:* LocalGaloisDeformationRings §§1.1, 1.10, 2.13; Mathlib `Polynomial.discr`.

### 8.2 A congruence to a form with n-regular refinements (Newton–Thorne I Proposition 8.3)

Let `n ≥ 2` and `π` be cuspidal on `GL_2(𝔸_ℚ)` of weight `k ≥ 2`, non-CM, with `π_l` of non-trivial
Jacquet module at every prime `l`. Prove that there are `p`, `ι` and `π′` cuspidal of weight `k` with
(1) `p > max(2(n + 1), (n − 1)k)`; (2) `r̄_{π,ι}(G_ℚ)` containing a conjugate of `SL_2(𝔽_p)`; (3)
`π_p` and `π′_p` unramified; (4) `r̄_{π,ι} ≅ r̄_{π′,ι}`; (5) every `π′_l` of non-trivial Jacquet module
and every accessible refinement of `π′_l` `n`-regular where `π′_l` is ramified (nt21 Proposition 8.3
and proof, pp. 92–96). This proves ModularityAndLanglandsExtensions §4.10. The printed proof leaves
two points implicit, which are part of the argument here: the number of patching variables is
`g = q_0 + |T| − 1`, and the auxiliary prime `q_a` is treated separately from the discriminant
argument, which runs over `T = S − {p, q_a}`.

*Proof sketch.* Choose `p` large: in the Fontaine–Laffaille range, with large image (Ribet–Momose,
AutomorphicGaloisRepresentations §7.5), and with unobstructed local problems at the ramified primes;
choose an auxiliary prime `q_a > p` with `π_{q_a}` unramified and formally smooth local lifting ring
(GL2ModularityLifting Layer 3, supplier contracts). Patch with `g = q_0 + |T| − 1` variables
(GL2ModularityLifting Layer 3; DeformationAndDerivedPatchingAlgebra §§5.6, 6.1): the patched module
`H_∞` has full support, of dimension `4|T| + q_0`, over the patched local rings. If every congruent
form failed `n`-regularity, `H_∞` would be supported on the quotient by `I = ∏_{l ∈ T} I_l`, of
smaller dimension by §8.1, a contradiction. At `q_a`, smoothness forces `q_a ≢ 1` modulo `p` and
excludes the ratio `q_a^{±1}`, so `π′_{q_a}` is unramified; the Jacquet-module condition at the other
primes holds because the inertial type is locally constant on the component and `p ∤ l(l² − 1)`.

**Checks.**

- The bound `p > (n − 1)k` puts every residual `Sym^{n−1}` lift in the Fontaine–Laffaille range:
  its Hodge–Tate weights lie in an interval of length `(n − 1)(k − 1) ≤ (n − 1)k − 1 ≤ p − 2`.
- For `n = 3`, `k = 2`: `p > max(8, 4)`, so `p ≥ 11`.
- A form with a supercuspidal component is excluded by hypothesis: its Jacquet module is zero.

*Needs:* §8.1; AutomorphicGaloisRepresentations §7.5; GL2ModularityLifting Layer 3
(gap:unobstructed-auxiliary-prime); DeformationAndDerivedPatchingAlgebra §§5.6, 6.1;
LocalGaloisDeformationRings Layer 2; ModularityAndLanglandsExtensions §1.1.

### 8.3 Theorem B relative to a level-one seed (Newton–Thorne I Proposition 8.2)

Let `n ≥ 2` and suppose that `Sym^{n−1} r_{π_0,ι}` is automorphic for one everywhere unramified
cuspidal `π_0` of `GL_2(𝔸_ℚ)` of weight `≥ 2`. Prove that for every cuspidal `π` on `GL_2(𝔸_ℚ)` of
weight `k ≥ 2`, not CM, with an `n`-regular accessible refinement at every prime where it is ramified,
`Sym^{n−1} r_{π,ι}` is automorphic for every `ι` (nt21 Proposition 8.2 and proof, pp. 91–92). The
seed hypothesis is discharged for `n = 2^r` by §7.6 and for every `n` by §14.1, which proves the
route of ModularityAndLanglandsExtensions §4.20. The printed proof leaves implicit why the
intermediate forms are not supercuspidal at the remaining ramified primes; this follows from local
constancy of the inertial type along the component.

*Proof sketch.* By §3.8 the seed gives automorphy for every level-one form. Induct on the number of
primes dividing the conductor. At a ramified prime `p`, move along the tame-level `M` `p`-adic
eigencurve, avoiding the Zariski closed set of §2.5, to a classical `π′` of level prime to `p`; §2.4
(ordinary or non-critical case) transfers automorphy. `π′_l` is not supercuspidal at the remaining
ramified primes: the restriction to `I_l` is locally constant along the component, and supercuspidal
inertial types differ from those of representations with non-trivial Jacquet module.

**Checks.**

- A semistable elliptic curve over `ℚ` has Steinberg components at its bad primes, with accessible
  refinement ratio `l^{±1}`, which is `n`-regular for every `n`; so the theorem applies to it.
- A CM form is excluded: §2.5 puts all its points in the bad locus.
- For `n = 2` the conclusion is the modularity of `r_{π,ι}` and the seed hypothesis is automatic.

*Needs:* §2.4; §2.5; §3.8; PadicFamilies §2.10; ModularityAndLanglandsExtensions §0.2.

### Examples

- `n = 3` and an elliptic curve with multiplicative reduction at `2` and `3`: its refinements at `2`,
  `3` have ratios `2^{±1}`, `3^{±1}`, so §8.3 applies directly.
- A form with a principal series `π_l = i(χ_1, χ_2)` and `χ_1/χ_2` of order `2` is not `3`-regular at
  `l`; §8.2 replaces it by a congruent form that is.

### Dependencies

Layers 2–3; LocalGaloisDeformationRings §§1.1, 1.10, 2.13 and Layer 2; AutomorphicGaloisRepresentations
§7.5; GL2ModularityLifting Layer 3; DeformationAndDerivedPatchingAlgebra §§5.6, 6.1; PadicFamilies
§2.10; ModularityAndLanglandsExtensions §§0.2, 1.1; Mathlib `Polynomial.discr`.

## Layer 9: automorphy lifting for symmetric powers

This layer proves an automorphy lifting theorem for `Sym^{n−1}` of non-ordinary weight-two Hilbert
modular forms with large projective image (nt21b Theorem 2.1, pp. 5–19), valid for every `p`
including `p = 2` and `p ≤ n`, without any vanishing of the dual Selmer group of the residual
symmetric power: the rank-two deformation ring and the conjugate self-dual pseudodeformation ring of
`Sym^{n−1}` are patched simultaneously, and regularity of the latter at an automorphic point
transfers automorphy. This proves ModularityAndLanglandsExtensions §4.11; Layer 12 runs the same
simultaneous patching for a tensor product with a fixed factor.

### 9.1 The setting: congruent non-ordinary weight-two forms with large projective image

Fix a prime `p`, a totally real field `F`, `ι : ℚ̄_p ≅ ℂ` and `n ≥ 1`. Define the setting as pairs
`(π, π′)` of regular algebraic cuspidal automorphic representations of `GL_2(𝔸_F)` of weight two,
non-CM, with `r_{π,ι}|_{G_{F_v}}` and `r_{π′,ι}|_{G_{F_v}}` not ordinary (hence potentially
Barsotti–Tate) at every `v | p`, `r̄_{π,ι} ≅ r̄_{π′,ι}`, `π_v` a twist of Steinberg exactly when `π′_v`
is for every `v ∤ p`, and for some `a ≥ 1` with `p^a > max(5, 2n − 1)`,
`PSL_2(𝔽_{p^a}) ⊂ Proj r̄_{π,ι}(G_F) ⊂ PGL_2(𝔽_{p^a})` up to conjugacy (ModularityAndLanglandsExtensions
§1.7). Prove that after a soluble totally real base change, which preserves the hypotheses and from
which the conclusion of §9.8 descends, one may assume: (6) `[F : ℚ]` even; (7)
`det r_{π,ι} = det r_{π′,ι} = ε^{−1}`; (8) `π`, `π′` unramified at `p`; (9) Iwahori-spherical away
from `p` with an even number of ramified places; (10) `r̄` trivial on `S = S_p ∪ Σ`, with
`q_v ≡ 1` modulo `p` and `π_v`, `π′_v` Steinberg on `Σ`; (11) an everywhere unramified CM quadratic
`K/F` in which `S` splits (nt21b §2, setting and Theorem 2.1, p. 5; reductions (6)–(11), p. 6).
One then works with `Π = π_K` and the pseudodeformation ring `P` of `Sym^{n−1} r̄|_{G_K}`.

*Proof sketch.* The soluble totally real extension is built from cyclic steps with prescribed split
places (PotentialAutomorphyInfrastructure §2.5) and steps with prescribed completions at `S`
(PotentialModularityAndCompatibleSystems §2.16), linearly disjoint from the field cut out by `r̄`.
Soluble base change and descent (PotentialAutomorphyInfrastructurePartII Layer 0;
EndoscopicTransferAndUnitaryTraceComparison §6.24) preserve all hypotheses and the conclusion; the
sandwich hypothesis is stable under base change disjoint from the residual field.

**API.**

- The data `(p, F, ι, n, π, π′)` with the hypotheses above.
- The integer `a` with `PSL_2(𝔽_{p^a}) ⊂ Proj r̄(G_F) ⊂ PGL_2(𝔽_{p^a})` and `p^a > max(5, 2n − 1)`.
- A soluble totally real `E/F` after which (6)–(11) hold, with the conclusion descending.
- The everywhere unramified CM quadratic `K/F` in which `S` splits, and `Π = π_K`.

**Checks.**

- For `n = 2` the bound is `p^a > 5`, so `𝔽_7` qualifies and `𝔽_5` does not; for `n = 10` it is
  `p^a > 19`, so `𝔽_{23}` and `𝔽_{25}` qualify and `𝔽_{19}` does not.
- A pair with `r_{π,ι}|_{G_{F_v}}` ordinary at some `v | p` is not in the setting.
- For `n = 1`, `Sym^0 r` is the trivial character and the conclusion of §9.8 is tautological; for
  `n = 2` the setting is a rank-two modularity lifting problem in weight two.

*Needs:* ModularityAndLanglandsExtensions §§0.2, 1.7; PotentialAutomorphyInfrastructurePartII Layer
0 ("Soluble base change and descent of polarized automorphy"); PotentialAutomorphyInfrastructure
§2.5; PotentialModularityAndCompatibleSystems §2.16; EndoscopicTransferAndUnitaryTraceComparison
§6.24.

### 9.2 Symmetric powers of Barsotti–Tate lifts and the morphism P → R

In the setting of §9.1 after the reductions, let `A` be an Artinian object of `𝒞_𝒪`, `v ∈ S_p`, and
`r̃ : G_{F_v} → GL_2(A)` a lift of `r̄` of determinant `ε^{−1}` through `R_v`, the ring of non-ordinary
crystalline lifts with Hodge–Tate weights `{0, 1}`. Prove that `A^n`, with `G_{F_v}` acting through
`Sym^{n−1} r̃`, is isomorphic to a subquotient of a lattice in a crystalline representation with
Hodge–Tate weights in `[0, n − 1]`; consequently `Sym^{n−1}` of the universal deformation restricted
to `G_K` defines a morphism `P → R` from the conjugate self-dual pseudodeformation ring, with
torsion-semistable conditions at `p`, to the rank-two deformation ring (nt21b Lemma 2.2 and proof,
p. 7; the construction of `P → R` from it, p. 8).

*Proof sketch.* The `ℤ_p[G_{F_v}]`-dual `(A²)^∨` of `A²` is the generic fibre of a finite flat group
scheme `𝒢` over `𝒪_{F_v}` (Kisin's construction of `R_v`). Raynaud's embedding of `𝒢`, dualised, gives
a Galois-stable lattice `L` in a crystalline representation with Hodge–Tate weights in `{0, 1}` and a
`G_{F_v}`-equivariant surjection `L ↠ A²` (FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4,
supplier contracts): the quotient is `A²` itself, not its dual. Hence
`Sym^{n−1}_{ℤ_p} L ↠ Sym^{n−1}_{ℤ_p} A² ↠ Sym^{n−1}_A A² = A^n`, the second map being the change of
coefficient ring from `ℤ_p` to `A`, and `Sym^{n−1}_{ℤ_p} L` is a lattice in a crystalline representation
with weights in `[0, n − 1]` (ArithmeticGaloisRepresentations §7.1). The pseudodeformation ring `P` is
defined by exactly this torsion-semistable condition (PotentialAutomorphyInfrastructurePartII Layer
9; LocalGaloisDeformationRings §8.14), so its universal property gives `P → R`.

**Checks.**

- For `n = 1`, `Sym^0 r̃` is trivial and `P → R` classifies the constant trivial pseudocharacter.
- For `n = 2` the weights of `Sym^1` are `[0, 1]`: the Barsotti–Tate condition itself.
- The quotient must be `A²`, not its dual. For `1 ⊕ ε^{−1}` (Hodge–Tate weights `{0, 1}`, since `ε` has
  weight `−1`), `Sym²` has weights `{0, 1, 2} ⊂ [0, 2]`; the dual `1 ⊕ ε` has weights `{0, −1}` and its
  `Sym²` has weights `{0, −1, −2}`, outside `[0, 2]`. Taking symmetric powers of a quotient onto the dual
  would land in the wrong interval.
- For `n = 3` the weights of `Sym²` lie in `{0, 1, 2}`, an interval of length `2 ≤ p − 2` only for
  `p ≥ 5`; the torsion-semistable formalism is what allows `p ≤ n`.

*Needs:* §9.1; PotentialAutomorphyInfrastructurePartII Layer 9 ("Semistable conjugate self-dual
pseudodeformation rings"); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20
(gap:artinian-crystalline-quotients); LocalGaloisDeformationRings §8.14;
ArithmeticGaloisRepresentations §7.1.

### 9.3 Taylor–Wiles data for symmetric powers and the rings P_Q

Let `n ≥ 2` and `N ≥ 1`. Define a Taylor–Wiles datum of level `N` as `(Q, Q̃, (α_v, β_v)_{v ∈ Q})`
with `Q` a finite set of places of `F` split in `K` and not in `S`, `q_v ≡ 1` modulo `p^N`, a chosen
factorisation `v = ṽṽ^c`, and `α_v`, `β_v` the eigenvalues of `r̄(Frob_v)` such that
`α_v^{n−1}, α_v^{n−2}β_v, …, β_v^{n−1}` are pairwise distinct. With `Δ_Q = ∏_{v ∈ Q} k(v)^×(p)`, the
deformation ring `R_Q` is an `𝒪[Δ_Q]`-algebra with `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R`. Define `P_Q` as the
quotient of the pseudodeformation ring of `G_{K,S∪Q}` parametrising pseudodeformations whose
restriction to each `G_{K_ṽ}` is the determinant of characters `χ_{v,1} ⊕ ⋯ ⊕ χ_{v,n}` lifting the
unramified characters with Frobenius `α^{n−i}β^{i−1}` (unique by the uniqueness of decompositions of
residually multiplicity-free pseudocharacters), with `χ_{v,i}|_I = χ_{v,m}^{n+1−2i}|_I` for `n = 2m`
and `χ_{v,i}|_I = χ_{v,m}^{(n+1−2i)/2}|_I` for `n = 2m + 1`; this makes `P_Q` an `𝒪[Δ_Q]`-algebra with
a map `P_Q → R_Q`, `𝒪[Δ_Q]`-linear for even `n` (nt21b §2, Taylor–Wiles data and the rings `P_Q`,
pp. 8–9).

*Proof sketch.* The decomposition into characters uses uniqueness for residually multiplicity-free
pseudocharacters (IntegralHeckeAndGaloisDeterminants §1.4). The inertial relations are those
obtained by applying `Sym^{n−1}` to the rank-two local characters (GlobalGaloisDeformations §5.5).

**API.**

- A level-`N` datum `(Q, Q̃, (α_v, β_v))` with the distinctness condition.
- `Δ_Q = ∏_{v ∈ Q} k(v)^×(p)` and the `𝒪[Δ_Q]`-structures on `R_Q` and `P_Q`, with
  `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R` and `P_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ P`.
- The map `P_Q → R_Q` induced by `Sym^{n−1}`: at each auxiliary place it sends the two ordered
  rank-two characters to the ordered monomials, and it is `𝒪[Δ_Q]`-linear for `n` even.

**Checks.**

- For `n = 3` the condition is that `α², αβ, β²` are distinct, i.e. `α ≠ ±β`.
- For `n = 2` the monomials are `α`, `β`, the inertial characters satisfy
  `χ_{v,1}|_I = χ_{v,2}^{−1}|_I`, and this is the rank-two Taylor–Wiles condition with fixed
  determinant.
- If `α_v/β_v` is a primitive cube root of unity and `n = 4`, then `α³ = β³`, distinctness fails, and
  `v` is not a Taylor–Wiles place for `n = 4`; for `n = 1` the formula for `χ_{v,m}` would involve
  `m = 0`, which is why `n ≥ 2`.

*Needs:* §9.2; GlobalGaloisDeformations §§5.5, 8.5; PotentialAutomorphyInfrastructurePartII Layer 4
("Taylor–Wiles data with a residual eigenspace"), Layer 9 ("Semistable conjugate self-dual
pseudodeformation rings"); IntegralHeckeAndGaloisDeterminants §1.4.

### 9.4 Definite unitary Hecke modules with twisted Taylor–Wiles level

Let `G` be the definite unitary group over `F` split by `K` (PotentialAutomorphyInfrastructurePartII
Layer 3), `H_G(V)` the `𝒪`-valued functions on `G(F) \ G(𝔸_F^∞)/V`, `V_0` Iwahori at `Σ`, `n ≥ 2`,
`N ≥ 1`, and assume `Sym^{n−1} r_{π′,ι}` automorphic (this supplies the non-zero localised unitary
module). A Taylor–Wiles datum gives `V_0(Q)` (Iwahori at `Q`) and `V_1(Q; N) ⊂ V_0(Q)`, cut out at
`v ∈ Q` by requiring `∏_i a_{ii}^{n+1−2i}` (`n` even) or `∏_i a_{ii}^{(n+1−2i)/2}` (`n` odd) to map
to `1` in `k(ṽ)^×(p)/(p^N)`, so `V_0(Q)/V_1(Q; N) ≅ Δ_Q/(p^N)`; with Hecke operators `T_w^{(i)}`,
`U_{ϖ_ṽ}^{(i)}`, maximal ideals `𝔪_G` (Hecke eigenvalues of `Sym^{n−1} r̄`) and `𝔪_{G,Q}`, and
twisting by characters `θ` of `U_1` through `det`. Prove: (Lemma 2.4) for `n` even and `p = 2`, each
quadratic `χ` of `F^× \ (𝔸_F^∞)^×/det U_1(Q; N)` has a unique `θ_χ` with `θ_χ(z/z^c) = χ(z z^c)`;
(Proposition 2.5) for a datum of level `N + c_G`, where `p^{c_G}` kills the `p`-primary parts of the
finitely many base-level stabilisers, `𝔪_G` and `𝔪_{G,Q}` are in the supports, `H_G(V_1(Q; N))_{𝔪_{G,Q}}`
is free over `𝒪[Δ_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`, and it is a `P_Q`-module on which
the universal characteristic-polynomial coefficients at `Frob_w` act by `q_w^{i(i−1)/2} T_w^{(i)}`,
compatibly with the `Δ_Q`-actions (nt21b §2, unitary Hecke modules, pp. 10–11; Lemma 2.4, p. 11;
Proposition 2.5, p. 11).

*Proof sketch.* At level `N + c_G` the congruence conditions put the `p`-primary stabiliser images in
`V_1(Q; N)`, so the deck group `Δ_Q/(p^N)` acts freely on the localised double quotient; exactness and
freeness (PotentialAutomorphyInfrastructurePartII Layer 3) give a free module whose coinvariants are
`H_G(V_0)_{𝔪_G}` by the trace. Support of `𝔪_G`: Labesse's descent of `Sym^{n−1}` of the automorphic
`π′_K` to `G` (EndoscopicTransferAndUnitaryTraceComparison §6.29). The `P_Q`-module structure: the
Hecke-valued determinant restricted at `ṽ ∈ Q` decomposes into characters by uniqueness, matching
the definition of `P_Q`. Lemma 2.4: Hilbert 90 for `0 → 𝔾_m → Res_{K/F} 𝔾_m → U_1 → 0`. For `p = 2`
the constructions of Layer 3 are used in the dyadic case (supplier contracts).

**API.**

- The level `V_1(Q; N)` with `V_0(Q)/V_1(Q; N) ≅ Δ_Q/(p^N)`.
- The maximal ideals `𝔪_G` and `𝔪_{G,Q}`.
- Freeness of `H_G(V_1(Q; N))_{𝔪_{G,Q}}` over `𝒪[Δ_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`.
- The `P_Q`-module structure, with `Λ_i^{univ}(Frob_w)` acting as `q_w^{i(i−1)/2} T_w^{(i)}`.
- For `p = 2` and `n` even, the unique quadratic `θ_χ` with `θ_χ(z/z^c) = χ(z z^c)`.

**Checks.**

- For `n = 2` the exponents `n + 1 − 2i` are `1, −1`: `V_1` is the kernel of
  `a_{11}/a_{22} ↦ k(ṽ)^×(p)/(p^N)`.
- For `n = 3` the exponents `(n + 1 − 2i)/2` are `1, 0, −1`: the character `a_{11}/a_{33}`.
- If the congruence level is only `N` and a `p`-primary stabiliser has non-trivial image in the deck
  group, its action on the double quotient has a fixed orbit and freeness fails; the offset `c_G`
  removes this.
- At `N = 1`, tensoring with `𝒪` along the augmentation of `𝒪[Δ_Q/(p)]` gives `H_G(V_0)_{𝔪_G}` with its
  Hecke action.

*Needs:* §9.3; PotentialAutomorphyInfrastructurePartII Layer 3 ("Algebraic modular forms on a
definite unitary group"; "Exactness and group-ring freeness at level without `l`-torsion"; "Residual
and `𝒢_n`-valued Galois representations of Hecke maximal ideals"; "Base change and descent between
definite unitary groups and `GL_n`"), Layer 4 ("Taylor–Wiles level structures and the parahoric
projection"); PotentialAutomorphyInfrastructurePartII (gap:dyadic-definite-unitary-forms);
EndoscopicTransferAndUnitaryTraceComparison §6.29.

### 9.5 Patching for symmetric powers, p > 2

In the setting of §9.1 with `p > 2`, `n ≥ 2` and `Sym^{n−1} r_{π′,ι}` automorphic, let
`q = dim_k H¹(F_S/F, ad⁰ r̄(1))` and `g = q + |S ∪ S_∞| − 1`. Prove: (Lemma 2.7) for every `N` there is
a Taylor–Wiles datum of level `N` with a surjection `R^{loc}[[X_1, …, X_g]] → R^□_Q`; (Proposition
2.6) there are `W_∞ = 𝒪[[Y_1, …, Y_q, Z_1, …, Z_{4|S∪S_∞|−1}]]`, complete Noetherian local
`W_∞`-algebras `P_∞`, `R_∞` with `P_∞ ⊗ 𝒪 ≅ P` and `R_∞ ⊗ 𝒪 ≅ R`, a surjection
`R^{loc}[[X_1, …, X_g]] → R_∞`, a `P_∞`-module `H_{G,∞}` and an `R_∞`-module `H_{D,∞}`, both finite free
over `W_∞`, specialising to `H_G = H_G(V_0)_{𝔪_G}` and to `H_D` (quaternionic forms of level `U_0`
localised at `𝔪_D`), and a morphism `P_∞ → R_∞` compatible with `P → R` (nt21b Proposition 2.6,
p. 13; Lemma 2.7, p. 14; proof, pp. 14–17).

*Proof sketch.* Lemma 2.7: Chebotarev and the vanishing of `H¹(PSL_2(𝔽_{p^a}), ad⁰)` give
Taylor–Wiles primes with `Frob_v` regular for `Sym^{n−1}` (`(α/β)^i ≠ 1` for `i < n`), as in
GlobalGaloisDeformations §5.7 with the stronger distinctness condition (GlobalGaloisDeformations
Layer G7, supplier contracts). Patch the modules of §9.4 and the quaternionic modules
(GL2ModularityLifting Layers 2–3) simultaneously over the framed rings
(DeformationAndDerivedPatchingAlgebra §5.6), with a uniform bound on the generators of `P_N`.

**Checks.**

- `dim W_∞ = 1 + q + 4|S ∪ S_∞| − 1`, which equals `dim R^{loc}[[X_1, …, X_g]]` when the local rings
  have the expected dimensions.
- For `n = 2`, `P_∞ → R_∞` is the inclusion of the trace subring and the statement is the rank-two
  patching of GL2ModularityLifting Layer 3.
- For `p = 3`, `p^a > max(5, 2n − 1)` forces `a ≥ 2`: projective image `PSL_2(𝔽_3) ≅ A_4` is never in
  the setting.

*Needs:* §§9.3, 9.4; GL2ModularityLifting Layers 2–3; DeformationAndDerivedPatchingAlgebra §5.6;
GlobalGaloisDeformations §5.7 (gap:tensor-taylor-wiles-primes); Chebotarev Layer 10.

### 9.6 Patching for symmetric powers, p = 2

In the setting of §9.1 with `p = 2`, `n ≥ 2` and `Sym^{n−1} r_{π′,ι}` automorphic, let
`q = dim_k H¹(F_S/F, ad r̄) − 2`, `g = 2q + 1` and `γ = 2 − |S ∪ S_∞| + q`. Prove: (Lemma 2.9)
`q ≥ |S ∪ S_∞| − 2`, and for every `N` there is a Taylor–Wiles datum of level `N` with `|Q| = q`, a
surjection `R^{loc}[[X_1, …, X_g]] → R′^□_Q`, and `Θ_Q/(2^N) ≅ (ℤ/2^N)^γ` for `Θ_Q` the Galois group of
the maximal abelian pro-`2` extension of `F` unramified outside `Q` and `(S ∪ S_∞)`-split;
(Proposition 2.8) there are data as in §9.5 but with surjections
`R^{loc}[[X_1, …, X_g]] → R′_∞ → R_∞`, a free action of `Ĝ_m^γ` on `Sp R′_∞` with an equivariant
`δ : Sp R′_∞ → Ĝ_m^γ` (`Ĝ_m^γ` acting on itself by the square), `δ^{−1}(1) = Sp R_∞`, the action of
`Ĝ_m^γ[2](𝒪)` on `R_∞` lifting to `H_{D,∞}`, and an action of `Ĝ_m^γ[2]` on `Sp P_∞` making
`Sp R_∞ → Sp P_∞` equivariant and lifting to `H_{G,∞}` (nt21b Proposition 2.8, p. 17; Lemma 2.9, p. 18;
proof, pp. 18–19).

*Proof sketch.* Lemma 2.9: the dyadic Taylor–Wiles sets (GlobalGaloisDeformations §§5.3–5.4) with the
stronger distinctness condition (GlobalGaloisDeformations Layer G7, supplier contracts). Patch as in
GL2ModularityLifting §§6.1, 6.6, 6.7: import the compatible free action chunks detecting
Artinian stabilizers, their free patched action and determinant-fibre comparison. Retain the
quadratic twists from `Θ_Q`, the twisting characters of §9.4 on the unitary side, and their
compatible actions on the pseudodeformation ring and both modules through
DeformationAndDerivedPatchingAlgebra (gap:formal-torus-patching).

**Checks.**

- For `γ = 0` there is no twisting action and `R′_∞ = R_∞`.
- The free rank-two patched action, quotient and torsor are imported; the simultaneous
  actions on `P_∞` and both modules and component transitivity are the additional input. In rank one,
  squaring on `Ĝ_m` is `1 + x ↦ (1 + x)²`, that is `y = 2x + x²`: finite flat of degree `2` at `p = 2` and an
  invertible substitution at odd `p` (GlobalGaloisDeformations §4.11). This degree computation alone
  supplies neither the action on `H_{D,∞}`, `H_{G,∞}` nor the transitivity on components of `Spec R_∞`.
- `Sp R_∞ = δ^{−1}(1)` is a fibre of a map to the `γ`-dimensional `Ĝ_m^γ`, so
  `dim R_∞ ≥ dim R′_∞ − γ`, with equality because the action is free and `δ` is equivariant for the
  square map, which is finite flat.
- Square-equivariance alone does not imply freeness: on `ℤ₂[[y]]`, with `δ = 1 + y`
  and `1 + y ↦ λ²(1 + y)`, `λ = −1` fixes `y`; over `ℤ/4`, `−1 = 3 ≠ 1`, so
  the free-action-chunk premise fails. In contrast, translation on `1 + x` sends it to
  `−1 − x`, different modulo `4`, while `δ = (1 + x)²` is square-equivariant. Its
  determinant-one fibre is `ℤ₂[[x]]/(x² + 2x)`, finite flat of degree `2`.
- The quadratic `θ_χ` of §9.4 is what lets `Ĝ_m^γ[2]` act on `H_{G,∞}`; for odd `n` no such twisting
  is needed on the unitary side.

*Needs:* §§9.3, 9.4; GL2ModularityLifting §§6.1, 6.6, 6.7; GlobalGaloisDeformations §§4.6, 4.11, 5.3–5.4
(gap:tensor-taylor-wiles-primes); DeformationAndDerivedPatchingAlgebra §5.4
(gap:formal-torus-patching); ArithmeticGaloisDuality §R02.3.5.

### 9.7 Regularity of P at an automorphic point transfers automorphy

Let `p_∞`, `p′_∞` be the points of `Spec P_∞` defined by the pseudocharacters
`t = Sym^{n−1} r|_{G_K}` and `t′ = Sym^{n−1} r′|_{G_K}`, with `t′` automorphic. Prove: (`p > 2`)
`H_{G,∞}` and `H_{D,∞}` are Cohen–Macaulay with all components of their supports of dimension
`q + 4|S ∪ S_∞|`, so `R^{loc}[[X]] → R_∞` is an isomorphism, `R_∞` is a domain and `H_{D,∞}` is
faithful; since the localisation `P_{(p′)}` is its residue field `E`, `P_∞` is regular of dimension
`q + 4|S ∪ S_∞| − 1` at `p′_∞`, a unique component of `Spec P_∞` through `p′_∞` lies in
`Supp H_{G,∞}`, `Spec R_∞` maps into it, and `p ∈ Supp_P H_G`; (`p = 2`) the dimension argument gives
`R^{loc}[[X]] ≅ R′_∞`; `Spec R′_∞` and the invariant ring `R_∞^{inv}` are irreducible,
`Sp R_∞ → Sp R_∞^{inv}` is a `Ĝ_m^γ[2]`-torsor on represented complete-local functors whose
`𝒪`-points act transitively on components; a translate of the automorphic point on a component
containing the target point lies in the support by equivariance, regularity transfers to it, and the
unique-component argument puts `p_∞` in the support (nt21b proof of Theorem 2.1 for `p > 2`,
pp. 12–13; for `p = 2`, pp. 17–18). No assertion that `R_∞` is a domain is made for `p = 2`.

*Proof sketch.* Let `Π′_n` be the RACSDC representation of `GL_n(𝔸_K)` with
`r_{Π′_n,ι} ≅ Sym^{n−1} r′|_{G_K}` (the automorphy of `t′`). `P_{(p′)} = E` because the adjoint
Bloch–Kato Selmer group of `Π′_n` vanishes (ModularityAndLanglandsExtensions §4.1;
PotentialAutomorphyInfrastructurePartII §9.7); counting dimensions lifts this to regularity of
`P_∞` at `p′_∞`. The enormous-image hypothesis of that section, that `r_{Π′_n,ι}(G_{K(ζ_{p^∞})})` is
enormous, holds. Let `G` be the Zariski closure of `r′(G_F)` over `Ē`; `G⁰` is reductive because `r′`
is irreducible. If `G⁰` were a torus, then either it is scalar, which the distinct Hodge–Tate weights
`{0, 1}` exclude (Sen's theorem puts a non-scalar element in `Lie G`, PadicHodgeTheory §4.4), or `G`
permutes its two eigenlines, so that `r′` is reducible or induced from an index-two subgroup and
`Proj r̄_{π′,ι}(G_F)` has a soluble subgroup of index at most `2` (the image of a subgroup acting by
upper triangular matrices) and is soluble, which is impossible as it contains the non-soluble group
`PSL_2(𝔽_{p^a})`, `p^a > 5`. Hence `G` contains `SL_2`
(ArithmeticGaloisRepresentations §7.6). `K(ζ_{p^∞})/F` is abelian, being the compositum of `K` and the
cyclotomic tower, so `r′(G_{K(ζ_{p^∞})})` contains the commutator subgroup of `r′(G_F)` and its
Zariski closure contains the derived group of `G`, hence `SL_2` (§7.6 there: the closure of a
commutator subgroup is the derived group of the closure). The identity component of the Zariski
closure of `Sym^{n−1} r′(G_{K(ζ_{p^∞})})` therefore contains `Sym^{n−1}(SL_2)`, which acts absolutely
irreducibly in characteristic zero and contains `Sym^{n−1} diag(a, a^{−1})`, of eigenvalues
`a^{n−1−2j}` (`0 ≤ j ≤ n − 1`), distinct when `a` is not a root of unity. After enlarging `E` so that
the characteristic polynomial of every element of the image splits (possible because `E` has only
finitely many extensions of degree at most `n`), the criterion of ArithmeticGaloisRepresentations
§7.10 makes the image enormous. Cohen–Macaulay modules finite free over `W_∞` have full-dimensional support
components (DeformationAndDerivedPatchingAlgebra §§5.5, 6.1, 6.7). The dyadic case uses the torsor of
GlobalGaloisDeformations §4.11 and the component transitivity of the formal-torus contract.

**Checks.**

- If `P` were not regular at `p′_∞` (non-zero adjoint Selmer group), several components of
  `Spec P_∞` could pass through `p′_∞` and the argument would give nothing.
- For `n = 2`, `P_∞ ⊂ R_∞` and the statement is the rank-two `R = T` support argument.
- For `p > 2` the dimension `q + 4|S ∪ S_∞|` of the support components equals
  `dim W_∞ = 1 + q + 4|S ∪ S_∞| − 1`, as it must for a Cohen–Macaulay module finite free over `W_∞`.
- The regular witness depends on `n`: the eigenvalues `a^{n−1−2j}` of `Sym^{n−1} diag(a, a^{−1})` are
  distinct exactly when `a^{2m} ≠ 1` for `1 ≤ m ≤ n − 1`, which every `a` of infinite order satisfies.
  For `n = 2` this is `a² ≠ 1`, the first Check of ArithmeticGaloisRepresentations §7.10. For `n = 3`,
  `a = 2` gives eigenvalues `4, 1, 1/4`, distinct, while `a = −1` gives `1, 1, 1` and `a = i` gives
  `−1, 1, −1` (`i⁴ = 1`, `m = 2`).
- For a CM form, `r′ = Ind_{G_L}^{G_F} χ`, the hypothesis fails and the non-CM condition of §9.1
  excludes it: the Zariski closure of the image is the normaliser of a torus, and `Sym² r′` contains
  the line on which `G_L` acts by `χ χ^c`, so it is reducible (dimensions `2 + 1`) and its image is not
  enormous.

*Needs:* §§9.5, 9.6; §9.1; PotentialAutomorphyInfrastructurePartII Layer 9 ("The pseudodeformation ring is
its residue field at an automorphic point"); ModularityAndLanglandsExtensions §4.1;
ArithmeticGaloisRepresentations §§7.6, 7.10; PadicHodgeTheory §4.4; GlobalGaloisDeformations §4.11;
DeformationAndDerivedPatchingAlgebra §§5.5, 5.6, 6.1, 6.7 (gap:formal-torus-patching).

### 9.8 Automorphy lifting for symmetric powers (Newton–Thorne II Theorem 2.1)

In the setting of §9.1, prove that if `Sym^{n−1} r_{π′,ι}` is automorphic then `Sym^{n−1} r_{π,ι}` is
automorphic (nt21b Theorem 2.1, p. 5; proof, pp. 12–19). This proves ModularityAndLanglandsExtensions
§4.11; no vanishing of the dual Selmer group of the residual symmetric power is assumed, and `p = 2`
and `p ≤ n` are allowed.

*Proof sketch.* `n = 1` is tautological. For `n ≥ 2` reduce by soluble base change (§9.1). §9.7 puts
`Sym^{n−1} r|_{G_K}` in the support of `H_G`, which gives a RACSDC `Π_n` on `GL_n(𝔸_K)` with
`r_{Π_n,ι} ≅ Sym^{n−1} r|_{G_K}` (EndoscopicTransferAndUnitaryTraceComparison §6.29). Descend from
`K` to `F` and along the soluble base change of §9.1 (PotentialAutomorphyInfrastructurePartII Layer
0, "Soluble base change and descent of polarized automorphy"; `Sym^{n−1} r|_{G_K}` is irreducible by
the large image hypothesis).

**Checks.**

- For `n = 1` the conclusion is the automorphy of the trivial character; for `n = 2` it is
  weight-two modularity lifting.
- At `p = 2`, `n = 3` the bound `2^a > 5` needs `a ≥ 3`, i.e. projective image `PSL_2(𝔽_8)` or larger.
- The hypothesis on Steinberg places is needed: it makes the local conditions at `Σ` the same for
  `π` and `π′`.

*Needs:* §9.7; §9.1; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and
descent of polarized automorphy"), Layer 3 ("Base change and descent between definite unitary groups
and `GL_n`"); EndoscopicTransferAndUnitaryTraceComparison §6.29.

### Examples

- `F = ℚ`, `p = 7`, `n = 3`: two non-ordinary weight-two newforms with the same residual
  representation of projective image `PGL_2(𝔽_7)` and the same Steinberg primes; automorphy of
  `Sym²` passes from one to the other.
- `p = 2`, `n = 4`: `2^a > 7` needs `a ≥ 3`; the twisting characters of Lemma 2.4 enter since `n` is
  even.

### Dependencies

ModularityAndLanglandsExtensions §§0.2, 1.7; PotentialAutomorphyInfrastructurePartII Layers 0, 3,
4, 9 (gap:dyadic-definite-unitary-forms); PotentialAutomorphyInfrastructure §2.5;
PotentialModularityAndCompatibleSystems §2.16; GlobalGaloisDeformations §§4.6, 4.11, 5.3–5.5, 5.7, 8.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory
Layer R07.4; LocalGaloisDeformationRings §8.14; IntegralHeckeAndGaloisDeterminants §1.4;
GL2ModularityLifting Layers 2, 3, 6; DeformationAndDerivedPatchingAlgebra §§5.4, 5.5, 5.6, 6.1, 6.7;
EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.29; ArithmeticGaloisRepresentations §§7.1,
7.6, 7.10; PadicHodgeTheory §4.4; ArithmeticGaloisDuality §R02.3.5; Chebotarev Layer 10.

## Layer 10: seasoned representations and the removal of supercuspidal primes

This layer extends Theorem B to every non-CM modular form by an induction on the number of
supercuspidal primes (nt21b Theorem 3.1, pp. 20–27): seasoned representations have large residual image at every
supercuspidal prime, a non-ordinary weight-two congruence removes one supercuspidal prime, and §9.8
transfers automorphy. As in Layer 8, the theorems are stated relative to a level-one seed, discharged
in Layer 14; the endpoint is the statement of ModularityAndLanglandsExtensions §4.29.

### 10.1 The semisimple conductor and the supercuspidal primes of a modular form

For `π` regular algebraic cuspidal on `GL_2(𝔸_ℚ)`, define `sc(π)` as the set of primes `p` with `π_p`
supercuspidal and the semisimple conductor `M_π = ∏_l N((rec_{ℚ_l} π_l)^{ss})`, the product of the
Artin conductors of the semisimplified Weil–Deligne representations (GL2AutomorphicRepresentationsAndTransfer
§§R16.3.1–R16.3.3, R16.3.5). Prove that `M_π` divides the conductor `N(π)`, and (Lemma 3.3) that if
`p` is odd and `r̄_{π,ι}` is reducible or dihedral, the prime-to-`p` part of the conductor of
`r̄_{π,ι}` divides `M_π` (nt21b Introduction, p. 2; Definition 3.2 and Lemma 3.3, p. 20).

*Proof sketch.* Semisimplification forgets monodromy, so a Steinberg component contributes only its
unramified part. For odd `p` a reducible or dihedral residual representation has semisimplified
image of order prime to `p`, so its local monodromy vanishes after semisimplification; reduction of
the characteristic-zero semisimplified Weil representation then bounds the prime-to-`p` conductor by
`M_π` (ArithmeticGaloisRepresentations §§3.3, 3.6, where only the bound by the full conductor
including monodromy is supplied; the sharper bound is this target).

**API.**

- `sc(π)`, the primes where `π_p` is supercuspidal.
- `M_π = ∏_l N((rec π_l)^{ss})`, dividing `N(π)`.
- Lemma 3.3: for `p` odd and `r̄` reducible or dihedral, the prime-to-`p` conductor of `r̄` divides
  `M_π`.

**Checks.**

- For `π_l = St ⊗ χ` with `χ` unramified, `N((rec π_l)^{ss}) = 1` although `N(π_l) = l`.
- If no `π_l` is supercuspidal, `sc(π) = ∅`, the case of §8.3; for a semistable elliptic curve also
  `M_π = 1`.
- For a depth-zero supercuspidal `π_l`, induced from a tamely ramified character of the unramified
  quadratic extension, `N((rec π_l)^{ss}) = l²`.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R16.3.1–R16.3.3, R16.3.5;
ArithmeticGaloisRepresentations §§3.3, 3.6.

### 10.2 Non-ordinary weight-two congruences with controlled type at p

Let `π` be regular algebraic cuspidal on `GL_2(𝔸_ℚ)` with `Proj r̄_{π,ι}(G_ℚ)` containing a conjugate
of `PSL_2(𝔽_{p^a})`, `p^a > 5`. Prove: (Lemma 3.4) there is `π′` with `r̄_{π′,ι} ≅ r̄_{π,ι}`, `π′` of
weight `2` and not ι-ordinary, `rec π′_p ≅ ω_1 ⊕ ω_2` with `ω_i` of conductor dividing `p³`, and for
`l ≠ p`, `π_l` Steinberg (resp. supercuspidal) exactly when `π′_l` is; (Lemma 3.5) if moreover
`p ≥ 3`, `π′` can be chosen with in addition `r_{π,ι}|_{G_{ℚ_l}} ∼ r_{π′,ι}|_{G_{ℚ_l}}` (strongly
connected) for every `l ≠ p`, in particular `N(π_l) = N(π′_l)` (nt21b Lemma 3.4 and proof,
pp. 20–22; Lemma 3.5, pp. 22–23).

*Proof sketch.* Lemma 3.4: Breuil–Mézard types at the supercuspidal primes, a quaternion algebra
ramified at the Steinberg primes, a neat level, and a dimension count on the slope-`(0, 1)` part of
cohomology of level `U_0(p³)` via Hida theory (PadicFamilies §5.8 for the control theorem;
GL2ModularityLifting Layer 3, supplier contracts, for the slope-`(0, 1)` dimension count;
SerreWeightAndLevelOptimisation §6.9 for quaternionic level raising); non-ordinarity follows. Lemma
3.5: prescribed-type lifts (PotentialModularityAndCompatibleSystems §10.10) with strong connection
(PotentialAutomorphyInfrastructurePartII Layer 1).

**Checks.**

- If `π` already has weight `2`, is not ordinary and has the required type at `p`, `π′ = π` works.
- `p^a = 5` is excluded: `PSL_2(𝔽_5) ≅ A_5` is the exceptional case of the large-image arguments.
- Lemma 3.5 needs `p ≥ 3` because the prescribed-type lifting theorem used is for odd `p`.

*Needs:* §10.1; PotentialModularityAndCompatibleSystems §10.10; PotentialAutomorphyInfrastructurePartII
Layer 1 ("Strong connection and component deformation problems"; "Properties of strong connection;
Choi's lemma and the filtration lemma"); PadicFamilies §5.8; SerreWeightAndLevelOptimisation §6.9;
GL2ModularityLifting Layer 3 (gap:slope-zero-one-dimension-count).

### 10.3 Seasoned automorphic representations

Fix `n ≥ 3`. Let `π` be regular algebraic cuspidal on `GL_2(𝔸_ℚ)` of weight `2` with `2 ∉ sc(π)`, and
`q`, `t`, `r` primes. Define `π` to be seasoned with respect to `(q, t, r)` if (1) `t | q + 1`,
`t ∉ sc(π)`, `t > max(10, 8n(n − 1))` and `(q + 1)/t > 2`; (2) `rec π_q ≅ Ind_{W_{ℚ_{q²}}}^{W_{ℚ_q}} χ`
with `χ|_{I_{ℚ_q}}` of order `t` (so `q ∈ sc(π)` and `N(π_q) = q²`); (3) `r` is a primitive root
modulo `q` and `r ≡ 1` modulo `M`, the lcm of the prime-to-`q` part of `M_π` and
`∏_{p ∈ sc(π) − {q}} p⁶`; (4) `π_r` is an unramified twist of Steinberg; (5) for each `p ∈ sc(π)`
and each irreducible dihedral `ρ : G_ℚ → GL_2(𝔽̄_p)` of prime-to-`p` conductor dividing `Mq²` there is
a prime `s` with `π_s` an unramified Steinberg twist, `ρ(Frob_s)` scalar and `s ≢ 1` modulo `p`
(nt21b Definition 3.6, p. 23). This is a variant of Khare–Wintenberger's good-dihedral condition
(ClassicalSerreModularity Layer R27.1) with an extra Steinberg prime, and it depends on `n` through
the bound on `t`.

**API.**

- The predicate "`π` is seasoned with respect to `(q, t, r)`", conditions (1)–(5).
- If `π` is seasoned with respect to `(q, t, r)` then `q ∈ sc(π)` and `N(π_q) = q²`.
- The bounds `t > max(10, 8n(n − 1))`, `t | q + 1` and `(q + 1)/t > 2`.
- Removing a supercuspidal prime `p ≠ q` as in §10.6 preserves seasoning with respect to `(q, t, r)`.

**Checks.**

- For `n = 3`, `t > max(10, 48) = 48`, so the smallest admissible `t` is `53` (`49 = 7²` and
  `51 = 3 · 17` are not prime).
- With `t = 53` one needs `q ≡ −1` modulo `53` and `(q + 1)/53 > 2`: `q = 158` (`q + 1 = 3 · 53`) is not
  prime, and `q = 211` (`q + 1 = 4 · 53`) is the least choice.
- A representation with `2 ∈ sc(π)` is never seasoned.

*Needs:* §10.1; ClassicalSerreModularity Layer R27.1; GL2AutomorphicRepresentationsAndTransfer
§R16.3.7.

### 10.4 Seasoned representations have large residual image at supercuspidal primes

Prove that if `π` is seasoned with respect to `(q, t, r)`, then for each `p ∈ sc(π)` there is
`ι : ℚ̄_p ≅ ℂ` with `PSL_2(𝔽_{p^a}) ⊂ Proj r̄_{π,ι}(G_ℚ) ⊂ PGL_2(𝔽_{p^a})` after conjugation, for some
`p^a > max(5, 2n − 1)`, and with linear image containing `SL_2(𝔽_{p^a})` (nt21b Proposition 3.7 and
proof, pp. 23–24).

*Proof sketch.* For `p = q`: irreducibility from the Steinberg prime `r` and the niveau-two
description of potentially Barsotti–Tate residual types (FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.5.10); non-dihedrality from condition (5) and Lemma 3.3 (§10.1); a choice of `ι` gives
projective elements of order `≥ t/2 > 4n(n − 1)`. For `p ≠ q`: inertia at `q` has projective image of
order `t`. Dickson's classification (ArithmeticGaloisRepresentations §4.4) then gives the conclusion,
including the linear statement.

**Checks.**

- The bound `p^a > 2n − 1` is the input §9.1 needs at `p`.
- A projective element of order `t > 5` excludes the exceptional images `A_4`, `S_4`, `A_5`, whose
  element orders are at most `5`.
- Without (5), a dihedral residual representation of small conductor could occur at some
  `p ∈ sc(π)`.

*Needs:* §§10.1, 10.3; ArithmeticGaloisRepresentations §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.5.10.

### 10.5 Making a representation seasoned

Fix `n ≥ 3`. Let `π` be regular algebraic cuspidal on `GL_2(𝔸_ℚ)` of weight `2`, non-CM, with
`2, 3 ∉ sc(π)`. Prove that there is `π′` regular algebraic cuspidal with (1) primes `(q, t, r)` such
that `π′` is seasoned with respect to `(q, t, r)` and `sc(π′) = sc(π) ∪ {q}`; (2) `Sym^{n−1} π′` exists
exactly when `Sym^{n−1} π` does (nt21b Proposition 3.9 and proof, pp. 24–25).

*Proof sketch.* Choose `t > max(10, 8n(n − 1), N(π))`, `t ≡ 1 mod 4`, with
`Proj r̄_{π,ι_t}(G_ℚ)` conjugate to `PSL_2(𝔽_t)` or `PGL_2(𝔽_t)`, so that `r̄_{π,ι_t}(G_ℚ)` contains a
conjugate of `SL_2(𝔽_t)`;
`q ≡ −1` modulo `t` with `Frob_q` conjugate to complex conjugation; `r` and the primes `s` by
Chebotarev (Chebotarev Layer 10), using the description of `Gal(L_1 L_2/K)` for two finite Galois
extensions as pairs of automorphisms agreeing on `L_1 ∩ L_2`. Prescribed-type lifts
(PotentialModularityAndCompatibleSystems §10.10) give `π′` congruent to `π` at `t` with the new local
components. Potentially diagonalizable automorphy lifting (ModularityAndLanglandsExtensions §2.16) shows `Sym^{n−1} π′` automorphic exactly when `Sym^{n−1} π` is: both are Fontaine–Laffaille
at `t` (ModularityAndLanglandsExtensions §2.1), `Sym^{n−1}` of `SL_2(𝔽_t)` is irreducible because
`t > n − 1`, and the image of `G_{ℚ(ζ_t)}` under `Sym^{n−1} r̄_{π,ι_t}` is adequate: it contains
`Sym^{n−1}(SL_2(𝔽_t))`, since the perfect group `SL_2(𝔽_t)` lies in the image of `G_ℚ` and the
quotient by the image of `G_{ℚ(ζ_t)}` is abelian, and `t > 8n(n − 1) ≥ 2n + 2`
(ArithmeticGaloisRepresentations §7.9, symmetric powers, clause (3)). Irreducibility alone does not
give adequacy.

**Checks.**

- The new supercuspidal prime is `q`; `sc` grows by exactly one.
- `t > N(π)` makes `t` prime to the conductor, so `π` and `π′` are both crystalline at `t`.
- `t ≡ 1 mod 4` and `Frob_q` conjugate to complex conjugation give `q ≡ −1` modulo `t` compatibly with
  the dihedral type at `q`.
- `t > n − 1` gives irreducibility but not adequacy. For `t = n = 13`, `Sym^{12}` of `SL_2(𝔽_{13})`
  is irreducible of dimension `13`, but the identity `I_{13}` is a non-zero invariant element of
  trace `13 = 0` in `𝔽_{13}`, so `H⁰(H, ad⁰) ≠ 0` and the image is not adequate. The bound
  `t > 8n(n − 1)` excludes it (`13 ≤ 1248`); for `n = 3` and `t = 53`, `53 > 48` and `53 ≥ 2n + 2 = 8`,
  so both the irreducibility and the adequacy criterion apply.

*Needs:* §10.3; PotentialModularityAndCompatibleSystems §10.10; ModularityAndLanglandsExtensions §§2.1, 2.16;
ArithmeticGaloisRepresentations §7.9; Chebotarev Layer 10.

### 10.6 Removing one supercuspidal prime

Fix `n ≥ 3`. Let `π` be regular algebraic cuspidal on `GL_2(𝔸_ℚ)` of weight `2`, seasoned with respect
to `(q, t, r)`, and `p ∈ sc(π)` with `p ≥ 5`. Prove that there is `π′` of weight `2`, non-CM, with
`sc(π′) = sc(π) − {p}`, still seasoned with respect to `(q, t, r)` if `p ≠ q`, such that if
`Sym^{n−1} π′` exists then `Sym^{n−1} π` exists (nt21b Proposition 3.10 and proof, pp. 25–26).

*Proof sketch.* §10.4 chooses `ι` at `p` with large residual image. §10.2 (Lemma 3.5) produces `π′`
non-ordinary at `p` with principal-series type at `p` (so `p ∉ sc(π′)`) and strongly connected to `π`
away from `p`; when `p ≠ q` impose conductor dividing `p⁶` at `p`, which with strong connection
preserves the integer `M` and conditions (3), (5), as well as the types at `q` and `r`. §9.8 transfers
automorphy of `Sym^{n−1}` from `π′` to `π` (the pair `(π, π′)` is in the setting of §9.1 at `p`).

**Checks.**

- For `p ≠ q`, strong connection preserves the local Weil–Deligne data away from `p`, and
  `N(π′_p) | p⁶`; these preserve `M` and the dihedral-killing conditions.
- `p = 3` is excluded here; it is treated in §10.8 by a separate congruence.
- For `p = q` the result is no longer seasoned (it has lost the dihedral type at `q`), and the
  statement does not claim it.

*Needs:* §§10.2, 10.4; §9.8.

### 10.7 Symmetric powers in weight two relative to a seed when 2, 3 are not supercuspidal primes

Let `n ≥ 3` and suppose `Sym^{n−1} r_{π_0,ι}` is automorphic for one everywhere unramified cuspidal
`π_0` of `GL_2(𝔸_ℚ)` of weight `≥ 2`. Prove that for every regular algebraic cuspidal `π` on
`GL_2(𝔸_ℚ)` of weight `2`, non-CM, with `2, 3 ∉ sc(π)`, `Sym^{n−1} π` exists (nt21b Proposition 3.11
and proof, p. 26).

*Proof sketch.* Let `H_k` assert the result for all such `π` with `|sc(π)| ≤ k`, and `H′_k` for the
seasoned ones. `H_0` (Theorem B relative to the seed): for `sc(π) = ∅` every component has
non-trivial Jacquet module, so §8.2 gives `π′` with the same residual representation, `n`-regular
refinements at its ramified primes and residual image containing `SL_2(𝔽_p)` for a prime `p` in the
Fontaine–Laffaille range; §8.3 with the seed makes `Sym^{n−1} r_{π′,ι}` automorphic, and
potentially diagonalizable automorphy lifting (ModularityAndLanglandsExtensions §§2.1, 2.16) transfers this to `π`. `H_k ⇒ H′_{k+1}`: remove any supercuspidal prime by §10.6 (including
`q` if needed); the result has at most `k` such primes. `H′_k ⇒ H_k` for `k ≥ 1`: for `|sc(π)| = k`
add a new prime `q` by §10.5, remove an old prime `p ∈ sc(π)` (so `p ≠ q`) by §10.6; the result is
seasoned with `k` supercuspidal primes. Compose the automorphy implications.

**Checks.**

- `k = 0` is §8.3 with the seed.
- The induction alternates between seasoned and arbitrary representations; at no step is a
  supercuspidal prime `≤ 3` eliminated by §10.6, consistently with `p ≥ 5` there.
- For `n = 3, 4, 5` the conclusion is also given by the low-rank lifts, without the seed.

*Needs:* §§10.5, 10.6; §§8.2, 8.3; ModularityAndLanglandsExtensions §§2.1, 2.16; ArithmeticGaloisRepresentations §7.9.

### 10.8 Symmetric power functoriality for non-CM modular forms relative to a seed (Newton–Thorne II Theorem 3.1)

Let `n ≥ 1` and, if `n ≥ 3`, suppose `Sym^{n−1} r_{π_0,ι}` automorphic for one everywhere unramified
cuspidal `π_0` of weight `≥ 2`. Prove that `Sym^{n−1} π` exists for every non-CM regular algebraic
cuspidal `π` of `GL_2(𝔸_ℚ)` (nt21b Theorem 3.1, p. 20; proof, pp. 26–27). With §14.1 this proves
ModularityAndLanglandsExtensions §4.29 (Newton–Thorne II Theorem A); CM and weight-one forms are its
§4.13. The printed proof applies the large-image step to `π` where the newly constructed
good-dihedral form `π′` is meant, and in the case `2 ∈ sc(π)` concludes by Proposition 3.11 although
the new form may have `3 ∈ sc`; the argument here concludes by the case of `2 ∉ sc` treated first.

*Proof sketch.* `n = 1, 2` are trivial. For weight `2` with `2 ∉ sc(π)` and `3 ∈ sc(π)`: choose
`t > max(5, 4n(n − 1), N(π))`, `t ≡ 1 mod 4`, with large `t`-adic projective image
(AutomorphicGaloisRepresentations §7.5), and `q ≡ −1` modulo `t`, `q ≡ 1` modulo `8` and modulo every
prime `l < t`, `Frob_q` conjugate to complex conjugation; a good-dihedral `π′` at `q`
(ClassicalSerreModularity Layer R27.1) with `Sym^{n−1} π′` existing exactly when `Sym^{n−1} π` does
(PotentialModularityAndCompatibleSystems §10.10, ModularityAndLanglandsExtensions §2.16, with
adequacy of `Sym^{n−1} r̄_{π,ι_t}` on `G_{ℚ(ζ_t)}` as in §10.5, since `t > 4n(n − 1) ≥ 2n + 2` for
`n ≥ 3`; ArithmeticGaloisRepresentations §7.9);
the `3`-adic projective image of `r̄_{π′,ι}` is `PSL_2` or `PGL_2` of `𝔽_{3^a}` with `3^a > 2n − 1`;
§10.2 gives a weight-two `π″` with `2, 3 ∉ sc(π″)`, non-ordinary at `3`; then §10.7 and §9.8
conclude. If `2 ∈ sc(π)`, run the same argument with `2` and `3` exchanged and conclude by the case
just treated. Weight `k > 2` reduces to weight `2` by a `t`-adic congruence with a potentially
crystalline weight-two form and potentially diagonalizable lifting (ModularityAndLanglandsExtensions §§2.1, 2.16).

**Checks.**

- A non-CM elliptic curve over `ℚ` whose local component at `3` is supercuspidal (its Weil–Deligne
  representation at `3` is irreducible) and whose local component at `2` is not passes through the
  `3`-adic step. Additive potentially good reduction at `3` does not suffice: the twist of `11a1` by
  the quadratic character of `ℚ(√−3)` has conductor `99 = 3² · 11`, additive potentially good
  reduction at `3`, and local component at `3` an unramified principal series twisted by a ramified
  quadratic character, so `2, 3 ∉ sc(π)` and §10.7 treats it without that step.
- `n = 1`: `Sym^0 π` is the trivial character; `n = 2`: `π` itself.
- If the large-image step were applied to `r̄_{π,ι}` rather than `r̄_{π′,ι}`, the image bound could fail
  (`π` need not have large `3`-adic image); `π′` has the auxiliary type that supplies it.

*Needs:* §§10.2, 10.7; §9.8; AutomorphicGaloisRepresentations §7.5; ClassicalSerreModularity Layer
R27.1; PotentialAutomorphyInfrastructurePartII Layer 1 ("Two-dimensional potentially Barsotti–Tate
representations are potentially diagonalizable", §1.4, `l > 2`); ModularityAndLanglandsExtensions §2.16; PotentialModularityAndCompatibleSystems §10.10;
ArithmeticGaloisRepresentations §7.9.

### Examples

- `n = 3`: seasoning uses `t = 53` and, for instance, `q = 211`.
- An elliptic curve with supercuspidal reduction at `5` and `7` (and semistable elsewhere) is handled
  by two applications of §10.6 after one of §10.5.

### Dependencies

Layers 8–9; GL2AutomorphicRepresentationsAndTransfer §§R16.3.1–R16.3.3, R16.3.5, R16.3.7;
ArithmeticGaloisRepresentations §§3.3, 3.6, 4.4, 7.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.5.10; ClassicalSerreModularity Layer R27.1; AutomorphicGaloisRepresentations §7.5;
PotentialModularityAndCompatibleSystems §10.10; PotentialAutomorphyInfrastructurePartII Layer 1;
ModularityAndLanglandsExtensions §§2.1, 2.16; PadicFamilies §5.8; SerreWeightAndLevelOptimisation §6.9; GL2ModularityLifting Layer 3;
Chebotarev Layer 10.

## Layer 11: the untwisted tensor product `r_π ⊗ Sym^{r−1} r_σ`

This layer proves automorphy of `r_π ⊗ Sym^{r−1} r_σ` for a weight-zero `π` and a congruent ordinary
companion `σ` of weights `{0, 2}`, assuming `SP_{r−1}` and `SP_{r+1}` (nt26 Theorem 3.2, pp. 12–25).
The tensor is residually reducible (its residual representation is that of an isobaric sum of rank
`r + 1` and `r − 1`); the proof compares deformation problems whose local conditions above an
auxiliary place `v_0` have congruent reduced special fibres, uses Thorne's level raising (§6.9) for a
Steinberg seed, and propagates automorphy over all components by generic primes. Fixed types include
monodromy throughout.

### 11.1 Standing hypotheses and auxiliary data

Let `F` be totally real, `p ≥ 5`, `1 < r < p`, `n = 2r`, `ι : ℚ̄_p ≅ ℂ`. Define the standing
hypotheses on a regular algebraic cuspidal `π` of `GL_2(𝔸_F)`: (1) `det r_{π,ι} = ε^{−1}`; (2) weight
`0` and `π_v` an unramified twist of Steinberg at each `v | p`; (3) a place `v_0` with
`q_{v_0} ≡ −1` modulo `p` where `π_{v_0}` is tamely dihedral of order `p`
(GL2AutomorphicRepresentationsAndTransfer §R16.3.7); (4) `r̄_{π,ι}(G_F)` containing a conjugate of
`SL_2(𝔽_{p^a})` with `a > a₀(p)`; (5) `π_v` potentially unramified at every `v ∤ p`. Define the
auxiliary data: a place `v_a ∤ p` where `π` is unramified and the eigenvalue ratio of `r̄(Frob_{v_a})`
satisfies `(α/β)^i ≢ q_{v_a}^{±1}` modulo `p` for `i = 0, …, r`, so that
`H²(F_{v_a}, ad(r̄ ⊗ Sym^{r−1} r̄)^{ss}) = 0` (Lemma 3.3); `M` the extension of `F(ζ_p)` cut out by `r̄`;
a finite set `X_0 ∋ v_a` of prime-to-`p` places such that every Galois subextension `M/M′/F` of degree
`> 1` has a non-split place in `X_0` (so `X_0`-split extensions are linearly disjoint from `M`); an
imaginary quadratic `K_0` in which `p` and the residue characteristics of `X_0 ∪ {v_0}` split, with a
place `u_0 | p`; and soluble totally real `F_2/F_1/F` as in Lemma 3.4: `X_0`-split, `K_1 = K_0F_1`
unramified over `F_1`, `[F_1 : F]` even, trivial residual representation and
`[F_{1,v} : ℚ_p] > n(n + 1)/2 + 1` at every `v | p`, the base change of `π` unramified away from
`p v_0` over `F_1`, `v_0` split in `F_1/F`; over `F_2`, the base change of `π` unramified at every
place above `v_0`, and at those places `q ≡ 1` modulo `p^N` for an `N` with `p^N > n` and trivial
residual representation, the `p`-adic places of `F_1` split in `F_2`, `d_{0,F_2} > 1`; and
everywhere unramified characters `X`, `Y` of `K_1` of type `A_0` whose `p`-adic characters
`x = r_{X,ι}`, `y = r_{Y,ι}` satisfy `x x^c = ε`, `y y^c = ω_p` (`ω_p` the Teichmüller lift of `ε`
modulo `p`), `x̄ = ȳ` and have Hodge–Tate weight `0` at `u_0` (nt26 §3, standing
hypotheses, pp. 12–13; Lemma 3.3, p. 15; auxiliary data, p. 16; Lemma 3.4, p. 16). The printed
Lemma 3.4 names the characters as characters "of `K_1`" in one clause and an undefined field `K` in
another; `K_1` is meant. For `r = 1` the theorem of §11.10 is trivial and none of this is needed.
The character `Y` is `Y′ ∘ N_{K_1/K_0}` for a character `Y′` of `K_0` of type `A_0` unramified above
the residue characteristics of `X_0 ∪ {v_0}` (nt26 proof of Lemma 3.4, pp. 16–17), so
`ȳ|_{G_{K_1}} = ȳ′|_{G_{K_1}}`. Require in addition: `ȳ` is trivial on `G_{K_{1,ṽ}}` for every place
`ṽ | p` of `K_1` (each `F_{1,v}`, `v | p`, contains the abelian extensions of `K_{0,u} = ℚ_p` cut out
by `ȳ′|_{G_{K_{0,u}}}` at both places `u | p` of `K_0`; this is compatible with `X_0`-splitness because
`X_0` is prime to `p`), and `ȳ` is trivial on `G_{K_{2,ṽ}}` for every place `ṽ` of `K_2` above `v_0`
(`ȳ′` is unramified at the two places `λ` of `K_0` above the residue characteristic `ℓ_0` of `v_0`,
the completion `K_{2,ṽ} = F_{2,w}` (`w` the place of `F_2` below `ṽ`, split in `K_2` because `ℓ_0`
splits in `K_0`) contains `K_{0,λ} = ℚ_{ℓ_0}`, and the absolute residue degrees of `F_2` at
the places above `v_0` are taken divisible by the orders of both values `ȳ′(Frob_λ)`). nt26
Lemma 3.4(2)–(3) asks for the triviality of `r̄_{π,ι}` only, and the proof of its Proposition 3.9 (p. 21) notes that `s̄` of §11.3 is then scalar above `p`; the
triviality of `ȳ` is added here because the ordinary and Steinberg local conditions of §11.4 and the
finiteness theorem used in §11.6 (PotentialAutomorphyInfrastructurePartII §3.10 and §8.7, hypotheses
(1) and (3)) are stated for a trivial residual local representation. The `p`-adic places of `F_1` split
in `F_2`, so the property above `p` persists over `F_2` and over the field `F_3 ⊇ F_2` of §11.8, and the
property above `v_0` persists over `F_3` by restriction.

*Proof sketch.* Lemma 3.3 by Chebotarev in the image of `r̄`, which contains `SL_2(𝔽_{p^a})`. Lemma 3.4
by successive soluble base changes with prescribed completions (PotentialModularityAndCompatibleSystems
§2.16, with complete splitting at `X_0` as the trivial prescribed completion) and cyclic steps of
prescribed degree (PotentialAutomorphyInfrastructure §2.5), with the characters from
PotentialAutomorphyInfrastructurePartII Layer 0 and ModularityAndLanglandsExtensions §2.13, and the
lower bound on the antiunit class-field rank `d_0` (ArithmeticGaloisDuality §R02.3.5) for
`d_{0,F_2} > 1`. The triviality of `ȳ` above `p` and `v_0` is one more prescribed completion at each
of these finitely many places.

**API.**

- The data `(F, p, r, ι, π)` with conditions (1)–(5).
- The place `v_a` with `H²(F_{v_a}, ad(r̄ ⊗ Sym^{r−1} r̄)^{ss}) = 0`.
- The set `X_0` and the notion of an `X_0`-split extension, linearly disjoint from `M`.
- The fields `K_0`, `F_1`, `F_2`, `K_1 = K_0F_1`, `K_2 = K_0F_2` and the characters `X`, `Y`, with
  the properties of Lemma 3.4; in particular, at every place of `F_2` above `v_0` the base change of
  `π` is unramified, `r̄` is trivial and the exact power of `p` dividing `q − 1` exceeds `n`.
- `ȳ` is trivial on `G_{K_{1,ṽ}}` for `ṽ | p` and on `G_{K_{2,ṽ}}` for `ṽ` above `v_0`; with the
  triviality of `r̄_{π,ι}` there, the residual representation `s̄` of §11.3 is trivial, not only
  scalar, at these places.

**Checks.**

- For `r = 1`, `r_π ⊗ Sym^0 r_σ = r_π` is automorphic.
- `q_{v_0} ≡ −1` modulo `p` makes `p | q_{v_0} + 1`, so the tamely dihedral type of order `p` exists at
  `v_0`; e.g. `q_{v_0} = 19` for `p = 5`.
- A place with `α/β ≡ q_v^{±1}` modulo `p` is not allowed as `v_a`: then `H²` of the adjoint can be
  non-zero and ramified deformations exist there. For `p = 5`, `r ∈ {2, 3, 4}` and `a > a₀(5) ≥ 3`
  gives `a ≥ 4`.
- The unramifiedness of the base change above `v_0` is a separate condition on `F_2`: the tamely
  dihedral type reduces to an unramified induced representation with Frobenius ratio `−1`, so an
  unramified extension of `F_{v_0}` of suitable even degree makes `q ≡ 1` modulo `p^N` and `r̄`
  trivial; but its inertia group is that of `F_{v_0}`, on which the parameter of `π_{v_0}` is the sum
  of two characters of order `p`, so the base change stays ramified. Only an extension whose
  ramification index is divisible by `p` (prime to the residue characteristic, since
  `q_{v_0} ≡ −1` modulo `p`) makes it unramified.
- The triviality of `r̄_{π,ι}` above `p` does not make `s̄` trivial there. With `r̄_{π,ι}` trivial on
  `G_{K_{1,ṽ}}`, `ṽ | p`, and `ȳ` unramified there with `ȳ(Frob_ṽ) = c`, the twist `ȳ^{1−r}` gives
  `s̄|_{G_{K_{1,ṽ}}} = c^{1−r}·1_{2r}`; for `r = 2` and `c ≠ 1` this is `c^{−1}·1_4`, scalar and
  non-trivial, and neither the ordinary condition `R^Δ_v` nor hypothesis (1) of
  PotentialAutomorphyInfrastructurePartII §8.7 applies to it. With `c = 1`, which the choice of `F_1`
  ensures, `s̄|_{G_{K_{1,ṽ}}} = 1_4`.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §R16.3.7; ArithmeticGaloisRepresentations §7.9;
PotentialAutomorphyInfrastructure §2.5 ("Auxiliary soluble and cyclic extensions");
PotentialModularityAndCompatibleSystems §2.16 (soluble prescribed-completion extensions);
PotentialAutomorphyInfrastructurePartII Layer 0 ("Algebraic characters with prescribed conjugate
norm and local behaviour"); ArithmeticGaloisDuality §R02.3.5; ModularityAndLanglandsExtensions
§2.13; Chebotarev Layer 10.

### 11.2 A congruent ordinary companion of weights {0, 2}

Under §11.1, let `σ` be the companion of PotentialModularityAndCompatibleSystems §9.2 (nt26 Lemma 3.1,
pp. 13–14): a RAESDC representation of `GL_2(𝔸_F)` which is ι-ordinary, has `HT_τ(r_{σ,ι}) = {0, 2}`
for every `τ`, determinant `ε^{−2} ω_p` (`ω_p` the Teichmüller lift of `ε` modulo `p`), residual
representation `r̄_{σ,ι} ≅ r̄_{π,ι}`, an unramified Steinberg twist at `v_0`, and
`r_{σ,ι}|_{G_{F_v}} ∼ r_{π,ι}|_{G_{F_v}}` at every finite `v ∤ p v_0`, all for the same `σ`. Prove the
determinant-corrected form of the last property: at every finite `v ∤ p v_0`,
`r_{σ,ι}|_{G_{F_v}} ∼ r_{π,ι}|_{G_{F_v}} ⊗ χ_v`, where `χ_v` is the unramified character with
`χ_v ≡ 1` modulo `ϖ` and `χ_v² = ε^{−1} ω_p`, so that both sides have determinant `ε^{−2}ω_p`. The
printed proof uses the local representation of `π` itself as a point of a ring with the new
determinant; the determinants `ε^{−1}` and `ε^{−2}ω_p` differ, and the correcting twist `χ_v` (which
exists since `p` is odd and the ratio is residually trivial and unramified) is used here.

*Proof sketch.* `π_v` is generic, so `r_{π,ι}|_{G_{F_v}}` lies on a unique component of the
unrestricted lifting ring and strongly connects to every lift it connects to
(PotentialAutomorphyInfrastructurePartII §1.3(1)); it connects to its twist by the unramified,
residually trivial `χ_v` (§1.2(4) there); and `r_{σ,ι}|_{G_{F_v}} ∼ r_{π,ι}|_{G_{F_v}}` together with
`r_{π,ι}|_{G_{F_v}} ⇝ r_{π,ι}|_{G_{F_v}} ⊗ χ_v` gives the claim (§1.2(1) there). The existence of `σ`
is PotentialModularityAndCompatibleSystems §9.2; its Khare–Wintenberger route, which §11.6 reruns
over `F_2` with one more prescribed component, is as follows. Local lifts at `p`: Hida families of
Hilbert modular forms (OrdinaryAutomorphicFormsAndModularityLifting §2.11) specialise `π` to weights
`{0, 2}` with determinant `ε^{−2}ω_p`. Global lifts with prescribed components
(PotentialAutomorphyInfrastructurePartII Layer 8, "Global lifts with prescribed local components
(Schur form)"): at `v ∤ p v_0` the component through `r_{π,ι}|_{G_{F_v}} ⊗ χ_v`, at `v | p`
the ordinary potentially crystalline component through the local lift, at `v_0` a unipotent
component with generically non-zero monodromy, which exists because the tamely dihedral type of
order `p` reduces to an unramified induced representation with Frobenius ratio `−1 ≡ q_{v_0}` modulo
`p`. The Khare–Wintenberger method: finiteness over `𝒪` (Layer 5) gives a characteristic-zero point,
and ordinary automorphy lifting after soluble base change (Layer 5) makes it `r_{σ,ι}`. The image
hypothesis of these two theorems holds: `r̄_{π,ι}(G_{F(ζ_p)})` contains the commutator subgroup of
`r̄_{π,ι}(G_F)`, hence the perfect group `SL_2(𝔽_{p^a})` of (4), so it is adequate
(ArithmeticGaloisRepresentations §7.9, rank two, `p^a ≥ 6`) and hence relaxed-adequate
(PotentialAutomorphyInfrastructurePartII §5.4); the soluble base changes are taken linearly disjoint
from the field cut out by `r̄_{π,ι}` over `F(ζ_p)`, so they keep this image, and `ζ_p ∉ F` as `F` is
totally real and `p ≥ 5`.

**API.**

- The companion `σ` with the properties above.
- `HT_τ(r_{σ,ι}) = {0, 2}`; `r̄_{σ,ι} ≅ r̄_{π,ι}`; `det r_{σ,ι} = ε^{−2} ω_p`.
- `σ_{v_0}` is an unramified twist of Steinberg.
- At `v ∤ p v_0`, `r_{σ,ι}|_{G_{F_v}}` is strongly connected to the determinant-corrected local lift
  of `π`; in particular their inertial Weil–Deligne data and monodromy agree, so `σ` is unramified
  wherever `π` is (away from `p v_0`).

**Checks.**

- For `r = 2`, `HT(r_π ⊗ r_σ) = {0, 1} + {0, 2} = {0, 1, 2, 3}`, distinct.
- The reduction of `ε^{−2}ω_p` is `ε̄^{−2} ε̄ = ε̄^{−1} = det r̄_{π,ι}`, as the residual isomorphism
  requires.
- Taking `σ = π` (weights `{0, 1}`) makes `r_π ⊗ Sym^{r−1} r_π` irregular for `r ≥ 2`: for `r = 2`,
  `{0, 1} + {0, 1}` repeats `1`.

*Needs:* §11.1; PotentialModularityAndCompatibleSystems §9.2; PotentialAutomorphyInfrastructurePartII
Layer 1 ("Properties of strong connection; Choi's lemma and the filtration lemma"; "Generic local
representations are smooth points, and smooth points are dense").

### 11.3 The polarized representation s and its residual decomposition

With `σ` from §11.2, define over `K_1`
`π_1 = BC(Sym^r σ) ⊗ X Y^{−r} |·|^{(r−1)/2}`, `π_2 = BC(Sym^{r−2} σ) ⊗ X^{−1} Y^{2−r} |·|^{(r−1)/2}` and
`s = (r_{π,ι} ⊗ Sym^{r−1} r_{σ,ι})|_{G_{K_1}} ⊗ y^{1−r}`, assuming `SP_{r−1}` and `SP_{r+1}` (to define
`π_2` and `π_1`). Prove (Lemma 3.5) that `s^c ≅ s^∨ ⊗ ε^{1−2r}`; that `π_1`, `π_2` are cuspidal
conjugate self-dual; that `π_1 ⊞ π_2` is regular algebraic and ι-ordinary; that
`r̄_{π_1 ⊞ π_2,ι} ≅ s̄`; that after conjugation `s` takes values in `GL_n(𝒪)` and extends to
`s : G_{F_1} → 𝒢_n(𝒪)` with multiplier `ε^{1−n} δ^n_{K_1/F_1}`; and that, with `S_{p,F_1}` the
`p`-adic places, `T_{F_1}` (resp. `T′_{F_1}`) the places above `v_0` (resp. `v_a`),
`S_{F_1} = S_{p,F_1} ∪ T_{F_1}` and `S̃_{F_1}` a choice of places of `K_1` above them, `s` is a lift of
`s̄` of type `𝒮_{F_1}` (§11.4): ordinary at `p`, of inertial type `τ_s` at `T_{F_1}`, unramified
outside `S_{F_1}` (nt26 Lemma 3.5, p. 17; the polarized `s` and the sets of §3, p. 17; final step of
the proof of Theorem 3.2, p. 25). Unramifiedness outside `S_{F_1}` uses that `σ` is unramified away
from `p v_0` (§11.2), which the printed proof uses after arranging it only for `π`.

*Proof sketch.* Conjugate self-duality from `det r_π = ε^{−1}`, `det r_σ = ε^{−2} ω_p` and
`y y^c = ω_p`: `s^c ≅ s^∨ ⊗ ε^{1−2r} ω_p^{r−1} (y y^c)^{1−r} = s^∨ ⊗ ε^{1−2r}`. The residual
decomposition is the mod-`p` Clebsch–Gordan formula
`r̄ ⊗ Sym^{r−1} r̄ ≅ Sym^r r̄ ⊕ (det r̄ ⊗ Sym^{r−2} r̄)` for `r < p` (ArithmeticGaloisRepresentations
§7.8) after twisting. Cuspidality of `π_1`, `π_2` from large image of `Sym^r r̄` and `Sym^{r−2} r̄`;
regularity from the weights `{0, 2}`; ordinarity from that of `σ` (PotentialAutomorphyInfrastructurePartII
Layer 0, "Ordinarity of a regular algebraic isobaric sum"). The multiplier of tensor products is
computed from the multipliers of the factors (GlobalGaloisDeformations §8.1).

**API.**

- `s = (r_π ⊗ Sym^{r−1} r_σ)|_{G_{K_1}} ⊗ y^{1−r}` with its `𝒢_n`-extension of multiplier
  `ε^{1−n} δ^n`.
- `s^c ≅ s^∨ ⊗ ε^{1−2r}`.
- `s̄ ≅ r̄_{π_1 ⊞ π_2,ι}`, a sum of constituents of dimensions `r + 1` and `r − 1`.
- `s` is a lift of `s̄` of type `𝒮_{F_1}`.

**Checks.**

- `dim s = 2r = (r + 1) + (r − 1)`; for `r = 2` the constituents have dimensions `3` and `1`
  (`Sym² r̄` and `det r̄`, twisted).
- `s̄` is reducible although `s` is irreducible: the residual decomposition is what the residually
  reducible theory of PotentialAutomorphyInfrastructurePartII Layers 2, 7 and 8 uses.
- For `r = 1` there is no `π_2` (rank `0`), which is why `r > 1` here.

*Needs:* §§11.1, 11.2; ArithmeticGaloisRepresentations §7.8; ModularityAndLanglandsExtensions §1.12;
GlobalGaloisDeformations §8.1; PotentialAutomorphyInfrastructurePartII Layer 0 ("Ordinarity of a
regular algebraic isobaric sum").

### 11.4 The deformation problems `𝒮_{F₁}`, `𝒮′_{F₁}`, `𝒮′_{F₂}`, `𝒮_{F₃}`

For `F′ ∈ {F_1, F_2, F_3}` (`F_3` from §11.8) with `K′ = K_0 F′`, define the polarized deformation
problem `𝒮 = (K′/F′, S_{F′}, S̃_{F′}, Λ_{F′}, s̄|_{G_{F′}}, ε^{1−n} δ^n_{K′/F′}, {R^Δ_v}_{v ∈ S_{p,F′}} ∪ {R^?_v}_{v ∈ T_{F′}})` with `S_{F′} = S_{p,F′} ∪ T_{F′}` (the places above `v_a`
are not in `S`), `Λ_{F′} = ⊗̂_{v ∈ S_{p,F′}} 𝒪[[I^{ab}_{K′_ṽ}(p)^n]]` of dimension `n[F′ : ℚ] + 1`,
`R^Δ_v` the ordinary condition at `p`, and at `T_{F′}`: the fixed Weil–Deligne type `τ_s` of `s`,
including its monodromy partition (`𝒮_{F_1}`), the type of the special representation `Sp_n`,
including its regular nilpotent monodromy (`𝒮′_{F_1}`), the Steinberg ring `R^{St}_v` (`𝒮′_{F_2}`), or
the unipotently ramified ring `R^1_v` (`𝒮_{F_3}`). The ordinary, Steinberg and unipotent rings are
those of a trivial residual local representation, which `s̄` is at `S_{p,F′}` for every `F′` and at
`T_{F′}` for `F′ ∈ {F_2, F_3}`, where these rings are used (§11.1); the fixed-type rings at `T_{F_1}`
ask for no such condition.
Prove (Lemma 3.7) that for `X_0`-split totally real
`F′ ⊇ F_1`: `K′ ⊄ F′(ζ_p)`; `s̄|_{G_{K′}} ≅ ρ̄_1 ⊕ ρ̄_2` with `ρ̄_i^c ≅ ρ̄_i^∨ ε^{1−n}`, of dimensions
`r + 1` and `r − 1`, non-isomorphic over `K′(ζ_p)`; `s̄|_{G_{K′}}` is primitive; and `s̄(G_{K′})` has
no quotient of order `p` (nt26 §3 after Lemma 3.7, deformation problems, pp. 19–20; Lemma 3.7,
p. 19). The printed proof of Lemma 3.7 asserts an equality of images that includes the twist `ȳ`;
`X_0` controls only the image of `r̄_π`, and that equality is what is used, for `F′ ⊇ F_1` (where `s̄`
is defined).

*Proof sketch.* Polarized deformation problems with `Λ`-structure (GlobalGaloisDeformations §8.1;
PotentialAutomorphyInfrastructurePartII Layer 3, "Ordinary deformation data and their Hecke
comparison"); local rings from LocalGaloisDeformationRings §§2.18, 2.24, 2.26. Lemma 3.7 from
`X_0`-splitness (linear disjointness from `M`), large image and `r + 1 ≠ r − 1`.

**API.**

- The four problems `𝒮_{F_1}` (type `τ_s` at `T_{F_1}`), `𝒮′_{F_1}` (special type), `𝒮′_{F_2}`
  (Steinberg rings at `T_{F_2}`), `𝒮_{F_3}` (unipotently ramified rings at `T_{F_3}`).
- Restriction maps `R_{𝒮_{F_3}} → R_{𝒮′_{F_2}}` and `R_{𝒮_{F_3}} → R_{𝒮_{F_1}}` of
  `Λ_{F_3}`-algebras.
- Maps from each universal ring classify lifts of the fixed polarized residual extension over the
  named field with ordinary characters and the precise local quotient, monodromy included; pullback
  along a restriction map agrees with Galois restriction.

**Checks.**

- `dim Λ_{F′} = n[F′ : ℚ] + 1`; for `n = 4`, `[F′ : ℚ] = 2` this is `9`.
- The places above `v_a` are not in `S_{F′}`: lifts are unramified there automatically by Lemma 3.3,
  so no local condition is imposed.
- For `r = 3`, `s̄|_{G_{K′}} = ρ̄_1 ⊕ ρ̄_2` with `dim ρ̄_1 = 4` and `dim ρ̄_2 = 2`.

*Needs:* §11.3; GlobalGaloisDeformations §8.1; PotentialAutomorphyInfrastructurePartII Layer 3
("Ordinary deformation data and their Hecke comparison"), Layer 7 ("Weakly and strongly primitive
representations"); LocalGaloisDeformationRings §§2.18, 2.24, 2.26.

### 11.5 Two inertial types with the same reduced special fibre, and the comparison of deformation rings

For `v ∈ T_{F_1}`, let `R^□_v` be the unrestricted lifting ring of `s̄|_{G_{K_{1,ṽ}}}`, `R_v` its
quotient for the inertial type `τ_s` of `s` and `R′_v` its quotient for the type of `Sp_n`. Prove
(Lemma 3.6) that `R_v` and `R′_v` are non-zero and `(R_v/(ϖ))^{red} ≅ (R′_v/(ϖ))^{red}` as
`R^□_v`-algebras, and (Lemma 3.8) that consequently
`(R_{𝒮_{F_1}}/(ϖ))_{red} ≅ (R_{𝒮′_{F_1}}/(ϖ))_{red}` and restriction gives a finite morphism
`R_{𝒮′_{F_2}} → R_{𝒮′_{F_1}}` (nt26 Lemma 3.6, p. 18; Lemma 3.8, p. 20).

*Proof sketch.* Under Jacquet–Langlands for the division algebra the two types correspond to
characters of order `p` and order `1`, which have the same reduction modulo `p`; Breuil–Mézard cycles
for division algebras away from `p` (LocalGaloisDeformationRings §2.27) are then equal for these
types (not for arbitrary congruent inertial restrictions). Both rings are `𝒪`-flat, reduced and
equidimensional of dimension `1 + n²` with special fibres pure of dimension `n²`
(LocalGaloisDeformationRings §§2.13, 2.24), so equal cycles give the same generic points and equal
reduced special fibres in the common unrestricted special fibre; non-emptiness from the exhibited
characteristic-zero types. Present the global problems with the same auxiliary global relations over
the local rings to transfer the equality; finiteness of restriction is PotentialAutomorphyInfrastructurePartII
Layer 7 ("Restriction of pseudodeformations to a finite-index subgroup is finite").

**Checks.**

- Equality of mod-`p` inertial restrictions alone is insufficient: the cycle equality and purity of
  dimension `n²` are what give equality of reduced special fibres.
- Both `R_v` and `R′_v` have dimension `1 + n²`; for `r = 2` (`n = 4`) their reduced special fibres
  are pure of dimension `16`.
- The characteristic-zero fibres differ: `R_v[1/p]` and `R′_v[1/p]` have no common points, since
  their inertial types differ.

*Needs:* §11.4; LocalGaloisDeformationRings §§2.13, 2.24, 2.27; PotentialAutomorphyInfrastructurePartII
Layer 7 ("Restriction of pseudodeformations to a finite-index subgroup is finite").

### 11.6 Finiteness of `R_{𝒮′_{F₂}}` and a Steinberg automorphic lift

Assume `SP_{r−1}` and `SP_{r+1}` (ModularityAndLanglandsExtensions §1.12). Prove that `R_{𝒮′_{F_2}}` is
finite over `Λ_{F_2}`, and that there is an ι-ordinary RACSDC `Π` of `GL_n(𝔸_{K_2})`, unramified outside
`S_{F_2}`, with `r̄_{Π,ι} ≅ s̄|_{G_{K_2}}` and `Π_ṽ` an unramified twist of Steinberg for each
`v ∈ T_{F_2}` (nt26 Proposition 3.9 and proof, pp. 20–21). Primitivity is geometric weak primitivity
with the common splitting field. Finiteness is PotentialAutomorphyInfrastructurePartII §8.16 as
stated, applied twice, with auxiliary place above `v_a` (non-scalar Frobenius is allowed there). Its
added hypothesis, that `s̄(G_{K_2(ζ_p)})` has no non-trivial quotient of `p`-power order, holds. As
`F_2` is `X_0`-split, `r̄_{π,ι}(G_{F_2}) = r̄_{π,ι}(G_F)`; after conjugation this group lies between
`SL_2(𝔽_{p^b})` and `k^× GL_2(𝔽_{p^b})` for some `b ≥ a` and a finite field `k ⊇ 𝔽_{p^b}`, which
we take to contain the values of `ȳ` (ArithmeticGaloisRepresentations §4.4, as in the last Check of
§13.8). The group
`A = r̄_{π,ι}(G_{K_2(ζ_p)})` has index at most `2` in a normal subgroup of `r̄_{π,ι}(G_F)` with abelian
quotient, so it contains the perfect group `SL_2(𝔽_{p^b})`, and `[A, A] = SL_2(𝔽_{p^b})`. The image
`H` of `(r̄_{π,ι}, ȳ)` on `G_{K_2(ζ_p)}` has `[H, H] = [A, A] × 1`, perfect, and `H/[H, H]` embeds in
`A/SL_2(𝔽_{p^b}) × k^×`, of order dividing `(|k| − 1)²`, prime to `p`. A quotient of `H` of `p`-power
order has trivial abelianization, hence is trivial, and `s̄(G_{K_2(ζ_p)})` is a quotient of `H`.

*Proof sketch.* Choose by Chebotarev a place `v_2 ∉ S_{F_2} ∪ X_0` of `F_2`, split in `K_0`, whose
residue characteristic differs from those of `X_0 ∪ {v_0}`, with `q_{v_2} ≡ 1` modulo `p` and
`r̄_{π,ι}|_{G_{F_{2,v_2}}}`, `s̄|_{G_{K_{2,ṽ_2}}}` trivial. (1) Run the Khare–Wintenberger argument
recalled in §11.2 (PotentialModularityAndCompatibleSystems §9.2) over `F_2`, prescribing in addition
the unramified Steinberg component at `v_2` (non-empty, as `r̄` is trivial and `q_{v_2} ≡ 1` modulo
`p` there), to obtain an ι-ordinary RAESDC `σ_2` of `GL_2(𝔸_{F_2})` with `HT_τ = {0, 2}`,
determinant `ε^{−2}ω_p`, `r̄_{σ_2,ι} ≅ r̄_{σ,ι}|_{G_{F_2}}` and an unramified Steinberg twist at `v_2`; it is non-CM, being Steinberg at `v_2`. `SP_{r+1}`, `SP_{r−1}`,
base change to `K_2` and the twists of §11.3 give ι-ordinary conjugate self-dual cuspidal `π′_1`,
`π′_2` lifting the two constituents of `s̄|_{G_{K_2}}`, Steinberg at `ṽ_2`. (2) §6.9, applied to
`π′_1 ⊞ π′_2` at `v_2` (genericity place from Lemma 3.3; the other places of the residue
characteristic of `v_2` are unramified), gives an ι-ordinary RACSDC `Π_2` with
`r̄_{Π_2,ι} ≅ s̄|_{G_{K_2}}`, Steinberg at `ṽ_2`. (3) With `Π_2` as automorphic input, §8.16 with
Steinberg place `v_2` makes finite over `Λ_{F_2}` its ring, unrestricted at `T_{F_2}`, and hence its
quotient with Steinberg conditions at `T_{F_2} ∪ {v_2}`. The crystalline ordinary weight-`0` quotient of
the latter is non-zero (at `v | p`, `s̄` is trivial (§11.1) and `ζ_p ∈ F_{2,v}`, so
`⊕_{i=0}^{n−1} ε^{−i}`, which reduces to `1_n`, is an ordinary lift), finite over `𝒪` and of Krull dimension at least one
(PotentialAutomorphyInfrastructurePartII Layer 8, "Global lifts with prescribed local components
(Schur form)"), so it has a characteristic-zero point. The auxiliary-place lifting theorem
(gap:auxiliary-place-reducible-lifting, with `Π_2` as input) makes this point `r_{Π′_2,ι}` for an
ι-ordinary RACSDC `Π′_2`, unramified outside `S_{F_2} ∪ {v_2}` and Steinberg at `T_{F_2} ∪ {v_2}`.
(4) With `Π′_2` as input, §8.16 with its Steinberg place in `T_{F_2}` makes finite the ring of `𝒮′_{F_2}`
enlarged by `v_2` with the unrestricted condition there, of which `R_{𝒮′_{F_2}}` is the quotient by the
unramified condition at `v_2`; a second characteristic-zero point and the same lifting theorem, with
`Π′_2` as input, give `Π`. A single finiteness application does not suffice: the automorphic input of
§8.16 must be Steinberg at the Steinberg place of the problem, and `Π_2` is Steinberg only at `ṽ_2`.

**Checks.**

- For the auxiliary comparison in its arithmetic-Frobenius normalization, over `𝔽_7` take
  `q = 3`, `Φ = diag(1, 2)`.
  The adjoint-twist eigenvalues are `3, 3, 6, 5`, none `1`; non-scalar Frobenius is
  already allowed by PotentialAutomorphyInfrastructurePartII §8.16, and is not an extra gap.
- The cyclotomic hypothesis of §8.16 in the `PGL_2` case, where `det r̄_{π,ι} = ε̄^{−1}` is trivial on
  `G_{F(ζ_p)}`: for `p = 7`, a non-square `ν ∈ 𝔽_{7^a}` and `λ ∈ 𝔽_{7^{2a}}` with `λ² = ν^{−1}`, the
  group `A` generated by `SL_2(𝔽_{7^a})` and `λ·diag(ν, 1)` lies in `SL_2(𝔽_{7^{2a}})` (the generator has
  determinant `λ²ν = 1` and square `diag(ν, ν^{−1})`), has projective image `PGL_2(𝔽_{7^a})`,
  `[A, A] = SL_2(𝔽_{7^a})` and `A/[A, A]` of order `2`; with `ȳ` of order `m` on `G_{K_2(ζ_7)}` (prime
  to `7`, as `ȳ` takes values in the units of a finite field of characteristic `7`), the group
  `H/[H, H]` has order dividing `2m`, prime to `7`. The upper unipotent
  group of order `7` has a quotient of order `7`; the large image excludes it.
- For `r = 2` the constituents are twists of `Sym² r̄_σ` and of a character; `SP_1` and `SP_3` hold
  unconditionally (ModularityAndLanglandsExtensions §1.15).
- The Steinberg condition at `T_{F_2}` is possible because `q ≡ 1` modulo `p^N` and `r̄` and `ȳ`, hence
  `s̄`, are trivial at the places above `v_0` over `K_2` (§11.1); with `r̄` trivial alone and
  `ȳ(Frob_ṽ) = c`, `c^{r−1} ≠ 1`, the residual representation there would be the unramified scalar
  `c^{1−r}·1_n`, outside the Steinberg ring of a trivial residual representation.
- Without the auxiliary place `v_2` the residual constituents would need automorphic lifts Steinberg
  at `T` directly, which `SP_{r±1}` does not supply.

*Needs:* §§11.1–11.4; §6.9; ModularityAndLanglandsExtensions §§1.12, 1.15;
PotentialModularityAndCompatibleSystems §9.2 (its Khare–Wintenberger route);
OrdinaryAutomorphicFormsAndModularityLifting §2.11; PotentialAutomorphyInfrastructurePartII Layer 0
("Soluble base change and descent of polarized automorphy"), Layer 1 ("Strong connection and
component deformation problems"), Layer 5 ("Finiteness of ordinary polarized deformation rings with
relaxed-adequate image"; "Characteristic-zero lifts from finiteness and the dimension bound";
"Ordinary automorphy lifting with relaxed-adequate image"; "Adequacy relaxed to the vanishing of
`H¹(H, ad)`"), Layer 7 ("Weak
primitivity over a splitting coefficient field"), Layer 8 ("Finiteness of ordinary locally Steinberg
deformation rings"; "Finiteness with an unobstructed auxiliary place"; "Global lifts with prescribed
local components (Schur form)"; gap:auxiliary-place-reducible-lifting); LocalGaloisDeformationRings
§2.26; ArithmeticGaloisRepresentations §§4.4, 7.9; Chebotarev Layer 10.

### 11.7 Generic primes on every component

Prove (Proposition 3.10) that the graph whose vertices are the minimal primes of `R_{𝒮′_{F_2}}/(ϖ)`,
with `Q`, `Q′` joined when `Q + Q′` lies in a generic prime of dimension `1`, is connected; and
(Proposition 3.11) that `R_{𝒮_{F_1}}` is finite over `Λ_{F_1}`, each of its minimal primes has dimension
`dim Λ_{F_1}` and characteristic `0` and lies in a generic prime of dimension `1` and characteristic
`p`. Consequently there is a finite set `𝒫` of generic primes of `R_{𝒮′_{F_2}}` of dimension `1` and
characteristic `p` witnessing every edge of the graph, such that every minimal prime of `R_{𝒮_{F_1}}`
lies in a generic `𝔭` with `𝔭_{F_2} ∈ 𝒫` (nt26 Proposition 3.10, p. 21; Proposition 3.11, p. 22; the
set `𝒫`, pp. 22–23). The bound `d_{0,F_2} > 1` of §11.1 controls the reducible locus.

*Proof sketch.* Proposition 3.10: the connectedness dimension of `R_{𝒮′_{F_2}}/(ϖ)`
(DeformationAndDerivedPatchingAlgebra §6.6, "Connectedness dimension and arithmetic rank", with the
bound from the local and global presentations as in PotentialAutomorphyInfrastructurePartII §8.5)
with the bound on the reducible locus by `d_{0,F_2}` (Layer 7, "The reducible locus is small in the
presence of Steinberg places"). Proposition 3.11: §11.5 transfers finiteness and components from
`𝒮′_{F_1}` to `𝒮_{F_1}`; large quotients contain generic primes (Layer 7). `𝒫`: the splitting of the
`p`-adic places of `F_1` in `F_2` lets generic primes over `F_2` restrict to generic primes over
`F_1`.

**Checks.**

- If `R_{𝒮′_{F_2}}/(ϖ)` had two components meeting only in the reducible locus, the graph would be
  disconnected; `d_{0,F_2} > 1` excludes this.
- A single component gives a graph with one vertex and no edges, and `𝒫` may be taken to contain one
  generic prime on it.
- Containment goes from the minimal prime up to the generic prime: each minimal prime `Q` (characteristic
  `0`, dimension `dim Λ_{F_1}`) is contained in a characteristic-`p` generic prime `𝔭` of dimension `1`,
  so `Q ⊂ 𝔭` and, for the closed subsets, `V(𝔭) ⊂ V(Q)`. In `𝒪[[T]]` with `Q = (0)` and `𝔭 = (ϖ)`:
  `dim 𝒪[[T]]/Q = 2`, `dim 𝒪[[T]]/𝔭 = 1`, `ϖ ∈ 𝔭` and `ϖ ∉ Q`, so `(0) ⊂ (ϖ)` and `(ϖ) ⊄ (0)`; a
  dimension-one prime of characteristic `p` never lies inside a characteristic-`0` prime.

*Needs:* §§11.5, 11.6; DeformationAndDerivedPatchingAlgebra §6.6 ("Connectedness dimension and
arithmetic rank"); PotentialAutomorphyInfrastructurePartII Layer 7 ("The reducible locus is small in
the presence of Steinberg places"; "Large quotients contain generic primes"; "Generic primes of an
ordinary deformation ring").

### 11.8 An extension making generic points scalar, and the generic R = T theorem

Prove (Proposition 3.12) that there is a totally real `F_3/F_2`, soluble and `X_0`-split over `F`, in
which each `p`-adic place of `F_2` splits, such that for every `𝔭 ∈ 𝒫` and `v ∈ T_{F_3}`,
`r_𝔭|_{G_{K_3,ṽ}}` is unramified with scalar Frobenius; and (Proposition 3.13) that if
`𝔭 ⊂ R_{𝒮_{F_3}}` is a generic prime of dimension `1` and characteristic `p` with `J_{𝒮_{F_3}} ⊂ 𝔭` and
`r_𝔭|_{G_{K_3,ṽ}}` scalar for each `v ∈ T_{F_3}`, then every prime `Q ⊂ 𝔭` contains `J_{𝒮_{F_3}}` (nt26
Proposition 3.12, p. 23; Proposition 3.13, p. 24). The residual coefficient field is chosen at the
start to split every subgroup of the residual image, and geometric weak primitivity is verified
before this choice.

*Proof sketch.* Proposition 3.12: adjoin an `X_0`-split soluble extension of `F` sufficiently tamely
ramified at `v_0`, so that the finitely many local representations `r_𝔭|_{G_{K_ṽ}}` become unramified
with scalar Frobenius. Proposition 3.13: for trivial restriction this is the weak-primitive generic
`R = T` theorem (PotentialAutomorphyInfrastructurePartII Layer 7); the scalar case reduces to it by
twisting (Layer 7, "Twisting and soluble base change for residually reducible rings and Hecke
algebras").

**Checks.**

- Trivial restriction at `T_{F_3}` is the scalar case with scalar `1`.
- `𝒫` is finite, which is what allows a single `F_3` to work for all its members.
- If the restriction at some `v ∈ T_{F_3}` were non-scalar unipotent, the generic `R = T` theorem
  would not apply directly.

*Needs:* §11.7; PotentialAutomorphyInfrastructurePartII Layer 7 ("The weak-primitive generic `R = T`
theorem"; "Twisting and soluble base change for residually reducible rings and Hecke algebras";
"Absolute irreducibility at a generic prime survives restriction"; "Weak primitivity over a splitting coefficient field").

### 11.9 Every component of the Steinberg problem is automorphic after restriction

Prove that there are `Λ_{F_3}`-algebra maps `R_{𝒮_{F_3}} → R_{𝒮′_{F_2}}` and
`R_{𝒮_{F_3}} → R_{𝒮_{F_1}}` by restriction (`τ_s` becomes unipotent over `F_3` because the base change
of `π` to `F_2` is unramified above `v_0`), compatible maps of the pseudodeformation subrings, and
`𝕋_{F_3} → 𝕋_{F_2}` by soluble base change, so that `J_{𝒮_{F_3}} P_{𝒮′_{F_2}} ⊂ J_{𝒮′_{F_2}}`; and
(Proposition 3.14) that for every prime `Q ⊂ R_{𝒮′_{F_2}}/(ϖ)` its pullback `Q_{F_3}` to `R_{𝒮_{F_3}}`
contains `J_{𝒮_{F_3}}` (nt26 the comparison diagram, p. 24; Proposition 3.14 and proof, p. 24).

*Proof sketch.* The restriction and ordinary Hecke base-change diagram, with the same
pseudodeformation subrings (PotentialAutomorphyInfrastructurePartII Layer 2; §6.3). The ordinary
Hecke algebra of the Steinberg seed of §11.6 is faithful over `Λ`; with finiteness and
equidimensionality this gives a minimal characteristic-`p` component containing the Hecke kernel.
Propagate along the connected graph of §11.7: at each edge, pull its witness in `𝒫` back to `F_3`,
where it is locally scalar by Proposition 3.12; Proposition 3.13 puts the Hecke kernel into both
adjacent component primes. Every vertex, and hence every prime above a vertex, contains the
pulled-back kernel.

**Checks.**

- One automorphic component plus connectivity gives all components.
- If the graph had two connected components, only the one containing the seed would be reached.
- The inclusion `J_{𝒮_{F_3}} P_{𝒮′_{F_2}} ⊂ J_{𝒮′_{F_2}}` is the compatibility of Hecke kernels with
  base change; without it the propagation would not return to `F_2`.

*Needs:* §§11.6–11.8; §6.3; PotentialAutomorphyInfrastructurePartII Layer 7 ("Twisting and soluble
base change for residually reducible rings and Hecke algebras").

### 11.10 Automorphy of the untwisted tensor `r_π ⊗ Sym^{r−1} r_σ` (Newton–Thorne 2026 Theorem 3.2)

Under §11.1, assume `SP_{r−1}` and `SP_{r+1}`. Prove that for any `σ` with the properties of §11.2,
`r_{π,ι} ⊗ Sym^{r−1} r_{σ,ι} ≅ r_{Π,ι}` for an ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` (nt26 Theorem 3.2,
p. 13; completion of the proof, p. 25). For `r = 1` the statement is trivial. This is the tensor
theorem for the prescribed `π` and `σ`, not general `GL_2 × GL_r` functoriality.

*Proof sketch.* `s` gives `f : R_{𝒮_{F_1}} → 𝒪` (§11.3). Choose a minimal prime `Q ⊂ ker(f)`;
Proposition 3.11 puts `Q` in a characteristic-`p` dimension-one generic prime `𝔭` with `𝔭_{F_2} ∈ 𝒫`.
Proposition 3.14 gives `J_{𝒮_{F_3}} ⊂ 𝔭_{F_3}`; Proposition 3.12 makes the local restrictions of this
generic representation scalar; Proposition 3.13, applied to `Q_{F_3} ⊂ 𝔭_{F_3}`, gives
`J_{𝒮_{F_3}} ⊂ Q_{F_3} ⊂ ker(f)_{F_3}` (membership in the larger generic prime alone does not give
automorphy of `f`). The Hecke support criterion gives automorphy of `s|_{G_{K_3}}`; undo `X`, `Y` and
descend from `K_3` to `K_1` and then to `F` (PotentialAutomorphyInfrastructurePartII Layer 0).

**Checks.**

- For `r = 2` the tensor `r_π ⊗ r_σ` is automorphic by Ramakrishnan (ModularityAndLanglandsExtensions
  §1.11), a consistency check.
- For `r = 1` the conclusion is the automorphy of `r_π`, and `SP_0` is never invoked.
- Hodge–Tate weights of `r_π ⊗ Sym^{r−1} r_σ` are `{0, 1, …, 2r − 1}`, so `Π` is regular algebraic.

*Needs:* §§11.3, 11.5, 11.8, 11.9; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base
change and descent of polarized automorphy"; "Automorphy of an induced representation descends";
"Automorphy is invariant under algebraic twists"); ModularityAndLanglandsExtensions §1.11.

### Examples

- `p = 5`, `r = 2`: `n = 4`, `s̄` splits as `3 + 1`, and the theorem uses `SP_1`, `SP_3`.
- `p = 7`, `r = 3`: `n = 6`, `s̄` splits as `4 + 2`, and the theorem uses `SP_2`, `SP_4`.

### Dependencies

Layer 6; GL2AutomorphicRepresentationsAndTransfer §R16.3.7; ArithmeticGaloisRepresentations §§4.4,
7.8, 7.9; ArithmeticGaloisDuality §R02.3.5; ModularityAndLanglandsExtensions §§1.11, 1.12, 1.15, 2.13;
PotentialAutomorphyInfrastructurePartII Layers 0, 1, 2, 3, 5, 7, 8
(gap:auxiliary-place-reducible-lifting); PotentialAutomorphyInfrastructure §2.5;
PotentialModularityAndCompatibleSystems §2.16; DeformationAndDerivedPatchingAlgebra §6.6;
GlobalGaloisDeformations §8.1; LocalGaloisDeformationRings §§2.13, 2.18, 2.24, 2.26, 2.27;
OrdinaryAutomorphicFormsAndModularityLifting §2.11; PotentialModularityAndCompatibleSystems §9.2;
Chebotarev Layer 10.

## Layer 12: functoriality lifting for tensor products

This layer proves that automorphy of `r_π ⊗ r_σ` passes to `r_{π′} ⊗ r_σ` for congruent `π`, `π′`
with `σ` fixed (nt26 Theorem 4.1, pp. 25–37), by the simultaneous patching of Layer 9: the rank-two
deformation ring of `r̄_π` and the rank-`2r` conjugate self-dual pseudodeformation ring of the tensor
are patched simultaneously, and regularity at the automorphic point (from characteristic-zero
enormous image and adjoint Selmer vanishing) transfers automorphy. This proves the first paragraph
of ModularityAndLanglandsExtensions §4.23. Throughout `Σ_π` is the ramification set of `π` (and `π′`)
and `Σ = Σ_π ∪ Σ_σ`; the quaternion algebra is ramified only at `Σ_π` away from `p`, while `S` and the
unitary level use all of `Σ`. The printed proof takes `S = S_p ∪ Σ_π` only, which does not cover the
application in §13.4, where `σ = Sym^{r−1} σ′` is ramified where `π` is not. The places of `Σ_σ − Σ_π`
away from `p` are added to `S` and to the unitary Iwahori level, with unramified rank-two local
conditions and split quaternion algebra. The places of `Σ_σ` above `p` lie in `S_p` already and are in
the unitary Iwahori level; there the rank-two local condition is the one `π` determines (crystalline,
ordinary crystalline, or semistable non-crystalline, with Hodge–Tate weights `{0, 1}`), whatever the
ramification of `σ`, and the exclusion of `p = 2` concerns `Σ_π ∩ S_p` only.

### 12.1 Preliminary reductions and the CM set-up for tensor functoriality lifting

In the situation of §12.7, prove that after a soluble totally real base change (from which the
conclusion descends) one may assume in addition: (10) `det r_π = det r_{π′} = ε^{−1}`; (11) `[F : ℚ]`
even; (12) `π_v`, `π′_v` and `σ_v` Iwahori-spherical at every finite `v`, with an even number of places
where `π`, `π′` are ramified; (13) with `S = S_p ∪ Σ`, `r̄_{π,ι}|_{G_{F_v}}` trivial for `v ∈ S`, and
for `v ∈ Σ` away from `p`, `q_v ≡ 1` modulo `p` with `π_v`, `π′_v` Steinberg or unramified as the case
may be (if `Σ_π ∩ S_p ≠ ∅` then `p > 2`, since at such a place `π_v` is an unramified twist of
Steinberg, so `r_{π,ι}|_{G_{F_v}}` is not potentially crystalline and (4) of §12.7 excludes `p = 2`);
(14) an `S`-split everywhere unramified quadratic CM `K/F` with
CM type `Φ` and places `S̃`; (15) everywhere unramified type-`A_0` characters `X`, `Y` of `K` with
`X ∘ N = χ ∘ N` (where `σ ≅ σ^∨ ⊗ χ`), `Y ∘ N = |·|` and prescribed infinity types; (16)
`(r_π ⊗ r_σ)|_{G_{K(ζ_{p^∞})}}` and `(r_{π′} ⊗ r_σ)|_{G_K}` irreducible. Define `π_K = BC(π)`,
`π′_K = BC(π′)`, `σ_K = BC(σ) ⊗ X^{−1}`, the RACSDC representation `T` of `GL_n(𝔸_K)` of weight `0`
with `r_T ≅ r_{π_K} ⊗ r_{σ_K} ⊗ r_Y^{1−r}`, integral models `r`, `r′`, `s` (`r̄ = r̄′`), and the group
determinants `t`, `t′` of `(r ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r}}` and its `π′`-analogue, with common
reduction `t̄` (nt26 proof of Theorem 4.1, reductions (10)–(16), pp. 26–27; the CM set-up,
pp. 27–28).

*Proof sketch.* The soluble totally real extension is built from cyclic steps with prescribed split
places (PotentialAutomorphyInfrastructure §2.5) and steps with prescribed completions at `S`
(PotentialModularityAndCompatibleSystems §2.16), which give (11)–(13). Soluble base change preserves
(1)–(9) of §12.7 and the conclusion descends (PotentialAutomorphyInfrastructurePartII Layer 0). `X X^c = χ ∘ N` and `Y Y^c = |·|_K` give
`r_T^c ≅ r_T^∨ ⊗ ε^{1−2r}`, and `X^{−1} Y^{1−r}` has trivial infinity type (Layer 0, auxiliary
characters).

**API.**

- The base changes `π_K = BC_{K/F}(π)` and `π′_K = BC_{K/F}(π′)` are cuspidal automorphic
  representations of `GL_2(𝔸_K)`, with `r_{π_K,ι} ≅ r_{π,ι}|_{G_K}` and `r_{π′_K,ι} ≅ r_{π′,ι}|_{G_K}`
  (cuspidal because these restrictions are irreducible, by (16)).
- The twisted base change `σ_K = BC_{K/F}(σ) ⊗ X^{−1}` is a cuspidal automorphic representation of
  `GL_r(𝔸_K)` with `r_{σ_K,ι} ≅ r_{σ,ι}|_{G_K} ⊗ r_{X,ι}^{−1}` (cuspidal because `r_{σ,ι}|_{G_K}` is
  irreducible, by (16)); it is conjugate self-dual, since
  `σ ≅ σ^∨ ⊗ χ` and `X X^c = χ ∘ N_{K/F}` give `σ_K^c ≅ σ_K^∨`.
- `T` is a RACSDC automorphic representation of `GL_{2r}(𝔸_K)` of weight `0` with
  `r_{T,ι} ≅ r_{π_K,ι} ⊗ r_{σ_K,ι} ⊗ r_{Y,ι}^{1−r}`.
- After enlarging the coefficient field `E`, the integral models `r, r′ : G_F → GL_2(𝒪)` and
  `s : G_F → GL_r(𝒪)` are conjugate to `r_{π,ι}`, `r_{π′,ι}`, `r_{σ,ι}`, the characters `r_{X,ι}`,
  `r_{Y,ι}` take values in `𝒪^×`, the reductions satisfy `r̄ = r̄′` as homomorphisms (not only up to
  conjugacy), and the eigenvalues of the images of `r̄` and `s̄` lie in the residue field `k`.
- The group determinants `t`, `t′` of `G_K` over `𝒪` are those of the `2r`-dimensional
  representations `(r ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}` and `(r′ ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}`;
  `t` is the determinant attached to `r_{T,ι}`, and `t ≡ t′` modulo `ϖ`, with common reduction `t̄`,
  because
  `r̄ = r̄′`.

**Checks.**

- For `r = 1`, `σ` is a character, `T = π_K ⊗ σ_K`, and the argument is rank-two modularity lifting.
- At a place of `Σ_σ − Σ_π` away from `p` the quaternion algebra is split and the rank-two condition
  is unramified; putting the place into the quaternionic ramification instead would change the
  rank-two automorphic input.
- At a place `v | p` of `Σ_σ − Σ_π` the rank-two condition is not the unramified one. Take `p = 2`,
  `r ≥ 2`, `r_{π,ι}|_{G_{F_v}}` crystalline with Hodge–Tate weights `{0, 1}` and `σ_v` an unramified
  twist of Steinberg, so that `r_{σ,ι}|_{G_{F_v}}` is semistable with monodromy of rank `r − 1 ≥ 1`
  while that of `r_{π,ι}|_{G_{F_v}}` is `0`. Then `Σ_π ∩ S_2 = ∅` and `Σ ∩ S_2 ≠ ∅`: hypothesis (4)
  of §12.7 holds and `p = 2` is allowed, which the implication with `Σ ∩ S_p` in place of `Σ_π ∩ S_p` would wrongly exclude.
  The rank-two condition at `v` is the crystalline one of weights `{0, 1}`, which contains `r_{π,ι}`;
  an unramified lift of the trivial residual representation has Hodge–Tate weights `{0, 0}` and
  misses it.
- `n = 2r` and `T` has weight `0`, so its Hodge–Tate weights are the `2r` distinct integers
  `{0, …, 2r − 1}` up to a common shift, by (7) of §12.7.

*Needs:* PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of
polarized automorphy"; "Algebraic characters with prescribed conjugate norm and local behaviour");
PotentialAutomorphyInfrastructure §2.5 ("Auxiliary soluble and cyclic extensions");
PotentialModularityAndCompatibleSystems §2.16; GL2ModularityLifting Layer 2.

### 12.2 Artinian points are torsion semistable, and the tensor map P → R

In the setting of §12.1, prove (Lemma 4.2) that for Artinian `A ∈ 𝒞_𝒪`, `v ∈ S_p` and a lift `r̃_A` of
`r̄|_{G_{F_v}}` of determinant `ε^{−1}` of the given type at `v`, the module `A^{2r}` with the action
`r̃_A ⊗ s|_{G_{K_ṽ}} ⊗ r_{X^{−1}Y^{1−r},ι}` is a subquotient of a lattice in a semistable
representation with Hodge–Tate weights in a fixed interval `[a, b]`; and (Corollary 4.3) that
`r̃ ↦ (r̃ ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}` defines a morphism `P → R` in `𝒞_𝒪` from the conjugate
self-dual pseudodeformation ring of rank `2r` (semistable in the torsion sense at `p`) to the
rank-two deformation ring `R`, and `t`, `t′` give homomorphisms `P → 𝒪` (nt26 Lemma 4.2,
pp. 28–29; Corollary 4.3, p. 29).

*Proof sketch.* At a potentially crystalline place of weights `{0, 1}`, each Artinian rank-two point
is a quotient of a lattice in a crystalline representation with weights `{0, 1}`
(FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4, supplier contracts); tensor with the fixed
semistable lattice and character, which gives a uniform interval. At a non-crystalline ordinary place
use the closed stable torsion-semistable quotient `R′` of the local ring (LocalGaloisDeformationRings
§§8.12, 8.14): the reduced local ring has dense characteristic-zero semistable points, all of which
factor through `R′`, so the whole map does, and every Artinian specialisation is torsion semistable
(an ordinary filtration alone does not give this). The universal property of the semistable
pseudodeformation ring (PotentialAutomorphyInfrastructurePartII Layer 9) gives `P → R` and the two
`𝒪`-points.

**Checks.**

- At the automorphic point the map `P → 𝒪` given by `t` is the composite of `R → 𝒪` (from `r`) with
  `P → R`.
- For `r = 1` the map `P → R` is the twist of the rank-two trace by the character `s ⊗ r_{X^{−1}}`.
- The interval `[a, b]` depends only on `s` and the fixed character, not on `A`, which is what the
  torsion-semistable condition needs.

*Needs:* §12.1; §9.2; LocalGaloisDeformationRings §§8.12, 8.14; PotentialAutomorphyInfrastructurePartII
Layer 9 ("Semistable conjugate self-dual pseudodeformation rings");
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20 (gap:artinian-crystalline-quotients).

### 12.3 Taylor–Wiles data and rings for the tensor product

Let `N ≥ 1`. Define a Taylor–Wiles datum of level `N` for the tensor as
`(Q, Q̃, (α_v, β_v), (γ_{v,1}, …, γ_{v,r}))` with `Q` a finite set of places disjoint from `S`
and split in `K`,
`q_v ≡ 1` modulo `p^N`, a factorisation `v = ṽṽ^c`, `(r̄ ⊗ s̄)(Frob_ṽ)` having `2r` distinct eigenvalues,
`α_v`, `β_v` the eigenvalues of `r̄(Frob_ṽ)` and `γ_{v,i}` those of `(s̄ ⊗ r_{X^{−1}Y^{1−r}})(Frob_ṽ)`.
Attach `Δ_Q`, with `R_Q` an `𝒪[Δ_Q]`-algebra such that `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R`; `P_Q`, the quotient of
the pseudodeformation ring of `G_{K,S∪Q}` by the Taylor–Wiles conditions (at `ṽ ∈ Q̃` the residual
characters are `α_v γ_{v,i}` for `i ≤ r` and `β_v γ_{v,i−r}` for `i > r`), with its `𝒪[Δ′_Q]`-structure,
`Δ′_Q = Δ_Q^{2r}`; and the map `P_Q → R_Q` extending §12.2 (nt26 §4 after Corollary 4.3, Taylor–Wiles
data and the rings, pp. 29–30). At the auxiliary places the decomposition is into ordered lifts of the
residual eigencharacters, which may be ramified and encode the diamond action.

*Proof sketch.* As §9.3, with the tensor eigenvalue pattern in place of the symmetric-power monomials,
using uniqueness of decompositions of multiplicity-free pseudocharacters (IntegralHeckeAndGaloisDeterminants
§1.4). The existence of enough data uses the perfect residual subgroup containing an element with
`2r` distinct eigenvalues (hypothesis (6) of §12.7) and rank-two large residual image
(GlobalGaloisDeformations Layer G7, supplier contracts); characteristic-zero enormous image is a
different hypothesis and does not give this.

**API.**

- A level-`N` datum with finite `Q`, `Q ∩ S = ∅`, chosen split lifts, `q_v ≡ 1 mod p^N`
  and the specified ordered `2r` distinct eigenvalues of `(r̄ ⊗ s̄)(Frob_ṽ)`.
- The finite groups `Δ_Q`, `Δ′_Q`, and the rings `R_Q`, `P_Q` with their group-ring structures, and `P_Q → R_Q` extending `P → R`.
- At `ṽ ∈ Q̃` the residual characters of `P_Q` are `α_v γ_{v,i}` (`i ≤ r`) and `β_v γ_{v,i−r}`
  (`i > r`).
- Specialising all rank-two diamond characters to the identity gives `R_Q ⊗_{𝒪[Δ_Q]} 𝒪 ≅ R`; the map
  on rank-`2r` local characters is the ordered tensor product with the fixed factor.

**Checks.**

- If all local `p`-primary factors are `C₂` and `|Q| = k`, then `|Δ_Q| = 2^k`;
  `Q = ∅` gives `|Δ_Q| = 1` and `Δ′_Q = 1`. An infinite such `Q` gives an infinite
  product, so it fails the finite diamond-group datum even if all its places satisfy the
  individual congruence and eigenvalue conditions.
- There are `2r` residual characters at each `ṽ`: `r` of the form `α_v γ_{v,i}` and `r` of the form
  `β_v γ_{v,i}`.
- For `r = 1` the condition is `α_v ≠ β_v`, a rank-two Taylor–Wiles datum with `γ_{v,1}` a fixed
  scalar.
- If `α_v γ_{v,1} = β_v γ_{v,2}`, the `2r` eigenvalues are not distinct and `v` is not a Taylor–Wiles
  place.

*Needs:* §12.2; §9.3; GlobalGaloisDeformations §8.5 (gap:tensor-taylor-wiles-primes);
IntegralHeckeAndGaloisDeterminants §1.4.

### 12.4 Unitary automorphic forms at Taylor–Wiles level for the tensor

Let `G` be the definite unitary group over `F` with
`G(R) = {g ∈ M_n(𝒪_K ⊗ R) : g = (1 ⊗ c)(g)^{−t}}` (`n = 2r`), `H_G(V)` the `𝒪`-valued forms of level `V`,
`V_0 = ∏_v V_{0,v}` Iwahori at `Σ` (including `Σ_σ`) and hyperspecial elsewhere. For a Taylor–Wiles datum
of level `N` (§12.3) define `V_1(Q; N) ⊂ V_0(Q)` place by place: `V_1(Q; N)_v = V_0(Q)_v = V_{0,v}` for
`v ∉ Q`, and for `v ∈ Q`, `V_0(Q)_v = ι_ṽ^{−1}(Iw_ṽ)` and
`V_1(Q; N)_v = ι_ṽ^{−1}{(a_{ij}) ∈ Iw_ṽ : a_{ii} ↦ 1 in k(ṽ)^×(p)/(p^N) for 1 ≤ i ≤ n}`, the kernel of the
ordered diagonal map `Iw_ṽ → (k(ṽ)^×(p)/(p^N))^n` (nt26 pp. 31–32). This is not the level of §9.4,
which imposes a single character of the diagonal; it is the level written `V′_1(Q; N)` in the proof of
nt21b Proposition 2.5. Thus `V_1(Q; N)` is normal in `V_0(Q)` and the ordered diagonal entries give the
diamond isomorphism `V_0(Q)/V_1(Q; N) ≅ Δ′_Q/(p^N)`, `Δ′_Q = Δ_Q^{2r}`, whose `i`-th coordinate at `ṽ`
is the `i`-th factor of the `𝒪[Δ′_Q]`-structure of `P_Q` (§12.3), attached to the `i`-th entry of
the ordering `η = (αγ_1, …, αγ_r, βγ_1, …, βγ_r)` of the residual eigenvalues. Let `𝔪_G`, `𝔪_{G,Q}` be the
maximal ideals where `𝔪_{G,Q}` contains `U^{(i)} − q^{i(1−i)/2} ∏_{j=1}^{i} η_j` at each
auxiliary place; for `i > r` this product is
`α^r β^{i−r} (∏_{j=1}^{r} γ_j)(∏_{j=1}^{i−r} γ_j)`. Prove (Lemma 4.5) that for `p = 2` each quadratic
`χ` of `F^× \ (𝔸_F^∞)^×/det U_1(Q; N)` has a unique quadratic `θ_χ` with
`θ_χ(z/z^c) = χ ∘ N_{K/F}(z)`; and (Proposition 4.6) that for a datum of level `N + c_G`, where
`p^{c_G}` kills the `p`-primary base-level stabilisers, `𝔪_G` and `𝔪_{G,Q}` are in the supports,
`H_G(V_1(Q; N))_{𝔪_{G,Q}}` is free over `𝒪[Δ′_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`, and it
carries a compatible `P_Q`-module structure (nt26 §4, unitary forms, pp. 31–32; Lemma 4.5, p. 32;
Proposition 4.6, p. 33). The diamond action is compatible with the ordering: the `i`-th coordinate
of `Δ′_Q` acts on `H_G(V_1(Q; N))_{𝔪_{G,Q}}` as it acts on `P_Q`, through the inertial character of the
lift of `η_i`. The printed generator of `𝔪_{G,Q}` for `i > r` omits the factor `∏_{j=1}^{r} γ_j`; the
product of the first `i` entries of `η` is meant.

*Proof sketch.* As §9.4: at level `N + c_G` the deck group acts freely, exactness gives freeness and
the trace identifies the coinvariants (PotentialAutomorphyInfrastructurePartII Layer 3). Support
from Labesse's descent of the automorphic `T` (EndoscopicTransferAndUnitaryTraceComparison §6.29).
The ordered cumulative products `η_1 ⋯ η_i` define `𝔪_{G,Q}`, and the multiplicity-free
decomposition of the Hecke determinant gives the `P_Q`-action. Lemma 4.5 by Hilbert 90. For `p = 2`
the dyadic forms of Layer 3 are used (supplier contracts).

**API.**

- The levels `V_0(Q) ⊃ V_1(Q; N)`: `ι_ṽ^{−1}(Iw_ṽ)` at `v ∈ Q`, and inside it the kernel of the ordered
  diagonal map to `(k(ṽ)^×(p)/(p^N))^{2r}`; equal to `V_{0,v}` away from `Q`.
- The diamond isomorphism `V_0(Q)/V_1(Q; N) ≅ Δ′_Q/(p^N)`, its `i`-th coordinate at `ṽ` matched with the
  `i`-th residual character `η_i` of `P_Q`.
- The maximal ideals `𝔪_G`, `𝔪_{G,Q}`, the latter generated with the cumulative products `η_1 ⋯ η_i`.
- Freeness of `H_G(V_1(Q; N))_{𝔪_{G,Q}}` over `𝒪[Δ′_Q/(p^N)]` with coinvariants `H_G(V_0)_{𝔪_G}`, and its
  `P_Q`-module structure compatible with the diamond action.
- For `p = 2`, the unique quadratic `θ_χ` with `θ_χ(z/z^c) = χ ∘ N_{K/F}(z)`.

**Checks.**

- For `N = 1`, augmentation from `𝒪[Δ′_Q/(p)]` recovers `H_G(V_0)_{𝔪_G}` with its Hecke action.
- The full ordered quotient is required. For `r = 1`, `p = 2` and a place `v ∈ Q` with
  `k(ṽ)^×(2)/(2^N)` of order `2`, `V_0(Q)_v/V_1(Q; N)_v ≅ C_2 × C_2` has order `4`, matching the two
  coordinates of `Δ′_Q` at `v`. The kernel of the determinant `a_{11}a_{22}` alone, or of the single
  character `a_{11}/a_{22}` of §9.4, has quotient of order `2` and does not give `Δ′_Q/(p^N)`.
- The ambient level is the Iwahori. The subgroup of `GL_n(𝒪_{K_ṽ})` with entries below the diagonal in
  `ϖ_ṽ²𝒪_{K_ṽ}` has the same ordered diagonal quotient but is strictly smaller than `Iw_ṽ`; with it the
  `U^{(i)}` and the coinvariants change, and `V_0(Q)_v = ι_ṽ^{−1}(Iw_ṽ)` excludes it.
- The ordering matters. For `r = 1`, `α = 2`, `β = 3`, `γ_1 = 5`: `η = (10, 15)`, `𝔪_{G,Q}` contains
  `U^{(1)} − 10` and `U^{(2)} − q_v^{−1}·150`, and the first diagonal coordinate acts through the lift of
  the character with residual value `10`. Exchanging the two coordinates while keeping these generators
  would match the diamond action with the wrong eigencharacter.
- For `r = 1`, `i = 2`: `η_1 η_2 = αγ_1 · βγ_1 = αβγ_1²`, which the corrected formula gives; the
  printed formula, without `∏_{j ≤ r} γ_j`, gives `αβγ_1`.
- With `σ`-only places omitted from the Iwahori level, the form `T` (ramified there) would not
  contribute to `H_G(V_0)`, and `𝔪_G` would not be in the support.

*Needs:* §§9.4, 12.3; PotentialAutomorphyInfrastructurePartII Layer 3 ("Algebraic modular forms on a
definite unitary group"; "Exactness and group-ring freeness at level without `l`-torsion"; "Base
change and descent between definite unitary groups and `GL_n`") (gap:dyadic-definite-unitary-forms);
EndoscopicTransferAndUnitaryTraceComparison §6.29.

### 12.5 The tensor image is enormous

Prove that the image of `(r ⊗ s)|_{G_K} ⊗ r_{X^{−1}Y^{1−r},ι}` restricted to `G_{K(ζ_{p^∞})}` is enormous
in the sense of ArithmeticGaloisRepresentations §7.10 (as used in ModularityAndLanglandsExtensions
§4.1), after enlarging the coefficient field so that every characteristic polynomial splits (nt26
Lemma 4.7 and proof, pp. 33–34). The inputs are hypothesis (8) of §12.7 (strong irreducibility of
`r_π ⊗ r_σ`) and Hodge–Tate regularity of the tensor (weights `{0, 1, …, 2r − 1}` by (7)).

*Proof sketch.* By the criterion of ArithmeticGaloisRepresentations §7.10 it suffices that the
derived subgroup `G^1` of the identity component `G^0` of the Zariski closure of the image contains
regular semisimple elements and acts absolutely irreducibly; `G^1` lies in the Zariski closure of the
image of `G_{K(ζ_{p^∞})}` (§7.6 there). `G^0` acts irreducibly because the representation is strongly
irreducible, so its centre is scalar and `G^0 = G^1` or `G^1 𝔾_m`, hence `G^1` acts irreducibly. At
`v ∈ S_p` the Sen operator lies in `Lie G^0` (PadicHodgeTheory §4.4) and has `n` distinct eigenvalues
by Hodge–Tate regularity; a maximal-torus argument gives regular semisimple elements in `G^0`, hence in
`G^1`. Enormousness is the input to adjoint Selmer vanishing (ModularityAndLanglandsExtensions §4.1) at the automorphic point.

**Checks.**

- A tensor that is not Hodge–Tate regular (`σ` of weights `{0, 1, …, r − 1}` instead of
  `{0, 2, …, 2r − 2}`) need not have a Sen operator with distinct eigenvalues: for `r = 2`,
  `{0, 1} + {0, 1}` repeats `1`, and the criterion fails.
- `SO(Q)`-valued images show why the coefficient field must split the characteristic polynomials
  (the hypothesis of ArithmeticGaloisRepresentations §7.10).
- For `r = 1` the tensor is a twist of `r_π`, and enormousness of an image containing `SL_2` up to
  scalars is the classical rank-two statement.

*Needs:* §12.1; ArithmeticGaloisRepresentations §§7.6, 7.10; PadicHodgeTheory §4.4;
ModularityAndLanglandsExtensions §4.1.

### 12.6 Patching for tensor functoriality lifting

Prove (`p > 2`, Proposition 4.8) that there are `W_∞ = 𝒪[[Y_1, …, Y_q, Z_1, …, Z_{4|S∪S_∞|−1}]]` and
`W′_∞` (with `n` copies of the `Y`-variables), a `W′_∞`-algebra `P_∞` and a `W_∞`-algebra `R_∞` with
`P_∞ ⊗ 𝒪 ≅ P` and `R_∞ ⊗ 𝒪 ≅ R`, a surjection `R^{loc}[[X_1, …, X_g]] → R_∞` with
`g = q + |S ∪ S_∞| − 1`, patched modules `H_{G,∞}`, `H_{D,∞}` finite free over `W′_∞`, `W_∞`
specialising to `H_G`, `H_D`, and `P_∞ → R_∞` compatible with `P → R`; and (`p = 2`, Proposition 4.9)
with `q ≥ |S ∪ S_∞|` and `γ = 2 − |S ∪ S_∞| + q`, the same with `R^{loc}[[X_1, …, X_g]] → R′_∞ → R_∞`
(`g = 2q + 1`), a free action of `Ĝ_m^γ` on `Sp R′_∞` with an equivariant `δ : Sp R′_∞ → Ĝ_m^γ` for the
square action and `δ^{−1}(1) = Sp R_∞`, and compatible actions of `Ĝ_m^γ[2]` lifting to `H_{D,∞}` and
`H_{G,∞}` (nt26 Proposition 4.8, p. 34; Proposition 4.9, pp. 35–36). For odd `p`, `q ≥ 0` is the common
size of the Taylor–Wiles sets of §12.3 used in the patching, as in §9.5 (nt26 Proposition 4.8 asks
only for an integer `q ≥ 0`).

*Proof sketch.* As §§9.5–9.6, patching the quaternionic modules for `r̄` (GL2ModularityLifting Layers
2–3, 6) and the unitary modules of §12.4 simultaneously, with the Taylor–Wiles data of §12.3
(DeformationAndDerivedPatchingAlgebra §5.6 and the formal-torus contract for `p = 2`); the rank `2r` of
the pseudocharacter side enters only through `P`, the data and the unitary module. This step does not
follow from §12.5.

**Checks.**

- `dim W′_∞ − dim W_∞ = (n − 1)q`, the extra `Y`-variables of the rank-`n` unitary side.
- For `r = 1` (`n = 2`), `W′_∞ = W_∞ ⊗̂ 𝒪[[Y′_1, …, Y′_q]]` and the construction is rank-two patching
  with a redundant copy of the diamond variables.
- Since `q ≥ |S ∪ S_∞|`, `γ ≥ 2`: for `q = |S ∪ S_∞| = 3`, `γ = 2 − 3 + 3 = 2` and
  `Ĝ_m^γ[2](𝒪) = {±1}²` has order `4` (`−1 ∈ 1 + 𝔪_𝒪` as `p = 2`). Without the bound the formula
  would give `γ = 2 − 3 + 0 = −1` for `q = 0`, which is why the bound on `q` is part of the statement.

*Needs:* §§9.5, 9.6, 12.3, 12.4; GL2ModularityLifting Layers 2, 3, 6; DeformationAndDerivedPatchingAlgebra
§5.6 (gap:formal-torus-patching); GlobalGaloisDeformations §4.11.

### 12.7 Functoriality lifting for a tensor with one factor fixed (Newton–Thorne 2026 Theorem 4.1)

Let `F` be totally real, `r ≥ 1`, `p` any prime, `ι : ℚ̄_p ≅ ℂ`, `π`, `π′` RAESDC on `GL_2(𝔸_F)` and `σ`
RAESDC on `GL_r(𝔸_F)` with (1) `π`, `π′` of weight `0` and non-CM; (2) `r̄_{π,ι} ≅ r̄_{π′,ι}`; (3)
`r̄_{π,ι}(G_F)` containing a conjugate of `SL_2(𝔽_{p^a})`, `p^a > 5`; (4) at each `v | p`,
`r_{π,ι}|_{G_{F_v}}` ordinary (resp. potentially crystalline) exactly when `r_{π′,ι}|_{G_{F_v}}` is, both
potentially crystalline if `p = 2`; (5) at each `v ∤ p`, `π_v` a twist of Steinberg exactly when `π′_v`
is; (6) a perfect subgroup of `(r̄_{π,ι} ⊗ r̄_{σ,ι})^{ss}(G_F)` containing an element with `2r` distinct
eigenvalues; (7) `HT_τ(r_{σ,ι}) = {0, 2, …, 2r − 2}` for every `τ`; (8) `r_{π,ι} ⊗ r_{σ,ι}` automorphic
and strongly irreducible; (9) `r_{π′,ι} ⊗ r_{σ,ι}` irreducible. Prove that `r_{π′,ι} ⊗ r_{σ,ι}` is
automorphic (nt26 Theorem 4.1, pp. 25–26; proof and component argument, pp. 34–36). This proves the first
paragraph of ModularityAndLanglandsExtensions §4.23, including the case where `σ` is ramified at
places where `π` is not.

*Proof sketch.* Reduce by §12.1. Characteristic-zero enormousness (§12.5) and adjoint Selmer vanishing
give `P_{(𝔭)} = E` at the automorphic characteristic-zero prime (PotentialAutomorphyInfrastructurePartII
Layer 9), and the patched specialisation gives regularity of `(P_∞)_{𝔭_∞}`, so `𝔭_∞` lies on a
unique component of `Supp H_{G,∞}`. For odd `p` the rank-two patched support is irreducible and
`H_{D,∞}` is faithful, so its image contains the target point on the same unitary component; for `p = 2`
the free action of `Ĝ_m^γ` on `Sp R′_∞` (`γ = 2 − |S ∪ S_∞| + q`, §12.6) and the `Ĝ_m^γ[2]`-torsor
`Sp R_∞ = δ^{−1}(1)` make `Ĝ_m^γ[2](𝒪)` act transitively on the irreducible components of
`Spec R_∞`, compatibly with its actions on `Spec P_∞` and on both patched modules; the unique
component of `Spec P_∞` through `𝔭_∞` has dimension `qn + 4|S ∪ S_∞| = dim W′_∞` and lies in
`Supp H_{G,∞}`, the component of `Spec R_∞` through the point of `t` maps into it and meets the orbit
of the point of `t′`, and as `Supp H_{G,∞}` is stable under the group, the point of `t′` lies in it,
as in §9.7. Hence `t′` is
automorphic: `r_{π′_K} ⊗ r_{σ_K} ⊗ r_Y^{1−r}` comes from a RACSDC representation of `GL_n(𝔸_K)`;
descend to `F` (PotentialAutomorphyInfrastructurePartII Layer 0).

**Checks.**

- `r = 1`: modularity lifting for weight-zero non-CM Hilbert forms twisted by a character.
- (7) with `π` of weights `{0, 1}` gives the tensor weights `{0, 1, …, 2r − 1}`, all distinct; with `σ`
  of weights `{0, 1, …, r − 1}` the weight `1` would repeat for `r ≥ 2`.
- (9) cannot be dropped: if `r_{π′} ⊗ r_σ` were reducible, it would not be the Galois representation of
  a cuspidal `Π`, and the conclusion would be false in the sense of ModularityAndLanglandsExtensions
  §0.2.

*Needs:* §§12.1, 12.5, 12.6; §9.7; PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base
change and descent of polarized automorphy"; "Automorphy of an induced representation descends"),
Layer 9 ("The pseudodeformation ring is its residue field at an automorphic point");
ModularityAndLanglandsExtensions §§0.2, 4.1.

### Examples

- `r = 2`, `p = 5`: `σ` a weight-`{0, 2}` companion; `r_π ⊗ r_σ` of weights `{0, 1, 2, 3}`.
- In §13.4 the theorem is applied with `σ = Sym^{r−1} σ′` (rank `r`, weights `{0, 2, …, 2r − 2}`),
  Steinberg at a place where `π` is unramified.

### Dependencies

Layer 9; PotentialAutomorphyInfrastructurePartII Layers 0, 3, 9; PotentialAutomorphyInfrastructure
§2.5; PotentialModularityAndCompatibleSystems §2.16; GlobalGaloisDeformations §§4.11, 8.5; LocalGaloisDeformationRings §§8.12, 8.14;
FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4; IntegralHeckeAndGaloisDeterminants §1.4;
GL2ModularityLifting Layers 2, 3, 6; DeformationAndDerivedPatchingAlgebra §5.6;
EndoscopicTransferAndUnitaryTraceComparison §6.29; ArithmeticGaloisRepresentations §§7.6, 7.10;
PadicHodgeTheory §4.4; ModularityAndLanglandsExtensions §§0.2, 4.1.

## Layer 13: residual twisted tensors and the induction on n

This layer proves `SP_n` for every `n` over every totally real field (nt26 Theorem 6.4, pp. 37–50;
th24 Theorems 7.1 and 7.6, pp. 42–47). Write `n = p + r` with `n/2 < p < n` prime. Modulo `p`,
`(Sym^{p+r−1} r̄)^{ss} ≅ (φ_p r̄ ⊗ Sym^{r−1} r̄) ⊕ (det r̄)^r ⊗ Sym^{p−r−1} r̄`
(ArithmeticGaloisRepresentations §7.8); Thorne's level raising (§6.9) and residually reducible lifting
turn ordinary automorphic witnesses for the two blocks into automorphy of `Sym^{p+r−1}` (§13.8). The
second block comes from `SP_{p−r}`; the first, the coefficient-Frobenius twisted tensor, comes from §11
and §12 by propagation over the Galois group of the coefficient field (§§13.3–13.6). The reciprocity
of the two auxiliary splitting conditions (nt26 Lemma 5.3) is ArithmeticGaloisDuality §R02.3.5. For
`r = 1` the twisted tensor is a coefficient conjugate of `π` and no `SP_0` occurs. The modular
two-block decomposition is an identity of semisimplifications, not a splitting of `Sym^{p+r−1} r̄`.

### 13.1 Large image at every prime from two tamely dihedral places

Fix `M > 5`. Let `π` be RAESDC on `GL_2(𝔸_F)` of weight `0` with (1) primes `t_1, t_2 > M` and places
`v_1`, `v_2` of residue characteristics `p_1, p_2 > 3`, unramified in `F`, with `π_{v_i}` tamely dihedral
of order `t_i` and `p_1, p_2, t_1, t_2` distinct; (2) with `S` the finite places `v ≠ v_1, v_2` where `π`
is ramified or `v` is ramified over `ℚ`, together with the places above `2` and `3`, `v_1` splits in
`F(S ∪ {v_2})` and `v_2` splits in `F(S ∪ {v_1})`. Prove that for every prime `p` and `ι : ℚ̄_p ≅ ℂ`,
`r̄_{π,ι}(G_F)` contains a conjugate of `SL_2(𝔽_{p^a})` for some `p^a > M` (nt26 Proposition 5.4 and
proof, pp. 39–40). The printed proof infers the strict bound `q > t − 1` on the projective field size
from one projective element of order `t`; for odd residual characteristic parity excludes `q = t − 1`,
and in characteristic two both places are used.

*Proof sketch.* Away from `{p_1, t_1}` the local representation at `v_1` is irreducible with a projective
element of order `t_1 > 5` (GL2AutomorphicRepresentationsAndTransfer §R16.3.8). Dickson's
classification (ArithmeticGaloisRepresentations §4.4) leaves `PSL_2(𝔽_q)`, `PGL_2(𝔽_q)` or a dihedral
image; in the former cases `t_1 | q ± 1`. In odd residual characteristic `q` is odd, so `q = t_1 − 1` is
impossible and `q > M`. In residual characteristic `2`, if `q ≤ M` then the distinct odd primes
`t_1, t_2 > M` can divide `q ± 1` only by both equalling `q + 1`, a contradiction. For `p ∈ {p_1, t_1}`
use `v_2` (these `p` are odd). If the residual representation is induced from `K/F`, Fontaine–Laffaille
(FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11) and the tame local conditions bound the
ramification of `K` by `S ∪ {v_2}` (dyadic places are in `S`), and the splitting of `v_1` in this
exponent-two extension (ArithmeticGaloisDuality §R02.3.5) contradicts local irreducibility at `v_1`;
exchange the places in the other case.

**Checks.**

- Without the splitting hypothesis, a quadratic inducing field can be non-split at `v_1` (for
  example unramified quadratic locally); odd-order tame inertia does not force ramification of that
  field at `v_1`.
- Characteristic `2` with `M = 6`: if `q ≤ 6` then `q ∈ {2, 4}` and `q ± 1 ∈ {1, 3, 5}`, divisible by no
  prime `t_i > 6`; in general `t_1, t_2 > M ≥ q` could divide `q ± 1` only by both equalling `q + 1`.
- In odd characteristic, `q = t_1 − 1` is even, hence not a power of an odd prime.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §R16.3.8; ArithmeticGaloisRepresentations §4.4;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11; ArithmeticGaloisDuality §R02.3.5.

### 13.2 The hypotheses `S5-global` and `S5-local`

Define `S5-global` on `(F, p, r, ι, π)`: `F` totally real, `p ≥ 5`, `0 < r < p`, `SP_r`, `SP_{r+1}` and,
when `r > 1`, `SP_{r−1}`, and `π` RAESDC on `GL_2(𝔸_F)` with (1) `det r_{π,ι} = ε^{−1}`; (2) weight `0` and
`π_v` an unramified twist of Steinberg for every `v | p`; (3) a place `v_0` with `q_{v_0} ≡ −1` modulo `p`
and `π_{v_0}` tamely dihedral of order `p`; (4) for every prime `l` and every `ι_l`, `r̄_{π,ι_l}(G_F)`
containing a conjugate of `SL_2(𝔽_{l^a})` with `l^a > max(4r, 5)`, and `r̄_{π,ι}(G_F)` containing a
conjugate of `SL_2(𝔽_{p^a})` with `a > a₀(p)`; (5) `π_v` potentially unramified at every finite `v ∤ p`.
Define `S5-local` on `(F, p, r, M, ι, π, v_1, w_1, w_2, t_1, t_2)`: as before with `M > p^{a₀(p)}`, `π`
satisfying (1)–(3); (4) a place `v_1` with `q_{v_1} ≡ 1` modulo `p` and `π_{v_1}` an unramified twist of
Steinberg; (5) `π_v` potentially unramified at every `v ∤ p v_1`; (6) primes `t_1, t_2 > M` and places
`w_1`, `w_2` of residue characteristics `p_1, p_2 > 3` unramified in `F`, with `π_{w_i}` tamely dihedral
of order `t_i` and `p_1, p_2, t_1, t_2` distinct; (7) with `H` the ray class field of modulus `(8)∞` and
`S` the places `v ≠ w_1, w_2` where `π` is ramified, `v` is ramified over `ℚ` or has residue
characteristic `2` or `3`: `w_1` splits in `H · F(S)` and `w_2` splits in `H · F(S ∪ {w_1})` (nt26
Theorem 5.5, hypotheses, p. 40; Theorem 5.9, hypotheses, p. 44). Prove that `S5-local` implies the
large-image condition (4) of `S5-global` with `M` in place of `max(4r, 5)`.

*Proof sketch.* By ArithmeticGaloisDuality §R02.3.5 (one new ramified prime and reciprocity), (7)
implies the symmetric splitting condition of §13.1, which gives large image at every prime.

**API.**

- The hypotheses `S5-global` on `(F, p, r, ι, π)`, with `SP_m` the statement of
  ModularityAndLanglandsExtensions §1.12.
- The hypotheses `S5-local`, with the dihedral places and the splitting conditions.
- `S5-local` implies large residual image at every prime with bound `M` (§13.1).
- The coefficient Frobenius `φ_p` and the twisted residual representation `φ_p r̄ ⊗ Sym^{r−1} r̄`.

**Checks.**

- For `r = 3` the global image bound is `l^a > max(12, 5) = 12`.
- `q_{v_1} ≡ 1` modulo `p`: for `p = 5`, `q_{v_1} ∈ {11, 16, 31, 41, …}`.
- `S5-local` without (7) does not give large image at every prime: a dihedral residual representation
  can occur. For `r = 1` the tensor is a coefficient conjugate of `π`, `SP_1` is the trivial character
  and `SP_2` the given form.

*Needs:* §13.1; ArithmeticGaloisDuality §R02.3.5; ModularityAndLanglandsExtensions §1.12;
ArithmeticGaloisRepresentations §7.9; ClassFieldTheory Layers 12, 14.

### 13.3 The companions σ, σ′ and the auxiliary prime t

Prove: (Lemma 5.6) under `S5-global` there is a RAESDC `σ` on `GL_2(𝔸_F)` with the properties of §11.2
and `r_{π,ι} ⊗ Sym^{r−1} r_{σ,ι}` automorphic; (Lemma 5.7) with `K_π` the coefficient field of `π`,
`K̃_π` its Galois closure, `Γ_π = Gal(K̃_π/ℚ)`, `B ≥ 1` such that `K_π` is ramified only at primes
`< B`, and `φ = ιφ_pι^{−1}`, there are a prime `t`, `ι_t` and a RAESDC `σ′` with: `t > max(5, 4r + 2, B)`,
`t` unramified in `F` and all three forms unramified above `t`; the residual tensors of `π` and of `φπ`
with `Sym^{r−1} σ` at `t` absolutely irreducible over `F(ζ_t)`; `r̄_{σ,ι_t} ≅ r̄_{σ′,ι_t}` and `σ′_{v_0}`
an unramified Steinberg twist; `r_π ⊗ Sym^{r−1} r_{σ′}` automorphic, and `r_{φπ} ⊗ Sym^{r−1} r_σ`
automorphic exactly when `r_{φπ} ⊗ Sym^{r−1} r_{σ′}` is; for every `l < B` and `ι_l`, `r̄_{σ′,ι_l}` has
image containing `SL_2(𝔽_{l^a})` with `l^a > max(4r, 5)` and projective fixed field meeting that of `γπ`
in degree at most `2` over `F` for every `γ ∈ Γ_π`; the new auxiliary place `v_1` of the construction
lies away from `p`, `t` and all prescribed bad places, so that `π` and `σ` are unramified there (nt26
Lemma 5.6, p. 40; Lemma 5.7 and proof, pp. 40–42). The printed proof verifies tensor irreducibility over
`F` but not over `F(ζ_t)`, which potentially diagonalizable lifting needs, and does not exclude `v_1 | p`;
both are supplied below.

*Proof sketch.* For `r > 1`, `σ` comes from §11.2 and §11.10 (with `SP_{r±1}`); for `r = 1` the tensor is
`r_π`. Choose `t` outside the exceptional-image sets of `π`, `φπ`, `σ` and unramified in the coefficient
fields and in `F`. If two residual projective fields coincided, Dickson's classification
(ArithmeticGaloisRepresentations §4.4) would identify the adjoint representations up to coefficient
Frobenius; their Fontaine–Laffaille weights `{−1, 0, 1}` and `{−2, 0, 2}` at an unramified `t > 5`
exclude this (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11). The projective fields therefore
meet in at most a quadratic extension; Goursat (ArithmeticGaloisRepresentations §7.6) gives
`PSL_2(q_π) × PSL_2(q_σ)` in the joint projective image, and commutators lift it to
`SL_2(q_π) × SL_2(q_σ)` in the joint linear image (a subgroup of `SL_2 × SL_2` surjecting onto the
projective product, times the centre, is the whole perfect product, hence equals it). `G_{F(ζ_t)}` is
normal with abelian quotient, so its joint image contains this perfect product, on which
`Std ⊗ Sym^{r−1}` is absolutely irreducible since `r < t ≤ q_σ`. Take moreover `t ≡ 1` modulo `4` and
split in the coefficient field of `σ`, so that `r̄_{σ,ι_t}(G_F)` lies between `SL_2(𝔽_t)` and
`GL_2(𝔽_t)`. Choose `v_1` by Chebotarev outside the finite set over `p`, `t` and the ramification of
`π`, `σ` and the coefficient conjugates, with `q_{v_1} ≡ −1` modulo `t` and `r̄_{σ,ι_t}(Frob_{v_1})` of
eigenvalue ratio `−1`, which a lift of tamely dihedral type of order `t` at `v_1` requires (it exists
as complex conjugation has projective image in `PSL_2(𝔽_t)` for `t ≡ 1` modulo `4`; nt26 p. 42).
Construct `σ′` by the Khare–Wintenberger argument of §11.2 with potentially diagonalizable local
conditions: over a quadratic CM extension `E/F` in which `t` and the prescribed places split, linearly
disjoint from the field cut out by `r̄_{σ,ι_t}` over `F(ζ_t)`, ModularityAndLanglandsExtensions §2.25
gives a lift of `r̄_{σ,ι_t}|_{G_E}` with the multiplier of `r_{σ,ι_t}` connecting, above `t`, to
`r_{σ,ι_t}` itself (crystalline with labelled weights `{0, 2}` in the Fontaine–Laffaille range, as `t > 5`
is unramified in `F`, hence potentially diagonalizable by ModularityAndLanglandsExtensions §2.1), at
`v_1` to a lift of tamely dihedral type of order `t` (GL2AutomorphicRepresentationsAndTransfer
§R16.3.7), and elsewhere to the local components of `r_{σ,ι_t}`; it is automorphic by
ModularityAndLanglandsExtensions §2.16, the residual automorphy coming from `σ_E`, and descends to the
RAESDC `σ′` over `F` (PotentialAutomorphyInfrastructurePartII Layer 0, "Soluble base change and
descent of polarized automorphy"). A weight-two lifting theorem does not apply: it would change the
weights `{0, 2}` above `t`. At small `l` the projective field of `σ′` differs from each
`γπ` field by ramification at `v_1`, and Dickson gives field size `q ≥ t − 1 > 4r`. Potentially
diagonalizable automorphy lifting over `F(ζ_t)` (ModularityAndLanglandsExtensions §2.16)
gives the two comparisons, with coefficient conjugation (AutomorphicGaloisRepresentationsPartII
AG2.6).

**Checks.**

- For `K_π = ℚ`, `Γ_π` is trivial and `B = 1`, so the conditions at small primes are empty.
- The weights distinguishing the adjoints: `ad⁰` of a weight-`{0, 1}` form has weights `{−1, 0, 1}`,
  of a weight-`{0, 2}` form `{−2, 0, 2}`; an isomorphism up to coefficient Frobenius would preserve
  Fontaine–Laffaille weights at unramified `t > 5`.
- For `r = 2`, `Std ⊗ Std` is irreducible of dimension `4` on `SL_2(q_π) × SL_2(q_σ)`, but on a
  diagonal `SL_2(q)` (as would occur if the two projective fields coincided) it splits as `Sym² ⊕ 1`:
  this is why the fields must be shown to be almost disjoint.
- The weights of `σ′` above `t` must stay `{0, 2}`: §13.4 needs `HT(Sym^{r−1} σ′) = {0, 2, …, 2r − 2}`,
  and a weight-two companion (labelled weights `{0, 1}`) would make `r_π ⊗ Sym^{r−1} r_{σ′}` irregular,
  for `r = 2` `{0, 1} + {0, 1}` repeating `1`; with `{0, 2}` the sum `{0, 1} + {0, 2} = {0, 1, 2, 3}` is
  regular.
- The place `v_1` must have `q_{v_1} ≡ −1` modulo `t`: a tamely dihedral type of order `t` is induced
  from a character of the unramified quadratic extension of order `t` on inertia that does not factor
  through the norm, which requires `t | q_{v_1}² − 1` and `t ∤ q_{v_1} − 1`, i.e. `t | q_{v_1} + 1`; its
  residual Frobenius ratio is `−1`. For `t = 13`, `q_{v_1} = 103 ≡ −1` modulo `13` qualifies, while
  `q_{v_1} = 53 ≡ 1` gives only principal-series types.

*Needs:* §§11.2, 11.10; ModularityAndLanglandsExtensions §§2.1, 2.16, 2.25;
GL2AutomorphicRepresentationsAndTransfer §R16.3.7; PotentialAutomorphyInfrastructurePartII Layer 0
("Soluble base change and descent of polarized automorphy"); AutomorphicGaloisRepresentations
§7.4; AutomorphicGaloisRepresentationsPartII AG2.6 ("Complex and local
coefficient conjugation"); ArithmeticGaloisRepresentations §§4.4, 7.6, 7.8;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11; Chebotarev Layer 10.

### 13.4 Propagation over the Galois group of the coefficient field

Under `S5-global` with `σ`, `σ′`, `B`, `K̃_π`, `Γ_π` from §13.3, prove (Lemma 5.8) that for `γ ∈ Γ_π`, a
finite place `w | l` of `K̃_π` and `δ` in the inertia group `I_{w/l}`, if
`r_{γπ,ι} ⊗ Sym^{r−1} r_{σ′,ι}` is automorphic then so is `r_{δγπ,ι} ⊗ Sym^{r−1} r_{σ′,ι}` (for `δ ≠ 1`
only `l < B` occurs; the second factor is fixed); hence `r_{γπ,ι} ⊗ Sym^{r−1} r_{σ′,ι}` is automorphic for
every `γ ∈ Γ_π`; and, taking `γ = φ`, with the equivalence of §13.3 and coefficient conjugation, there is
an ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` with `r_{Π,ι} ≅ φ_p(r_{π,ι}) ⊗ Sym^{r−1} r_{σ,ι}` (nt26
Lemma 5.8 and proof, pp. 42–44; completion of Theorem 5.5, pp. 42–44). The checks in the printed proof
are at the original embedding `ι` where the comparison embedding `ι_l` at `l` is meant.

*Proof sketch.* Change the comparison embedding to one inducing `w`; `δ` acts trivially on the residue
field, so `r̄_{δγπ} ≅ r̄_{γπ}` at the prime above `l`. Apply §12.7 with `σ = Sym^{r−1} σ′` (RAESDC by `SP_r`,
Steinberg at `v_0` where `γπ` is unramified after base change, a case Layer 12 covers because its set
`S` and its unitary level contain the ramification of `σ`, with the rank-two condition at `v_0`
unramified if `v_0 ∤ l` and the one `γπ` determines if `v_0 | l`), checking its nine hypotheses at
`l`: the coefficient inertia gives the residual congruence;
the different weights give regularity; the two projective fields give a perfect product, and a regular
semisimple element `(diag(y, y^{−1}), diag(x, x^{−1}))` is found by choosing `x` of order `> 2r − 2`
in the symmetric-power slot and `y` in the rank-two slot avoiding the at most `4r − 2` elements `±x^i`,
`|i| ≤ r − 1`, that lie in the field from which `y` is chosen, which `q > 4r` permits (nt26 p. 44); ordinarity and Steinberg status are preserved by coefficient
conjugation. Return to `ι` by AutomorphicGaloisRepresentationsPartII AG2.6 (coefficient independence
of untwisted tensor automorphy, both factors RAESDC). `Γ_π` is generated by its inertia subgroups
because `ℚ` has no non-trivial everywhere unramified extension (Mathlib
`NumberField.abs_discr_gt_two`).

**Checks.**

- If `K_π = ℚ`, `Γ_π` is trivial, the propagation is empty, `φ` acts trivially and the conclusion is the
  untwisted tensor of §11.10.
- If `K̃_π/ℚ` were unramified at every prime (impossible for `K̃_π ≠ ℚ`), inertia would generate only the
  trivial group; Hermite–Minkowski excludes this.
- The hypothesis (6) of §12.7 at `l`: with projective images containing `PSL_2(q_{γπ}) × PSL_2(q_{σ′})`,
  `q > 4r`, the element `(diag(y, y^{−1}), diag(x, x^{−1}))` with `x` of order `> 2r − 2` and `y ∉ {±x^i : |i| ≤ r − 1}`
  has the `2r` eigenvalues `y^{±1} x^{r−1−2j}`, `0 ≤ j ≤ r − 1`, all distinct: `y x^a = y x^b`
  forces `a = b` because `|a − b| ≤ 2r − 2` is below the order of `x`, and `y x^a = y^{−1} x^b`
  forces `y = ±x^{(b−a)/2}` with `|(b − a)/2| ≤ r − 1`, which is excluded. The forbidden set has at most
  `4r − 2` elements (fewer when some `±x^i` coincide, and only those in the field of `y` count), so
  `q − 1 ≥ 4r` leaves a choice of `y`.
- The forbidden count is a bound, not an exact value. For `r = 4`, `q = 17`, `x = 2` (of order
  `8 > 6`), the values `±2^i`, `|i| ≤ 3`, are `{1, 2, 4, 8, 9, 13, 15, 16}`: `8` elements, not `14`,
  because `−1 = 2^4`; in characteristic `2` the signs coincide as well. The choice `y = 3` avoids them
  and gives the eight distinct eigenvalues `7, 6, 10, 11, 14, 12, 3, 5` modulo `17`.
- The slots are not interchangeable: with `x` in the rank-two slot the eigenvalues are `x^{±1} y^{r−1−2j}`,
  and for `r = 4`, `q = 43`, `x` of order `7` and `y` of order `3` (which avoids `±x^i`, these
  having orders dividing `7` or `14`), `x y³ = x y^{−3}` is a repeated eigenvalue.

*Needs:* §§13.3, 12.7; AutomorphicGaloisRepresentationsPartII AG2.6 ("Complex and local coefficient
conjugation"; "Coefficient independence of tensor automorphy"); Mathlib `NumberField.abs_discr_gt_two`;
ClassFieldTheory Layer 13.

### 13.5 A residual witness for `φ_p r̄ ⊗ Sym^{r−1} r̄` under global image hypotheses (Newton–Thorne 2026 Theorem 5.5)

Under `S5-global` (with `SP_r`, `SP_{r+1}` and `SP_{r−1}` when `r > 1`), prove that there is an
ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` with `r̄_{Π,ι} ≅ φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}` (nt26
Theorem 5.5, p. 40; proof, pp. 40–44). The statement is residual: it does not identify `r_{Π,ι}` with a
Frobenius twist of a characteristic-zero tensor of `π` with itself.

*Proof sketch.* §13.4 gives `Π` with `r_Π ≅ φ_p(r_π) ⊗ Sym^{r−1} r_σ`; reducing, `r̄_σ^{ss} ≅ r̄_π^{ss}` (§11.2),
so `r̄_Π ≅ φ_p(r̄_π) ⊗ Sym^{r−1} r̄_π`; ordinarity from that of `π` and `σ`.

**Checks.**

- For `r = 1` the witness is for `φ_p r̄`, given by the coefficient conjugate of `π`.
- Residual irreducibility: for `a > a₀(p)` the representation `φ_p r̄ ⊗ Sym^{r−1} r̄` of a group
  containing `SL_2(𝔽_{p^a})` is irreducible and adequate (ArithmeticGaloisRepresentations §7.9), so `Π`
  is cuspidal.
- `dim = 2 · r = 2r`, and the Hodge–Tate weights `{0, 1} + {0, 2, …, 2r − 2}` are distinct.

*Needs:* §§13.4, 11.2, 13.2; ArithmeticGaloisRepresentations §7.9.

### 13.6 A residual witness retaining a Steinberg place (Newton–Thorne 2026 Theorem 5.9)

Under `S5-local` (with `SP_r`, `SP_{r+1}` and `SP_{r−1}` when `r > 1`), prove that `r̄_{π,ι}(G_F)` contains
`SL_2(𝔽_{p^a})` with `p^a > M`, and that there is an ι-ordinary RAESDC `Π` on `GL_{2r}(𝔸_F)` with
`r̄_{Π,ι} ≅ φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}`; `π` remains Steinberg at `v_1` for the later level raising,
while no Steinberg condition at `v_1` is asserted for `Π` (nt26 Theorem 5.9, p. 44; proof, pp. 44–45).
This is the second paragraph of ModularityAndLanglandsExtensions §4.23 read residually, with
`φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}` in place of `φ_p r_π ⊗ Sym^{r−1} r_π`; the characteristic-zero
reading of that paragraph is not proved here, and for `r ≥ 2` it fails (first Check).

*Proof sketch.* Large image at every prime by §13.2. Remove the extra Steinberg place: a congruent
ι-ordinary RAESDC `π′` of weight `0`, determinant `ε^{−1}`, Steinberg at all `p`-adic places, with
`r_{π,ι}|_{G_{F_v}} ∼ r_{π′,ι}|_{G_{F_v}}` for `v ∤ p v_1`, `π′_{v_1}` a principal series `i(χ_1 ⊗ χ_2)`
with `(χ_1/χ_2)|_{𝒪^×}` of order `p` (residually the same inertial semisimplification as Steinberg since
`q_{v_1} ≡ 1` modulo `p`), and the dihedral types at `w_1`, `w_2` preserved (LocalGaloisDeformationRings
§2.15; PotentialModularityAndCompatibleSystems §10.10; PotentialAutomorphyInfrastructurePartII Layer
1). `π′` satisfies `S5-global`, and §13.5 gives the witness for `π′`, hence for `π`.

**Checks.**

- The witness is residual only, as in §13.5. In characteristic zero, for `r = 2`, `φ_p r_π ⊗ r_π` has
  labelled Hodge–Tate weights `{0, 1} + {0, 1} = {0, 1, 1, 2}` at every `τ` (`π` has weight `0`), a
  repeated weight, so it is the Galois representation of no RAESDC `Π`; for every `r ≥ 2` the weights
  `{0, 1} + {0, …, r − 1}` repeat in the same way.
- `q_{v_1} ≡ 1` modulo `p` is what makes an order-`p` character of `𝒪^×` at `v_1` exist and the principal
  series congruent to Steinberg.
- The output `Π` need not be Steinberg at `v_1`; §13.7 keeps the Steinberg place on `π′` for §13.8.

*Needs:* §§13.5, 13.2; LocalGaloisDeformationRings §2.15; PotentialModularityAndCompatibleSystems
§10.10; PotentialAutomorphyInfrastructurePartII Layer 1 ("Strong connection and component
deformation problems").

### 13.7 Ordinary replacement with a Frobenius-tensor residual witness (Newton–Thorne 2026 Corollary 6.2)

For `F` totally real, `π` non-CM RAESDC on `GL_2(𝔸_F)`, `p ≥ 5`, `0 < r < p`, and `SP_r`, `SP_{r+1}` and
`SP_{r−1}` when `r > 1`, prove that there are a soluble totally real `E/F`, `ι` and RAESDC `π′` over `E`
with: `Sym^{p+r−1} r_{π,ι}` automorphic exactly when `Sym^{p+r−1} r_{π′,ι}` is; `π′` of weight zero and an
unramified Steinberg twist at every `p`-adic place of `E`; `r̄_{π′,ι}` with image containing
`SL_2(𝔽_{p^a})`, `a > a₀(p)`; an unramified Steinberg twist at some `v_1 ∤ p`; and an ι-ordinary RAESDC
representation of `GL_{2r}(𝔸_E)` with residual representation `φ_p(r̄_{π′,ι}) ⊗ Sym^{r−1} r̄_{π′,ι}`
(nt26 Corollary 6.2, p. 49). Prove also the intermediate step of the proof of Proposition 6.1: there are
`ι`, a soluble totally real `E/F` and RAESDC `π_0` over `E` of weight `0`, Steinberg at all `v | p`,
`det r_{π_0} = ε^{−1}`, residual image containing `SL_2(𝔽_{p^a})` with `a > a₀(p)`, Steinberg at some
`v_1 ∤ p` with `q_{v_1} ≡ 1` modulo `p`, potentially unramified away from `p v_1`, and
`Sym^{p+r−1} r_π` automorphic exactly when `Sym^{p+r−1} r_{π_0}` is (nt26 proof of Proposition 6.1,
intermediate claim, pp. 46–48). The printed corollary labels the final `p`-adic places as places of
`F`; they are places of `E`. The printed choice of the auxiliary prime `t` avoids the conductor of `π`;
it must avoid that of `π_a` below.

*Proof sketch.* Intermediate step: a prime `q` from Dimitrov's large-image theorem
(AutomorphicGaloisRepresentations §7.4); an everywhere unramified finite-order character
`χ : G_E → ℚ̄_q^×` whose reduction `χ̄` satisfies the residual identity `χ̄² det r̄_{π,ι_q} = ε̄^{−1}`
(the obstruction to a square root of the totally even residual character `ε̄ det r̄_{π,ι_q}` is a
`2`-torsion class in `Br(F)`, killed by local conditions on `E`; a finite-order lift of the square root
is then chosen, unramified after enlarging `E`) (nt26 proof of Proposition 6.1, p. 47); an ordinary
weight-zero `π_a` with `det r_{π_a,ι_q} = ε^{−1}`, the required local conditions and residual
representation `r̄_{π_a,ι_q} ≅ r̄_{π,ι_q}|_{G_E} ⊗ χ̄` (PotentialModularityAndCompatibleSystems §9.2;
SerreWeightAndLevelOptimisation §6.11). Only the residual representations of `π` and `π_a` are related:
the characteristic-zero determinant of `π_a` is `ε^{−1}` because `π_a` has weight zero, not because it
is a finite twist of `det r_{π,ι_q}`. Then a prime `t` prime to the conductor of `π_a` with tamely
dihedral level raising. Proposition 6.1 (ModularityAndLanglandsExtensions §4.22) then gives `π′` with its eight
conditions, hence `S5-local`, and §13.6 gives the witness.

**Checks.**

- For `r = 1` the witness is `φ_p r̄_{π′}`, a coefficient conjugate.
- The twisting identity is residual, never in characteristic zero. For `Δ` (weight `12`, `F = ℚ`),
  `det r_{Δ,ι_q} = ε^{−11}` has Hodge–Tate weight `11`; a finite-order `χ` has Hodge–Tate weight `0`,
  so `χ² det r_{Δ,ι_q}` has weight `11 ≠ 1`, the weight of `ε^{−1}`, on `G_ℚ` and on `G_E` for every
  finite `E`: no finite-order character satisfies the characteristic-zero identity. Residually the
  exponents give `χ̄ = ε̄⁵` with `2·5 − 11 = −1`, so `χ̄² det r̄_{Δ,ι_q} = ε̄^{−1}` (and `ε̄` is
  unramified at `v | q` once `ζ_q ∈ E_v`).
- `E/F` soluble and totally real keeps `Sym^{p+r−1}` automorphy equivalent over `F` and `E` by soluble
  descent (the representation is irreducible by non-CM large image).
- A prime `t` dividing the conductor of `π_a` would not allow an unramified starting point for the
  dihedral level raising at `t`.

*Needs:* §13.6; ModularityAndLanglandsExtensions §2.1 (potential diagonalizability of ordinary and
Fontaine–Laffaille representations), §4.22; AutomorphicGaloisRepresentations §7.4;
PotentialModularityAndCompatibleSystems §9.2; SerreWeightAndLevelOptimisation §6.11;
PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of polarized
automorphy").

### 13.8 Symmetric-power lifting from two ordinary residual blocks (Newton–Thorne 2026 Proposition 6.3; Thorne 2024 Proposition 7.4)

Let `F` be totally real, `p ≥ 5`, `0 < r < p`, and `π` RAESDC on `GL_2(𝔸_F)`, ι-ordinary for some `ι`, of
weight zero, with residual image containing `SL_2(𝔽_{p^a})`, `a > a₀(p)`, and an unramified Steinberg
twist at a place `v_1 ∤ p`. Suppose there are ι-ordinary RAESDC `π_1` on `GL_{p−r}(𝔸_F)` and `π_2` on
`GL_{2r}(𝔸_F)` with residual representations `Sym^{p−r−1} r̄_{π,ι}` and
`φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}`. Prove that there is an ι-ordinary RAESDC `Π` on `GL_{p+r}(𝔸_F)` with
`r_{Π,ι} ≅ Sym^{p+r−1} r_{π,ι}` (nt26 Proposition 6.3 and proof, pp. 49–50; th24 Proposition 7.4 and proof,
pp. 43–44; Theorem 7.5, p. 44, and proof, p. 45). These residual witnesses replace the hypotheses of th24 Proposition 7.4
that `Sym^{r−1} r_π` and `Sym^{p−r−1} r_π` are automorphic and that `TP_r` holds. Primitivity is weak
primitivity over `k̄` with the common splitting field.

*Proof sketch.* Pass to a CM quadratic extension with the conditions of th24 Proposition 7.4, linearly
disjoint over `F` from the extension of `F(ζ_p)` cut out by `r̄|_{G_{F(ζ_p)}}` (soluble base change; th24
proof of Theorem 7.6, p. 45). Twist the witnesses into conjugate self-dual cuspidal `σ_1`, `σ_2` with
`σ_2` Steinberg at the place above `v_1` (Khare–Wintenberger method with PotentialAutomorphyInfrastructurePartII Layer 5),
so that `Σ = σ_1 ⊞ σ_2` is regular algebraic, ι-ordinary of weight `0` and `r̄_Σ ≅ (Sym^{p+r−1} r̄)^{ss}`
(ArithmeticGaloisRepresentations §7.8). §6.9 gives a cuspidal ι-ordinary `Π_0` Steinberg at the
place above `v_1` with the same residual representation (its hypothesis (3) from an element `diag(t, t^{−1})`
with `1, t², …, t^{2(p+r−1)}` distinct, which exists since `a ≥ 3`). Residually reducible ordinary
lifting with a Steinberg place and an unobstructed auxiliary place
(PotentialAutomorphyInfrastructurePartII, gap:auxiliary-place-reducible-lifting, which is th24
Theorem 7.5; the form of ModularityAndLanglandsExtensions §4.2 does not apply, since over the CM
extension the cyclotomic field can lie in the field cut out by `ad r̄`, as a Check below shows) shows
`Sym^{p+r−1} r_π` automorphic; descend. The auxiliary place `w ∤ p` is chosen by Chebotarev with
Frobenius conjugate to some `σ ∈ G_F` such that `ε̄(σ) = −1` and `(α/β)^i ≠ −1` for
`1 ≤ i ≤ p + r − 1`, where `α`, `β` are the eigenvalues of `r̄(σ)`; then the eigenvalues of `σ` on
`ad(Sym^{p+r−1} r̄)(1)` are `−(α/β)^j` with `|j| ≤ p + r − 1`, none equal to `1`. Such `σ` exists: the
image of `(ad r̄, ε̄)` contains `(gh, −1)` for every `h ∈ PSL_2(𝔽_{p^a})` (enlarging `a` so that the
projective image is `PSL_2(𝔽_{p^a})` or `PGL_2(𝔽_{p^a})`; `PSL_2(𝔽_{p^a})` is simple), with `g` the image
of a complex conjugation, and an `h` in the centralizer of `g` makes the ratio of the eigenvalues of `gh` of
order larger than `2(p + r − 1)`; by the linear disjointness of the first step, `σ` may be taken in
the absolute Galois group of the CM extension (th24 proof of Theorem 7.6, pp. 46–47).

**Checks.**

- `p = 5`, `r = 1`: blocks `Sym³ r̄` (rank `4`) and `φ_5 r̄` (rank `2`), giving `Sym⁵` (rank `6`).
- Ranks: `(p − r) + 2r = p + r`.
- The decomposition is of semisimplifications only: `Sym^{p+r−1} r̄` is a non-split extension in general
  (ArithmeticGaloisRepresentations §7.8 gives an exact sequence), so `Σ` is congruent to
  `Sym^{p+r−1} r_π` only after semisimplification.
- The cyclotomic clause of ModularityAndLanglandsExtensions §4.2 can fail here, which is why the
  auxiliary-place form is used. Take `p = 7`, `F ⊇ ℚ(ζ_7)⁺` (so `[F(ζ_7) : F] = 2`), `a` odd with
  `a > a₀(7)`, and `r̄(G_F) = {g ∈ GL_2(𝔽_{7^a}) : det g = ±1}` with `det r̄ = ε̄^{−1}`; its projective
  image is `PGL_2(𝔽_{7^a})`. Since `7^a ≡ 3 mod 4`, `−1` is not a square in `𝔽_{7^a}`, so the only
  scalars in the image are `±1`, of determinant `1`, and `ε̄` is trivial on `ker ad r̄`. That kernel
  is the kernel of `ad (Sym^{p+r−1} r̄)^{ss}` (a scalar value of `(Sym^{p+r−1} r̄)^{ss}(σ)` forces the
  eigenvalues `α`, `β` of `r̄(σ)` to be equal, and then the factor
  `φ_p r̄` of the constituent `φ_p r̄ ⊗ Sym^{r−1} r̄` forces `r̄(σ)` scalar), so for every CM extension
  `K` of `F`, `K(ζ_7)` lies in the field cut out by `ad (Sym^{p+r−1} r̄)^{ss}|_{G_K}`, and no soluble
  base change restores the clause. The auxiliary place of the sketch still exists: `ε̄(σ) = −1` and the
  eigenvalues `−(α/β)^j` are never `1` (`j = 0` gives `−1`). For `n = 11`, §13.10 has only `p = 7`
  (`11/2 < p < 11`), so the choice of `p` does not avoid this case.
- The cyclotomic hypothesis of gap:auxiliary-place-reducible-lifting holds in this application:
  `r̄(G_{F(ζ_p)})` has index at most `p − 1 < 2p` in `r̄(G_F)`, so it contains a conjugate of
  `SL_2(𝔽_{p^a})`; after conjugation its projective image is `PSL_2(𝔽_{p^b})` or `PGL_2(𝔽_{p^b})` for
  some `b ≥ a`, and it lies between `SL_2(𝔽_{p^b})` and `k^× GL_2(𝔽_{p^b})` for a finite field
  `k ⊇ 𝔽_{p^b}` (ArithmeticGaloisRepresentations §§4.4, 7.9; th24 Lemma 7.3(3) and proof, pp. 42–43,
  whose proof writes the upper bound as `k^× SL_2(𝔽_{p^b})`, valid only in the `PSL_2` case). The
  `PGL_2` case occurs: in the setting of the preceding Check with `det r̄ = ε̄^{−1}χ̄`, `χ̄` quadratic
  and non-trivial on `G_{F(ζ_7)}`, the group `r̄(G_{F(ζ_7)})` is `{g ∈ GL_2(𝔽_{7^a}) : det g = ±1}`, of
  projective image `PGL_2(𝔽_{7^a})` of order `q(q² − 1)`, `q = 7^a`; a copy of `SL_2(𝔽_{7^b})` inside it
  forces `b ≤ a`, and the projective image of `k^× SL_2(𝔽_{7^b})` has order
  `7^b(7^{2b} − 1)/2 < q(q² − 1)`, so no sandwich with `k^× SL_2` exists. A quotient of `p`-power order
  kills the perfect group `SL_2(𝔽_{p^b})` and is then a quotient of a subgroup of
  `k^× GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b})`, an abelian group (a quotient of
  `k^× × GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b}) ≅ k^× × 𝔽_{p^b}^×`) of order dividing `(|k| − 1)(p^b − 1)`, prime
  to `p`, hence trivial; in the `PGL_2` instance above the quotient by `SL_2(𝔽_{7^a})` is `{±1}`, of
  order `2`, prime to `7`. The image of `(Sym^{p+r−1} r̄)^{ss}` on
  `G_{F(ζ_p)}` is a quotient of this group, and a twist by a character changes the image only by
  scalars, so the argument applies unchanged over the CM extension.

*Needs:* §6.9; PotentialAutomorphyInfrastructurePartII Layer 0, Layer 5, Layer 7 ("Weak primitivity
over a splitting coefficient field"), Layer 8 (gap:auxiliary-place-reducible-lifting, the lifting form
beside "Finiteness with an unobstructed auxiliary place", §8.16); ArithmeticGaloisRepresentations
§§4.4, 7.8, 7.9; Chebotarev Layer 10.

### 13.9 Thorne's induction step and the small cases (Thorne 2024 Theorems 7.1, 7.6, Corollary 7.2)

Let `p ≥ 5` and `0 < r < p`. Prove: (Theorem 7.6) assuming `SP_{p−r}`, `SP_r` and `TP_r`, if `(π, χ)` is
RAESDC on `GL_2(𝔸_{F⁺})`, ι-ordinary with residual image containing `SL_2(𝔽_{p^a})` for some
`a > a₀(p)`, of weight `0`, with an unramified Steinberg twist at some `v_0 ∤ p`, then `Sym^{p+r−1} π`
exists as an ι-ordinary cuspidal RAESDC `Π`; (Theorem 7.1) hence `SP_{p−r} + SP_r + TP_r ⇒ SP_{p+r}`;
(Corollary 7.2) `SP_n` holds for `n = 1, …, 10` and for even `n = 12, …, 26`, and `TP_r` for all `r`
implies `SP_n` for all `n` (th24 Theorem 7.1, Corollary 7.2 and Lemma 7.3, p. 42; Theorem 7.6, p. 45;
proofs, pp. 42–47). `TP_r` is known for `r = 1, 2, 3` (ModularityAndLanglandsExtensions §§1.11, 1.13) and
`SP_n` for `n ≤ 5` (§1.15 there).

*Proof sketch.* Theorem 7.6 from the `TP_r` version of §13.8 after soluble base change. Theorem 7.1 from
Theorem 7.6 by the Clozel–Thorne reductions and th24 §8 (ModularityAndLanglandsExtensions §4.22).
Corollary 7.2: `TP_1`, `TP_2`, `TP_3` give `SP_{p−1} ⇒ SP_{p+1}`, `SP_{p−2} ⇒ SP_{p+2}`,
`SP_{p−3} ⇒ SP_{p+3}` for `p = 5, …, 23`; the general case by Bertrand's postulate as in §13.10.

**Checks.**

- `p = 7`, `r = 1`: `SP_6 + SP_1 + TP_1 ⇒ SP_8`; `p = 7`, `r = 3`: `SP_4 + SP_3 + TP_3 ⇒ SP_{10}`.
- `n = 11` is not covered: `11 = p + r` with `p ∈ {7}` needs `r = 4` and `TP_4`, which is not known; this
  is why the corollary stops short of all `n` and §13.10 replaces `TP_r` by residual witnesses.
- `n = 6 = 5 + 1`: `SP_4 + SP_1 + TP_1 ⇒ SP_6`.

*Needs:* §13.8; ModularityAndLanglandsExtensions §§1.11–1.15, 4.22.

### 13.10 The induction proving SP_n for all n (Newton–Thorne 2026 Theorem 6.4)

Prove that `SP_n` holds for every `n ≥ 1`: for every totally real `F` and every non-CM RAESDC `π` on
`GL_2(𝔸_F)` there is a RAESDC `Π` on `GL_n(𝔸_F)` with `r_{Π,ι} ≅ Sym^{n−1} r_{π,ι}` for every `ι` (nt26
Theorem 6.4 and proof, p. 50). This proves ModularityAndLanglandsExtensions §4.30 and, through its
§§4.35–4.36, Newton–Thorne 2026 Theorem A. The printed list of induction hypotheses contains `SP_0` when
`r = 1`, which is not a statement; the case `r = 1` uses the coefficient-conjugate branch directly. The
ordinarity of the smaller witness is supplied by the Steinberg-at-`p` condition.

*Proof sketch.* Induction on `n`, with base cases `n ≤ 5` (ModularityAndLanglandsExtensions §1.15). For
`n ≥ 6` choose a prime `p` with `n/2 < p < n` (Mathlib `Nat.exists_prime_lt_and_le_two_mul` applied to
`⌊n/2⌋`) and write `n = p + r` with `0 < r < p`; the indices `r`, `r + 1`, `p − r` (and `r − 1` when `r > 1`)
are positive and smaller than `n`. By the one-prime criterion (ModularityAndLanglandsExtensions §4.15)
it suffices to prove automorphy of `Sym^{p+r−1} r_{π,ι}` for one `ι`. §13.7 gives `π′` over a soluble `E`
with the residual witness for `φ_p r̄ ⊗ Sym^{r−1} r̄`; `SP_{p−r}` gives a witness for `Sym^{p−r−1} r̄`,
ordinary since `π′` is Steinberg at `p`. §13.8 gives `Sym^{p+r−1} r_{π′}` automorphic, hence
`Sym^{p+r−1} r_π` by §13.7.

**Checks.**

- `n = 6`: `p = 5`, `r = 1`; the induction uses `SP_1`, `SP_2` and `SP_4`, with no `SP_0`.
- `n = 7`: `p = 5`, `r = 2`; it uses `SP_1`, `SP_2`, `SP_3` and `SP_{p−r} = SP_3`.
- `n = 12`: `p ∈ {7, 11}`; with `p = 7`, `r = 5` it uses `SP_4`, `SP_5`, `SP_6` and `SP_2`; with `p = 11`,
  `r = 1` it uses `SP_1`, `SP_2`, `SP_{10}`.

*Needs:* §§13.7, 13.8; ModularityAndLanglandsExtensions §§1.12, 1.15, 4.15; Mathlib
`Nat.exists_prime_lt_and_le_two_mul`.

### Examples

- `SP_6` over `ℚ`: `p = 5`, `r = 1`; witnesses for `Sym³ r̄` (from `SP_4`) and for `φ_5 r̄` (a coefficient
  conjugate), combined by §13.8.
- `SP_{11}`: `p = 7`, `r = 4` is the only choice with `n/2 < p < n`; it uses `SP_3`, `SP_4`, `SP_5` and
  `SP_3`, and needs no `TP_4`.

### Dependencies

Layers 6, 11, 12; ArithmeticGaloisRepresentations §§4.4, 7.6, 7.8, 7.9; ArithmeticGaloisDuality
§R02.3.5; GL2AutomorphicRepresentationsAndTransfer §§R16.3.7, R16.3.8; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.5.11; AutomorphicGaloisRepresentations §7.4; AutomorphicGaloisRepresentationsPartII AG2.6;
PotentialModularityAndCompatibleSystems §§9.2, 10.10; SerreWeightAndLevelOptimisation §6.11;
PotentialAutomorphyInfrastructurePartII Layers 0, 1, 5–8 (gap:auxiliary-place-reducible-lifting); LocalGaloisDeformationRings §2.15; ModularityAndLanglandsExtensions §§1.11–1.15, 2.1, 2.16, 2.25,
4.15, 4.22; ClassFieldTheory Layers 12–14; Chebotarev Layer 10; Mathlib `NumberField.abs_discr_gt_two`,
`Nat.exists_prime_lt_and_le_two_mul`.

## Layer 14: endpoints over ℚ

This layer discharges the seed hypotheses of Layers 7, 8 and 10 by §13.10 and assembles the
endpoints over `ℚ` that ModularityAndLanglandsExtensions states in §§4.8, 4.9, 4.12, 4.20 and 4.29,
together with the holomorphy of symmetric power `L`-functions of level-one eigenforms and of
non-CM newforms away from their level, which are the statements of this roadmap's Lean file. Each
endpoint has two routes: the Newton–Thorne I/II route
through Layers 2–10 with the seed, and the specialisation of §13.10 to `F = ℚ`.

### 14.1 Theorem 7.1 and Theorem E in every rank

Prove: (1) `TS_n(p, q, X_0, ω)` of §7.5 holds for every `n ≥ 3` and all admissible data, which is the
statement of ModularityAndLanglandsExtensions §4.8; (2) for every `n ≥ 3` there is a cuspidal,
everywhere unramified `π` of `GL_2(𝔸_ℚ)` of weight `k ≥ 2` with `Sym^{n−1} r_{π,ι}` automorphic for
every `ι` (Theorem E, the statement of ModularityAndLanglandsExtensions §4.9); indeed every such `π`
has this property (nt21 Theorems 7.1, 7.6, pp. 83, 90; nt26 Theorem 6.4, p. 50).

*Proof sketch.* (2): level-one eigenforms are non-CM and regular algebraic, so §13.10 over `F = ℚ`
gives `SP_n` for them. (1): choose an `X_0`-split soluble totally real `F⁺_1` with `F_1 = F⁺_1 K`
(PotentialModularityAndCompatibleSystems §2.16, with trivial prescribed completions at the primes
below `X_0` and at `p`, and at `q` a finite Galois, hence soluble, extension of `ℚ_q` over which
`r̄_{σ_0,ι}` becomes trivial and whose residue cardinality is `1` modulo `p`) in which `p` splits completely and such that at some place
`v | q` of `F⁺_1` the residual representation `r̄_{σ_0,ι}` is trivial and `q_v ≡ 1` modulo `p`; raise
the level of the base change of `σ_0` to `F⁺_1` at `v` to an unramified Steinberg twist, congruent
modulo `p`, of the same weight and the same central character, unramified above `p`
(SerreWeightAndLevelOptimisation §6.9, at level `GL_2(𝒪_w)` above `p`, where `σ_0` is unramified as
`p ∤ 4`; the level-raising condition holds since `r̄` is trivial and `q_v ≡ 1` there), obtaining
`σ`, non-CM because it is Steinberg at `v`. It is ι-ordinary: at each `w | p`, `F⁺_{1,w} = ℚ_p`,
`r_{σ,ι}|_{G_{ℚ_p}}` is crystalline with Hodge–Tate weights `{0, 4}` and `4 ≤ p − 2`, and its reduction
`r̄_{σ_0,ι}|_{G_{ℚ_p}}` is a sum of two characters because `p ≡ 1` modulo `4` splits in `K = ℚ(i)`; a
non-ordinary crystalline representation of `G_{ℚ_p}` with such weights has irreducible reduction
(FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11), so `r_{σ,ι}` is ordinary at `w`, and `σ` is
ι-ordinary (PotentialAutomorphyInfrastructurePartII Layer 0, the converse of "`ι`-ordinary automorphic
representations have ordinary Galois representations"); §13.10 over `F⁺_1` makes `Sym^{n−1} σ`
automorphic; base change to `F_1` and twist by `ω^{n−1}`. The result is RACSDC, ι-ordinary,
Steinberg at the place above `v` (`Sym^{n−1}` of a Steinberg twist is a Steinberg twist), with
residual representation `ω̄^{n−1} ⊗ Sym^{n−1} r̄_{σ_0,ι}` and the Hodge–Tate weights of (b). For `n = 2^r`
the seed route of §§7.5–7.6 gives (1) and (2) as well.

**Checks.**

- `n = 3, 4, 5`: (2) also follows from ModularityAndLanglandsExtensions §1.15.
- `Sym^{n−1}(St ⊗ χ) = St_n ⊗ χ^{n−1}`: the Weil–Deligne parameter `sp(2) ⊗ χ` has `Sym^{n−1}` equal to
  `sp(n) ⊗ χ^{n−1}`, so the Steinberg place survives.
- The level-raising condition at `v`: with `r̄|_{G_{F_v}}` trivial, `T_v ≡ 2` and `(q_v + 1)² ≡ 4`
  modulo `𝔪`, so `T_v² − (q_v + 1)² ψ(ϖ_v) ∈ 𝔪` when the residual central character is trivial at `v`.
- Ordinarity needs `F⁺_{1,w} = ℚ_p`, not only `F⁺_{1,w}/ℚ_p` unramified. Over `ℚ_{p²}` with embeddings
  `τ_1`, `τ_2`, the sum `ψ_1 ⊕ ψ_2` of crystalline characters with labelled weights `(4, 0)` and `(0, 4)`
  is crystalline with labelled weights `{0, 4}` at each embedding and has reducible reduction, but has
  no line of weights `(4, 4)` and is not ordinary. Over `ℚ_p`, with `n = 3` and `p = 577`
  (`577 = 2 · 288 + 1` prime, `577 ≡ 1` modulo `4`), the reduction is `ψ̄ ⊕ ψ̄^c` and the criterion
  applies, `4 ≤ 575`.

*Needs:* §13.10; §§7.1, 7.5, 7.6; SerreWeightAndLevelOptimisation §6.9;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11;
PotentialModularityAndCompatibleSystems §2.16 (soluble prescribed-completion extensions);
PotentialAutomorphyInfrastructurePartII Layer 0 ("Soluble base change and descent of polarized
automorphy"; the converse of "`ι`-ordinary automorphic representations have ordinary Galois
representations"); ModularityAndLanglandsExtensions §1.15.

### 14.2 Theorem A in level one and Theorem B

Prove: (1) for every `n ≥ 2` and every RAC automorphic `π` of `GL_2(𝔸_ℚ)` of level one,
`Sym^{n−1} π` exists as a cuspidal automorphic representation of `GL_n(𝔸_ℚ)` (Theorem A, the statement
of ModularityAndLanglandsExtensions §4.12); (2) for every `n ≥ 2` and every non-CM cuspidal `π` of
`GL_2(𝔸_ℚ)` of weight `≥ 2` with no supercuspidal local component, `Sym^{n−1} π` exists (Theorem B, the
statement of ModularityAndLanglandsExtensions §4.20) (nt21 Theorem A, p. 2, Theorem 7.7, p. 91,
Theorem 8.1, p. 91; nt26 Theorem 6.4, p. 50).

*Proof sketch.* Both are specialisations of §13.10 to `F = ℚ`. Along the seed route: (1) by §3.8 with
the seed of §14.1(2) and the one-prime criterion (ModularityAndLanglandsExtensions §4.15); (2) by the
argument of §10.7 for `H_0` (§§8.2, 8.3 with the seed, and potentially diagonalizable lifting).
Cuspidality: for a non-CM `π` the image of `r_{π,ι}` is Zariski dense in `GL_2`
(AutomorphicGaloisRepresentations §7.5), so `Sym^{n−1} r_{π,ι}` is irreducible and `Sym^{n−1} π` is not
an isobaric sum of smaller blocks.

**Checks.**

- Every level-one form is non-CM, so (1) is the case of (2) with no ramification at all.
- A CM form has `Sym² π` non-cuspidal; it is excluded from (2) and treated by
  ModularityAndLanglandsExtensions §4.13.
- A semistable elliptic curve over `ℚ` has no supercuspidal component, so (2) applies to it.

*Needs:* §13.10; §§3.8, 8.2, 8.3, 10.7; AutomorphicGaloisRepresentations §7.5;
ModularityAndLanglandsExtensions §§4.13, 4.15.

### 14.3 Symmetric power functoriality for every non-CM newform (Newton–Thorne II Theorem A)

Prove that for every `n ≥ 1` and every non-CM regular algebraic cuspidal `π` of `GL_2(𝔸_ℚ)`, `Sym^{n−1} π`
exists (nt21b Theorem A, p. 1; Theorem 3.1, p. 20; nt26 Theorem 6.4, p. 50). This proves
ModularityAndLanglandsExtensions §4.29. Non-CM is the self-twist condition of
GL2AutomorphicRepresentationsAndTransfer §R16.4.6; the consequence for the Euler products of
newforms away from their level is §14.5.

*Proof sketch.* §10.8 with the seed of §14.1(2); alternatively §13.10 over `F = ℚ`.

**Checks.**

- `n = 1, 2` are trivial.
- A non-CM elliptic curve over `ℚ` with supercuspidal reduction at `2` or `3` is covered (by the `2`, `3`
  steps of §10.8 or directly by §13.10).
- The statement is about existence at every place (ModularityAndLanglandsExtensions §1.10); at the
  ramified primes the local components are `Sym^{n−1}` of `rec(π_l)`, which need not be determined by
  the Fourier coefficients alone.

*Needs:* §10.8; §14.1; §13.10; ModularityAndLanglandsExtensions §1.10;
GL2AutomorphicRepresentationsAndTransfer §R16.4.6.

### 14.4 Holomorphy of symmetric power L-functions of level-one eigenforms

Let `f` be a normalised Hecke eigenform of level one and weight `k` (Tau Ceti `HeckeRing.GL2.Newform`
with `N = 1`), `{α_p, β_p}` its Satake parameters at the prime `p`
(`HeckeRing.GL2.Newform.satakeParameters`, the roots of `X² − a_p X + p^{k−1}`), and `n ≥ 1`. Define
the Euler factor `symPowerEulerFactor n α β x = ∏_{j=0}^{n} (1 − α^j β^{n−j} x)`. Prove that the Euler
product `∏_p symPowerEulerFactor n α_p β_p (p^{−s})^{−1}` converges for `Re s > n(k − 1)/2 + 1` to a
function which extends to an entire function on `ℂ` (`symPowerEulerProduct_levelOne_entire`; nt21
Theorem A, p. 2; the entire continuation follows by Godement–Jacquet, as nt21 Corollary C, p. 2,
records for semistable elliptic curves). The factor is symmetric in `α` and `β`, so the statement
does not depend on the ordering of the Satake parameters.

**API.**

- `symPowerEulerFactor n α β x` is a finite product of `n + 1` linear factors in `x`, a polynomial of
  degree at most `n + 1` with value `1` at `x = 0`; at `n = 0` it is `1 − x`.
- It is symmetric under exchanging `α` and `β` (reindex `j ↦ n − j`), so it depends only on the
  unordered pair of Satake parameters; the Lean file proves this symmetry.
- For `n = 1` and Satake parameters `{α_p, β_p}` it is `1 − a_p x + α_p β_p x²`, the reciprocal Euler
  factor of `L(s, f)` (Tau Ceti `HeckeRing.GL2.Newform.prod_map_one_sub_mul_satakeParameters`).
- At `x = p^{−s}` with the Satake parameters of `f` at an unramified prime it is the reciprocal of the
  local factor at `p` of `L(s − n(k − 1)/2, Sym^n π_f)`.
- `symPowerEulerProduct_levelOne_entire`: for level one and `n ≥ 1` the product over all primes
  converges for `Re s > n(k − 1)/2 + 1` and extends to an entire function.

*Proof sketch.* By §14.2(1) applied with `n + 1`, `Π = Sym^n π_f` is a cuspidal automorphic
representation of `GL_{n+1}(𝔸_ℚ)`, unramified at every prime, with Satake parameters
`α_p^j β_p^{n−j} p^{−n(k−1)/2}` at `p`. Its finite standard `L`-function is entire, because the
completed function is entire for cuspidal `Π` of `GL_m`, `m ≥ 2`, and the archimedean factor has no
zeros (AutomorphicLFunctionsAndLocalFactors AL.2.4.1). Its Euler product converges absolutely for
`Re s > 1` (AL.3.6.1, the Jacquet–Shalika boundary after the Rankin–Selberg pole criterion), and no
local factor vanishes or has a pole there, since `|α_p^j β_p^{n−j} p^{−n(k−1)/2}| < p^{1/2}` (AL.3.3.8);
so the product of the inverted factors converges unconditionally. The Euler product of the statement
at `s` is `L(s − n(k − 1)/2, Π)`.

**Checks.**

- `n = 0` is excluded: the product is then `∏_p (1 − p^{−s})^{−1} = ζ(s)`, which has a pole at `s = 1`.
- `n = 1`: the statement is the entirety of `L(s, f)`, which Tau Ceti already records
  (`hasEntireExtension_qExpansion_coeff` in `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean`); the
  region `Re s > (k + 1)/2` is that of absolute convergence given Deligne's bound
  `|α_p| = p^{(k−1)/2}`.
- For `Δ` (`k = 12`) and `n = 2`, the factor at `p = 2` is
  `(1 − α²x)(1 − αβx)(1 − β²x)` with `α + β = −24`, `αβ = 2^{11}`, that is
  `1 − (α² + αβ + β²)x + αβ(α² + αβ + β²)x² − (αβ)³x³` with `α² + αβ + β² = 576 − 2048 = −1472`.

*Needs:* §14.2; AutomorphicLFunctionsAndLocalFactors AL.2.4.1, AL.3.3.8, AL.3.6.1; Tau Ceti `HeckeRing.GL2.Newform`,
`HeckeRing.GL2.Newform.satakeParameters`, `HeckeRing.GL2.Newform.exists_satakeParameters_eq_pair`;
Mathlib `HasProd`, `Differentiable`.

### 14.5 Holomorphy of symmetric power L-functions of non-CM newforms

Let `f` be a newform of level `N` and weight `k ≥ 2` (Tau Ceti `HeckeRing.GL2.Newform`, with
nebentypus `χ_f`), `a_p` its `q`-expansion coefficients (Mathlib `UpperHalfPlane.qExpansion` with
period `1`), and `{α_p, β_p}` its Satake parameters at the primes `p ∤ N`, the roots of
`X² − a_p X + χ_f(p) p^{k−1}`. Define `HasQuadraticSelfTwist f` to mean that for some modulus `M > 0`
there is a Dirichlet character `ψ` modulo `M` (Mathlib `DirichletCharacter ℂ M`) with `ψ ≠ 1`,
`ψ² = 1` and `a_p ψ(p) = a_p` at every prime `p ∤ NM`. The non-CM condition itself is owned by
GL2AutomorphicRepresentationsAndTransfer §R16.4.6 on cuspidal classes of `GL_2`; this predicate is
its coefficient form on newforms, the carrier that Tau Ceti provides: for `k ≥ 2`, `π_f` is CM in that
sense exactly when `HasQuadraticSelfTwist f` holds (nt21 p. 2, footnote 1). Prove
(`symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`) that if `f` has no quadratic self-twist
and `n ≥ 1`, the Euler product over the primes `p ∤ N` of
`symPowerEulerFactor n α_p β_p (p^{−s})^{−1}` converges for `Re s > n(k − 1)/2 + 1` to a function
which extends to an entire function on `ℂ` (nt21b Theorem A, p. 1, with Godement–Jacquet). Only the
Satake parameters at `p ∤ N` enter; the factors at `p | N` are omitted.

*Proof sketch.* If `π_f ≅ π_f ⊗ χ` for a quadratic Hecke character `χ ≠ 1` of `ℚ`, let `ψ` be the
primitive Dirichlet character of `χ`, of conductor `M > 1`; comparing the Hecke eigenvalues of
`π_f ⊗ χ` and `π_f` at the primes `p ∤ NM` (GL2AutomorphicRepresentationsAndTransfer §R16.4.4,
newform adapter) gives `a_p ψ(p) = a_p`, so `HasQuadraticSelfTwist f`. Hence `π_f` is non-CM, and it is
regular algebraic since `k ≥ 2`. By §14.3, `Π = Sym^n π_f` is a cuspidal automorphic representation
of `GL_{n+1}(𝔸_ℚ)`, unramified at `p ∤ N` with Satake parameters `α_p^j β_p^{n−j} p^{−n(k−1)/2}`. Its
finite `L`-function is entire (AutomorphicLFunctionsAndLocalFactors AL.2.4.1) and its Euler product
converges absolutely for `Re s > 1` with non-zero factors (AL.3.6.1, AL.3.3.8). The product of the
statement at `s` is
`L(s − n(k − 1)/2, Π) ∏_{p | N} L_p(s − n(k − 1)/2, Π_p)^{−1}`, and each `L_p(·, Π_p)^{−1}` is a
polynomial in `p^{−s}`, so the product extends to an entire function.

**API.**

- `HasQuadraticSelfTwist f` is a predicate on Tau Ceti newforms of any level and weight, defined
  from the prime-indexed `q`-expansion coefficients and Mathlib's Dirichlet characters, with real
  body: a positive modulus, a non-trivial character of order dividing `2`, and the identity at every
  prime coprime to `NM`.
- If it holds with `(M, ψ)`, it holds with `(MM′, ψ′)` for every `M′ > 0`, where
  `ψ′ = DirichletCharacter.changeLevel h ψ` for `h : M ∣ MM′` (Mathlib): on the units of `ℤ/MM′`
  it is `ψ` composed with the unit-group map `(ℤ/MM′)^× → (ℤ/M)^×` (`ZMod.unitsMap`), and it
  vanishes on the non-units. Then `ψ′ ≠ 1` because `changeLevel` is injective for the non-zero
  modulus `MM′` (`DirichletCharacter.changeLevel_eq_one_iff`), `ψ′² = 1` because `changeLevel` is a
  monoid homomorphism, `ψ′(p) = ψ(p)` at every prime `p` prime to `MM′`
  (`DirichletCharacter.changeLevel_eq_cast_of_dvd'`), and fewer primes are tested.
- For `k ≥ 2`, `π_f` is CM in the sense of GL2AutomorphicRepresentationsAndTransfer §R16.4.6 exactly
  when `HasQuadraticSelfTwist f` holds; the direction "CM implies a quadratic self-twist" is the
  eigenvalue comparison above, and the converse is strong multiplicity one (§R16.4.4, via
  AutomorphicLFunctionsAndLocalFactors AL.3.7.1).
- `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`: the analytic conclusion above, for
  every level `N`, weight `k ≥ 2` and `n ≥ 1`.

**Checks.**

- The condition `M > 0` is needed: modulo `0` the coprimality `p ⊥ N · 0` forces `p = 1`, so no
  prime is tested, and the sign character of `ℤ^× = {±1}` is a non-trivial Dirichlet character
  modulo `0` with square `1`; without `M > 0` every newform would have a quadratic self-twist.
- Modulo `1` and modulo `2` every Dirichlet character is trivial, since `(ℤ/1)^×` and `(ℤ/2)^×` are
  trivial; the smallest moduli that can witness a self-twist are `3` and `4`.
- Enlarging the modulus goes through the unit groups, not through the ring map `ℤ/12 → ℤ/4`. For
  `ψ = χ_{−4}` (Mathlib's `ℤ`-valued `ZMod.χ₄` composed with `ℤ → ℂ`, values `0, 1, 0, −1`) and
  `M′ = 3`, the composite with the ring
  map takes the value `χ_{−4}(3) = −1` at the non-unit `3` of `ℤ/12`, where every Dirichlet
  character modulo `12` vanishes (`MulChar.map_nonunit`); so it is not a Dirichlet character modulo
  `12`, and its square is `1` at `3` while the principal character modulo `12` is `0` there.
  `changeLevel` gives `ψ′(3) = 0` and `ψ′(7) = χ_{−4}(3) = −1`.
- The newform of level `32` and weight `2` attached to `y² = x³ − x` has `a_p = 0` for `p ≡ 3`
  modulo `4` and `a_5 = −2`; with `ψ = χ_{−4}` modulo `4`, `0 · (−1) = 0` and `(−2) · 1 = −2`, and in
  general `a_p ψ(p) = a_p` at every odd prime, so it has a quadratic self-twist and is excluded. The
  exclusion is needed: for `n = 4`, `α_p² β_p² = p²` at every odd `p`, so the product contains
  `ζ(s − 2)(1 − 2^{2−s})`, with a pole at `s = 3 = n(k − 1)/2 + 1`, while the remaining factor is a
  product of Hecke `L`-functions of `ℚ(i)` at the edge of absolute convergence, non-zero at `s = 3`;
  so no entire extension exists. (For `n = 2` the product of a CM form is still entire, so `n = 2`
  does not detect the hypothesis.)
- For `Δ` (`N = 1`, `k = 12`) the candidate `ψ = χ_{−4}` fails at `p = 3`: `252 · (−1) = −252 ≠ 252`.
  No level-one form has a quadratic self-twist, since `π_f` is unramified everywhere while
  `π_f ⊗ χ` ramifies at the primes dividing the conductor of `χ`; for `N = 1` the statement contains
  that of §14.4.
- The weight bound is needed. A weight-one newform with icosahedral projective image has no
  quadratic self-twist, but its Galois representation has finite image, so some symmetric power
  contains the trivial representation and the product then contains `ζ(s)` up to finitely many
  factors, with a pole at `s = 1 = n(k − 1)/2 + 1`.
- `n = 0` is excluded: the product is `ζ(s) ∏_{p | N} (1 − p^{−s})`, with a pole at `s = 1` because
  `∏_{p | N} (1 − p^{−1}) ≠ 0`.

*Needs:* §14.3; §14.4 (`symPowerEulerFactor`); AutomorphicLFunctionsAndLocalFactors AL.2.4.1, AL.3.3.8,
AL.3.6.1, AL.3.7.1;
GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R16.4.6; Tau Ceti `HeckeRing.GL2.Newform`,
`HeckeRing.GL2.Newform.satakeParameters`; Mathlib `DirichletCharacter`,
`DirichletCharacter.changeLevel`, `UpperHalfPlane.qExpansion`, `HasProd`, `Differentiable`.

### Examples

- `Δ`, `n = 2`: `L(s, Sym² Δ)` is entire; its Euler factor at `2` is computed in §14.4.
- `E: y² + y = x³ − x² − 10x − 20` (conductor `11`, semistable): §14.2(2) gives every `Sym^{n−1}`,
  and §14.5 applied to its weight-two newform of level `11` gives entire `L`-functions of `Sym^n E`
  away from `11`.

### Dependencies

Layers 3, 7, 8, 10, 13; SerreWeightAndLevelOptimisation §6.9; PotentialAutomorphyInfrastructurePartII
Layer 0; PotentialModularityAndCompatibleSystems §2.16; AutomorphicGaloisRepresentations §7.5;
AutomorphicLFunctionsAndLocalFactors AL.2.4.1, AL.3.3.8, AL.3.6.1, AL.3.7.1;
GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R16.4.6;
ModularityAndLanglandsExtensions §§1.10, 1.15, 4.13, 4.15; Tau Ceti `HeckeRing.GL2.Newform`; Mathlib
`DirichletCharacter`, `UpperHalfPlane.qExpansion`.

## Downstream consumers

- ModularityAndLanglandsExtensions: its statements in §§4.5–4.12, 4.20, 4.23 (its second paragraph
  in residual form, §13.6), 4.29–4.31 are proved here (§§2.4, 3.1, 3.8, 14.1, 8.2, 9.8, 14.2, 12.7,
  13.6, 14.3, 13.10, 7.7), and its consequences (Sato–Tate in §4.34, the Hilbert statements of
  §§4.35–4.36, the holomorphy statements of §§4.32, 4.37) use them.
- Roadmaps on the cuspidal cohomology of `GL_n(ℤ)` and level-one change of weight consume §§13.10 and
  14.2.
- The technique of Layer 9 and Layer 12 (patching a pseudodeformation ring against a rank-two
  deformation ring) is reused wherever functoriality lifting is proved without residual adequacy of the
  target.
- Later roadmaps that need the Kazhdan–Lusztig classification of Iwahori-spherical representations
  of split adjoint groups (for the Aubert involution or spherical complementary series) take it from
  §4.9.

## Worked examples

- **The seed in rank `3` over `p = 577`.** `48 · 3! = 288` and `577 = 2 · 288 + 1`; `σ_0` is ordinary at
  `577 ≡ 1 mod 4`; the residual characters `χ_i = ω̄² ψ̄^{3−i}(ψ̄^c)^{i−1}` have ratios
  `(ψ̄/ψ̄^c)^{±1, ±2}` of order `> 2 · 3 = 6` on `G_{F(ζ_{577})}` (§7.2). Theorem 7.1 in rank `3` is
  supplied by §14.1, not by the seed route.
- **Ping-pong for `Δ` at `p = 2`.** The refinements of `Δ` have slopes `3` and `8`; the component of the
  slope-`3` refinement meets the boundary in some `X_i`; with `m ≥ m_Δ` the ping-pong point has weight
  `k′ = 2i + 2^{m+1} − 1` and slope `2i`, and its twin lies on `X_{2^m − 1}` (§3.7).
- **Clozel–Thorne signs at `n = 9`.** `jY − jX + jZ` equals twice the shuffle sum of `(2, 1)` with
  `(1, 0)`, term by term (§4.12).
- **Bertrand at `n = 11`.** The only prime with `11/2 < p < 11` is `7`, so `r = 4`; Thorne 2024's route
  would need `TP_4`, while §13.10 uses `SP_3`, `SP_4`, `SP_5` and `SP_3`.

## References

- [nt21] James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular
  forms*, Publ. Math. IHÉS 134 (2021), 1–116; arXiv:1912.11261v3, cited by PDF page.
- [nt21b] James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular
  forms, II*, Publ. Math. IHÉS 134 (2021), 117–152; arXiv:2009.07180v2, cited by PDF page.
- [nt26] James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*,
  Ann. of Math. 203 (2026); arXiv:2212.03595v2, cited by PDF page.
- [ct17] Laurent Clozel and Jack A. Thorne, *Level-raising and symmetric power functoriality, III*,
  Duke Math. J. 166 (2017), 325–402; authors' accepted manuscript, cited by its pages.
- [ct15] Laurent Clozel and Jack A. Thorne, *Level raising and symmetric power functoriality, II*,
  Ann. of Math. 181 (2015); authors' manuscript.
- [th24] Jack A. Thorne, *A p-adic approach to the existence of level-raising congruences*, Proc. Lond.
  Math. Soc. 128 (2024), e12584; arXiv:2212.03591v2, cited by PDF page.
- [at20] Konstantinos Anastassiades and Jack A. Thorne, *Raising the level of automorphic
  representations of `GL_{2n}` of unitary type*, J. Inst. Math. Jussieu (2021); arXiv:1912.11267.
- [bk05] Kevin Buzzard and L. J. P. Kilford, *The 2-adic eigencurve at the boundary of weight space*,
  Compositio Math. 141 (2005), 605–619; author's copy.
- [con99] Brian Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999); author's
  copy, internal pagination.
- [chen14] Gaëtan Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and
  pseudorepresentations over arbitrary rings*, in Automorphic forms and Galois representations, LMS
  Lecture Note Ser. 414 (2014); arXiv:0809.0415v2.
- [kl87] David Kazhdan and George Lusztig, *Proof of the Deligne–Langlands conjecture for Hecke
  algebras*, Invent. Math. 87 (1987), 153–215; cited by its locators.
- [moe07] Colette Mœglin, *Classification et changement de base pour les séries discrètes des groupes
  unitaires p-adiques*, Pacific J. Math. 233 (2007); arXiv:math/0610960v1.
- [kv12] David Kazhdan and Yakov Varshavsky, *On endoscopic transfer of Deligne–Lusztig functions*, Duke
  Math. J. 161 (2012), 675–732; arXiv:0902.3426v1 (its Theorem 2.2.5 is Theorem 2.2.6 of the published
  version).
- [dm18] Olivier Dudas and Gunter Malle, *Modular irreducibility of cuspidal unipotent characters*,
  Invent. Math. (2018); arXiv:1611.07373v2.
- [ls20] Jaime Lust and Shaun Stevens, *On depth zero L-packets for classical groups*, Proc. Lond. Math.
  Soc. (2020); arXiv:1611.08421v1.
- [wes04] Tom Weston, *Unobstructed modular deformation problems*, Amer. J. Math. 126 (2004);
  arXiv:math/0212091v2.
- [bbm82] Pierre Berthelot, Lawrence Breen and William Messing, *Théorie de Dieudonné cristalline II*,
  Lecture Notes in Math. 930 (1982); cited by its locator.
- [kw09] Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (II)*,
  Invent. Math. 178 (2009); cited by its locator.
