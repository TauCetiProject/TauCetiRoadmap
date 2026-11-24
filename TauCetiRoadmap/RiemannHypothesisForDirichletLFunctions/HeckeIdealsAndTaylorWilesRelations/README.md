# Roadmap: Hecke ideals and Taylor–Wiles relations

**Summary.** At a maximal ideal of the big ordinary Hecke algebra of a definite unitary group whose residual Galois determinant is that of a sum of pairwise distinct characters, the Hecke algebra carries a determinant, not a Galois representation. This roadmap compares it with the universal ring of ordinary determinants, gives its Taylor–Wiles patching data, deduces the vanishing of adjoint Bloch–Kato Selmer groups at irreducible automorphic points, and adds Tate–Shafarevich kernels of Galois cohomology with lattice and divisible coefficients. Its headline theorems:

- *The Hecke ideal.* Let `L` be a CM field with `L/L⁺` unramified at every finite place, `l` an odd prime, and `χ̄_1, …, χ̄_n` pairwise distinct characters of `G_{L,S}` with `⊕χ̄_i` isomorphic to its conjugate dual twisted by `ε̄^{1−n}`. Ordinary determinants lifting `det ⊕χ̄_i` are classified by a complete local noetherian ring `B` over the weight algebra `Λ`; the localized big ordinary Hecke algebra `𝕋` carries a unique ordinary determinant, and the classifying map `B → 𝕋` is surjective, with kernel `J` such that `B/J` is finite over `Λ`, `Λ`-torsion-free and reduced. Twisting by a character `γ ≡ 1` as in 3.13a (g) maps `J` into itself.
- *Patching data.* If moreover `μ_l ⊄ L`, then `J` has automorphic patching data: at every Taylor–Wiles level `N`, modules over the ordinary determinant ring with the Taylor–Wiles places added, comparison maps whose composites are multiplication by a product `f` of differences of ordered Hecke eigenvalues, and Taylor–Wiles relations that, multiplied by `f`, act nilpotently with exponent `n!`, independent of `N`.
- *Adjoint vanishing.* If `F` is an imaginary CM field, `n ∈ {2, 3}`, and `ρ = r|_{G_F}` is absolutely irreducible on every open subgroup of `G_F` and attached to a regular algebraic cuspidal representation of `GL_n(𝔸_F)` that is polarized (conjugate self-dual up to twist by a character), then `H¹_f(F⁺, ad r) = 0`. For `2 ≤ n ≤ 4` and ordinary `ρ` with residual representation a sum of pairwise distinct characters, `H¹_f(L⁺, ad r) = 0` under the hypotheses of 9.9 (d), among them absolute irreducibility on `G_{L(μ_{p^∞})}` and an element with separable characteristic polynomial in every nonempty open subset of that group.
- *Kernels with lattice coefficients.* For a number field `F`, a prime `p`, a finite set `S` of places containing those above `p` and the infinite ones, and a `ℤ_p`-lattice `T` with continuous `G_{F,S}`-action, the kernel `Ш²_S(F, T)` of localization on `H²(G_{F,S}, T)` is the Pontryagin dual of `Ш¹_S(F, T^D)`, real places included. This is ArithmeticGaloisDuality §D7.6a (b), of which 10.1 (b) is a corollary.

The targets extend PotentialAutomorphyInfrastructurePartII (definite unitary groups, their Hecke algebras and Taylor–Wiles data) and [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md) (Poitou–Tate duality). Determinants come from [IntegralHeckeAndGaloisDeterminants](../../IntegralHeckeAndGaloisDeterminants/README.md), the Galois representations of definite unitary groups from [BaseChangeAndGaloisRepresentationsForUnitaryGroups](../BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md), another sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md), and Newton and Thorne's vanishing theorem from ModularityAndLanglandsExtensions.

Layers 3, 4 and 9 below carry the numbers of the layers of PotentialAutomorphyInfrastructurePartII that they extend; Layer 10 extends ArithmeticGaloisDuality instead. Layer 3 builds the universal ordinary determinant ring and the Hecke ideal (3.13a), and Layer 4 its patching data (4.2a). Layer 9 proves adjoint vanishing (9.9): by Newton and Thorne's theorem at points absolutely irreducible on every open subgroup, and through Layers 3 and 4 at the other irreducible ordinary points. Layer 10, independent of the others, states the Tate–Shafarevich kernels (10.1).

## Conventions

Notation and conventions not restated here are those of PotentialAutomorphyInfrastructurePartII §§2.1, 3.1–3.13, 4.1–4.2, 9.3, and of its Conventions, in Layers 3, 4 and 9, and those of ArithmeticGaloisDuality §§R02.4.2, D7.6, and of its Conventions, in Layer 10.

- `L` (in 9.9 (a)–(c), `F`) is a CM field with maximal totally real subfield `L⁺` and complex conjugation `c`. For a place `v` of `L⁺` split in `L`, `ṽ` is the chosen place of `L` above it; `G_{L,S}`, the decomposition groups `G_{L_ṽ}` and the inertia groups `I_ṽ` are those of PotentialAutomorphyInfrastructurePartII.
- `O` is the ring of integers of a finite extension `E` of `ℚ_l`, with uniformizer `ϖ`, maximal ideal `𝔪_O` and residue field `k`. In 9.9 (d), (d₀), (d₀′) and (d′) the coefficient prime is written `p`; it plays the role of `l` in 3.13a and 4.2a.
- `ε` is the cyclotomic character, of Hodge–Tate weight `−1`, and `ε̄` its reduction; local class field theory `Art` sends uniformizers to geometric Frobenius elements (as in [FormalProof],
  `Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/HasExponentZeroIff.lean` (`GlobalTheory.LocLanglands.IsLocalArtin`),
  `Development/AbelianVarietyTheory/Definitions/TwistedInnerProducts/IsSubquotientDetRepParInd.lean` (`GlobalTheory.SmGL.ord`),
  `Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/ExistsNotCongPow.lean` (`GlobalTheory.WeilDeligne.deg_eq_one_iff`));
  `Teich` is the Teichmüller lift.
- `Frob_w` is a geometric Frobenius element at `w`, as in PotentialAutomorphyInfrastructurePartII §3.7, so `ε(Frob_w) = (Nw)⁻¹`; the Frobenius elements `φ_{N,j}` of 4.2a are geometric as well.
- `𝒢_n = (GL_n × GL_1) ⋊ {1, j}` is the group of ArithmeticGaloisRepresentations §7.4 (as in the Conventions of PotentialAutomorphyInfrastructurePartII). For a `𝒢_n`-valued `r`, `ad r` is the adjoint representation and `H¹_f` the Bloch–Kato Selmer group of PotentialAutomorphyInfrastructurePartII §9.3 (as in [FormalProof],
  `Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BlochKatoSelmerVanishes.lean` (`UpperTheory.V.Af.IsBK`),
  `Development/AutomorphicArithmetic/AutomorphicVarieties/PadicHodgeTheory/FiniteCohomology.lean` (`UpperTheory.V.Loc.finiteCocycles`),
  `Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/EigenbasisLifts/IsTanZero.lean` (`UpperTheory.V.Ws.Eb.IsAdExt`)).
- Determinants `D`, their traces `tr_D`, characteristic polynomials `charpoly D(g)` and Cayley–Hamilton quotients are those of IntegralHeckeAndGaloisDeterminants Layers 0–1. For an ideal `J` of a ring `B`, `V(J)` is the closed subset of `Spec B` it defines.
- In Layer 10 the prime is `p`, `T^D = Hom(T, ℚ_p/ℤ_p)(1)` for a lattice `T`, `A^∨` is the Pontryagin dual of `A`, and cohomology is the continuous cohomology of ArithmeticGaloisDuality §D7.6.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. Every section carries both labels. Parts of three sections are
not statements of [FormalProof]: 3.13a (f) for every `n ≥ 1` and without (w1) and (w2), 9.9 (a)–(c) and (d′) in its
generality, and 10.1 beyond the instance recorded there; the second label of these sections concerns the parts that
[FormalProof] states.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels,
`*Corollary of:*`, which names a general theorem and the roadmap section that states it, and the
clauses it covers when it does not cover the whole section. The general theorem is proved in the
roadmap that states it, and what the line covers is deduced from it. The proof of the Riemann
hypothesis for Dirichlet L-functions needs only that case, not the general theorem in full: the
`*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the
statement when that proof has a narrower one. Where the route given with the section is not the
deduction, it is a second proof, [FormalProof]'s unless the label says that it differs; the
`*Needs:*` line lists what that route needs, and the deduction needs the section that the `*Corollary
of:*` line names.

## Layer 3: Big ordinary Hecke algebras at a reducible residual determinant

This layer compares the big ordinary Hecke algebra of a definite unitary group, localized at a maximal ideal whose residual
determinant is that of a sum of pairwise distinct characters, with the universal ring of ordinary determinants.

### 3.13a The big ordinary Hecke algebra at a reducible residual determinant, in determinant form

*Origin:* adapted from Geraghty (2019), the big ordinary Hecke algebra of a definite unitary group at a non-Eisenstein maximal
ideal, with the determinants of Chenevier (2014), and from Wake and Wang-Erickson (2017), a ring of ordinary pseudorepresentations
equal to the Eisenstein component of a Hida Hecke algebra in rank two: here the ring of polarized ordinary determinants in rank `n`
and its map onto the big ordinary Hecke algebra at a maximal ideal whose residual determinant is that of a sum of pairwise distinct
characters.

*Method of the formal proof:* `M` is free over `Λ` and specializes at arithmetic points to classical ordinary forms; at the points
of each regular weight whose inertial characters have pairwise distinct finite parts, which are Zariski dense, the classical space is
a sum of Hecke eigenspaces, so these points separate the reduced algebra `𝕋`; `D_𝕋` is glued from the determinants of the Galois
representations at these points, the characters `ψ^𝕋_{v,i}` are read from the weight character and the `U`-operators through the
Artin map, the defining relations are checked at these points, and `J` is the kernel of the resulting surjection `B → 𝕋`. (f), for
`2 ≤ n ≤ 4` and `ρ` automorphic with (w1) and (w2), is proved by local–global compatibility, a comparison of the Weil–Deligne
characteristic polynomials read off the flag, the irreducibility of unlinked principal series, and descent to `G`, which gives a
point of the Hecke algebra.

Let `L` be a CM field with `L/L⁺` unramified at every finite place, `l` an odd prime, `n ≥ 1`, `G` the definite unitary group in `n`
variables for `L/L⁺` (PotentialAutomorphyInfrastructurePartII §3.1), and `S = S_l ∪ S_t ∪ {v₀}` a finite set of places of `L⁺` that split in `L`: `S_l` the places above `l`,
`S_t` a set of places prime to `l`, and `v₀` of prime norm `p ∉ {2, l}`, with `p` unramified in `L`. Let `O` be the ring of
integers of a finite extension of `ℚ_l` containing the images of all embeddings of `𝒪_L`, with residue field `k`. Let
`χ̄_1, …, χ̄_n : G_{L,S} → k^×` be **pairwise distinct** characters such that `⊕χ̄_i` is isomorphic to its conjugate dual twisted by
`ε̄^{1−n}` (`ε` the cyclotomic character), and `ψ̄_{v,i}` characters of `G_{L_ṽ}` for `v ∈ S_l`.

(1) (*the universal ordinary determinant ring*) An *ordinary determinant* over a complete local noetherian `O`-algebra `R` with
residue field `k` is a pair `(D, (ψ_{v,i}))`: a continuous `n`-dimensional determinant `D` of `G_{L,S}` over `R`
(IntegralHeckeAndGaloisDeterminants Layer 0) lifting `det ⊕χ̄_i` and polarized in the same sense, and continuous characters
`ψ_{v,i} : G_{L_ṽ} → R^×` lifting `ψ̄_{v,i}` with prescribed restriction to the `l`-torsion of `G_{L_ṽ}^{ab}`, such that
`tr_D(h·(g_1 − ψ_{v,1}(g_1))(g_2 − ψ_{v,2}(g_2))⋯(g_n − ψ_{v,n}(g_n))) = 0` for all `v ∈ S_l`, `g_i ∈ G_{L_ṽ}`, `h ∈ G_{L,S}`, and
`tr_D(h(g − 1)) = 0` for `g` in an inertia group at `S_t` with `χ̄_i(g) = 1` for all `i`. Prove that, provided the residual pair
`(det ⊕χ̄_i, (ψ̄_{v,i}))` is itself an ordinary determinant (otherwise there is none), the functor of ordinary determinants on
complete local noetherian `O`-algebras with residue field `k` is represented by a complete local noetherian `O`-algebra `B` (this
uses Mazur's finiteness condition for `G_{L,S}` and for the `G_{L_ṽ}`), and that the characters `ψ_{v,i}|_{I_ṽ}` define a map
`Λ → B` from the universal ring `Λ` of the inertial characters (a power series ring in `n[L⁺:ℚ]` variables over `O`,
LocalGaloisDeformationRings §1.3).

Let `M` be the localization, at the maximal ideal at which the Hecke polynomial at every split `w ∉ S` reduces to the
characteristic polynomial of `(⊕χ̄_i)(Frob_w)` and `U^j_{λ,ϖ_ṽ}` at `v ∈ S_l` to `∏_{i≤j}(ψ̄_{v,i}ε̄^{i−1})(Art ϖ_ṽ)` (so the maximal
ideal depends on the `ψ̄_{v,i}` as well), of the ordinary part of the space of `Λ`-valued algebraic automorphic forms on `G` of
universal weight (PotentialAutomorphyInfrastructurePartII §§3.8–3.9, weight `0` with the twisted `Λ`-structure), hyperspecial level outside `S`, level `G(𝒪)` at `S_t` with
the type of `⊕Teich(χ̄_i)|_I`, and principal congruence level at `v₀`; let `𝕋 ⊂ End_Λ(M)` be generated by the spherical operators
`T_w^j` at the split places `w ∉ S` and the operators `U^j_{λ,ϖ_ṽ}`, `v ∈ S_l`. If `M = 0`, put `J = B`. Prove:

(a) (*determinant*) there are a unique continuous determinant `D_𝕋 : G_{L,S} → 𝕋` whose characteristic polynomial at `Frob_w`
is the Hecke polynomial of the `T_w^j` (PotentialAutomorphyInfrastructurePartII §3.7), and characters `ψ^𝕋_{v,i}` of `G_{L_ṽ}` given on units by the diamond operators and
on a uniformizer through the `U`-operators, by the Artin map: `ψ^𝕋_{v,i}ε^{i−1}`, `i = 1, …, n`, is on units the inverse of the `i`-th
coordinate of the universal weight character, and `∏_{i≤j}(ψ^𝕋_{v,i}ε^{i−1})(Art ϖ_ṽ) = U^j`; `(D_𝕋, ψ^𝕋)` is an ordinary determinant;
the classifying map `B → 𝕋` is surjective. Let `J` be its kernel.

(b) (*ring*) `M` is finite free over `Λ` with support `V(J)`; `B/J` is finite over `Λ`, `Λ`-torsion-free and reduced; over `B/J`,
`charpoly D(g) = ∏_i (X − ψ_{v,i}(g))` for `g ∈ G_{L_ṽ}`, the products `(g_1 − ψ_{v,1}(g_1))⋯(g_n − ψ_{v,n}(g_n))` lie in the kernel
of `D` (this holds already over `B`: over a residually multiplicity-free base the trace relation of (1) is equivalent to it), and
the restriction of `D` to an inertia group at `S_t` is `det ⊕Teich(χ̄_i)`; if the `χ̄_i` are equal and unramified on the
decomposition group at `v₀` and `ε̄ ≠ 1` there, `D` is unramified at `v₀`. In particular `B/(J + 𝔪_Λ B)` is finite.

(c) (*density*) for every regular weight the points of `V(J)` of that weight whose `n` inertial characters at each `v ∈ S_l` have
pairwise distinct finite parts are Zariski dense; at such a point `D` is the determinant of a representation with a full flag
at each `v ∈ S_l` with characters `ψ_{v,i}`, which is potentially crystalline there.

(d) (*arithmetic points*) at every arithmetic point of `V(J)`, `D` is the determinant of a continuous semisimple `ρ` whose
characteristic polynomials are those of `⊕_i ⊕_{0≤j<m_i} ρ′_i ⊗ ε^{−j}` for continuous representations `ρ′_i` of `G_L` (in the
route below, those of the cuspidal constituents of the base change); if all `m_i = 1`, any two eigenvalues `z, z′` of
`ρ(Frob_w)` satisfy `|z| < Nw·|z′|` (under the fixed isomorphism `ι : ℚ̄_l ≅ ℂ`) for almost all `w`.

(e) (*classicality*) if `ρ` in (d) is irreducible, it is attached to a regular algebraic conjugate self-dual cuspidal
representation of `GL_n(𝔸_L)`. This follows from [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/PlainTorsionPairs/IrrArithPointsAutomorphicAway.lean`
(`UpperTheory.Gal.projectedFormsSystemPart.WitOff`), which gives moreover clauses (w1) and (w2) of (f) for this representation,
(w2) at the places not above `v₀`.

(f) (*points*) an arithmetic point of `B` whose determinant is that of a continuous `ρ` attached to a regular algebraic
conjugate self-dual cuspidal representation of `GL_n(𝔸_L)`, unramified at `v₀`, with a full flag at each `v ∈ S_l` with
characters `ψ_{v,i}`, no two of which are in ratio `ε`, lies in `V(J)`. [FormalProof] states (f) for `2 ≤ n ≤ 4` and for `ρ`
*automorphic*, which means: `ρ` is continuous and attached to a regular algebraic conjugate self-dual cuspidal representation of
`GL_n(𝔸_L)`, and (w1) at each place above `l` at which `ρ` has a full flag with no two characters in ratio `ε`, it has a full
flag with no two characters in ratio `ε` up to a character of finite order; (w2) for every regular algebraic cuspidal `Π′` to
which `ρ` is attached there is a real `t` such that, at every finite place `w` of `L` which is prime to `l` or at which the
conclusion of (w1) holds, `Π′_w` has cuspidal support made of characters `ξ` of `L_w^×`, each with
`(Nw)^{t−1/2} < |ξ(ϖ_w)| < (Nw)^{t+1/2}` ((w2): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/GammaLaurentFactors/MatchIndOf.lean` (`UpperTheory.V.Z.Gam.TorAt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/GammaLaurentFactors/MatchIndOf.lean` (`UpperTheory.V.Z.Gam.SuppAt`),
`Development/AutomorphicArithmetic/Foundations/LocalLanglands/IsRecTOfIsRec.lean` (`UpperTheory.Zero.LLC.Toral`)).
The statement of [FormalProof]:
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PointTheoremBaseObject.lean`
(`UpperTheory.V.W.UniversalOrdinaryDeterminantRing.PointTheoremBaseObject`), proved for the ideal `J` of (a) in
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/HeckePolyCoeffZero.lean`
(`UpperTheory.V.Hi.hecke_ideal_point_properties`). The statement for every `n ≥ 1` and without (w1) and (w2) is this roadmap's, by
the route below.

(g) (*twists*) Let `γ : G_{L,S} → B^×` be a continuous character, `γ ≡ 1` modulo the maximal ideal, with `γ(cgc⁻¹)γ(g) = 1`, trivial on
the inertia groups at `S_t` and at `v₀`, and trivial on the `l`-torsion of the `G_{L_ṽ}^{ab}`, `v ∈ S_l`, prescribed in (1) (for
instance a character with values in `1 + 𝔪_O` factoring through a quotient of `G_{L,S}` isomorphic to `ℤ_l`, unramified outside `l`,
with `γγ^c = 1`). Then `(D ⊗ γ, (ψ_{v,i}γ))` is an ordinary determinant, the endomorphism `τ_γ` of `B` classifying it is the unique
one twisting `D` and the `ψ_{v,i}` by `γ`, and `τ_γ(J) ⊆ J`; for `γ` with values in `1 + 𝔪_O`, `τ_γ` is an automorphism and
`τ_γ(J) = J`.

(1) and (a)–(e), (g) are statements of [FormalProof] or follow from its statements, in the form given here. (1): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/WeilCharactersModular/ProModularRingExists.lean`
(`UpperTheory.V.W.b0Ex`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/WeilCharactersModular/LamEx.lean` (`UpperTheory.V.W.lamEx`);
the module `M`, the algebra `𝕋` and its maximal ideal: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/IsTheta.lean` (`UpperTheory.V.Hi.CaseU.hset`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/CoefficientRepTrivialOnUnramified.lean` (`UpperTheory.V.Hi.HSet.MK`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/CoefficientRepTrivialOnUnramified.lean` (`UpperTheory.V.Hi.HSet.TK`);
(a): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/CoefficientRepTrivialOnUnramified.lean` (`UpperTheory.V.Hi.HSet.IsUniv`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/IsTheta.lean` (`UpperTheory.V.Hi.HSet.IsJ`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/RepAlg.lean` (`UpperTheory.V.W.GDet.chi`);
(b) follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/CoefficientRepTrivialOnUnramified.lean` (`UpperTheory.V.Hi.HSet.IsWt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TThetaEx.lean`
(`UpperTheory.V.Hi.exists_theta_is_weight_of_lam_obj`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebraHeight/PairKills.lean` (`UpperTheory.V.CA.pair_kills`);
(c): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/ArithmeticPointClassicality.lean`
(`UpperTheory.V.W.UniversalOrdinaryDeterminantRing.Pt.Good`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/CoefficientRepTrivialOnUnramified.lean` (`UpperTheory.V.Hi.HSet.Out`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/OrdCoreH.lean`
(`UpperTheory.V.Z.Ord.core_hecke_of_automorphic_hecke_dense_weight`);
(d), for the fixed `ι`: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/UnitaryHeckeData.lean`
(`UpperTheory.V.Hi.CaseU.UnitaryHeckeData`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/UnitaryHeckeData.lean`
(`UpperTheory.V.Hi.CaseU.TypeForAlt`);
(e): see that clause; (g) follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/TwistedFourierKernels/TwMapEx.lean` (`UpperTheory.V.Ws.H5.twMapEx`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/TwistedFourierKernels/IsTwistTwD.lean` (`UpperTheory.V.Ws.H5.TwCh`).

For `D = det ρ` with `ρ` absolutely irreducible over a field, the relations of (1), with the characteristic-polynomial identity of
(b), are the determinant-ordinary equations of LocalGaloisDeformationRings §7.1 on each `G_{L_ṽ}`. For Schur residual data,
ordinary and trivial at `l`, PotentialAutomorphyInfrastructurePartII §3.10 gives the analogous surjection `P_D ↠ 𝕋_D` from the
characteristic-polynomial subring of an ordinary deformation ring, and PotentialAutomorphyInfrastructurePartII §7.11 (2)(c) proves
the invariance of (g) pointwise, at the primes of characteristic `l` of a Schur ordinary deformation ring.

*Route.* (1) The universal ring of continuous determinants lifting `det ⊕χ̄_i` is noetherian under Mazur's finiteness condition
(LocalGaloisDeformationRings §F.2.11, after Chenevier [Che14], Proposition 3.7, with LocalGaloisDeformationRings §§F.2.1, F.2.2
for `Φ_l` of `G_{L,S}` and the `G_{L_ṽ}`); the characters add a completed group ring of the pro-`l` part of the `G_{L_ṽ}^{ab}` modulo
the prescribed torsion (LocalGaloisDeformationRings §1.3, the rings `Λ̃_v`);
the ordinary relations, the relations at `S_t` and the polarization are closed conditions; the functor is nonempty exactly when
the residual pair satisfies them (for `ψ̄_{v,i} = χ̄_i|_{G_{L_ṽ}}` it does: the `i`-th factor vanishes on the `i`-th line). (b) `M` is
free over `Λ` because the level at `v₀` makes the arithmetic subgroups act freely (PotentialAutomorphyInfrastructurePartII §3.11), and Hida's control theorem (PotentialAutomorphyInfrastructurePartII §3.12)
identifies its specializations with classical ordinary forms; at a point with distinct inertial characters the classical space
is a sum of Hecke eigenspaces, so `𝕋` is reduced and such points are dense (c). Every automorphic representation of `G` has a
semisimple Galois representation with the Speh shape of (d): its weak base change to `GL_n` is an isobaric sum of Speh blocks
(EndoscopicTransferAndUnitaryTraceComparison §6.29) (in the form of [FormalProof] recorded at
BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1), with the Galois representations `r_l(π)` of
PotentialAutomorphyInfrastructurePartII §3.6, whose Speh shape with explicit twists is
BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 (which agrees with PotentialAutomorphyInfrastructurePartII §3.6 in
this setting; its hypothesis `[L⁺ : ℚ] ≥ 2` holds, since `L/L⁺` unramified at
every finite place forces `[L⁺ : ℚ]` to be even), and the bound of (d) is the Jacquet–Shalika bound for each cuspidal piece
(AutomorphicLFunctionsAndLocalFactors §AL.3.3.8). In the notation of BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1,
the weight of a point of 3.13a is the base-changed weight `a_{ι∘τ} = −w₀λ_{ι∘τ}` (the weight of
PotentialAutomorphyInfrastructurePartII §3.6), not the weight `λ_{ι∘τ}` of the automorphic representation of `G`: at an
arithmetic point of weight `(a_τ)`, `a_{τ,1} ≥ ⋯ ≥ a_{τ,n}` for each `τ : L → ℚ̄_l`, the `i`-th coordinate of the weight
character is, up to a character of finite order, `u ↦ ∏_τ τ(u)^{a_{τ,n+1−i}}` over the `τ` inducing `ṽ`, and `ψ_{v,i}` has the
labelled weight `i − 1 + a_{τ,n+1−i} = i − 1 − λ_{ι∘τ,i}` at each such `τ`: strictly increasing in `i`, the subrepresentation
`ψ_{v,1}` having the smallest weight; the weights at `v` are labelled by the embeddings inducing the chosen place `ṽ` only.
At a classical point where the local components above `l` are principal series
of characters distinct on units, the Galois representation is de Rham with the weights of the point
(PotentialAutomorphyInfrastructurePartII §3.6 (v)) and abelian Weil–Deligne
representation with `N = 0` (AutomorphicGaloisRepresentationsPartII §AG2.6, *Full polarized local–global compatibility at `l`*,
whose hypothesis ModularityAndLanglandsExtensions §2.43 proves), hence potentially crystalline, and the unit-root characters
attached by Hida's lemma give crystalline characters of the right weights: the valuations of Frobenius lie on the Hodge polygon,
so it has a full flag with the characters `ψ_{v,i}` (PadicHodgeTheory §3.6, after Berger's theorem, NoncommutativeAndEquivariantIwasawa
§F.6; when the base change of the point is cuspidal this is PotentialAutomorphyInfrastructurePartII §0.4, and at a non-Eisenstein
maximal ideal it is PotentialAutomorphyInfrastructurePartII §3.13 (3)).
(a) The determinants at the dense points glue to `D_𝕋` (Chenevier's gluing of determinants over a compact ring which the
dense points separate, `𝕋` being reduced and finite over `Λ`; IntegralHeckeAndGaloisDeterminants §4.1), the characters `ψ^𝕋_{v,i}` come from local class
field theory, and every relation defining an ordinary determinant is an identity in the reduced ring `𝕋`, checked at the dense
points (where a flag gives the relation). Surjectivity: `𝕋` is generated by the `T_w^j`, which are coefficients of characteristic
polynomials of `D_𝕋`, and by the `U`-operators, which are products of values of the `ψ^𝕋_{v,i}`. The second statement of (b): over
a henselian base `A` with residually pairwise distinct `χ̄_i` the Cayley–Hamilton quotient `R` is a generalized matrix algebra of
type `(1, …, 1)`, with orthogonal idempotents `e_a` and `e_a R e_a = A e_a` (IntegralHeckeAndGaloisDeterminants §1.3). Let `x`
satisfy `tr(xy) = 0` for all `y`, and let `w = xz` for some `z`; then `tr(wy) = 0` for all `y`, so `e_a w e_a = 0` and
`e_a w e_b u e_a = 0` for all `a, b, u`, since the trace of `c·e_a` is `c`. Amitsur's formula (IntegralHeckeAndGaloisDeterminants
Layer 0) writes `D(1 − tw)` as a product of factors `D(1 − t^k v)` over words `v` in the `e_a w e_b`; a word along a closed path is
zero, and a word from `a` to `b ≠ a` lies in `e_a R e_b`, whose characteristic coefficients vanish because conjugation by
`λe_a + 1 − e_a` multiplies it by `λ`. So `D(1 − tw) = 1` for every `z`, and `x` lies in the kernel of `D`. (e) PotentialAutomorphyInfrastructurePartII §3.14(b). (f) The flag makes `ρ` potentially crystalline at `S_l`: `ρ` is de Rham
there (AutomorphicGaloisRepresentationsPartII §AG2.6), so each step of the flag is a class in `H¹_g` with coefficients `W`, and
`dim H¹_g − dim H¹_f = dim D_cris(W^∨(1))^{φ=1}` (Bloch–Kato, as in the route of PotentialAutomorphyInfrastructurePartII §9.2)
vanishes. Indeed a graded character `ψ_{v,j}ψ_{v,i}^{−1}ε` (`i < j`) of `W^∨(1)` has all its Hodge–Tate weights `≥ 0`, the
weight of an arithmetic point being dominant (at weight `0` they all equal `j − i − 1`, by the fourth Check below); if one of them is
positive, a nonzero `D_cris` of it is admissible of rank one, so `t_N = t_H ≠ 0` (PadicHodgeTheory §3.5) and its Frobenius
has an eigenvalue of nonzero valuation and fixes no vector; if all vanish, it has `D_cris ≠ 0` only if it is unramified, and then a
Frobenius-fixed vector only if it is trivial, which is excluded because no two characters of the flag are in ratio `ε`. A class
of `H¹_f` stays in `H¹_f` over a finite extension on which the `ψ_{v,i}` are crystalline, where it is a crystalline extension.
Hence the cuspidal representation `Π` of `ρ` has level potentially prime to `l` (AutomorphicGaloisRepresentationsPartII
§AG2.6) and is `ι`-ordinary (PotentialAutomorphyInfrastructurePartII §0.5). Away from `l`, Caraiani's full local–global
compatibility, with the monodromy operator (AutomorphicGaloisRepresentationsPartII §AG2.5, *Caraiani's full away-prime
compatibility*), determines `Π_w` from `ρ|_{G_{L_w}}`: `Π_w` is unramified wherever `ρ` is, in particular outside `S` and at
`v₀`. As `ρ` is semisimple (AutomorphicGaloisRepresentationsPartII §AG2.3, *Arbitrary regular conjugate-self-dual
existence*), the trace form on the span of `ρ(G_{L,S})` is
nondegenerate, so at `S_t` the relation of (1) makes `ρ` trivial on the inertia elements killed by all `χ̄_i`; its monodromy
vanishes there, and `Π_w` is a principal series with the type of `⊕Teich(χ̄_i)|_I`. The descent `σ` of `Π` to `G`
(PotentialAutomorphyInfrastructurePartII §3.5(1), `σ_v ≅ Π_w ∘ ι_w` at split `v`, for every `n`) gives a point of the big
ordinary Hecke algebra above an arithmetic prime (PotentialAutomorphyInfrastructurePartII §3.12, first Check), with the type at
`S_t` matched and the flag matched by the characters. No step depends on `n` or uses (w1) or (w2); (w2), which keeps the
exponents of the cuspidal support less than one apart, excludes nonzero monodromy at the places prime to `l`, which §AG2.5
gives here. No hypothesis on the
maximal ideal is used: the residual determinant may be reducible, and nothing in (a)–(e) uses that the `χ̄_i` are distinct except
the definition of the tame types and of the torsion data and the second statement of (b).
(g) (i) For `β` of finite `l`-power order with `β^c = β⁻¹`, trivial on those inertia groups, and a point
`x` of `V(J)` as in (c): `x` comes from an automorphic representation `σ` of `G`; `β = μ/μ^c` (`β` has odd order); twisting `σ` by the
character of `G(𝔸)` attached to `μ` gives an automorphic representation with the same weights, unramified where `σ` and `β` are,
spherical at `v₀`, with the same tame types, ordinary at `S_l` with the characters `ψ_{v,i}β`; so the twisted point lies in `V(J)`.
(ii) Modulo `𝔪_B^N`, `γ` factors through a finite `l`-group `Q`; the universal twist `B → B[Q]` maps `J` into `J·B[Q]`: `B[Q]` is finite
free over `B`, `J` is the ideal of the dense set of points of (c), and at a pair (such a point, character of `Q`) the image of
`b ∈ J` is the value of `b` at the twisted point, zero by (i). Specialising and letting `N` grow, `τ_γ(b) ∈ J + 𝔪_B^N` for all `N`,
and `J` is closed. The twisting endomorphism exists and is unique by the universal property of (1). *Needs:* PotentialAutomorphyInfrastructurePartII §§0.5, 3.5–3.14;
IntegralHeckeAndGaloisDeterminants Layers 0–1, §4.1; LocalGaloisDeformationRings §§1.3, F.2.1, F.2.2, F.2.11;
EndoscopicTransferAndUnitaryTraceComparison §6.29; AutomorphicGaloisRepresentationsPartII §§AG2.3, AG2.5, AG2.6;
BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1; ModularityAndLanglandsExtensions §2.43; PadicHodgeTheory §§3.5, 3.6;
NoncommutativeAndEquivariantIwasawa §F.6; AutomorphicLFunctionsAndLocalFactors §AL.3.3.8.

**Checks.**

- For `n = 1`, `B` is the completed group ring of the relevant ray class group, `𝕋 = B` and `J = 0`.
- At a non-Eisenstein maximal ideal (`⊕χ̄_i` replaced by an absolutely irreducible residual representation) the determinant of
  PotentialAutomorphyInfrastructurePartII §3.13(2)'s `r_𝔪` is `D_𝕋`; at an Eisenstein ideal no `r_𝔪` exists over `𝕋`, which is why the statement is in determinant form.
- The relation in (1) is the determinant form of ordinarity. If `D = det ρ` with `ρ` absolutely irreducible over a field, it is the
  identity `∏_i(ρ(g_i) − ψ_{v,i}(g_i)) = 0` on `G_{L_ṽ}`; together with `charpoly ρ(g) = ∏_i(X − ψ_{v,i}(g))` and the `ψ_{v,i}` pairwise
  distinct this is equivalent to a full flag with successive characters `ψ_{v,1}` (the subrepresentation), …, `ψ_{v,n}`
  (LocalGaloisDeformationRings §7.4). Neither addition can be dropped (compare the Checks of LocalGaloisDeformationRings §7.1):
  a scalar `ρ|_{G_{L_ṽ}} = ψ_{v,1}` satisfies the identity for every `ψ_{v,2}`; and for
  `(ψ_{v,1}, ψ_{v,2}, ψ_{v,3}) = (φ, θ, φ)`, an extension of `θ` by `φ ⊕ φ` with two independent classes satisfies both conditions and
  has no flag in that order. If `D` is reducible the relation is a condition on its constituents only: `det(χ₁ ⊕ χ₂)` satisfies it
  for both orders, also when it is the determinant of an extension that is nonsplit at `v` and ordinary in one order only.
  Ordinarity of a representation with a reducible determinant is therefore imposed on the representation,
  never deduced from its determinant.
- The shift in (a) is `ε^{i−1}` for `i = 1, …, n`: at weight `0` the diagonal characters on inertia are `1, ε⁻¹, …, ε^{1−n}` (PotentialAutomorphyInfrastructurePartII §3.13,
  first Check).
- The direction of `Frob_w` in the maximal ideal and in (a): for `n = 2`, on the constant functions of weight `0`, `T_w^1` acts by
  the number `Nw + 1` of its cosets and `T_w^2` by `1`, so the Hecke polynomial is `X² − (Nw + 1)X + Nw = (X − 1)(X − Nw)`, the
  characteristic polynomial of `(1 ⊕ ε̄⁻¹)(Frob_w)` because `ε(Frob_w) = (Nw)⁻¹`; and `1 ⊕ ε̄⁻¹` is conjugate self-dual up to
  `ε̄^{1−n} = ε̄⁻¹`, as 3.13a requires. With an arithmetic `Frob_w` the same polynomial would come from `1 ⊕ ε̄`, which is conjugate
  self-dual up to `ε̄` and, when `ε̄² ≠ 1`, not up to `ε̄⁻¹`. The general normalization is
  IntegralHeckeAndGaloisDeterminants §3a.1 (the integral Hecke polynomial and the conversion between arithmetic and geometric Frobenius).

### Examples

- For `n = 1`, `B` is the completed group ring of the relevant ray class group, `𝕋 = B` and `J = 0` (3.13a, first Check).
- If `D = det ρ` with `ρ` absolutely irreducible over a field, the relation of 3.13a (1) is the identity
  `∏_i(ρ(g_i) − ψ_{v,i}(g_i)) = 0`; a scalar `ρ|_{G_{L_ṽ}} = ψ_{v,1}` satisfies it for every `ψ_{v,2}`, and for the characters
  `(φ, θ, φ)` an extension of `θ` by `φ ⊕ φ` with two independent classes satisfies it together with the characteristic polynomial
  condition and has no flag in that order; `det(χ₁ ⊕ χ₂)` satisfies the relation for both orders (3.13a, third Check).
- At weight `0` the diagonal characters on inertia are `1, ε⁻¹, …, ε^{1−n}`, which is the shift `ε^{i−1}` of 3.13a (a) (fourth Check).

### Dependencies

PotentialAutomorphyInfrastructurePartII §§0.5, 3.1, 3.5–3.14; IntegralHeckeAndGaloisDeterminants Layers 0–1, §4.1;
LocalGaloisDeformationRings §§1.3, F.2.1, F.2.2, F.2.11; EndoscopicTransferAndUnitaryTraceComparison §6.29;
AutomorphicGaloisRepresentationsPartII §§AG2.3, AG2.5, AG2.6; BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1; ModularityAndLanglandsExtensions §2.43; PadicHodgeTheory §§3.5, 3.6;
NoncommutativeAndEquivariantIwasawa §F.6; AutomorphicLFunctionsAndLocalFactors §AL.3.3.8.

## Layer 4: Automorphic patching data at a reducible determinant

This layer gives Taylor–Wiles patching data at the Hecke ideal of Layer 3, allowing coinciding residual Frobenius eigenvalues at the
Taylor–Wiles places.

### 4.2a Automorphic patching data at a reducible residual determinant

*Origin:* particular to this proof: Taylor–Wiles data with no condition on the residual Frobenius eigenvalues, comparison maps whose
composites are multiplication by a product `f` of differences of Hecke eigenvalues, and Taylor–Wiles relations that, multiplied by
`f`, are nilpotent with an exponent independent of `N`.

*Method of the formal proof:* (L) is applied to the places of the datum at each level `N`: the `U_{j,i}` are the normalized
double-coset operators of the diagonal matrices on the Iwahori invariants, the trace to Iwahori level is onto with kernel generated
by the diamond variables because the invariants are projective over the diamond group ring, `M_N` is the summand on which the
`U_{j,i} − u_{j,i}` and the diamond variables are topologically nilpotent, and the two comparison maps are the inclusion of the
spherical vectors extended over the polynomial ring in the `U_{j,i}` and the spherical projector applied after an explicit pair of
dual bases of that ring over its symmetric polynomials, whose composite, the product over `j` and `i < i′` of
`U_{j,i′} − Nw_{N,j}·U_{j,i}`, divides `f`, one of the maps being multiplied by the cofactor. The relations hold with exponent `n!`
because the invariants of an irreducible smooth representation under a subgroup of the Iwahori subgroup defined by a subgroup of the
diagonal residues have dimension at most `n!`, a polynomial in commuting operators vanishing at every joint eigencharacter of a space
of dimension `d` has `d`-th power zero, and the level module is separated by its classical specializations.

In the setting of 3.13a, assume `μ_l ⊄ L`. A *Taylor–Wiles datum* consists of `q ≥ 0`, elements `σ_1, …, σ_q ∈ G_{L(μ_{l^∞})}`, and
for each `N ≥ 1` places `w_{N,1}, …, w_{N,q}` of `L`, above pairwise distinct places `v_{N,1}, …, v_{N,q}` of `L⁺` that split in `L`
and lie outside `S`, of norm `≡ 1 mod l^N`, with Frobenius elements `φ_{N,j}` whose images in `G_{L,S}` satisfy
`χ̄_i(φ_{N,j}) = χ̄_i(σ_j)` for all `i` and all `N` and converge to `σ_j`, as `N` grows, in the largest quotient of `G_{L⁺,S}` in
which the common kernel of the `χ̄_i` and of `ε mod l` is pro-`l`, and generators `τ_{N,j}` of the `l`-part of tame inertia at
`w_{N,j}`; such data exist for every choice of the `σ_j` (Chebotarev; [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/TaylorWilesObstructionBound.lean` (`UpperTheory.V.Pa.ArPl`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/AutomorphicDetection/ArPl.lean` (`UpperTheory.V.Pa.arPl`),
with `Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/ContinuousCycMod.lean` (`GlobalTheory.TameQuot.IsProGen`) for
the `τ_{N,j}`). Put `S_N = S ∪ {v_{N,1}, …, v_{N,q}}`. Say that an ideal
`J ⊂ B` has *automorphic patching data* if for every Taylor–Wiles datum there are a `B`-module `M`, finite free over `Λ` (in
the statement of [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/ThetaCoefficientMapEq.lean` (`UpperTheory.V.Pa.TWBase`),
finite free over a power series ring over `O` in `n[L⁺:ℚ]` variables acting through the values
of the `ψ_{v,i}` at chosen elements; in its construction,
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeckeAlgebras/OrdinaryHeckeCharacters/WeightVariablesExist.lean`
(`UpperTheory.V.Hi.levelUR2WtVars`),
these elements are inertial and the ring is `Λ`), with
`Supp_B M = V(J)`, lifts `u_{j,i} ∈ O` of the `χ̄_i(σ_j)`, an exponent `e`, and for every `N`:

- a complete local noetherian `O`-algebra `R_N` with residue field `k` carrying an ordinary determinant `(D_N, ψ_N)` in the
  sense of 3.13a(1) for the same residual data and the ramification set `S_N` (no condition at the `w_{N,j}`), a map
  `Λ[[x_{j,i}]] → R_N` (`qn` variables) whose restriction to `Λ` is the map given by the inertial characters of `ψ_N`, and
  elements `U_{j,i} ∈ R_N` lifting the `u_{j,i}`; `R_N` is an algebra over the universal ordinary determinant ring for `S_N`,
  not necessarily that ring;
- an `R_N`-module `M_N`, free of finite rank (the rank may depend on `N`) over `Λ[[x_{j,i}]]/((1 + x_{j,i})^{l^{a_{N,j}}} − 1)` for some
  `a_{N,j} ≥ N`;
- a homomorphism `R_N → Sp_N` carrying `(D_N, ψ_N)` to the pullback of the universal ordinary determinant of `B` along
  `G_{L,S_N} → G_{L,S}` and the `x_{j,i}` to `0`, where
  `Sp_N = B[[X_{j,i}]]/(∏_i(X − u_{j,i} − X_{j,i}) = charpoly D(φ_{N,j}))` is `B` with ordered roots of
  the characteristic polynomials of `D(φ_{N,j})` adjoined, sending `U_{j,i}` to `u_{j,i} + X_{j,i}`, and maps `Sp_N ⊗_B M ⇄ M_N/(x)M_N`
  whose two composites are multiplication by `f = ∏_j ∏_{i≠i′}(U_{j,i} − U_{j,i′})(U_{j,i} − Nw_{N,j}·U_{j,i′})`;
- with the exponent `e` above, independent of `N` (one may take `e = n!`): `(f·tr_{D_N}(h·r))^e` kills `M_N` for every `h ∈ G_{L,S_N}` and
  each of the two kinds of elements `r = ∏_i(φ_{N,j} − U_{j,i})` and `r = ∏_{k≠i}(φ_{N,j} − U_{j,k})(τ_{N,j} − 1 − x_{j,i})`.

(L) (*level modules*) There is a base module `M` as above (a `B`-module, finite free over `Λ`, with `Supp_B M = V(J)`) such that
for every finite set `Q = {w_1, …, w_q}` of places of `L` above pairwise distinct places `v_1, …, v_q` of `L⁺` that split in `L` and
lie outside `S`, with `S_Q = S ∪ {v_1, …, v_q}`, there are: a complete local noetherian `O`-algebra `R_Q` with residue field `k`,
carrying an ordinary determinant in the sense of 3.13a(1) for the same residual data and the ramification set `S_Q`, with the
`Λ`-algebra structure given by its inertial characters; a homomorphism `R_Q → B` carrying this determinant to the pullback of
the universal ordinary determinant along `G_{L,S_Q} → G_{L,S}`; and an `R_Q`-module `P_Q` with an `R_Q`-linear action of
`∏_j GL_n(L_{w_j})`, such that, `Iw` being the product of the Iwahori subgroups and `Iw′ ⊆ Iw` the subgroup of the elements whose
diagonal entries reduce to elements of order prime to `l`: (i) the `Iw′`-invariants of `P_Q` are finite over `Λ`; (ii) `Iw′` is normal
in `Iw` and these invariants are projective over `Λ[Iw/Iw′]`; (iii) the invariants of `∏_j GL_n(𝒪_{w_j})` are identified with `M`, `R_Q`
acting through `B`; (iv) there is `ι : ℚ̄_l ≅ ℂ` such that an element of `P_Q` is zero if it is killed by every *classical
specialization*: an additive map from `P_Q` to a complex representation `Y` of `∏_j GL_n(L_{w_j})`, equivariant, semilinear for a
ring homomorphism `θ : R_Q → ℚ̄_l` through `ι`, where the restriction of `Y` to the `j`-th factor is a sum of copies of one
irreducible smooth representation `π_j`, and `θ` composed with the determinant of `R_Q` is the determinant of a continuous
representation of `G_{L,S_Q}` which has a Weil–Deligne representation at each `w_j`, equal to `rec^T` of `π_j` in the algebraic
normalisation whenever the latter is a sum of characters with zero monodromy. In (iv) the algebraic normalisation and the
condition of having a Weil–Deligne representation at `w_j` are those of [FormalProof], whose definitions of them are not written
out here.

Prove that the ideal `J` of 3.13a has automorphic patching data. This is a theorem of [FormalProof], with the residual data
and the map of Galois groups of
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/PairedDualFirstOrderDualMatrixSpace.lean`
(`UpperTheory.V.Pa.Glob.Compat`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/PairedDualFirstOrderDualMatrixSpace.lean`
(`UpperTheory.V.Pa.Glob.Hom`);
there `μ_l ⊄ L` is a hypothesis of the bundle
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/HidaU.lean`
(`UpperTheory.V.W.HidaUAlt`),
not of the statement that `J` has patching data,
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/TaylorWilesObstructionBound.lean` (`UpperTheory.V.Pa.HasAut`). The patching
data follow from (L) applied to the sets `Q_N`, with finiteness for parabolically induced representations, the geometric lemma
and the structure of tame local Galois groups ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/THasAutOf.lean`
(`UpperTheory.V.Pa.has_automorphy_of_statement`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PaLevel.lean`
(`UpperTheory.V.Pa.HasAutOfAlt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PaLevel.lean`
(`UpperTheory.V.Pa.LocPAlt`)); (L) is a theorem of [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TLevelU.lean`
(`UpperTheory.V.Hi.level_of_is_j_unitary_hecke_data`), with
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PaLevel.lean`
(`UpperTheory.V.Pa.LevelAlt`) and
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/Classical.lean` (`UpperTheory.V.Pa.LevMod`),
whose route is not given here (outline below); the relations have the route below.

*From (L) to the patching data.* The base module is the module `M` of (L); the `u_{j,i}` are arbitrary lifts of the `χ̄_i(σ_j)`;
`e = n!`. Fix `N`, put `Q = {w_{N,1}, …, w_{N,q}}`, and let `R_Q`, `P_Q` be as in (L). Then `Iw/Iw′ ≅ ∏_{j,i} ℤ/l^{a_{N,j}}`,
`a_{N,j} = v_l(Nw_{N,j} − 1) ≥ N`. The invariants `P_Q^{Iw′}` and `P_Q^{Iw}` carry, for each `j`, `n` commuting invertible
operators `U_{j,1}, …, U_{j,n}` that commute with `R_Q`, defined through the double coset operators of diagonal matrices at
`w_{N,j}` (for a uniformiser); and `P_Q^{Iw′}` carries the action of `Iw/Iw′`; write `1 + y_{j,i}` for the action of a generator
of its `(j, i)`-th factor. The trace `P_Q^{Iw′} → P_Q^{Iw}` is onto, has kernel `Σ_{j,i} y_{j,i}P_Q^{Iw′}`, and commutes with the
`U_{j,i}`. Then: `R_N = R_Q[[X_{j,i}, x_{j,i}]]` (`2qn` variables), with the ordinary determinant of `R_Q`,
`U_{j,i} := u_{j,i} + X_{j,i}`, and `Λ[[x_{j,i}]] → R_N` extending `Λ → R_Q`; `M_N` is the direct summand of `P_Q^{Iw′}` on which
every `U_{j,i} − u_{j,i}` and every `y_{j,i}` is topologically nilpotent, `X_{j,i}` acting as `U_{j,i} − u_{j,i}` and `x_{j,i}` as
`y_{j,i}`; it is free over `Λ[[x_{j,i}]]/((1 + x_{j,i})^{l^{a_{N,j}}} − 1)` by (i) and (ii); the homomorphism `R_N → Sp_N` is
`R_Q → B` on coefficients, with `X_{j,i} ↦ X_{j,i}` and `x_{j,i} ↦ 0`; by the trace, `M_N/(x)M_N` is the corresponding summand of
`P_Q^{Iw}`; and the two comparison maps come from two additive maps between
`B[U_{j,i}]/(∏_i (X − U_{j,i}) = charpoly D(φ_{N,j}), 1 ≤ j ≤ q) ⊗_B M` and `P_Q^{Iw}`, compatible with the `U_{j,i}` and with
`R_Q → B`, whose two composites are multiplication by `f`, `M` being the invariants of `∏_j GL_n(𝒪_{w_{N,j}})` by (iii). The
relations hold on `P_Q^{Iw′}` by (iv) and the local statements (*The relations* below), and pass to `M_N`. Everything is
transported to the groups of the Taylor–Wiles datum along their isomorphisms with the Galois groups `G_{L⁺,S_N}`. The existence of
the summand with its freeness, of the operators `U_{j,i}`, and of the two maps on `P_Q^{Iw}` with composites `f` are theorems of
[FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/NilpotentLevelLowering/OpToTW.lean` (`UpperTheory.V.Pa.Lev.opToTW`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevOpOf.lean`
(`UpperTheory.V.Pa.Lev.opOf_alt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevTwoOf.lean`
(`UpperTheory.V.Pa.Lev.twoOf_alt`), whose routes are not given here.

*Outline of the mechanism.* For the finite set `Q_N = {w_{N,j}}`, the module `P_{Q_N}` of ordinary forms at Iwahori-type level at the
places of `Q_N` (the subgroup `Iw′` of (L), whose diagonal entries reduce to elements of order prime to `l`) with its smooth action of
`∏_j GL_n(L_{w_{N,j}})`: its invariants under `Iw′` are finite over `Λ` and projective over the group ring of the diamond group (PotentialAutomorphyInfrastructurePartII §3.4, the
level at `v₀` making the action free), its invariants under the maximal compact subgroup are `M`, and it is detected by its
classical specializations. The `U_{j,i}` are the ordered `U`-operators at `w_{N,j}` (PotentialAutomorphyInfrastructurePartII §4.2);
in the classical setting the two comparison maps are the parahoric projection and its adjoint, whose composite is the product of
the differences of the ordered eigenvalues because the residual eigenvalues need not be distinct; that the maps of [FormalProof] are
these is not shown here. The construction of the level modules and of the two maps at Iwahori level is not written here. *The relations.* At a Taylor–Wiles place `w`, for an irreducible smooth `π` of
`GL_n(L_w)` with a vector fixed by the pro-`l` Iwahori subgroup and matching `ρ|_{W_{L_w}}`, and a generalized eigencharacter of the
`U`-operators with normalized eigenvalues `α_i`, pairwise distinct and with no ratio `Nw`: the characteristic polynomial of
`ρ(Frob_w)` is `∏(X − α_i)`, and `∏_{k≠i}(ρ(Frob_w) − α_k)(ρ(τ_w) − χ(δ_i)) = 0` (local–global compatibility
at the Taylor–Wiles places: PotentialAutomorphyInfrastructurePartII §3.6 (i) gives it after semisimplification, which
determines `ρ|_{G_{L_w}}` here, the constituents having no nonsplit extensions since the `α_i` are pairwise distinct with no
ratio `Nw`; SmoothRepresentationsOfLocalGroups §SR.2.3, *borel-casselman-invariants* for the kernel `Iw₁` of the reduction of
the Iwahori subgroup to the diagonal, identifies the generalized eigencharacter with a character of the Jacquet module of `π`;
`π` is a constituent of a principal series `i_Bχ` (SmoothRepresentationsOfLocalGroups §SR.3a.1, *jacquet-subrepresentation*),
the characters of its normalized Jacquet module are Weyl conjugates of `χ` (SmoothRepresentationsOfLocalGroups §SR.2.2,
*principal-series-jacquet*), and the semisimplified Langlands parameter of `π` is the sum of the reciprocity images of the
`χ_i` (EndoscopicTransferAndUnitaryTraceComparison §10.18 and §10.20, the normalized-induction constituent sum and rank-one
geometric reciprocity, with §10.30, the identification with the classical correspondence)).
Hence `f·tr_{D_N}(h·r)` vanishes at every generalized eigencharacter of
every classical point (where `f ≠ 0` the eigenvalues are generic); already the factor of `f` at the place of `r` suffices. An
element of the polynomial ring in the `U`-operators and diamond operators at one place, with coefficients in `R_N`, that vanishes
at every generalised eigencharacter of every classical point has `n!`-th power zero on the level module ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevOpOf.lean`
(`UpperTheory.V.Pa.Lev.opOf_alt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/NilpotentLevelLowering/OpTransport.lean`
(`UpperTheory.V.Pa.Lev.opTransport`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevRelOf.lean`
(`UpperTheory.V.Pa.Lev.relOf_alt`)): the invariants of an
irreducible smooth representation of `GL_n(L_w)` under the subgroup of the Iwahori subgroup defined by a subgroup of the diagonal
residues have dimension at most `n!` (for such a representation `V` the subgroup contains `Iw₁`; if `V^{Iw₁} ≠ 0`, then
`V^{Iw₁} ≅ (V_N)^{T(O)₁}` by SmoothRepresentationsOfLocalGroups §SR.2.3, *borel-casselman-invariants*, so `V_N ≠ 0` and `V`
embeds in a principal series `i_Bχ` by SmoothRepresentationsOfLocalGroups §SR.3a.1, *jacquet-subrepresentation*, and
`dim V_N ≤ |S_n| = n!` by exactness of the Jacquet functor and the Jacquet module of `i_Bχ`,
SmoothRepresentationsOfLocalGroups §SR.2.2, *jacquet-lemma* and *principal-series-jacquet*, after the geometrical lemma of Bernstein and Zelevinsky [BZ77], §2.12),
a polynomial in commuting operators on a space of dimension `d`
vanishing at all joint eigencharacters has `d`-th power zero (if not, the image of its `d`-th power, stable under the operators,
contains a joint eigenvector, on which the polynomial acts by its value `0`, so a further power kills it, a contradiction), and
the level module is separated by its classical points. The exponent does not depend on the number of Taylor–Wiles places.
The remaining steps of the route are not given here. *Needs:* 3.13a; PotentialAutomorphyInfrastructurePartII §§3.4, 3.6, 4.1, 4.2;
SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.2.3, SR.3a.1; EndoscopicTransferAndUnitaryTraceComparison §§10.18, 10.20, 10.30;
IntegralHeckeAndGaloisDeterminants §1.3; Chebotarev Layer 10.

**Checks.**

- When the `χ̄_i(σ_j)` are pairwise distinct, `f` is a unit and the data at the `w_{N,j}` are the determinant form of the
  Taylor–Wiles places of GlobalGaloisDeformations §8.5 (`n` inertia characters per place, no local condition), at the Iwahori
  level recorded at the end of PotentialAutomorphyInfrastructurePartII §4.2; Thorne's datum of
  PotentialAutomorphyInfrastructurePartII §§4.1–4.2 (one residual eigenspace, one diamond factor per place) is a different datum. The
  factor `f` is what allows coinciding residual eigenvalues, the points used being those at which the eigenvalues differ.
- The `U_{j,i}` lift elements `u_{j,i}` of `O` given once for each datum, independent of `N`; `Sp_N` is finite over `B`, not étale, when the
  `χ̄_i(σ_j)` coincide.

### Examples

- When the `χ̄_i(σ_j)` are pairwise distinct, `f` is a unit and the data of 4.2a at the `w_{N,j}` are the determinant form of the
  Taylor–Wiles places of GlobalGaloisDeformations §8.5; when they coincide, `Sp_N` is finite over `B` and not étale (4.2a, Checks).

### Dependencies

Layer 3 (3.13a); PotentialAutomorphyInfrastructurePartII §§3.4, 3.6, 4.1, 4.2;
SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.2.3, SR.3a.1; EndoscopicTransferAndUnitaryTraceComparison §§10.18, 10.20, 10.30;
IntegralHeckeAndGaloisDeterminants §1.3; Chebotarev Layer 10.

## Layer 9: Adjoint vanishing at irreducible points

This layer proves the vanishing of adjoint Bloch–Kato Selmer groups at automorphic points absolutely irreducible on every open subgroup, in
rank at most three and for `GSp₄`, and at irreducible ordinary points with regular elements in ranks two to four.

### 9.9 Adjoint vanishing at strongly irreducible points, and at irreducible points with regular elements

*Origin:* published: Thorne (2022), the vanishing of the adjoint Bloch–Kato Selmer group of the Galois representation attached to a
regular algebraic polarized cuspidal representation over a CM field, when its restriction to the cyclotomic tower is irreducible; (d)
is a case of it, and (a)–(c) follow from it. Particular to this proof: (d₀) and (d₀′), the two steps into which [FormalProof] divides (d).
This roadmap's own formulation: (d′) in the generality stated.

*Method of the formal proof:* for (d), through (d₀′) and (d₀): Bloch–Kato classes are shown to be ordinary, and a derivation of the
ordinary determinant ring that killed the weight variables but not some trace would, together with derivations dual to the weight
and Taylor–Wiles variables at one level, produce more trace functions of Selmer cocycles modulo a high power of the uniformizer than
the Greenberg–Wiles formula allows, the dual term being controlled by detection at regular elements. The published proofs of Newton
and Thorne (2023) and Thorne (2022) pass to a patching limit over Taylor–Wiles levels; [FormalProof] works at a single Taylor–Wiles
level for each precision and counts trace functions there.

(a) Let `F` be an imaginary CM field, `n ∈ {2, 3}`, and `r : G_{F⁺} → 𝒢_n(O)` with `ρ = r|_{G_F}` attached to a regular algebraic
cuspidal polarized pair `(Π, χ)` of `GL_n(𝔸_F)` (AutomorphicGaloisRepresentationsPartII §AG2.0: `Π^c ≅ Π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det)`
for a character `χ` of `𝔸_{F⁺}^×/(F⁺)^×` with `χ_v(−1)` independent of `v | ∞`; conjugate self-dual `Π` is the case `χ = 1`),
with `ρ` absolutely irreducible on every open subgroup of `G_F`. Prove
`H¹_f(F⁺, ad r) = 0`, `ad r` the adjoint representation of `G_{F⁺}` on `𝔤𝔩_n` through `r` (conjugation on `G_F`, and complex conjugation
acting through the polarization, PotentialAutomorphyInfrastructurePartII §9.3).

(b) Let `ρ : G_ℚ → GSp₄(E)` be absolutely irreducible on every open subgroup of `G_ℚ`, and automorphic over an imaginary quadratic field `F`:
`ρ|_{G_F}` attached to a regular algebraic cuspidal representation of `GL₄(𝔸_F)`. Prove `H¹_f(ℚ, 𝔰𝔭₄(ρ)) = 0`, `𝔰𝔭₄(ρ)` the adjoint
representation of `Sp₄` composed with `ρ`.

(c) Let `F` be imaginary quadratic with character `η_F` and `W : G_ℚ → GL₂(E)` such that `W|_{G_F}` satisfies the hypotheses
of (a) for `n = 2`. Prove `H¹_f(ℚ, ad W) = 0`.

(a), (b) and (c) are statements of this roadmap, consequences of the theorem of Newton and Thorne [NT23]
(ModularityAndLanglandsExtensions §4.1), by the route below; they follow also, without the bound on the rank, from Thorne's
theorem [Tho22], Theorem A. They are not statements of [FormalProof].

(d) (*a theorem of [FormalProof]*) Let `p` be odd, `L` a CM field with `L/L⁺` unramified at all finite places, `μ_p ⊄ L`, and every place of
`L⁺` above `p` split in `L`; let `ρ = r|_{G_L}` be attached to a regular algebraic conjugate self-dual cuspidal representation of
`GL_n(𝔸_L)`, `2 ≤ n ≤ 4`, automorphic in the sense of 3.13a (f) (with its clauses (w1), (w2)), ordinary at every place `w` of
`L` above `p` with inertial characters `ε^{m_{w,i}}` up to finite order, `m_{w,1} > ⋯ > m_{w,n}` (the exponents may depend on `w`),
with
residual representation a sum of pairwise distinct characters; assume that `ρ` is unramified outside a finite set `S` of places
split in `L`, trivial on every inertia element at the places of `S` prime to `p` at which all the residual characters are trivial,
and unramified at an auxiliary place `v₀` as in 3.13a, of prime norm, at which the residual characters agree and are unramified
and `Nv₀ ≢ 1 mod p`. Assume moreover: (i) at each place above `p` some element of the decomposition group in the kernel of `ε` has
ordinary characters whose ratios have infinite order; (ii) `ρ|_{G_{L(μ_{p^∞})}}` is absolutely irreducible; (iii) every nonempty open
subset of `G_{L(μ_{p^∞})}` contains an element at which `ρ` has separable characteristic polynomial. Prove `H¹_f(L⁺, ad r) = 0`. The
hypothesis `μ_p ⊄ L` is a hypothesis of the statement of [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutomorphicPointGalois.lean`
(`UpperTheory.V.Th.AdjointLiftingTheorem`), whose automorphy hypothesis includes (w1) and (w2). Its conclusion: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/TheoremsMuLinked/OrdZero.lean` (`UpperTheory.V.Th.AdZero`), with
`Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BlochKatoSelmerVanishes.lean` (`UpperTheory.V.Af.IsBK`);
its hypothesis on the exponents,
`Development/AutomorphicArithmetic/AutomorphicVarieties/TheoremsMuLinked/OrdZero.lean` (`UpperTheory.V.Th.Par`), is on the ratios
of the ordinary characters only (`ε^{m_{w,i} − m_{w,j}}` up to finite order on inertia), which the hypothesis here implies.

(d₀) (*ordinary cocycles at locally generic points*) In the setting of 3.13a with `μ_p ⊄ L`, `2 ≤ n ≤ 4` and coefficients large
as there, let `x` be an arithmetic point of the universal ordinary determinant ring whose determinant is that of a continuous
`ρ`, automorphic in the sense of 3.13a (f) (with (w1), (w2)), trivial on inertia at `v₀`, with at each place `v` above `p` a full
flag whose characters are those of `x`; assume (i), (ii), (iii) of (d). Then every continuous cocycle of `G_{L⁺,S}` in `ad r`
that vanishes on the inertia elements at the places of `S` prime to `p` at which the residual characters are trivial, and such
that at each `v` above `p` there are a basis of the flag and a matrix `X` for which the cocycle minus the coboundary of `X` is upper
triangular on the decomposition group and has zero diagonal on the inertia group, is a coboundary.

(d₀′) (*Bloch–Kato classes are ordinary*) Let `ρ` be as in (d₀), with the flags and hypotheses (i) and (ii), and assume that at each place
`w` above `p` the ratios of its ordinary characters are `ε^{m_{w,i} − m_{w,j}}` up to finite order on inertia, with
`m_{w,1} > ⋯ > m_{w,n}`. Then every continuous cocycle of `G_{L⁺,S}` in `ad r` whose class is in `H¹_f` satisfies the two conditions
of (d₀).

In (d₀) and (d₀′) the largeness of the coefficients, the conditions at `v₀`, the action on `ad r` and hypothesis (ii) are those of
the statement of [FormalProof], taken here in the forms of 3.13a, of the Conventions and of (d); the definitions of [FormalProof]
for them are not written out here.

(d′) Under the hypotheses of (d), let `Λ → B_det` be the weight algebra of the universal ordinary determinant ring of 3.13a(1)
(a power series ring over `O`) and `J₀` the Hecke ideal, with `B_det/J₀` finite and torsion-free over `Λ`. If moreover the cyclotomic
exponents of `ρ` at each place above `p` differ by at least `2`, then every point derivation of `B_det` at the point of `ρ` (a point
of `V(J₀)` by 3.13a(f)) that vanishes on `Λ` is zero, and every prime of `B_det` contained in the kernel of that point contains
`J₀`. This rests on (d). (d′) in this generality is a statement of this roadmap and not a statement of [FormalProof], which
has, in rank four, the second conclusion under other hypotheses. *The form of the formal proof:* in the setting of (d) with
`n = 4`, let the determinant of `ρ` be a point of `V(J₀)`, with `ρ` automorphic in the sense of 3.13a (f), unramified at `v₀`,
`ρ|_{G_{L(μ_{p^∞})}}` irreducible, and a full flag at each place `w` above `p` whose characters are `ε^{m_{w,i}}` up to finite
order on inertia with `m_{w,i} ≥ m_{w,j} + 2` for `i < j`; assume that the only character `η` of `G_L` with `η² = 1`, trivial on
the kernel of `ε̄`, such that multiplication by `η` permutes the `χ̄_i`, is `η = 1`, and that for some `i, j`,
`(χ̄_i/χ̄_j)^m ≠ 1` for every `m ∈ {1, 2, 3, 4}`. Then every prime of `B_det` contained in the kernel of the point contains `J₀`
([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/EigenbasisRankFour.lean`
(`UpperTheory.V.Th.eigenbasis_rank_four`), which assumes (d) in the form of [FormalProof]). Hypotheses (i) and (iii)
of (d) are not assumed there. [FormalProof] has the same conclusion at the seeds of the links of UniformWildKernelBounds
(`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/BirthPm.lean`
(`UpperTheory.V.Th.local_zero_of_modular_p`)), and
it has the last step of the route below as a statement
(`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/EigenbasisLifts/RegOfTan.lean` (`UpperTheory.V.Ws.Eb.regOfTan`)):
for a complete local noetherian `O`-algebra `B`, a homomorphism to `B`
from a power series ring `Λ′` over `O` and an ideal `J` with `B/J` finite and torsion-free over `Λ′`, if every point derivation
at a `ℚ̄_p`-point of `V(J)` that vanishes on `Λ′` is zero, then every prime contained in the kernel of the point contains `J`.
The first conclusion is the analogue, for the ordinary
determinant ring, of the injectivity in the second statement of PotentialAutomorphyInfrastructurePartII §9.8 (with the exponent
gap in place of genericity; compare PotentialAutomorphyInfrastructurePartII §9.7), and the second has the shape of the conclusion
of PotentialAutomorphyInfrastructurePartII §7.19, at a characteristic-zero point.

*Route.* (a) If `ρ` is absolutely irreducible on every open subgroup of `G_F`, the identity component of the Zariski closure of
its image acts absolutely irreducibly, hence so does its derived group (the identity component is reductive, with centre acting by
scalars), which lies in the Zariski closure of the image of every open subgroup
of `G_{F(μ_{p^∞})}` (the quotient by that group is abelian). In rank at most three that derived group is `SL_n` or, for `n = 3`,
the image of `SL₂` under the symmetric square. In both cases, once `E` is replaced by a finite extension over which the
characteristic polynomial of every element of the image splits (each splits over an extension of degree at most `n!`, and `E`
has finitely many of these), the image of `G_{F(μ_{p^∞})}` is enormous (ArithmeticGaloisRepresentations §7.10, whose criterion
assumes this splitting; [NT23], Example 2.29); the enlargement does not change whether `H¹_f(F⁺, ad r)` vanishes, `H¹_f` commuting
with finite extension of scalars. ModularityAndLanglandsExtensions §4.1 (Newton–Thorne [NT23], Theorem A, p. 2 of arXiv v3) then
applies after the twist into unitary type (AutomorphicGaloisRepresentationsPartII §AG2.2), which does not change `ad r` (the
reduction of [NT23], Theorem 5.2, p. 40, the polarized form), and gives `H¹_f(F⁺, ad r) = 0`. (b) `ρ|_{G_F}` is conjugate self-dual up to twist, with
`𝒢₄`-valued extension `r`. The derived group of the identity component of the Zariski closure of the image of an open
subgroup acts absolutely irreducibly inside `GSp₄`, so it is `Sp₄` or the image of `SL₂` under the symmetric cube (`SL₂ × SL₂` acting by the
tensor product preserves a symmetric form, not an alternating one, and does not occur). Both are enormous after the same enlargement
of `E` as in (a): for `Sp₄`, with
`h = diag(a, b, b⁻¹, a⁻¹)` regular, the eigenprojection on the eigenvalue `a` has a nonzero component in each of the three simple
summands `1`, `𝔰𝔭₄`, `∧²₀` of `𝔤𝔩₄`; for the symmetric cube this is Newton–Thorne's symmetric power example (ArithmeticGaloisRepresentations
§7.10). ModularityAndLanglandsExtensions §4.1, after the twist into unitary type (AutomorphicGaloisRepresentationsPartII §AG2.2),
gives `H¹_f(ℚ, ad r) = 0`, and `𝔰𝔭₄(ρ)` is the summand of `ad r` on which complex conjugation acts through `ρ` (the complementary
summand `∧²₀ ⊕ 1` is twisted by `η_F`), so `H¹_f(ℚ, 𝔰𝔭₄(ρ))` is a direct summand of `H¹_f(ℚ, ad r) = 0`, which gives (b). (c) For the
`𝒢₂`-valued extension `r` of `W|_{G_F}` with `r(c)` built from `W(c)` and the alternating form, `ad r ≅ ad⁰W ⊕ η_F` as `G_ℚ`-modules
for every such `W`, whatever its determinant (the symplectic adjoint of a trace-zero `2 × 2` matrix is its negative, so `c` acts
on trace-zero matrices by conjugation by `W(c)`, and by `−1` on scalars);
`H¹_f(ℚ, η_F) = 0` (finiteness of the class group of `F`) and `H¹_f(ℚ, ℚ_p) = 0`, so `H¹_f(ℚ, ad W) = H¹_f(ℚ, ad⁰W) = H¹_f(ℚ, ad r) = 0` by
(a). (d) *Outline of the mechanism.* The hypotheses do not give an enormous image in general (an irreducible group need not
contain regular elements: ArithmeticGaloisRepresentations §7.10, Check), so ModularityAndLanglandsExtensions §4.1 is not applied; the mechanism is a count at
the characteristic-zero point, with (ii) and (iii) in place of enormity. A Bloch–Kato class of `ad r` is, at each place above `p`,
an ordinary deformation with fixed inertial characters (a local statement, using (i) and the regular weights), and away from `p`
a coboundary on inertia. The statement reduces in two steps to points at which no two ordinary characters are in ratio `ε` on
the decomposition groups and to cocycles with fixed inertial characters. Put the point on the Hecke side: after normalizing `ρ` to an integral point, 3.13a(f) puts it in `V(J)`
for the residual sum of characters, with the auxiliary place `v₀`, and 4.2a gives the patching data. By (ii) and (iii) finitely
many `σ_j ∈ G_{L(μ_{p^∞})}` at which `ρ` is regular semisimple detect the dual classes: a cocycle `z` of `ad ρ ⊗ ε` with
`tr(z(σ_j)ρ(σ_j)^k) = 0` for all `j, k` is a coboundary (the span of `ρ(G_{L(μ_{p^∞})})` is all of `M_n`, and derivations of a matrix
algebra are inner). At every arithmetic point `x`, an element of the algebra generated by the characteristic polynomial
coefficients a power of which kills `M/𝔭_xM` already kills it (control, and semisimplicity of the unramified Hecke operators on
classical forms); with integrality over `Λ` and the fact that a derivation killing traces kills the ordinary characters, this
gives `t` with `x(t) ≠ 0` such that `t·ker x` kills `M/𝔭_xM`. Then, at one Taylor–Wiles level `N ≫ m`, with no patching limit:
derivations modulo `ϖ^m` dual to the `n[L⁺:ℚ]` weight variables and to the `nq` Taylor–Wiles variables exist up to a constant;
each derivation gives a Selmer cocycle modulo `ϖ^m` with the same trace function; a further derivation at `x` killing the weights
and not the traces would give `|k|^{m(1 + n[L⁺:ℚ] + nq) − C}` trace functions, against the Selmer bound `|k|^{m(n[L⁺:ℚ] + nq) + C}`
(the Greenberg–Wiles formula, the dual term killed by detection). So the ordinary determinant ring is unramified over the weight
algebra at the point, which is the vanishing of the ordinary, hence of the Bloch–Kato, adjoint Selmer group. (d) follows
from (d₀) and (d₀′) ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AdLOf.lean`
(`UpperTheory.V.Th.adjointLiftingTheorem_of_locPrints_of_core`), whose proof gives (d₀′), above `p` from
`Development/AutomorphicArithmetic/AutomorphicVarieties/TheoremsMuLinked/GaloisRepresentationTypes/CornerStable.lean`
(`UpperTheory.V.Th.bkOrd`)); (d₀) is a theorem of [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutomorphicPointGalois.lean`
(`UpperTheory.V.Th.DenseThresholdMainCase`), with
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutomorphicPointGalois.lean`
(`UpperTheory.V.Th.AutomorphicPointLocallyGeneric`) and
`Development/AutomorphicArithmetic/AutomorphicVarieties/TheoremsMuLinked/OrdZero.lean` (`UpperTheory.V.Th.OrdZero`), whose route
is not given here beyond this outline (the derivations dual to the variables and detection in characteristic zero are not
written here), and the local statement on Bloch–Kato classes behind (d₀′) is not written here. (d′) A point derivation of `B_det` at the point vanishing on `Λ` is a first-order deformation of `ρ` with constant inertial
characters, trivial on the tame inertia killed residually and unramified at `v₀`; its cocycle is, at each place above `p`, an
extension of crystalline characters whose cyclotomic exponents differ by at least `2` in the ordinary order, hence a
Bloch–Kato cocycle (`H¹_f = H¹` for such a character; with a gap of `1` this can fail), so it is a coboundary by (d) and the
derivation is zero. Then the embedding dimension of the local ring of `B_det` at the kernel `𝔭` of the point is at most
`dim Λ − 1`, since point derivations inject into those of `Λ`; the quotient by `J₀` has at least that dimension, by going-down
for the finite torsion-free extension `Λ → B_det/J₀` of a normal domain, `𝔭 ∩ Λ` having height `dim Λ − 1`; so the local ring is
regular of that dimension, a domain equal to its quotient by `J₀`, and `J₀` vanishes in it: each element of `J₀` is killed by an
element outside `𝔭`, hence lies in every prime contained in `𝔭`. *Needs:* 3.13a, 4.2a; PotentialAutomorphyInfrastructurePartII §§9.3, 9.8; ModularityAndLanglandsExtensions
§4.1; ArithmeticGaloisRepresentations §§7.4, 7.10; AutomorphicGaloisRepresentationsPartII §§AG2.0, AG2.2; ArithmeticGaloisDuality §R02.5.1;
Chebotarev Layer 10.

**Checks.**

- For `ρ = Sym²` of a non-CM newform restricted to `G_F`, (a) applies: the image is absolutely irreducible on every open
  subgroup, of rank three; for `ρ` induced from a character of a cubic extension it is irreducible on `G_F` but not on an open
  subgroup, and (a) says nothing.
- Irreducibility over `E` is not enough. For an elliptic curve `A` over `ℚ` with complex multiplication by an imaginary
  quadratic field `K₁ ≠ F`, `p` inert in `K₁` and `E = ℚ_p`, the image of every open subgroup of `G_{FK₁}` in `Aut V_p(A)`
  spans the field `K₁ ⊗ ℚ_p`, over which `V_p(A)` has rank one; so `V_p(A)|_{G_F}` is irreducible over `ℚ_p` on every open
  subgroup, while over `K₁ ⊗ ℚ_p` it is a sum of two characters there, and (a) does not apply. The identity component of the
  Zariski closure of its image is a torus with trivial derived group, where the route of (a) needs one acting irreducibly.
- `n = 1` is excluded: `H¹_f(F⁺, ad ρ) = 0` there is the class-group statement of PotentialAutomorphyInfrastructurePartII §9.3's first Check.
- In (b) the adjoint module matters: `𝔤𝔩₄(ρ) = 𝔰𝔭₄ ⊕ ∧²₀ ⊕ 1` over `G_ℚ` contains `∧²₀(ρ)`, which is not a summand of `ad r` without
  the twist by `η_F`.
- In (d), (ii) alone is not enough for the detection step: a group acting irreducibly can contain no regular semisimple
  element, and then no finite set of trace functionals at regular elements is available; (iii) is a separate hypothesis.
- In (d) the conditions on the places above `p`, on the ramification and on `v₀` are those under which 3.13a(f) and 4.2a put the
  point on the Hecke side; at points pure in the sense of weights, (i) holds automatically (the ratio of two ordinary characters
  at a Frobenius lift in the kernel of `ε` has complex absolute value a nonzero power of the norm).
- Ordinarity is not a hypothesis of (a)–(c): Newton–Thorne's theorem needs none, and the routes do not use it.
- The hypothesis of (a) is polarization, not conjugate self-duality. Let `W : G_ℚ → GL₂(E)` have `det W|_{G_F} = 1` and
  cyclotomic exponents `e, −e`, `e ≠ 0`, the shape of the rank-two blocks that the consumer of 9.9 (c) uses (Downstream consumers),
  and put `ρ = W|_{G_F}`. Then `ρ^c ≅ ρ` (conjugation by `W(c)`) and `ρ^∨ ≅ ρ` (rank two, trivial determinant). Were `ρ` attached
  to a conjugate self-dual `Π`, it would satisfy `ρ^c ≅ ρ^∨ ⊗ ε^{−1}` ([NT23], Introduction), so `ρ ≅ ρ ⊗ ε^{−1}`, and
  determinants would give `ε^{−2} = 1`, which is false. So (c) reaches such a `W` only through the polarized form of (a).

### Examples

- For `ρ = Sym²` of a non-CM newform restricted to `G_F`, 9.9 (a) applies; for `ρ` induced from a character of a cubic extension,
  irreducible on `G_F` but not on an open subgroup, it says nothing (first Check).
- For `n = 1` the vanishing is the class-group statement of the first Check of PotentialAutomorphyInfrastructurePartII §9.3 (third
  Check).
- Over `G_ℚ`, `𝔤𝔩₄(ρ) = 𝔰𝔭₄ ⊕ ∧²₀ ⊕ 1`, and `∧²₀(ρ)` is a summand of `ad r` only after the twist by `η_F` (fourth Check).

### Dependencies

Layers 3 and 4 (3.13a, 4.2a); PotentialAutomorphyInfrastructurePartII §§9.3, 9.8; ModularityAndLanglandsExtensions §4.1;
ArithmeticGaloisRepresentations §§7.4, 7.10; AutomorphicGaloisRepresentationsPartII §§AG2.0, AG2.2; ArithmeticGaloisDuality §R02.5.1;
Chebotarev Layer 10.

## Layer 10: Tate–Shafarevich kernels with lattice coefficients

This layer defines the kernels of localization on the Galois cohomology of a number field with finite, divisible and lattice
coefficients, with vanishing imposed at a chosen subset of the ramification set, and proves their duality, structure and change
of the two sets of places.

### 10.1 Sha kernels with lattice and divisible coefficients

*Origin:* published for `ℤ_p`-lattices and `Σ = S`, clauses (a)–(c): Poitou–Tate duality for finite modules is Milne,
*Arithmetic duality theorems*, chapter I, §4; its passage to the kernels of a lattice and of its divisible modules has the
sources given at ArithmeticGaloisDuality §D7.6a; this roadmap's own formulation: the kernels `Ш¹_{S;Σ}` with `Σ ≠ S`,
`O`-lattices with their lengths, and (d)–(f).

*Method of the formal proof:* for `T = ℤ_p(e+1)`, with vanishing imposed at the places above `p` and `p` odd or `F` totally complex,
the equality of the lengths of the two kernels is proved by counting: at each level `p^r` the kernels for `ℤ/p^r(e+1)` and its dual
have the same order by Poitou–Tate duality for finite modules, a uniform bound on the local invariants compares them with the layers
of the two limit groups, and a finitely generated `ℤ_p`-module and a `p`-primary torsion module whose layers at level `p^r` have the
same order for all large `r` have the same length. The route written below is not this count: it passes the finite-level pairings
to the limit and obtains the perfect pairing of (b) for every lattice `T`, of which the equality of lengths is a consequence; it
also proves the clauses that are not in [FormalProof].

*Corollary of:* ArithmeticGaloisDuality §D7.6a (Poitou–Tate duality for the `Ш` kernels of a `ℤ_p`-lattice with vanishing imposed at
every place of `S`: their limits, the perfect pairing `Ш¹_S(F, T^D) × Ш²_S(F, T) → ℚ_p/ℤ_p` and their structure, from which (b),
(c) and the case `Σ = S` of (a) follow).

Let `F` be a number field, `p` a prime, `S` a finite set of places of `F` containing the places above `p` and the
infinite places, and `Σ ⊂ S`. Let `T` be a finite free `ℤ_p`-module (or `O`-module, `O` the integers of a finite
extension of `ℚ_p`) with continuous `G_{F,S}`-action, `V = T ⊗ ℚ_p`, `W = V/T`, and `T^D = Hom(T, ℚ_p/ℤ_p)(1)`. For a finite
discrete `G_{F,S}`-module `M` killed by a power of `p`, and for `M = W`, define

```text
Ш¹_{S;Σ}(F, M) = ker( H¹(G_{F,S}, M) → ∏_{v∈Σ} H¹(F_v, M) ),          Ш¹_S(F, M) = Ш¹_{S;S}(F, M),
Ш²_S(F, T)     = ker( H²(G_{F,S}, T) → ∏_{v∈S} Ĥ²(F_v, T) ),
```

with the continuous cohomology of ArithmeticGaloisDuality §D7.6 and the modified groups at real places of ArithmeticGaloisDuality §R02.4.2; for finite `M`, `Ш¹_S(F, M)` is the
group of ArithmeticGaloisDuality §R02.4.2, and `Ш¹_{S;Σ}` imposes vanishing only at the places of `Σ`. Their lengths are
`length_{ℤ_p}`, with values in `ℕ∞`, or, for `O`-modules, the `O`-length divided by the ramification index `e_O` of `O`, with
values in `(1/e_O)ℕ ∪ {∞}`; the two differ by the factor `[E : ℚ_p]` (`E = O[1/p]`; for `O/ϖ` they are the residue degree `f_O`
and `1/e_O`), and (b) holds for either.

Prove:

(a) *Limits.* `Ш¹_{S;Σ}(F, W) = colim_n Ш¹_{S;Σ}(F, W[p^n])` and `Ш²_S(F, T) = lim_n Ш²_S(F, T/p^n)`, compatibly with the
transition maps.

(b) *Duality.* The finite-level pairings of ArithmeticGaloisDuality §R02.4.3(a) pass to the limit and give a perfect pairing
`Ш¹_S(F, T^D) × Ш²_S(F, T) → ℚ_p/ℤ_p`, so `Ш²_S(F, T) ≅ Ш¹_S(F, T^D)^∨`; in particular
`length Ш¹_S(F, T^D) = length Ш²_S(F, T)`. Real places are included in both kernels.

(c) *Structure.* `Ш²_S(F, T)` is finitely generated over `ℤ_p` and `Ш¹_S(F, W)` is cofinitely generated; `Ш²_S(F, T)` is finite
exactly when `Ш¹_S(F, T^D)` is.

(d) *Change of the vanishing set.* For `Σ ⊂ Σ′ ⊂ S`, `Ш¹_{S;Σ′} ⊂ Ш¹_{S;Σ}` and the quotient embeds in `∏_{v∈Σ′∖Σ} H¹(F_v, W)`;
for `p` odd the real places contribute nothing.

(e) *Change of the ramification set.* If `S ⊂ S′` and, at every `v ∈ S′ ∖ S`, `W` is unramified with
`H¹_ur(F_v, W) = W/(Frob_v − 1)W = 0`, then inflation identifies `Ш¹_{S;Σ}(F, W)` with `Ш¹_{S′;Σ∪(S′∖S)}(F, W)`. This applies
to `W = ℚ_p/ℤ_p(−e)`, `e ≠ 0`, at every finite `v ∤ p`, where `Frob_v` acts by `Nv^{−e} ≠ 1` on a divisible group.

(f) *Functoriality.* Restriction and corestriction along finite extensions `F′/F`, and maps of lattices, preserve the
kernels; the kernel of restriction `Ш¹_{S;Σ}(F, W) → Ш¹_{S′;Σ′}(F′, W)` (`S′, Σ′` the places above `S, Σ`) lies in
`H¹(Gal(F′/F), W^{G_{F′}})` when `F′/F` is Galois.

These definitions and (a)–(f), in this generality, are statements of this roadmap, classical consequences of Poitou–Tate
duality (ArithmeticGaloisDuality §§R02.4.3, D7.6), and not statements of [FormalProof]. [FormalProof] has one instance only:
`T = ℤ_p(e+1)` and `W = ℚ_p/ℤ_p(−e)` for an integer `e`, the ramification set formed by the places above `p` and the infinite
places, vanishing imposed at the places above `p` only, and (b) as the equality of lengths when `p` is odd or `F` is totally
complex, with no real place in either kernel ([FormalProof], `Formalism/GaloisCohomology/Statement.lean`
(`Formalism.GaloisCohomology.PTShaAt`), derived from the finite-level Poitou–Tate statements in
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/LengthEqLengthInvariantsOfTorsionLevels.lean`
(`GlobalTheory.TateLimit.ptShaAt`)).

*Route.* (a) Filtered colimits are exact on discrete modules and `H¹(G_{F,S}, W) = colim_n H¹(G_{F,S}, W[p^n])`;
inverse limits of finite groups are exact, and the Milnor sequence of ArithmeticGaloisDuality §D7.6 with finite finite-level groups gives
`H²(G_{F,S}, T) = lim_n H²(G_{F,S}, T/p^n)`, and likewise locally. (b) ArithmeticGaloisDuality §R02.4.3(a) at each finite level, with the
identification `Hom(T/p^n, μ_{p^n}) = T^D[p^n]` and the naturality of the Poitou–Tate pairing in the coefficients (the same
transport for the compactly supported complexes is the compact duality target of IntegralIwasawaTheory §2.0, to which
ArithmeticGaloisDuality §D7.6 is the adapter);
Pontryagin duality turns the colimit into the limit (*Character duality for the arithmetic topological groups*,
ArithmeticGaloisDuality §R02.4.2). (c) `H²(G_{F,S}, T)` is finitely generated (ArithmeticGaloisDuality §R02.4.4 at finite levels and the limit) and `H¹(G_{F,S}, T^D)` is
cofinitely generated; the finiteness statement is (b). (d)–(f) Inflation–restriction (ProfiniteCohomology §5.4), corestriction
(ProfiniteCohomology Layer 6), and the unramified local groups of ArithmeticGaloisDuality §R02.4.2. *Needs:* ArithmeticGaloisDuality §§R02.1.2, R02.4.2, R02.4.3, R02.4.4, D7.6; ProfiniteCohomology §5.4 and Layer 6.

**Checks.**

- At `p = 2` the real-place condition is not vacuous: complex conjugation acts on `ℚ₂/ℤ₂(−e)` by `(−1)^e`, so
  `H¹(ℝ, ℚ₂/ℤ₂(−e))` is `ℤ/2` for even `e` and `0` for odd `e`. For odd `p` every real local group vanishes, so
  `Ш¹_{S;S_p} = Ш¹_S` by (d) when `S = S_p ∪ S_∞` (`S_p` the places above `p`, `S_∞` the infinite places). With another finite
  place in `S` the two differ: for `F = ℚ`, `p = 3` and `S = {3, 61, ∞}`, a cubic character of conductor `61`, as a class in
  `H¹(G_{ℚ,S}, ℚ₃/ℤ₃)`, is trivial on the decomposition group at `3`, since `3²⁰ ≡ 1 mod 61` makes `3` a cube modulo `61`, so it
  lies in `Ш¹_{S;S_3}(ℚ, ℚ₃/ℤ₃)`; it is ramified at `61`, whereas `Ш¹_S(ℚ, ℚ₃/ℤ₃) = 0`, its classes being unramified everywhere.
- (e) fails at `e = 0`: `H¹_ur(F_v, ℚ_p/ℤ_p) = ℚ_p/ℤ_p ≠ 0`, so a class of `Ш¹_{S;Σ}` need not vanish at `v`, and inflation does
  not land in `Ш¹_{S′;Σ∪(S′∖S)}`, which can be strictly smaller. For `F = ℚ`, `p = 3`, `S = {3, ∞}`, `Σ = ∅` and
  `S′ = S ∪ {7}`, `Ш¹_{S;∅}(ℚ, ℚ₃/ℤ₃) = ℚ₃/ℤ₃` (the characters of the cyclotomic `ℤ₃`-extension), while
  `Ш¹_{S′;{7}}(ℚ, ℚ₃/ℤ₃) = 0`: its classes are unramified at `7`, hence characters of that extension trivial at the Frobenius
  at `7`, which is a topological generator of its Galois group because `7 ≢ 1 mod 9`.
- `F = ℚ`, `S = {p, ∞}`: `Ш¹_S(ℚ, ℚ_p/ℤ_p) = 0`, since a character of `G_{ℚ,S}` of `p`-power order factors through
  `Gal(ℚ(μ_{p^∞})/ℚ)` (Kronecker–Weber: the maximal abelian extension of `ℚ` unramified outside `p∞` is `ℚ(μ_{p^∞})`) and the
  decomposition group at `p` is all of that group; by (b), with `T = ℤ_p(1)`,
  `T^D = ℚ_p/ℤ_p`, also `Ш²_S(ℚ, ℤ_p(1)) = 0`.
- (c) does not compare `Ш²_S(F, T)` with `Ш¹_S(F, W)`: for `T = ℤ_p(1)`, `Ш²_S(F, ℤ_p(1))` is dual to `Hom(Cl_S(F), ℚ_p/ℤ_p)`, finite,
  while `Ш¹_S(F, ℚ_p/ℤ_p(1))` is dual to `Ш²_S(F, ℤ_p)`, whose rank is the Leopoldt defect of `(F, p)`.

### Examples

- For `F = ℚ` and `S = {p, ∞}`, `Ш¹_S(ℚ, ℚ_p/ℤ_p) = 0`, and by 10.1 (b) with `T = ℤ_p(1)` also `Ш²_S(ℚ, ℤ_p(1)) = 0` (10.1, third Check).
- For `T = ℤ_p(1)`, `Ш²_S(F, ℤ_p(1))` is dual to `Hom(Cl_S(F), ℚ_p/ℤ_p)` and finite, while `Ш¹_S(F, ℚ_p/ℤ_p(1))` is dual to
  `Ш²_S(F, ℤ_p)`, whose rank is the Leopoldt defect of `(F, p)` (fourth Check).
- At `p = 2`, `H¹(ℝ, ℚ₂/ℤ₂(−e))` is `ℤ/2` for even `e` and `0` for odd `e`, so the condition at the real places is not vacuous (first Check).

### Dependencies

ArithmeticGaloisDuality §§R02.1.2, R02.4.2, R02.4.3, R02.4.4, D7.6; ProfiniteCohomology §5.4 and Layer 6. No earlier layer is used.

## Downstream consumers

- UniformWildKernelBounds §1.1 uses 10.1.
- UniformWildKernelBounds §3.11 (ord) imposes ordinarity on a representation with a reducible determinant, not on the determinant
  (third Check of 3.13a).
- UniformWildKernelBounds §3.15 uses the ring `B` of 3.13a and the patching data of 4.2a, in the definition of its hypothesis.
- UniformWildKernelBounds §3.16 (h) uses 3.13a with tame places of `S_t` at which all the `χ̄_i` are ramified through the same
  character, the type at `S_t` being `⊕Teich(χ̄_i)|_I`.
- UniformWildKernelBounds §3.20 (e), the Hecke ideal of a layer in rank four (the sum of the extended Hecke ideals at two auxiliary
  places), uses 3.13a for finiteness, weak purity, automorphy and seeds as points, 3.13a (g) in its clause (inv), 4.2a, and
  9.9 (d′), through 9.9 (d), at the seed.
- UniformWildKernelBounds §4.2 uses 3.13a (finiteness, automorphy, seeds) and 4.2a; UniformWildKernelBounds §4.4 uses 3.13a through
  UniformWildKernelBounds §3.20 (e); UniformWildKernelBounds §4.5 uses 3.13a, 4.2a, and 9.9 (a) over `ℚ(i)`.
- UniformWildKernelBounds §4.3 uses 9.9 (a) at type I points and 9.9 (c) at the rank-two block of type II points;
  UniformWildKernelBounds §4.7 uses 9.9 (b) at points absolutely irreducible on every open subgroup and 9.9 (d) over the tower field at the
  other irreducible points. These consumers use 3.13a (f) in the range `2 ≤ n ≤ 4`.
- BernoulliBoundsForClassGroupEigenspaces §6.17 uses 10.1 for the groups `Ш¹(F, ℓ, e) = Ш¹_{S;S_ℓ}(F, ℚ_ℓ/ℤ_ℓ(−e))` and
  `Ш¹_S(F, ℚ_ℓ/ℤ_ℓ(−e))`, `S = S_ℓ ∪ S_∞`: by 10.1 (b) the second is dual to an étale wild kernel, by 10.1 (d) the two
  coincide when `ℓ` is odd (and, as that roadmap shows, when `e` is odd or `F` is totally imaginary), and the equality of
  lengths for `Ш¹(F, ℓ, e)` is used under the hypothesis "`ℓ` odd or `F` totally imaginary" only.
- CongruenceModulesOfThetaLifts §7.7b uses 10.1.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

It owns 3.13a, 4.2a, 9.9 and 10.1. The theory they extend is owned by PotentialAutomorphyInfrastructurePartII (definite unitary groups, algebraic modular forms and big ordinary Hecke algebras in its Layer 3; Taylor–Wiles data and patching in its Layer 4; adjoint Bloch–Kato Selmer groups in its Layer 9) and by [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md) (Poitou–Tate duality in its Layers R02.4 and D7). The targets above differ from the nearest statements of their homes as follows.

- 3.13a and 4.2a concern other maximal ideals than PotentialAutomorphyInfrastructurePartII §§3.13 and 4.2. PotentialAutomorphyInfrastructurePartII §3.13 (2) constructs the lift `r_𝔪` over the localized big ordinary Hecke algebra, its ordinarity and the classifying map only for a non-Eisenstein maximal ideal `𝔪`, and PotentialAutomorphyInfrastructurePartII §4.2 uses a residual eigenspace. At the maximal ideals of 3.13a the residual determinant is that of a sum of characters, the Hecke algebra carries a determinant, not a representation, and the comparison with deformation theory is through the universal ordinary determinant ring.
- 10.1 extends ArithmeticGaloisDuality §D7.6a. ArithmeticGaloisDuality §R02.3.0d defines `Ш^i_S(K, A)` for finite `A` with vanishing imposed outside `S`; ArithmeticGaloisDuality §R02.4.2 defines `Ш^r_S(K, M) = ker(H^r(G_S, M) → P^r_S(K, M))` for finite `M`, with vanishing imposed at every place of the ramification set `S`, archimedean places included; ArithmeticGaloisDuality §D7.6 has the Poitou–Tate sequences for a lattice `T` and for `V/T`; ArithmeticGaloisDuality §D7.6a has, for a `ℤ_p`-lattice `T`, the kernels `Ш¹_S(F, W)`, `Ш¹_S(F, T^D)` and `Ш²_S(F, T)` with vanishing imposed at every place of `S`, real places included, their limits, their duality and their structure, from which 10.1 (b), (c) and the case `Σ = S` of 10.1 (a) follow, but no length and no kernel in which the ramification set and the set of places where vanishing is imposed differ. 10.1 gives these, for instance for classes unramified outside `p` (ramification set `S_p ∪ S_∞`) that vanish at the places above `p` only.
- The automorphy statements for residually reducible deformation rings whose routes pass through 3.13a, 4.2a and 9.9, and the machinery of those routes, are not stated here: their residual representations have constituents exchanged by the polarization, there is no Steinberg place, and the functors are representable only after framing. They belong to UniformWildKernelBounds, which uses these targets. PotentialAutomorphyInfrastructurePartII §§7.6–7.19 and 8.1–8.16 state the published analogues under Schur, primitivity and Steinberg hypotheses.

[FormalProof] states 3.13a (1) and (a)–(e), (g) or statements from which they follow, 3.13a (f) for `2 ≤ n ≤ 4` under (w1) and (w2), 4.2a, 9.9 (d), the second conclusion of 9.9 (d′) in rank four under other hypotheses, and an instance of 10.1, each in the form recorded at its target. Of these, the existence of the level modules and comparison maps of 4.2a, and 9.9 (d), rest here on [FormalProof] alone: their routes are outlined at the targets, and the steps not written out are said there to be not given here.

The users of these targets in this family are UniformWildKernelBounds, BernoulliBoundsForClassGroupEigenspaces and CongruenceModulesOfThetaLifts (Downstream consumers, above).

## Exact supplier contracts

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

- §0.5: an automorphic representation of level potentially prime to `l` whose Galois representation is ordinary at every place above `l` is `ι`-ordinary, for every `n`, used in the route of 3.13a (f).
- §3.1: the definite unitary group `G` in `n` variables for `L/L⁺`.
- §3.4: exactness and freeness over the group ring of the diamond group at level without `l`-torsion, used in the outline of 4.2a.
- §3.5 (1): descent of automorphic representations from `GL_n` to `G`, for every `n`, used in the route of 3.13a (f); [FormalProof]
  has it for a CM field `L` with `L/L⁺` unramified at every finite place, `2 ≤ n ≤ 4`, a prime `l`, and a regular algebraic
  cuspidal `π` with `π^∨ ≅ π^c`, unramified outside the places above a finite set of places of `L⁺` split in `L` that contains those
  above `l`: an automorphic representation of the definite unitary group, unramified at every place that does not split, whose
  components at almost all split places are unramified with the Satake parameters of `π`
  (`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CuspidalDescent/DescWeak.lean`
  (`UpperTheory.V.Z.Desc.DescWeak`), proved as `UpperTheory.V.Z.Tf.SR.descWeak` in
  `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/TraceFormula/SplitRigidity/HasOfSplit.lean`).
- §3.6: the Galois representations `r_l(π)` attached to constituents of algebraic modular forms on `G`, with (i) semisimplified local–global compatibility at split places and (v) de Rham with the weights at `S_l`, used in the routes of 3.13a (c), (d) and in the relations of 4.2a.
- §3.7: the Hecke polynomials of the spherical operators `T_w^j`.
- §§3.8–3.9: Iwahori levels at `l`, the `U`-operators, ordinary parts, and the big ordinary Hecke algebra over `Λ` of universal weight.
- §§3.10–3.11: ordinary deformation data, and finite freeness of ordinary forms over `Λ` when the level at `v₀` makes the arithmetic subgroups act freely.
- §3.12: Hida classicality and control, with its first Check (points above arithmetic primes).
- §3.13: the `Λ`-adic Galois representation at non-Eisenstein maximal ideals, with its first Check (the diagonal characters at weight `0`).
- §3.14 (b): from Hecke eigensystems to regular algebraic conjugate self-dual cuspidal representations of `GL_n(𝔸_L)`, used for 3.13a (e).
- §§4.1–4.2: Taylor–Wiles data with a residual eigenspace, Taylor–Wiles level structures and the parahoric projection.
- §9.3: the adjoint Bloch–Kato Selmer group of a conjugate self-dual representation, with its first Check (the case `n = 1`).
- §9.8: ordinary tangent vectors of trivial weight lie in `H¹_g`.

### From TauCetiRoadmap.ArithmeticGaloisDuality

- §R02.1.2: continuous cochains into inverse limits.
- §R02.4.2: the local terms, the modified groups at real places, the kernels `Ш^r_S(F, M)` for finite `M`, character duality for the arithmetic topological groups, and the unramified local groups.
- §R02.4.3 (a): the Poitou–Tate pairings at finite level, natural in the coefficients.
- §R02.4.4: finiteness of `H²(G_{F,S}, M)` for finite `M`.
- §R02.5.1: the Greenberg–Wiles formula, used in the outline of 9.9 (d).
- §D7.6: continuous cohomology with lattice coefficients, the Milnor sequence, and the Poitou–Tate sequences for `T` and `V/T`.
- §D7.6a: the kernels `Ш¹_S(F, W)`, `Ш¹_S(F, T^D)` and `Ш²_S(F, T)` of a `ℤ_p`-lattice `T`, with vanishing imposed at every place of `S`, real places included, their limits, the perfect pairing `Ш¹_S(F, T^D) × Ш²_S(F, T) → ℚ_p/ℤ_p` and their structure: the general theorem of which 10.1 (b), (c) and the case `Σ = S` of 10.1 (a) are corollaries.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

- Layers 0–1: continuous determinants, their traces and characteristic polynomials, Amitsur's formula, and Cayley–Hamilton quotients.
- §1.3: over a henselian base with residually pairwise distinct characters the Cayley–Hamilton quotient is a generalized matrix algebra of type `(1, …, 1)` (Chenevier's Theorem 2.22(ii)), used in the route of 3.13a (b).
- §4.1: Chenevier's gluing of continuous determinants over a compact coefficient ring from a jointly injective family of coefficient rings, used in the route of 3.13a (a).

### From TauCetiRoadmap.LocalGaloisDeformationRings

- §1.3: the universal rings of inertial characters, a power series ring over `O` in `n[L⁺:ℚ]` variables in the setting of 3.13a, and the rings `Λ̃_v` of full Galois characters, used in the route of 3.13a (1).
- §§F.2.1, F.2.2: Mazur's finiteness condition, which `G_{L,S}` and the `G_{L_ṽ}` satisfy, used in the route of 3.13a (1).
- §F.2.11: continuous pseudodeformation rings, noetherian under Mazur's finiteness condition, used in the route of 3.13a (1).
- §7.4: over a field, a representation with pairwise distinct prescribed characters satisfying the characteristic-polynomial and ordered-product identities has a full flag with those ordered characters, cited in the third Check of 3.13a.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §6.29: the weak base change of an automorphic representation of `G` to `GL_n` is an isobaric sum of Speh blocks, used for the Speh shape in 3.13a (d).
- §§10.18, 10.20: the semisimple Weil parameter of an irreducible smooth representation of `GL_n` over a `p`-adic field, additive on supercuspidal support and given in rank one by geometric reciprocity; §10.30: its identification with the classical correspondence; used in the relations of 4.2a.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- §AG2.0: conjugate self-dual and polarized automorphic representations `(π, χ)` of `GL_n` over a CM field, used in the statement of 9.9 (a).
- §AG2.2: the twist of a polarized representation into unitary type, used in the routes of 9.9 (a) and (b).
- §AG2.3: the Galois representation attached to a regular algebraic conjugate self-dual cuspidal representation is continuous and semisimple, used in the route of 3.13a (f).
- §AG2.5: Caraiani's full away-prime compatibility, the Weil–Deligne representation at every place prime to `ℓ` with its monodromy operator, used in the route of 3.13a (f).
- §AG2.6: full polarized local–global compatibility at `ℓ`, used in the route of 3.13a (c), (d) and (f).

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

- §2.43: the hypothesis of the local–global compatibility of AutomorphicGaloisRepresentationsPartII §AG2.6.
- §4.1: Newton and Thorne's vanishing of adjoint Bloch–Kato Selmer groups for regular algebraic cuspidal `π` of unitary type when the image of `G_{F(μ_{p^∞})}` is enormous, used in the routes of 9.9 (a)–(c).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- §AL.3.3.8: the Jacquet–Shalika bound for the Satake parameters of cuspidal representations, used for the eigenvalue bound of 3.13a (d).

### From TauCetiRoadmap.PadicHodgeTheory

- §3.5: a rank-one filtered `φ`-module is admissible exactly when `t_H = t_N`, used in the route of 3.13a (f).
- §3.6: labelled ordinary flags and their characters, used in the route of 3.13a (c) to obtain a full flag when the valuations of Frobenius lie on the Hodge polygon.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

- §F.6: the comparison after Berger's theorem used with PadicHodgeTheory §3.6 in the route of 3.13a (c).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §7.4: the group `𝒢_n` and its multiplier.
- §7.10: enormous images, with its Check (an irreducible group need not contain regular elements), used in the routes of 9.9.

### From TauCetiRoadmap.ProfiniteCohomology

- §5.4: inflation–restriction, used in the route of 10.1 (d)–(f).
- Layer 6: corestriction along open subgroups, used in the route of 10.1 (f).

### From TauCetiRoadmap.Chebotarev

- Layer 10: the Chebotarev density theorem in Dirichlet density, used for the existence of Taylor–Wiles places in 4.2a and in the outline of 9.9 (d).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- §SR.2.2: *jacquet-lemma* (exactness of the Jacquet functor) and *principal-series-jacquet* (the Jacquet module of a principal series), used in the relations and for the bound `n!` in the route of 4.2a.
- §SR.2.3: *borel-casselman-invariants* for the kernel `Iw₁` of the reduction of the Iwahori subgroup to the diagonal, used in the relations and for the bound `n!` in the route of 4.2a.
- §SR.3a.1: *jacquet-subrepresentation*, used in the relations and for the bound `n!` in the route of 4.2a.

### From TauCetiRoadmap.GlobalGaloisDeformations

- §8.5: Taylor–Wiles places in rank `n`, cited in the first Check of 4.2a.

### From BaseChangeAndGaloisRepresentationsForUnitaryGroups, a sub-roadmap of this family

- §16.1: the Galois representations attached to automorphic representations of definite unitary groups, in the form stated there: the standard Hermitian form over a CM extension unramified at every finite place, used in the route of 3.13a (d); its hypothesis `[L⁺ : ℚ] ≥ 2` holds in the setting of 3.13a.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>; the file paths and declaration names cited here are those of its first commit 40e56bab026552e089d7afcfeff08d2defb9c005, the source as published, under its directory `src/`. It states 3.13a (1) and (a)–(e), (g) or statements from which they follow, 3.13a (f) for `2 ≤ n ≤ 4` under (w1) and (w2), 4.2a, 9.9 (d), the second conclusion of 9.9 (d′) in rank four under other hypotheses, and an instance of 10.1, each recorded at its target.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- [BZ77] I. N. Bernstein and A. V. Zelevinsky, *Induced representations of reductive p-adic groups I*, Annales scientifiques de l'École Normale Supérieure 10 (1977), 441–472, [Numdam](http://archive.numdam.org/article/ASENS_1977_4_10_4_441_0.pdf). The bound `n!` in the route of 4.2a.
- [Che14] G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*, in Automorphic Forms and Galois Representations, vol. 1, LMS Lecture Note Series 414 (2014), 221–285; arXiv:0809.0415v2. [Open preprint](https://arxiv.org/abs/0809.0415v2). Noetherianity of the universal ring of determinants under Mazur's finiteness condition, in the route of 3.13a.
- [Ger19] D. Geraghty, *Modularity lifting theorems for ordinary Galois representations*, Mathematische Annalen 373 (2019), 1341–1427. The big ordinary Hecke algebra of a definite unitary group at a non-Eisenstein maximal ideal, from which 3.13a is adapted.
- [Mil] J. S. Milne, *Arithmetic duality theorems*, second edition, 2006, chapter I, §4. Poitou–Tate duality for finite modules, the finite-level case of 10.1 (b), through ArithmeticGaloisDuality §D7.6a.
- [NT23] J. Newton and J. A. Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, Journal of the European Mathematical Society 25 (2023), 1919–1967; arXiv:1912.11265v3. [Open preprint](https://arxiv.org/abs/1912.11265v3). The vanishing theorem used in the routes of 9.9 (a)–(c).
- [Tho22] J. A. Thorne, *On the vanishing of adjoint Bloch–Kato Selmer groups of irreducible automorphic Galois representations*, Pure and Applied Mathematics Quarterly 18 (2022), 2159–2202; arXiv:2207.04925. [Open preprint](https://arxiv.org/abs/2207.04925). Theorem A (Theorem 6.1): the vanishing theorem of which 9.9 (d) is a case and from which 9.9 (a)–(c) follow.
- [WWE17] Wake and Wang-Erickson, *Ordinary pseudorepresentations and modular forms*, Proceedings of the American Mathematical Society, Series B 4 (2017), 53–71; arXiv:1510.01661. [Open preprint](https://arxiv.org/abs/1510.01661). A ring of ordinary pseudorepresentations equal to the Eisenstein component of a Hida Hecke algebra in rank two, from which 3.13a is adapted.
