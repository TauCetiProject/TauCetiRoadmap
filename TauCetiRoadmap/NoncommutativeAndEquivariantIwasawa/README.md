# Roadmap: noncommutative and equivariant Iwasawa theory

**Summary.** This roadmap builds the algebra in which noncommutative Iwasawa main conjectures are stated, compared and proved, and records the main theorems in their exact form. It starts from the completed group algebra `Λ(G) = ℤ_p[[G]]` of a compact `p`-adic Lie group `G`, which Tau Ceti already provides, and makes it usable for nonabelian `G`: constant lower-`p`-series indices, ordered coordinates and finite-rank `p`-valuations, freeness over open subgroups, finite-quotient radical formulas, filtrations and integral graded rings, finite global dimension, and compact group homology with diagonal twists (Layer 0). It proves the Ore theorem for the canonical denominator set `S` of Coates–Fukaya–Kato–Sujatha–Venjakob and its `p`-saturation `S*`, with the categories `𝔐_H(G)` of `S*`-torsion modules and of `S`-acyclic perfect complexes (Layer 1). It builds the Picard-valued determinant of perfect complexes over a noncommutative ring, the localization sequence `K₁(Λ(G)) → K₁(Λ(G)_S) → K₀(Λ(G), Λ(G)_S)` with its perfect-complex model, fixes its boundary sign, and defines characteristic elements (Layer 2); it evaluates `K₁`-classes at Artin representations, relates the values to Akashi series and to `Γ`- and `G`-Euler characteristics, and separates the integral ambiguity `SK₁` from the reduced-norm ambiguity (Layer 3). The arithmetic layers construct the `GL₂` dual Selmer module and the totally real Iwasawa complexes, with the cyclotomic-overfield extension of weak Leopoldt along admissible towers, compactly supported variants, the duality triangle and the real-place correction at 2 (Layer 4), state the `GL₂` and totally real main conjectures as precise normalized interpolation statements (Layer 5), and prove the totally real main conjecture for odd `p` under `μ = 0` along Kakde's route — the equivariant adapters of IntegralIwasawaTheory’s Deligne–Ribet pseudomeasures and normalized abelian theorem, the Burns–Kato reductions, the additive and multiplicative descriptions of `K′₁` by congruences, and the analytic congruences between abelian zeta functions with a smoothing element chosen uniformly in the conductor — with the Ritter–Weiss theorem, the conditional Ritter–Weiss uniqueness reduction and the Gambheera–Popescu unconditional abelian minus theorem stated alongside in their own hypotheses (Layer 6). The last layer builds Bockstein descent: semisimple complexes, the Bockstein trivialization, leading terms at representations, the cyclotomic height as a Bockstein map, the Burns–Venjakob interpolation formulas for the Tate motive and for critical motives on correctly shifted complexes, and noncommutative Fitting invariants with denominator-corrected annihilation (Layer 7).

The end theorems are the canonical Ore theorem (§1.7), surjectivity of the boundary for every compact `p`-adic Lie group (§2.15), the evaluation–Euler characteristic formula (§3.6), Kakde's congruence description of `K′₁` (§6.15), the main conjecture for totally real fields (§6.34, with §6.30 and §6.36), and the leading-term interpolation formulas (§7.13, §7.14, §7.18).

`README.md` is normative. `Suggested.lean` records the light definitions and theorem signatures that can be stated against the pinned Mathlib and Tau Ceti, with the `example` checks named below; it is not exhaustive. New declarations live in the namespace `TauCeti.NoncommIwasawa`; Lean names in this file are written without that prefix. Every definition has the API it needs and Checks that a plausible wrong definition fails; every theorem has its exact hypotheses, its source and the statements it rests on.

## Scope and ownership

This roadmap owns:

- the group side of compact `p`-adic Lie groups used by Iwasawa algebras: the constant-index characterization and dimension of uniform groups, compact `p`-adic analytic groups as profinite groups with an open normal uniform subgroup together with the analytic structure they carry, ordered coordinates, finite-rank `p`-valuations with their saturation and ordered bases, ordered Iwasawa series (ramified coefficients included), the integral graded ring under an extra commutator condition, freeness over open subgroups, finite-quotient radicals and semilocality, the extension of Auslander regularity and finite global dimension from uniform groups to compact analytic groups without `p`-torsion, the rational global dimension, Lazard's exterior cohomology, the diagonal twist of a module by a representation, and the rational and twisted comparisons of compact group homology (Layer 0);
- the canonical Ore set `S` and its `p`-saturation `S*`, the central procyclic subgroup and finite quotient algebras used to prove the Ore property, the left and right membership criteria, `S`-torsion, the prime-radical description of `S`, the localizations `Λ(G)_S` and `Λ(G)_{S*}` and their flatness, the category `𝔐_H(G)` and the `S`-acyclic perfect complexes (Layer 1);
- `K₀` of complete rings and its detection by finite quotients and characters, semilocality of `Λ(G)_S`, the Picard-valued determinant of perfect complexes over a possibly noncommutative ring, the localized `K₁` of Fukaya–Kato and its comparison with `K₁(Λ(G)_S)`, the perfect-complex model of the relative group of an Ore localization and the relative classes of torsion perfect complexes, the localization sequence and its boundary `∂_G`, surjectivity of `∂_G` with and without `p`-torsion, characteristic elements, and the comparison with commutative characteristic series (Layer 2);
- the twist homomorphism `Φ_ρ` and its extension to `S*`, evaluation of `K₁`-classes at Artin representations, Akashi series, the evaluation–Akashi diagram, `Γ`-Euler characteristics of torsion Iwasawa modules and the Hochschild–Serre product formula, twisted Euler characteristics and their Artin formalism, the `X₁(11)` example, the integrality conjecture, the finite Whitehead inputs (Wall's theorem that `SK₁` of a `p`-adic group ring is a finite `p`-group, its vanishing when the Sylow `p`-subgroup is abelian, triviality of `SK₁` of semisimple `p`-adic algebras, and the Dress–Witt–Berman computation of `K′₁` on elementary subgroups), `SK₁` and `K′₁ = K₁/SK₁` of Iwasawa algebras through Artin determinants with their inverse-limit description, the conditional `K₁` continuity comparison, the semisimple total quotient in dimension one and the reduced-norm comparison (Layer 3);
- the dual Selmer module of an elliptic curve over its trivializing extension with the control and complex-multiplication inputs its criteria use, the `𝔐_H(G)` conjecture and its criteria, admissible extensions of totally real fields, weak Leopoldt along admissible towers, the complex `C(F_∞/F)` and its perfection when `G` has `p`-torsion, equivariant compactly supported complexes and their duality triangle, perfection and derived base change, and the real-place correction at 2 (Layer 4);
- the `GL₂ p`-adic `L`-function and main conjecture, the totally real main conjecture, the localized zeta interpolation statement with its functoriality, and the normalized abelian comparison (Layer 5);
- the proof of the totally real main conjecture along Kakde's route (equivariant adapters of Deligne–Ribet partial-zeta rationality, Kummer congruences and pseudomeasures, `Σ`-truncated Artin `L`-values at negative integers and their inductivity, the relative-boundary adapter of Wiles's normalized abelian theorem, Burns–Kato patching, the reductions, the twisted group ring presentation, the congruence groups `Φ^G`, the additive theorem, the Iwasawa-algebra and integral logarithms, the multiplicative sequence, `K′₁` injectivity, the congruence criterion, the Hilbert Eisenstein `q`-expansion formulas, the analytic Möbius congruences with a uniform smoothing element, and canonical descent), the Ritter–Weiss logarithmic pseudomeasure and main theorem, the conditional Ritter–Weiss `SK₁` reduction, and the Gambheera–Popescu minus theorem (Layer 6);
- Bockstein homomorphisms, semisimple complexes, the Bockstein trivialization and leading terms, leading terms as characteristic-series coefficients and derivatives, generalized Euler–Poincaré characteristics, the Fukaya–Kato global zeta isomorphism as a proposition, Tate-motive descent and interpolation, Greenberg's `p`-adic Artin `L`-functions, Colmez's residue formula and the `p`-adic Stark conjecture, the local `ε`-isomorphism, Dabrowski–Panchishkin Selmer complexes, the cyclotomic height as a Bockstein map, critical-motive interpolation with its periods and regulators, noncommutative Fitting invariants and the exceptional-factor leading term (Layer 7).

The shared `K`-theory space, fibration, resolution and relative-triple theorems belong to GeneralAlgebraicKTheory §§4–8; the low-degree matrix and congruence constructions are targets of §F.0. The finite group-ring logarithm belongs to ClassicalArithmeticCompletion Layer 7. The continuous-cochain, compact-tensor, arithmetic-duality, Selmer, Hilbert-modular and period-comparison foundations used below are specified in §§F.1–F.6, extending the named suppliers on their existing carriers. The local constants used in §7.15 retain the Deligne–Langlands normalization of ClassicalArithmeticCompletion’s local-constant contract and §§7.13, 7.30.

### Prerequisites and boundaries

Use the following supplied carriers and contracts. Section F.0 builds the low-degree ring constructions named here:

- **Tau Ceti and TauCetiRoadmap ProfiniteProPGroups, Layer 9**: the completed group algebra `TauCeti.completedGroupAlgebra R G` of a profinite group with compact coefficients, its finite quotient projections, augmentation, the `ℤ_p` power-series coordinate of a procyclic group, and the extension of commuting continuous coefficient and group actions on a compact module to a module over the completed group algebra. These exist at the Tau Ceti pin; Layer 0 writes `Λ_O(G) = O[[G]]` for this carrier. The Tau Ceti pin also has the twisted monoid algebra `TauCeti.twistedMonoidAlgebra k G α` of a factor set over a commutative semiring `k`, with `TwistedMonoidAlgebra.basis`, `of_mul_of` and `isUnit_of` (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`), and the commutative Fitting ideals `TauCeti.fittingIdeal R M k` (`TauCeti/RingTheory/FittingIdeal/Basic.lean`); §6.7 and §7.21 build on them.
- **TauCetiRoadmap ProfiniteArithmetic**: the closed lower `p`-series `TauCeti.pLowerCentralSeries` (indexed from zero, so our `P_i` is its term `λ_(i−1)`) and continuous `p`-adic powers `TauCeti.IsProP.padicPow`.
- **TauCetiRoadmap PadicMeasuresIwasawaAlgebras**: the coefficient extension `O ⊗_{ℤ_p} ℤ_p[[Γ]] ≅ O[[Γ]]` for every profinite `Γ` with a countable tower of finite quotients and every finite free `O`, ramified or not (§1.7); the structure theorem for finitely generated `Λ`-modules (§4.2); characteristic ideals and their norms under `O[[T]] → ℤ_p[[T]]` (§4.6); determinant lines of perfect complexes over commutative rings (§5.1); and topological Nakayama for compact modules over a compact local ring with finite residue field (§5.2). Compact Nakayama is therefore not a target here; it is applied to `Λ(J)` for `J` pro-`p`, which is such a ring by §0.4, and its coinvariant form `M/𝔪_J M = M_J/pM_J` follows because `𝔪_J` is generated by `p` and the augmentation ideal.
- **TauCetiRoadmap ClassicalArithmeticCompletion, Layer 7**: for finite groups and complete coefficient domains with a Frobenius lift, semilocal elimination (§7.27), Adams operations (§7.14), the integral group logarithm with its character formula (§7.46), integral-character twisting of determinants (§7.47), its integral images `L(1 + I) ⊆ pφ(I)` and `L(1 + A) = pφ(A)` (§7.62), the Witt–Berman induction identities with field of definition `ℚ_p`, with a prime-to-`p` multiplier over `ℚ_p-p`-elementary subgroups and integrally over `ℚ_p`-elementary subgroups, and their use for determinant tests (§7.63), the kernel `Det(G)` of `L/p` on `Det(1 + I)` (§7.73), fixed-point descent (§§7.80, 7.109), equality of matrix and unit determinant images (§7.101), maximal orders (§7.21) and reduced norms of semisimple number-field algebras (§§7.10, 7.60).
- **Low-degree ring K-theory (§F.0 here)**: the native finite-projective `K₀`, associative balanced tensor, stable matrix `K₁`, congruence relative groups, Morita and field determinants, and semilocal elimination. These constructions precede the higher comparisons of GeneralAlgebraicKTheory.
- **TauCetiRoadmap GeneralAlgebraicKTheory**: the resolution theorem (§4.6), the relative group `K₀^cl(T)` of triples `(P, α, Q)` for an additive functor `T` (§4.15), its stable automorphism boundary (§4.16) and the classical five-term exact sequence `K₁(C) → K₁(D) → K₀^cl(T) → K₀(C) → K₀(D)` for `T` dense up to summands (§4.17), Waldhausen `K`-theory spaces and spectra (§§5.7, 5.11), the Waldhausen fibration theorem under saturation, extension and cylinder hypotheses (§6.3), the Gillet–Waldhausen comparison (§§6.9, 6.19), relative `K`-theory of a ring map as a homotopy fibre (§8.1) and the identification of its components with relative triples (§8.7), and Morita invariance (§10.6). No Ore localization theorem and no determinant functor are supplied there; both are targets of §§2.7–2.9.
- **TauCetiRoadmap RepresentationTheory/InductionRestriction**: Clifford theory over a normal subgroup (Layer 5) and the virtual character ring with Artin and Brauer induction (Layer 6); Tau Ceti's integral Brauer induction `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary`. **RepresentationTheory/SemisimpleAlgebras**: Wedderburn decomposition.
- **TauCetiRoadmap IntegralHeckeAndGaloisDeterminants**, Layer 0: determinant laws, Azumaya determinants and the reduced norm of a central simple algebra; Layer 3 instantiates the reduced norm on the Iwasawa total quotient.
- **TauCetiRoadmap ProfiniteCohomology**: continuous cochains and cup products of profinite groups.

The arithmetic foundations used here are §F.3 (continuous Galois duality), §F.4 (Selmer complexes and Iwasawa cochains), §F.5 (Hilbert modular forms), and §F.6 (de Rham comparison and Weil–Deligne realization). The on-main ClassicalArithmeticCompletion local-constant contract supplies completed finite-image Artin functions; the Hecke and Dedekind comparisons are specified below. These contracts and the pinned period-ring suppliers are specified below.

### Theorems and conjectures

The following are conjectural statements, used only as named hypotheses or as statements whose proved cases are recorded: the integrality conjecture for characteristic elements (§3.10), the `𝔐_H(G)` conjecture and Mazur's conjecture (§4.2), the `GL₂ p`-adic `L`-function and main conjecture (§§5.1–5.2), the localized zeta interpolation statement for a general admissible extension (§5.6), the Fukaya–Kato global zeta isomorphism (§7.9), the `p`-adic Stark conjecture (§7.11) and the local `ε`-isomorphism (§7.15). The totally real main conjecture (§5.5) is a statement that Layer 6 proves for odd `p` under `μ = 0` (§6.34); §6.30 is the Ritter–Weiss form of the same theorem and §6.35 is a conditional uniqueness reduction. Everything else in the layers is a definition, construction or theorem to be proved. The `X₁(11)` data (§§3.9, 5.4) are consistency checks conditional on their published numerical tables, which are hypotheses of those subsections.

## Conventions

Fix a prime `p`. Write `Λ_O(G) = O[[G]], Λ(G) = ℤ_p[[G]], Ω_k(G) = k[[G]]` and `Ω(G) = 𝔽_p[[G]]`. Unless a statement says otherwise, `O` is the ring of integers of a finite extension `L` of `ℚ_p`, with uniformizer `ϖ` and residue field `k, G` is a Hausdorff compact `p`-adic analytic group, and modules are left modules with the compact topology appropriate to finite generation. Coefficient extension is the finite free tensor product with its induced compact topology; these coefficient rings have characteristic zero, and equal-characteristic discrete valuation rings are not included in the integral or rational `p`-adic assertions. Kakde's logarithmic route uses odd `p` and an unramified coefficient domain `O`. Finite products are taken componentwise, including all kernel and cokernel factors; for `R = ∏R_i` the central regular denominator set is `∏(R_i ∖ pR_i)`, not `R ∖ pR`. The canonical localization fixes a closed normal subgroup `H` with `G/H = Γ ≅ ℤ_p` and a topological generator `γ`, with `T = γ − 1`. In `O`-coefficients the saturation of `S` uses `ϖ`; saturating by `p` gives the same localization, since `p` is a unit times `ϖ^e`. Neither torsion-freeness nor absence of `p`-torsion follows from compact analyticity; a finite prime-to-`p` factor is allowed wherever the theorem allows it. Total quotient rings, canonical Ore localizations and completed central localizations are distinct rings.

**Matrices and modules.** Maps between finite free left modules act on row coordinates by multiplication on the right; this makes the cokernel of right multiplication by `f` equal to `Λ/Λf`. A left basis over an open subgroup `H′ ≤ H` uses representatives of the cosets `H′g`, a right basis representatives of `gH′`.

**Powers and series.** `U^n` is the closed subgroup generated by `n`-th powers, not the set of `n`-th powers. A pro-`p` group is powerful if its commutator subgroup lies in `U^p` for odd `p` and in `U⁴` for `p = 2`. Uniformity includes topological finite generation and torsion-freeness. The lower `p`-series has `P₁ = U`, so `P_i = λ_(i−1)` in Tau Ceti's zero-based indexing. Ordered coordinates fix an order of multiplication and are homeomorphisms, not group homomorphisms.

**Boundaries and classes.** Complexes are indexed cohomologically: `H^i(C[1]) = H^(i+1)(C), [C[1]] = −[C]` and `d(C) = ⊗_i d(C^i)^((−1)^i)`. The boundary of the localization sequence is normalized by `∂[s] = [Λ/Λs]`. For `C = [Λ --f→ Λ]` in degrees `−1, 0`, the relative class is `[C] = [Λ/Λf]`. Burns–Venjakob's characteristic map for the identity trivialization gives `ch(C) = f⁻¹`, so `∂ch(C) = −[C]`. A shift negates the relative class and inverts the characteristic element. The totally real dual Galois complex `C(F_∞/F)` has `H^(−1) = X_Σ` and `H⁰ = ℤ_p`, so `[C] = [ℤ_p] − [X_Σ]` whenever its cohomology classes can be used, and the main conjecture's `∂ζ = −[C]` has the opposite module expression. No sign is left as an unspecified ±.

**Global determinants.** The global Fukaya–Kato map has codomain `d(C)⁻¹` for `C = RΓ_c`. It is transported along `d(C[1]) ≅ d(C)⁻¹` to the pair `[C[1], ζ_D]`, whose boundary is `+[C]` and whose order is `−r(C)`; the shift preserves the arithmetic map, whereas inverting the map would change its values. For a Tate specialization of multiplicity `m` the normalized value is `c_γ^(−m)[C[1], ζ_D]^*`. For a Selmer complex with nondegenerate height of rank `h, r(SC) = −h` and `r(SC[1]) = h`, and the inverse determinant contributes the height determinant, not its reciprocal. These global conventions are separate from those of the totally real dual complex.

**Twists and Frobenius.** Twisting uses `g(m ⊗ v) = gm ⊗ ρ(g)v`; the evaluation–Akashi comparison uses the contragredient `ρ∨`. Artin evaluation uses `Φ_ρ(g) = ρ(g)·ḡ` and the Morita determinant, without division by `dim ρ`. The Bockstein is cup product with `θ : G → Γ → ℤ_p` normalized by `θ(γ) = 1`, and `c_γ = log_p κ_Γ(γ)` for the principal-unit character `κ_Γ` on `Γ` is retained whenever one passes from `T` to a cyclotomic variable. Arithmetic versus geometric Frobenius, the removed Euler factors, the periods and the cyclotomic variable are fixed by the source formula each target cites. A comparison of ideals does not identify normalized zeta elements. At a zero or pole, evaluation is replaced by a leading-term construction whose semisimplicity and regulator hypotheses are stated.

**Totally real towers.** For the totally real theorems `p` is odd, `F_∞/F` is Galois, totally real, contains the cyclotomic `ℤ_p`-extension, is unramified outside a finite set `Σ` of finite primes containing those above `p`, and has compact `p`-adic analytic Galois group. The condition `μ = 0` means that the maximal abelian pro-`p` extension of `F_∞` unramified outside `Σ` has Galois group finitely generated over `Λ(H)`; its cyclotomic formulation is §4.4. Real places at `p = 2` require modified Tate terms and are excluded from the odd-prime theorems. A statement conditional on weak Leopoldt, semisimplicity, a main conjecture or a period comparison retains that condition.

**Witnesses.** Each sign convention has a two-term example in Worked examples whose value is computed: the elementary complex `[Λ --T→ Λ]` fixes the boundary and order conventions (example 5), the rank-one Tate computation fixes the normalization `c_γ^(−m)` (example 9), and the carry of the twisted group ring fixes its inverse (example 4).

## Exact supplier contracts

### From Mathlib at the pin

`Subgroup.closure`, `Subgroup.topologicalClosure` and `commutatorElement` (closed power subgroups and powerfulness); `OpenNormalSubgroup`; `IsPGroup`; `IsLocalRing`; `IsNoetherianRing` (left noetherian; right noetherian through the opposite ring); `MvPolynomial` and `MvPolynomial.isNoetherianRing` (graded rings); `Module.Finite`; `Submodule.span` (the left ideal `Λf`); `FractionRing` (commutative fraction fields only, never used for a noncommutative localization); `LinearMap.injective_iff_surjective` (finite-dimensional endomorphisms, used only under finiteness); the left Ore localization `OreLocalization` with `OreLocalization.OreSet`, `ore_right_cancel`, `numeratorRingHom`, `numeratorHom_inj`, `numerator_isUnit`, `universalHom` and `universalHom_unique`; `HomologicalComplex`; `Ideal.Quotient.mk`; `Matrix` (the target of `Φ_ρ`); `MonoidAlgebra` (the group ring; the twisted ring agrees with it for the trivial cocycle); `ConjClasses` (indexing the cocentre `R[Conj Ḡ]^τ`); `MonoidHom.transfer` (the transfer `ver`); `Algebra.norm` and `Algebra.trace` (norms and traces of finite free algebras); `Abelianization`; `IsPrimitiveRoot.geom_sum_eq_zero` (for `η_P`); `sub_pow_char_of_commute` (`p`-th powers of commuting differences in characteristic `p`); `Complex.Gamma` (for `Γ*(j)`); `Padic`. Each is used only in the scope just stated. No noncommutative `K₁`, relative perfect-complex `K₀` or noncommutative determinant functor exists in these APIs.

### From Tau Ceti at the pin

At `a91d3aa`, use `TauCeti.IsProP`; `TauCeti.pLowerCentralSeries`; `TauCeti.IsProP.padicPow`; and `TauCeti.completedGroupAlgebra` from `Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic`, with the finite quotient projections and the procyclic coordinate from its `PowerSeries` module. The `Module` module supplies `TauCeti.IsCompactModule.completedGroupAlgebraModule`, extending commuting continuous coefficient and group actions on a compact module. `TauCeti.twistedMonoidAlgebra` and `TauCeti.TwistedMonoidAlgebra.basis`, `of_mul_of`, `isUnit_of` are in `Algebra/MonoidAlgebra/Twisted/Basic`; `TauCeti.fittingIdeal`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_le_of_surjective` are in `RingTheory/FittingIdeal/Basic`. The completed group algebra, factor-set algebra and commutative Fitting ideal are supplied objects, not new definitions here. The new statements concern their noncommutative localization, relative perfect-complex classes and arithmetic realizations; the eight admitted signatures of `Suggested.lean` use only the light ring-level definitions and Mathlib carriers.

### TauCetiRoadmap ProfiniteProPGroups, Layer 9; ProfiniteArithmetic; PadicMeasuresIwasawaAlgebras

The carriers listed under Prerequisites and boundaries, consumed with their stated projections, continuity and coordinate change. PadicMeasuresIwasawaAlgebras §1.7 supplies `O ⊗_{ℤ_p} ℤ_p[[G]] ≅ O[[G]]` for every compact `p`-adic analytic `G` (such `G` is topologically finitely generated, so its open normal subgroups contain a countable cofinal tower) and every finite free `O`, with Dirac elements and multiplication; the `mod-p` analogue `k ⊗_{𝔽_p} 𝔽_p[[G]] ≅ k[[G]]` and the commuting squares for restriction to a closed subgroup and for change of coefficients follow levelwise from the finite group algebras and are part of §0.3 (consumed in §§0.3, 0.4, 0.8, 0.14, 1.1, 1.2, 1.8, 3.1, 3.8). §5.2 supplies topological Nakayama (consumed in §§1.4, 2.2, 4.1, 4.3, 4.4). §§4.2 and 4.6 supply characteristic power series of finitely generated torsion `Λ_O(Γ)`-modules with the structure theorem up to pseudo-isomorphism and the norm of characteristic series under `O[[Γ]] → ℤ_p[[Γ]]` (consumed in §§2.14, 3.4, 3.6). Layer 3 supplies pseudo-measures on commutative completed group algebras and their admissible evaluation at characters (§§3.1–3.3 there; consumed in §§5.8, 6.1). §5.1 supplies graded determinant lines of perfect complexes over a commutative ring with shifts and Koszul signs; the noncommutative Picard-valued determinant of §2.7 specializes to it.

### TauCetiRoadmap ClassicalArithmeticCompletion, Layer 7

§§7.10, 7.14, 7.21, 7.27, 7.46, 7.47, 7.60, 7.62, 7.63, 7.73, 7.80, 7.101 and 7.109 as listed under Prerequisites and boundaries, for finite groups over complete coefficient domains with a Frobenius lift (consumed in §§2.13, 3.11, 6.4–6.6, 6.11, 6.12, 6.14). Layer 6 passes from finite `p`-groups to completed one-dimensional Iwasawa algebras; the exact kernel and cokernel of the finite integral logarithm (Oliver's Theorem 6.6, as restated by Kakde, §5.5, exact sequence (9), p. 48) is a target of §6.12, not an import.

<a id="ne-foundations-matrix-k-theory"></a>
### `F`.0 Low-degree matrix and congruence K-theory

**Construction.** For every associative unital ring `R`, use the pinned `TauCeti.finiteProjectiveModules` and `TauCeti.ExactK0` for finite-projective `K₀`. Construct the balanced tensor of a right `R`-module and a left `R`-module as the additive tensor quotient by the balancing relations. Prove its universal property, associativity for composable bimodules, units and scalar-extension/restriction adjunction; scalar extension preserves finite projectives. Construct `classicalK1 R=GL∞(R)/E∞(R)` with stabilization by `diag(g,1)` and prove Whitehead’s theorem that `E∞(R)` is the perfect commutator subgroup. Identify this group with the projective-automorphism presentation, naturally in ring maps. For every `n>0` prove Morita invariance `K₁(M_n(R))≅K₁(R)`; for a field the determinant identifies `K₁` with its unit group. For a two-sided ideal `I`, construct `congruenceK1 R I=GL∞(R,I)/E∞(R,I)`, where the relative elementary subgroup is the normal closure of elementary matrices with entries in `I`; prove relative Whitehead and functoriality for ideal pairs, with exact `K₁(R,I)→K₁(R)→K₁(R/I)`. When `R` is semilocal, prove stable range one and elementary/diagonal elimination, hence `Rˣ→K₁(R)` is surjective. Use left projectives, transporting right-module matrix conventions through the opposite ring. Identify this projective-automorphism presentation with the categorical `K₁` used in the earlier higher comparison theorems; use the matrix model only for the ring-specific arguments.

Source: Weibel, *The K-book*, II §2 (projectives and `K₀`), III §1, especially Whitehead’s Lemma 1.3.5, Lemma 1.4 and Proposition 1.6.4, and III §2, Relative Whitehead Lemma 2.1 and Definition 2.2.

**Checks.**

- Over a field, the class of `diag(a,1)` has determinant `a`; an elementary matrix has trivial class.
- `K₁(M_n(F))≅Fˣ` uses the ordinary determinant of the corresponding matrix over `F`, without an `n`th root or division by `n`.
- For `I=0`, the congruence group is zero. In general its map to `K₁(R)` need not be injective: it cannot be defined as that map’s image or kernel.
- The balanced tensor `R⊗_R M≅M` keeps the specified left action; transposing matrices alone does not change a left module into a right one.

*Needs:* pinned finite-projective categories and exact Grothendieck groups; Mathlib matrices, elementary matrices, additive tensor products and quotient groups.

### TauCetiRoadmap GeneralAlgebraicKTheory, §§4.6, 4.15–4.17, 5.7, 5.11, 6.3, 6.9, 6.19, 8.1, 8.7, 10.6

In applying §6.19 to finite projectives, use its degreewise split cofibrations and its specified weak-equivalence class. For the additive scalar-extension functor `T = Λ_S ⊗_Λ − : P(Λ) → P(Λ_S)`, which is dense up to summands, §4.15 supplies the relative group `K₀^cl(T)` of triples `(P, α, Q)` with `α : Λ_S ⊗ P ≅ Λ_S ⊗ Q`, §4.16 the boundary `δ[α] = [P, α ⊕ id, P]`, and §4.17 exactness of `K₁(Λ) → K₁(Λ_S) → K₀^cl(T) → K₀(Λ) → K₀(Λ_S)` at the three interior terms, for every ring map and without any Ore hypothesis. §8.7 identifies `K₀^cl(T)` with `π₀` of the homotopy fibre of `K(Λ) → K(Λ_S)` (§8.1). §6.3 is the fibration theorem `K(C^w, v) → K(C, v) → K(C, w)` under saturation, extension and a cylinder functor for `w`, and §§6.9, 6.19 are the Gillet–Waldhausen comparisons for bounded complexes. §4.6 is the resolution theorem, §§5.7 and 5.11 the `K`-theory space and spectrum of a Waldhausen category, and §10.6 Morita invariance. The verification of the fibration hypotheses for `S`-quasi-isomorphisms of perfect `Λ`-complexes, the comparison `K(Ch^b P(Λ), w_S) → K(Λ_S)`, the identification of `K₀^cl(T)` with `K₀` of `S`-acyclic perfect complexes, and the Picard-valued determinant functor are targets of §§2.7–2.9.

### TauCetiRoadmap RepresentationTheory`/`InductionRestriction, Layers 5–6; SemisimpleAlgebras; IntegralHeckeAndGaloisDeterminants, Layer 0

From InductionRestriction: Clifford's dichotomy for a normal subgroup `A` — an irreducible representation either restricts to an isotypic representation of A or is induced from a proper subgroup containing `A` — and the monomiality of irreducible representations of finite `p`-groups (Serre, *Linear representations of finite groups*, Proposition 24 and Theorem 16; consumed in §6.17); Artin's and Brauer's induction theorems (§§3.14, 6.1, 6.4, 6.6, 6.32, 7.11, 7.14). The twisted algebra of §§3.12 and 6.7 is Tau Ceti's `twistedMonoidAlgebra` over the commutative ring `O[[Z]]` and its localizations and completions; no field-coefficient restriction applies. From SemisimpleAlgebras: Wedderburn decomposition (§§3.12, 7.19). From IntegralHeckeAndGaloisDeterminants Layer 0: the reduced norm of a central simple algebra over its centre and the Azumaya determinant (consumed in §§3.13, 7.19, 7.20).

### ProfiniteCohomology, ClassFieldTheory and DerivedModuleAlgebra

ProfiniteCohomology Layers 5–8 and 10–12 supply continuous cochains, connecting maps, restriction, corestriction, closed-subgroup Shapiro, cup products and cohomological dimension. ClassFieldTheory Layer 5 supplies the normalized local invariant and local Tate duality, Layers 10–13 the global Brauer sequence, reciprocity and the Grunwald–Wang theorem. DerivedModuleAlgebra §§0.2, 1.1.1, 1.`T`.1 and 1.`E`.0 supplies derived operations, inverse systems and general-ring perfectness. The compact-coefficient and arithmetic extensions of these objects are §§F.2–F.4 here.

### PadicPeriodRings §§1.5, 4.1–4.3; SmoothRepresentationsOfLocalGroups SR.5.2

PadicPeriodRings supplies the topological rings `B_cris`, `B_st`, `B_dR`, their Galois actions, Frobenius, monodromy and filtrations, the invariant functors `D_cris`, `D_st`, `D_dR` with coefficient-field actions, the regularity/comparison-map criterion for de Rham objects, and the fundamental exact sequence `0 → ℚ_p → B_cris^{φ=1} → B_dR/Fil⁰ → 0`. SmoothRepresentationsOfLocalGroups SR.5.2, “Shared raw Weil–Deligne parameters”, supplies the common `(V,r,N)` carrier, its operations and Frobenius semisimplification, with arithmetic Frobenius convention. Section `F`.6 constructs the finite-field continuous-cohomology comparison and the de Rham-to-Weil–Deligne realization on these objects; it does not define new period rings or another Weil–Deligne carrier.

### ClassicalArithmeticCompletion: local constants and completed finite-image Artin functions

Use the on-main ClassicalArithmeticCompletion “Local constants and Artin completion” contract, with its conductor, Frobenius, additive-character and self-dual-measure conventions. Its arithmetic owner is ArithmeticGaloisRepresentations §2.7 (`finite-order-hecke-functional-equation`, `local-constant-gauss-sum`, `root-number-product-formula` and `epsilonWeil`); the Fröhlich–Taylor adapters remain ClassicalArithmeticCompletion §§7.13, 7.30. This roadmap constructs determinant-line comparisons, not another functional equation or local-constant theory.

**Comparison.** Construct `finiteHeckeArtinComparison`: for every number field, finite-order Hecke character with its class-field-theory Galois character, and finite deleted set containing the ramified primes, identify their Euler products on `Re(s)>1` prime by prime and define the continued Hecke function by the supplied finite-image Artin function. Prove uniqueness of the meromorphic continuation, conjugation of Euler coefficients, deleted-factor compatibility and induction using the same primes above the deleted set. For the trivial character before deleting Euler factors construct `dedekindZeta_complexGerm`: the continued function agrees on `Re(s)>1` with Mathlib’s `NumberField.dedekindZeta`; its residue at `1` is `NumberField.dedekindZeta_residue`, by the pinned real right-hand limit and the meromorphic simple-pole statement. Nontrivial finite-order characters are holomorphic at `1`. Use these germs for the complex leading coefficients in Layer 7. Artin values at negative integers are the adapters of §6.1; the Deligne–Ribet rationality and distributions come from IntegralIwasawaTheory §§6.0–6.3.

Source: the on-main local-constant contract, Deligne (1973), §3.12(A)–(D), Theorem 4.1 and §8.12; ClassFieldTheory’s Frobenius/reciprocity compatibility; Mathlib `NumberTheory/NumberField/DedekindZeta.lean`, `tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

**Checks.**

- For the trivial character over `ℚ`, the residue is `1`; removing `q` multiplies it by `1−q⁻¹`.
- A character ramified at `q` has zero inertia invariants and local Euler factor `1`; an unramified rank-one character has factor `(1−χ(Frob_q)q^{−s})⁻¹`.
- For `K/F`, the induced character’s factors are indexed over `F` and those of the original character over `K`, with the deleted set upstairs consisting of primes above the downstairs set.
- A primitive nontrivial Dirichlet character is regular at `1`, unlike the trivial one; the same pole convention cannot be assigned to every character.

*Needs:* ClassicalArithmeticCompletion’s on-main local-constant and Artin-completion contract; ClassFieldTheory Layers 10–13; GlobalNumberFields Hecke-character carriers; Mathlib Dedekind zeta and meromorphic germs.

## How to read the build

Layer 0 makes the completed group algebra of a compact `p`-adic Lie group usable: coordinates, `p`-valuations, finite-quotient radical formulas, integral filtrations and homological dimension, together with the diagonal twist and group homology that later layers need. Layer 1 proves that the canonical set `S` is an Ore set and builds the localizations and torsion categories. Layer 2 builds the determinant of perfect complexes, the relative `K`-theory of the localization, its boundary and characteristic elements. Layer 3 evaluates `K₁`-classes at representations, computes Euler characteristics and controls the integral and reduced-norm ambiguities. Layer 4 constructs the arithmetic modules and complexes; Layer 5 states the main conjectures and their normalizations. Layer 6 proves the totally real main conjecture and records the neighbouring theorems in their own hypotheses. Layer 7 builds leading terms by Bockstein descent and the interpolation formulas, and develops noncommutative Fitting invariants. Build §F.0 before Layer 0. Within each layer use subsection order except for the explicit Layer 0 order below; a *Needs:* line names the earlier subsections and the outside declarations or roadmap layers each one uses.

## Layer 0: Uniform groups and Iwasawa homological foundations

This layer builds constant lower-`p`-series indices, the analytic structure of the group model, ordered coordinates, finite-rank `p`-valuations and Iwasawa series, finite-quotient radical formulas, the integral maximal-ideal grading under an extra commutator condition, homological dimension beyond uniform groups, exterior cohomology, diagonal twists and the rational and twisted comparisons of compact group homology. The integral maximal-ideal filtration needs the extra commutator condition of Worked examples, example 3. Declarations live in `TauCeti.NoncommIwasawa` (modules `TauCeti/NumberTheory/NoncommIwasawa/AnalyticGroup` and `.../Layer0`).

<a id="ne0-uniform-pro-p-group"></a>
### 0.1 Constant lower-`p`-series indices

**Theorem.** For a finitely generated pro-`p` group `U`, the uniform predicate defined below is equivalent to powerfulness together with constancy of the successive lower-`p`-series indices `|P_i:P_(i+1)|`. Its dimension `d` is its minimal number of topological generators; `|U:U^p|=p^d` and every successive index equals `p^d`. This identifies the lower-series and torsion-free conventions for uniformity.

See Ardakov–Brown, §2.3, pp. 3–4 (arXiv v1): Powerful, then uniform `=` powerful, finitely generated and `|G : P₂| = |P_i : P_{i+1}|`. Calegari–Dimitrov–Tang, Lemmas 4.5.6 and 4.5.9, pp. 662–663: Powerful torsion-free congruence groups are the groups on which Lazard cohomology is applied; the 2-adic level must be 4. The uniform convention and open-uniform theorem are specified in §§0.1–0.2.

The hypotheses are as follows. `p` is prime; `U` is a Hausdorff compact pro-`p` group.

*Construction.*

1. Import the closed lower `p`-series and `p`-adic powers from ProfiniteArithmetic, with `P_i=λ_(i−1)`.
2. Compare torsion-freeness with constancy of the indices by the uniform-group criterion that Ardakov–Brown §2.3 quote from Dixon–du Sautoy–Mann–Segal, *Analytic pro-`p` groups*, Chapter 4; the proof of the nontrivial direction is part of this target.

Prove `IsUniform.dim` (the unique `d` with `|U:P₂|=p^d`), `IsUniform.lowerPSeries_index` (every successive index is `p^d`), and `IsUniform.iff_constantIndex` (the equivalence above). Define `IsPowerful` by the closed commutator containment and `IsUniform` by powerfulness, topological finite generation and torsion-freeness; use the supplied closed power subgroup operations. Their API includes invariance under topological group isomorphism, the trivial group, finite products and the canonical power subgroups `U^{pⁿ}` of a uniform group. All uses of uniformity below retain the fourth-power condition at 2.

**Checks.**

- `isUniform_padicInt_pow`: `ℤ_p^d` is uniform of dimension `d`.
- `not_isUniform_zmod`: `ℤ/p` is not uniform although it is powerful.
- `isUniform_trivial`: The trivial group is uniform of dimension 0 (degenerate case).
- The first congruence subgroup `Γ₁(GL_d(ℤ_p)) = ker(GL_d(ℤ_p) → GL_d(𝔽_p))` is uniform of dimension `d²` for odd `p`; at `p = 2` the level-4 subgroup is needed.
- `ℤ/p` is powerful but not uniform: its lower `p`-series indices are `p, 1`.
- For odd `p` the nonabelian Heisenberg group over `𝔽_p` has exponent `p` and nontrivial commutator subgroup, so it is not powerful. At 2 the dihedral group of order eight has commutator subgroup contained in its squares but not in its fourth powers; the square condition would give the wrong predicate.
- Uniformity need not pass to every open subgroup: at odd `p` take a uniform three-dimensional Heisenberg group with central `c` and `[a,b]=c^p`. The open subgroup generated by `a,b,c^p` has commutator `c^p` outside its `p`-th powers, so it is not powerful. The canonical power subgroups `U^{pⁿ}` remain uniform.

*Needs:* Tau Ceti `TauCeti.IsProP`.

<a id="ne0-compact-padic-analytic-group"></a>
### 0.2 Compact `p`-adic analytic groups

**Definition.** The group-side model of a compact `p`-adic analytic group is a profinite `G` containing an open normal uniform pro-`p` subgroup `U`. Its dimension is `dim U`, independent of `U`. Prove that this model is equivalent to a compatible `ℚ_p`-analytic group structure: an open uniform `U` carries the `p`-valuation of §0.7, which has finite rank, and a finite-rank `p`-valued group carries a unique compatible analytic structure of dimension equal to its rank (Schneider Theorem 29.8); conversely a compact `ℚ_p`-analytic group has an open normal uniform subgroup (§§0.1–0.2). The group-side predicates of this roadmap never require the analytic structure to be chosen.

See Ardakov–Brown, §2.1, p. 2 (arXiv v1): Lazard's characterisation. Ardakov–Brown, §2.3, p. 4 (arXiv v1): The characterisation used as the definition. Schneider, *`p`-Adic Lie Groups*, Theorem 27.1, pp. 192–194; Theorem 29.8, pp. 206–208: Small analytic groups acquire saturated valuations; a finite-rank valued group acquires a unique compatible analytic structure. The open-uniform theorem is the target of this subsection, with the `p=2` convention.

The hypotheses are as follows. The group-theoretic characterization is the definition. Prove `analytic_exists_open_uniform`: every compact `ℚ_p`-analytic group has an open normal torsion-free uniform pro-`p` subgroup, with the fourth-power convention at 2 (Schneider, Theorem 27.1; Ardakov–Brown §2.3). The converse, a compatible analytic structure on the group model, is the target `IsCompactPAdicAnalytic.analyticStructure`, stated and proved at the end of §0.7 once `p`-valuations are available: the explicit valuation of §0.7 on an open uniform `U`, Schneider Theorem 29.8 for `U`, and translation by coset representatives for `G`, with `dim G = dim U` and independence of `U` by commensurability (two open uniform subgroups share an open uniform subgroup, whose index computes both dimensions).

*Construction.*

1. Package: profinite (compact, Hausdorff, totally disconnected) topological group with `∃ U` open normal, pro-`p` and uniform.
2. Closure properties used later: open subgroups, closed normal subgroups and quotients by closed normal subgroups of compact `p`-adic analytic groups are compact `p`-adic analytic (Ardakov–Brown §2.1, citing Dixon–du Sautoy–Mann–Segal).

API: `IsCompactPAdicAnalytic` (Profinite with an open normal uniform pro-`p` subgroup); `IsCompactPAdicAnalytic.dim` (`dim U`, independent of `U`); `IsCompactPAdicAnalytic.analyticStructure` (the compatible `ℚ_p`-analytic structure, of dimension `dim G`); `IsCompactPAdicAnalytic.of_open` (Open subgroups inherit the property); `IsCompactPAdicAnalytic.quotient` (Quotients by closed normal subgroups inherit it); `IsCompactPAdicAnalytic.exists_open_proP` (An open normal pro-`p` subgroup exists).

**Checks.**

- `isCompactPAdicAnalytic_finite`: A finite discrete group is compact `p`-adic analytic `(U = 1)`.
- `isCompactPAdicAnalytic_padicInt`: `ℤ_p` is compact `p`-adic analytic of dimension 1.
- `not_isCompactPAdicAnalytic_prod`: `∏_{n∈ℕ} ℤ/p` is pro-`p` but not of finite rank, hence not analytic.
- Finite groups, `ℤ_p^d ×` (finite), `GL_d(ℤ_p), SL_d(ℤ_p)` and their congruence subgroups are examples.
- 'No element of order `p'`, 'torsion-free' and 'pro-`p'` are different hypotheses: `ℤ_p × ℤ/ℓ` for `ℓ ≠ p` has no element of order `p` but is not pro-`p`, and `ℤ_p × ℤ/p` is pro-`p` with `p`-torsion.

*Needs:* [0.1](#ne0-uniform-pro-p-group) (Constant lower-`p`-series indices); §§0.1–0.2; Mathlib `OpenNormalSubgroup` and `p`-adic manifolds; Tau Ceti `TauCeti.IsProP`.

<a id="ne0-iwasawa-free-over-open-subgroup"></a>
### 0.3 Completed group algebras are free over open subgroups

**Lemma.** Let `G` be profinite and `H′ ≤ H` closed subgroups with `H′` open in `H`. Then `Λ(H)` is a free left (and right) `Λ(H′)`-module of rank `[H : H′]`, with basis any set of right (resp. left) coset representatives; likewise `Ω(H)` over `Ω(H′)`. If `H′` is open normal in `H, Λ(H) ≅ Λ(H′) ∗ (H/H′)` is a crossed product. Consequently a `Λ(H)`-module is finitely generated over `Λ(H)` iff it is finitely generated over `Λ(H′)`.

When `H` has a countable quotient tower, the supplied finite free coefficient comparison `O ⊗_{ℤ_p} Λ(H) ≅ O[[H]]` commutes with the algebra map induced by `H′ ↪ H` and sends the coset basis to the same group elements. Thus the same freeness and finite-generation assertions hold over `O`. For every finite field `𝔽/𝔽_p` the analogous map `𝔽 ⊗_{𝔽_p} Ω(H) ≅ 𝔽[[H]]` has these compatibilities, without a countability restriction. The subgroup square concerns the covariant algebra map and restriction of scalars along it; it does not assert pullback of an arbitrary measure to a closed subset.

See Lazard, Chap. II, (2.2.7), p. 62: Lazard: coset representatives form a basis of `Λ(G)` over `Λ(U)`. CFKSV, §2, p. 166: CFKSV's use for `H′` open in `H`. Ardakov–Brown, §2.2, p. 3 (arXiv v1): The crossed-product form for open normal subgroups.

The hypotheses are as follows. `Λ(−) = ℤ_p⟦−⟧` and `Ω(−) = 𝔽_p⟦−⟧` are Tau Ceti's completed group algebras (ProfiniteProPGroups, Layer 9). Finite generation means algebraic finite generation; a choice of representatives also gives a topological finite direct sum. For `O`-coefficients the same statements hold for `Λ_O` and `Ω_k` by the coefficient extension of PadicMeasuresIwasawaAlgebras §1.7; the `mod-p` extension `k ⊗ 𝔽_p[[H]] ≅ k[[H]]` and the commuting squares for restriction to `H′` and for change of coefficients are proved here levelwise on the finite group algebras.

*Proof.*

1. Compute `Λ(H)` as `lim ℤ_p[H/V]` over open normal `V ≤ H′` of `H`; at each level `ℤ_p[H/V]` is free over `ℤ_p[H′/V]` on coset representatives; the bases are compatible, so the limit is free on the same set.
2. Finite generation transfers because `Λ(H)` is finite free over `Λ(H′)`.
3. At a finite quotient, coefficient extension sends `a ⊗ [h]` to a`[h]` and commutes with every subgroup and quotient map. For finite free `O` use the supplied comparison, whose Dirac formula identifies this map at every quotient; the finite coset decompositions then give the asserted squares. For `𝔽` choose a finite `𝔽_p`-basis: tensoring is a finite direct sum, so it commutes with the products and kernels defining the inverse limit. The quotient maps determine multiplication and show that the result is independent of the coefficient basis. The same finite-basis argument proves compatibility with a further finite free coefficient extension.

API: `openSubgroupBasis` (the coset-representative basis, left and right), `rank_openSubgroup` (rank `[H : H′]`), `crossedProduct_of_normal` (the section-dependent crossed-product comparison for `H′` normal), `coefficientExtension_restrict` (the restriction and coefficient-change squares commute).

**Checks.**

- For `H = H′` the basis has one element and both extension maps are identities.
- For `H=ℤ_p, H′=pℤ_p` and `O=ℤ_p[π]` with `π²=p`, the basis is `1,γ,…,γ^(p−1)` over `O[[H′]]`, just as for unramified `O`. Ramification changes neither the index nor the group elements in this basis. For `𝔽=𝔽_(p²)` the same basis survives residual coefficient extension, including `p=2`.
- For `H = ℤ_p` and `H′ = pℤ_p`, the basis `1, γ, …, γ^(p−1)` has rank `p`; left and right bases agree in this abelian case.
- The basis is a set of coset representatives, independent of the level `V`.
- For `p=5, G=S₃×Z₅` and `U=Z₅, Λ(G)` is free of rank 6 over `Λ(U)`. Its `Γ`-augmentation quotient is `Z₅[S₃]`, where the basis products (12)(123) and (123)(12) differ. Commutative power series cannot replace this group ring.

*Needs:* Tau Ceti's completed group algebra and finite quotient projections; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7 (`completedGroupAlgebraBaseChange`, `_tmul_dirac`, `_mul`).

<a id="ne0-iwasawa-local-iff-pro-p"></a>
### 0.4 Finite-quotient Jacobson radicals and semilocality

**Theorem.** For compact `p`-adic analytic `G` and an open normal pro-`p` subgroup `U`, let `q:Λ_O(G)→k[G/U]` be reduction modulo `ϖ` and quotient. Then `J(Λ_O(G))=q⁻¹(J(k[G/U]))`. The corresponding quotient `Ω_k(G)→k[G/U]` has the same radical-preimage formula. Consequently both completed algebras are semilocal, with semisimple quotient that of `k[G/U]`, and they are local exactly when `G` is pro-`p`. Prove `iwasawa_isLocal_iff_pro_p` from the radical formula; in the pro-`p` case the maximal ideal is generated topologically by `ϖ` and the augmentation ideal, with residue field `k`.

See Lazard, Chap. II, (2.2.2), p. 59: Lazard II.2.2.2. CFKSV, §2, p. 166: The maximal ideal as CFKSV use it. Ardakov–Brown, §4.1, Theorem (2), p. 9 (arXiv v1): The equivalence. The geometric-series argument in their §3.1 needs a zero constant coefficient (correction `E39`); the theorem is unaffected. The locality consequence is `iwasawa_isLocal_iff_pro_p` here.

The hypotheses are as follows. `G` compact `p`-adic analytic; `U` open normal and pro-`p`.

*Proof.*

1. The closed two-sided ideal generated by `p` and `u−1 (u∈U)` lies in `J(Λ(G))`. At every finite quotient its residual image is generated by the augmentation ideal of a finite normal `p`-subgroup and is nilpotent. The same argument without `p` applies to `Ω(G)`. For a central `z` of order `p`, the identity `(z−1)^p=0` in characteristic `p` starts the nilpotence induction (`of_sub_one_pow_char` in Suggested.lean, which needs only `z^p = 1`).
2. For a surjection with kernel contained in the Jacobson radical, the radical is the preimage of the quotient radical. Apply this to `q` and to its residual analogue.
3. The quotient `𝔽_p[G/U]` is finite-dimensional, hence artinian and semilocal; its semisimple quotient identifies the semisimple quotient of each completed algebra.

**Checks.**

- For `G = 1, Λ_O(G) = O` is local and `Ω_k(G) = k` is a field.
- For `G = C_p, k[G]` has radical `(g − 1)` with `(g − 1)^p = 0` and residue field `k`; locality does not imply finite global dimension (§0.11).
- For `p` odd and `G = C₂, O[C₂] ≅ O × O` has two maximal ideals and is semilocal but not local.
- `Λ(ℤ/ℓ) = ℤ_p[ℤ/ℓ]` for a prime `ℓ ≠ p` is a product of local rings and is not local: `(1/ℓ)Σ_{g} g` is a nontrivial idempotent.
- `Λ(ℤ_p) ≅ ℤ_p[[T]]` is local with maximal ideal `(p, T)`, the kernel of reduction of the augmentation.
- In `ℤ_p[C_p]` the element `σ−1` is not nilpotent (the ring embeds in `ℚ_p×ℚ_p(ζ_p)`), whereas `(σ−1)^p=0` in `𝔽_p[C_p]`; the nilpotence step uses characteristic `p`.

*Needs:* TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7; [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); Mathlib `IsLocalRing`; Tau Ceti `TauCeti.IsProP`.

<a id="ne0-zariskian-noetherian"></a>
### 0.5 Complete filtrations with noetherian graded ring

**Lemma.** For a complete separated nonnegative adic filtration with `F¹R⊆Jac(R)` and left/`right` noetherian associated graded ring, the Rees filtration is Zariskian and `R` is left/`right` noetherian. If `gr R` is a domain, `R` is a domain. If every finitely generated graded left `gr R`-module has graded projective dimension at most `n` (for instance if `gr R` has left global dimension `n`), then every finitely generated left `R`-module has projective dimension at most `n`, so the left global dimension of `R` is at most `n`; the same holds on the right. For Auslander regularity require `gr R` to be Auslander regular and the following closure condition: for every finite family `u₁,…,u_s∈R` and integers `m₁,…,m_s`, both `Σ_i F^(m_i)R·u_i` and `Σ_i u_i·F^(m_i)R` are closed. No Auslander conclusion follows from graded noetherianity or finite graded global dimension alone.

See Schneider–Teitelbaum, *Algebras of `p`-adic distributions and admissible representations*, Proposition 1.1, pp. 4–5, and Lemma 1.4, p. 6 (arXiv v1), for complete quasi-integral filtrations, noetherian lifting and strict ideal generators. The integer-indexed filtration here is quasi-integral. Venjakob 2002, Definition 3.19, Lemma 3.20 and Theorem 3.21, pp. 16–17, give the closure condition and the Auslander-regular transfer with equality of grades; Venjakob refers to Björk, *Filtered Noetherian Rings* (1987), Theorems 4.1 and 4.3, and *The Auslander condition on Noetherian rings* (1989), Theorem 3.9, for the proof. The numerical bound and the grade comparison are proved below from strict filtered free resolutions (`filtered_gldim_le`, `filtered_grade_ge`), so neither Björk text is needed as a locator.

The hypotheses are as follows. Complete separated descending adic filtration, with its usual exhaustive extension to integer degrees; `F¹R⊆Jac(R)`. Associated graded ring noetherian on both sides; homological conclusions require the respective graded hypotheses.

*Proof.*

1. For a left ideal `J`, lift homogeneous generators of `gr J`. Cancel the lowest symbol of any `x∈J` using these lifts and repeat on the error in strictly higher filtration. For each of the finitely many generators the accumulated coefficients converge by completeness; their limits express `x` as a finite `R`-linear combination of the chosen lifts. Apply the same argument to `R^op` for right ideals. Strict ideal generators are the statement of Schneider–Teitelbaum Lemma 1.4. The same argument applies to a submodule of a finitely generated filtered free module with shifted filtration. Hence such submodules are closed, and a finitely generated module with the image filtration of a filtered free module (a good filtration) is complete and separated. The Rees and Artin–Rees comparisons are a separate filtered-algebra consequence, not an inference that an arbitrary dense ideal is closed.
2. If `x,y≠0`, separatedness gives finite initial degrees. Their nonzero initial symbols have nonzero product when `gr R` is a domain; hence `xy≠0`. No filtered primeness assertion is needed.
3. `filtered_gldim_le`. Let `M` be finitely generated with a good filtration, so `gr M` is finitely generated over `gr R`. `(a)` Strict lifting. Lift homogeneous generators of `gr M` to `M` and let `F₀` be the filtered free module on them with the matching shifts. The map `F₀→M` is strict and surjective. Its kernel `K₁`, with the induced filtration, is closed and has `gr K₁=ker(gr F₀→gr M)`, because a strict surjection has exact associated graded sequence. Repeat with `K₁`. After `n` steps this gives a strict filtered free resolution `F_(n−1)→…→F₀→M` whose associated graded complex is a graded free resolution of `gr M`, and `gr K_n` is the `n`-th graded syzygy. `(b) gr K_n` is graded projective. A graded module that is projective as an ungraded module is graded projective: keep only the degree-zero component of an ungraded splitting of a graded free cover. Schanuel's lemma in the graded category and `pd(gr M)≤n` then give this. `(c)` A complete separated module with projective symbol is projective. Take a filtered free `F` on lifts of homogeneous generators of `gr K_n`, with strict surjection `F→K_n` and kernel `N`. Then `gr N` is a graded direct summand of `gr F`; let `e` be the degree-zero graded idempotent of `gr F` with kernel `gr N`. The filtered endomorphisms of `F` of degree `≥0` form a ring, complete for the ideals of endomorphisms of degree `≥k`, whose degree-zero symbols are the degree-zero graded endomorphisms of `gr F`. Lift `e` and refine the lift by `x↦3x²−2x³`; if `x²−x` has degree `≥k`, the new error has degree `≥2k`, so the iterates converge to a filtered idempotent `E` with symbol `e`. The composite `EF⊆F→K_n` has bijective associated graded map between complete separated modules, so it is an isomorphism. Hence `K_n` is a direct summand of `F`, and `pd M≤n`. `(d) R` is noetherian, so its global dimension is the supremum of the projective dimensions of finitely generated modules.
4. `filtered_grade_ge`. Filter `Hom_R(F_•,R)` by the shifted degrees of the resolution of step 3. Its associated graded complex is `Hom_(gr R)(gr F_•,gr R)`. The filtration is complete and exhaustive in each degree, and the images of the differentials, finitely generated submodules of filtered free modules, are closed by step 1; so the associated spectral sequence converges and the induced filtration on `Ext` is separated. Hence `gr Ext^i_R(M,R)`, for the filtration induced from this complex, is a subquotient of `Ext^i_(gr R)(gr M,gr R)`. In particular `Ext^i_R(M,R)=0` when `Ext^i_(gr R)(gr M,gr R)=0`, so `j_R(M)≥j_(gr R)(gr M)`. For the Auslander clause, let `N⊆Ext^i_R(M,R)`. Under Venjakob's closure condition (Theorem 3.21) the induced filtration on `N` is good, and `gr N` is a subquotient of `Ext^i` over `gr R`. That ring is Auslander–Gorenstein, so grade is exact on short exact sequences of finitely generated modules, and every subquotient of `Ext^i_(gr R)(gr M,gr R)` has grade `≥i`. Hence `j_R(N)≥j_(gr R)(gr N)≥i`. In the compact Iwasawa application the closure condition is Lemma 3.20: each finite weighted sum is a continuous image of a product of compact filtration pieces, hence closed.

API: `filtered_noetherian` (step 1); `filtered_domain` (step 2); `filtered_gldim_le` (`gl.dim R≤n` when every finitely generated graded `gr R`-module has projective dimension `≤n`); `filtered_grade_ge` (`j_R(M)≥j_(gr R)(gr M)` for good filtrations; with the closure condition and Auslander regular `gr R, R` is Auslander regular).

**Checks.**

- Both sides are stated; Iwasawa algebras are noncommutative.
- `ℤ_p[[T]]` with the `(p, T)`-adic filtration has `gr = 𝔽_p[P, T]`, a noetherian domain of global dimension 2. The lemma gives a noetherian domain of global dimension `≤2`. Equality holds because `Tor₂(𝔽_p,𝔽_p)≠0` (Koszul complex on `p,T`); §0.11 proves the same value for the uniform group `ℤ_p`.
- For the trivial group, the coefficient filtration has `gr ℤ_p=𝔽_p[P]`; for a field with the discrete filtration it has `gr k=k`. The bounds are respectively 1 and 0, and both are attained, so the coefficient direction cannot be omitted in the integral case.
- The filtration must be chosen with care. For `O` ramified of degree `e ≥ 2` with uniformizer `ϖ`, the `p`-adic filtration has `gr O = k[ϖ̄]/(ϖ̄^e)[P]`, which has infinite global dimension, so the lemma gives no bound although `O` has global dimension 1. The `ϖ`-adic filtration has `gr O = k[Π]` and gives the sharp bound 1. This is why §0.8 keeps the coefficient symbol `Π` of degree `1/e`.
- A compactness argument for closure requires compact filtration pieces and continuous multiplication. Completeness alone is not compactness. Layer 1 uses only noetherianity; the Auslander clause requires its additional hypotheses.

*Needs:* Mathlib `IsNoetherianRing`.

<a id="ne0-ordered-uniform-coordinates"></a>
### 0.6 Ordered coordinates of a uniform group

**Construction.** For uniform `U` of dimension `d` and an ordered minimal generating set `(u₁,…,u_d)`, the map `c:ℤ_p^d→U` given by `c(x)=u₁^{x₁}⋯u_d^{x_d}` is a homeomorphism of spaces. Coordinate order is fixed. For every `n≥0` it identifies `p^n ℤ_p^d` with `U^{p^n}`, and the resulting coordinate residues parameterize `U/U^{p^n}`; `c` is a group homomorphism only in the abelian case.

See Schneider, *`p`-Adic Lie Groups*, Definition of ordered basis, p. 182; Proposition 26.5, pp. 184–185; Corollary 26.12, p. 188: Proves the coordinate and graded-basis criteria and the coordinate description of power subgroups; supplies an accessible alternative to DDMS Theorem 4.9. Fu, §4, pp. 12–13, equations (10)–(13): Uses ordered group coordinates before passing to ordered Iwasawa series.

The hypotheses are as follows. `p` prime; `U` uniform; an ordered minimal generating set is selected.

*Construction.*

1. Use pro-`p p`-adic powers from ProfiniteArithmetic.
2. Successive approximation along the lower `p`-series gives existence and uniqueness of ordered digits; compactness and Hausdorffness give the homeomorphism.
3. Compare with the valuation-basis criterion of Schneider Proposition 26.5 and the power-subgroup calculation in Corollary 26.12. That every minimal generating set is an ordered basis uses the uniform-group criterion of §0.1.
4. The coordinates are those of an ordered basis of the `p`-valuation of §0.7, for odd `p` with weight 1 and at `p=2` with weight 2.

API: `UniformCoordinates.toHomeomorph` (The ordered product `c` is bundled with its continuous inverse); `UniformCoordinates.eval` (`c(x)` is the ordered product of `u_i^{x_i}, c(0)=1` and `c(e_i)=u_i`); `UniformCoordinates.powerSubgroup` (`c(p^n ℤ_p^d)=U^{p^n}`; `|U:U^{p^n}|=p^{nd}`); `UniformCoordinates.changeBasis` (Two ordered bases give the transition homeomorphism `c₂⁻¹∘c₁`, with identity and composition laws).

**Checks.**

- `ordered_uniform_coordinates_1`: For `U=ℤ_p^2` with its standard additive generators, `c` is the identity and the level-`n` quotient has `p^{2n}` elements.
- `ordered_uniform_coordinates_2`: For `U=1`, the empty product identifies `ℤ_p^0` with the one-point group.
- `ordered_uniform_coordinates_3`: In a nonabelian uniform semidirect product, `c(x+y)` differs from `c(x)c(y)` for suitable `x,y`; a group-equivalence interpretation fails.

*Needs:* [0.1](#ne0-uniform-pro-p-group) (Constant lower-`p`-series indices).

<a id="ne0-p-valuation"></a>
### 0.7 Finite-rank `p`-valuations and the explicit valuation of a uniform group

**Definition.** A `p`-valuation on a group `U` is a function `ω : U → (1/(p−1), ∞]` with `ω(x) = ∞` iff `x = 1, ω(xy⁻¹) ≥ min(ω(x), ω(y)), ω([x,y]) ≥ ω(x) + ω(y)` and `ω(x^p) = ω(x) + 1`; its filtration `U_ν = {x : ω(x) ≥ ν}` is required to define the given complete topology. The graded group `gr U = ⊕_ν U_ν/U_ν⁺` is a graded Lie algebra over `𝔽_p[P]`, with `P` raising degree by 1 through `x ↦ x^p`; `(U, ω)` has finite rank `d` if `gr U` is free of rank `d` over `𝔽_p[P]`. An ordered basis is a sequence `(g₁, …, g_d)` such that `x ↦ g₁^{x₁}⋯g_d^{x_d}` is a homeomorphism `ℤ_p^d → U` with `ω(∏ g_i^{x_i}) = min_i(ω(g_i) + v_p(x_i))`. `(U, ω)` is saturated if every `x` with `ω(x) > p/(p−1)` is a `p`-th power of some `y` with `ω(y) = ω(x) − 1`. Prove: a complete `p`-valued group of finite rank has an ordered basis; every `p`-valued group of finite rank embeds into a saturated one (its `p`-saturation) with the universal property among morphisms to complete saturated `p`-valued groups; and a group with an element of order `p` admits no `p`-valuation.

For a uniform `U` of dimension `d` with the ordered coordinate homeomorphism `c` of §0.6, put `c₀ = 1` for odd `p` and `c₀ = 2` for `p = 2`. For `x ≠ 1` write `c⁻¹(x) = (x₁, …, x_d)` and define `ω_U(x) = c₀ + min_i v_p(x_i)`; put `ω_U(1) = ∞`. Then `ω_U` is a `p`-valuation of finite rank `d` defining the original topology, the ordered generators form an ordered basis, and `gr U` is free over `𝔽_p[P]` on their symbols, each in degree `c₀`. ProfiniteArithmetic supplies only the lower `p`-series and `p`-adic powers; no `p`-valuation theory is supplied by the named suppliers, so the generic notion is owned here. As a consequence, prove `IsCompactPAdicAnalytic.analyticStructure` for the group model of §0.2: an open uniform `U` with `ω_U` is a finite-rank `p`-valued group, hence carries a unique compatible `ℚ_p`-analytic structure of dimension `d` (Schneider, Theorem 29.8, pp. 206–208), which translation by coset representatives extends to `G`.

See Lazard, Chap. III, (2.1.2), p. 81, and Chap. II, (1.2.10), for the `p`-valuation conventions; Schneider, *`p`-Adic Lie Groups*, §§23–26, especially Lemma 26.4, Proposition 26.5, Proposition 26.6 and Corollary 26.12, pp. 181–190, for ordered bases and saturation, and Theorem 27.1, pp. 192–194, for small analytic groups. Fu, §4, (15), p. 13, gives the odd-prime coordinate weight. The 2-adic offset follows from the fourth-power commutator estimate below.

The hypotheses are as follows. `p` prime; for the generic statements `U` is a complete topological group with the valuation topology; for `ω_U, U` is uniform with an ordered minimal generating set as in §0.6.

*Construction.*

1. Generic part: filtration subgroups `U_ν` are normal and `U_ν U_μ⁻¹ ⊆ U_min(ν,μ)`; the commutator and `p`-power axioms make `gr U` a mixed Lie algebra over `𝔽_p[P]`. Existence of ordered bases for complete finite-rank groups is successive approximation along the filtration (Schneider Proposition 26.5); the `p`-saturation adjoins `p`-th roots in valuation degrees above `p/(p−1)`, and its universal property follows from uniqueness of such roots in a saturated group (Schneider §26). An element `x ≠ 1` of order `p` would give `∞ = ω(x^p) = ω(x) + 1 < ∞`.
2. For `ω_U`, the coordinate homeomorphism and its power-subgroup formula identify `ω`-levels with lower-`p`-series terms.
3. Powerfulness gives the commutator bound: at odd `p`, one extra lower-series step supplies the two weights `1+1`; at `p=2` the fourth-power condition supplies the two weights `2+2`.
4. The strict bound `c₀>1/(p−1)`, the exact `p`-power increment, and completeness follow from the coordinate formula. Compare ordered symbols with the `𝔽_p[P]`-basis criterion of step 1.

API: `PValuation` (the axioms above, with the topology condition); `PValuation.filtration` (`U_ν`, with `U_ν U_μ⁻¹ ⊆ U_min(ν,μ)`); `PValuation.pow_p` (`ω(x^p) = ω(x) + 1`, hence no element of order `p`); `PValuation.commutator` `(ω([x,y]) ≥ ω(x) + ω(y))`; `PValuation.orderedBasis_iff` (ordered symbols form a free `𝔽_p[P]`-basis iff the minimum formula holds); `PValuation.exists_orderedBasis` (complete finite-rank groups have ordered bases); `PValuation.saturation` and `saturation_lift` (the `p`-saturation and its universal map); `UniformCoordinates.pValuation` `(ω_U)`; `UniformCoordinates.pValuation_apply` (its minimum formula); `UniformCoordinates.valuedBasis` (finite freeness of the associated graded module with the indicated generator degrees).

**Checks.**

- `p_valuation_1`: For additive `ℤ_p, ω(x)=1+v_p(x)` is valid at odd `p` and `ω(0)=∞`.
- `p_valuation_2`: At `p=2` the value `1+v₂(x)` fails the strict bound `ω > 1/(p−1) = 1` on a unit; `2+v₂(x)` works.
- `p_valuation_3`: A group with an element `x` of order `p` cannot carry such a valuation: the exact `p`-power identity would assign a finite value to 1.
- For `ℤ_p` at odd `p, ω = 1 + v_p` is saturated: an element of value at least `2 > p/(p−1)` is `p` times an element of value one less. With `ω = 2 + v_p` a unit has value `2 > p/(p−1)` but is not `p` times an element of `ℤ_p`, so `(ℤ_p, 2 + v_p)` is not saturated; its saturation is `(p⁻¹ℤ_p, 2 + v_p)`, isomorphic to `(ℤ_p, 1 + v_p)` through multiplication by `p`.
- For `U = 1` the rank is 0, the ordered basis is empty and `gr U = 0`.

*Needs:* [0.1](#ne0-uniform-pro-p-group) (Constant lower-`p`-series indices); [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); [0.6](#ne0-ordered-uniform-coordinates) (Ordered coordinates of a uniform group); TauCetiRoadmap ProfiniteArithmetic (lower `p`-series, `p`-adic powers); Mathlib `PadicInt`, `padicValNat`, topological groups.

<a id="ne0-ordered-iwasawa-series"></a>
### 0.8 Ordered Iwasawa series and rationalization

**Construction.** Let `U` be uniform with ordered generators and `O` a complete finite-free `ℤ_p` coefficient DVR. For `b_i=u_i−1`, ordered summation identifies `∏_(α∈N^d) O` with `O[[U]]` as topological `O`-modules: `(c_α)↦Σ c_α b₁^{α₁}⋯b_d^{α_d}`. The topology is the complete maximal-ideal topology. This is a power-series ring isomorphism when `U` is abelian; multiplication is ordered and noncommutative in general. With `K=Frac(O), K⊗_O O[[U]]` consists exactly of ordered `K`-coefficient series with a common bounded denominator, not all formal `K`-series.

See Schneider, *`p`-Adic Lie Groups*, §28, pp. 195–201, Theorem 28.3 and Corollaries 28.4–28.6: Establishes the ordered complete-module basis and its weighted associated graded ring. Fu, §4, pp. 12–13, ordered-series display preceding (14), and (15): Uses integral ordered series and their localization; the rational algebra is distinct from unrestricted formal `K`-series.

The hypotheses are as follows. `p` prime; `U` uniform of dimension `d`; `O` finite free over `ℤ_p` and complete. Schneider, opening of Chapter VI, p. 195, assumes that `p` is a prime element of `O`, allowing unramified coefficient extensions. Ordered series over ramified `O` use the finite-free coefficient comparison. The weighted graded-ring extension over ramified `O` is obtained by the filtered finite-free argument below; it is not asserted to be Schneider’s coefficient hypothesis.

*Construction.*

1. Use the supplied finite-quotient completion and the ordered coordinate basis.
2. Prove finite-level ordered monomials give the compatible bases; complete to obtain existence and uniqueness of all coefficient families.
3. Tensor the product by the field by inverting a single uniformizer: each element admits one common denominator, giving the bounded-denominator criterion. For ramified `O` use the finite-free completed coefficient comparison.
4. For the weighted ramified extension, let `O₀⊆O` be the maximal unramified coefficient ring and write `O=⊕_(0≤j<e) O₀π^j`. With `v(p)=1`, this basis is orthogonal: `v(Σ a_jπ^j)=min_j(v(a_j)+j/e)`, because distinct `j` have distinct fractional valuations. The same equality holds coefficient by coefficient in the ordered series basis. Thus the coefficient comparison is a strict filtered isomorphism from the direct sum of `e` copies of `O₀[[G]]`, shifted by `j/e`, to `O[[G]]`.
5. Write `p=uπ^e, κ=O/πO`, and `ū` for the residue of `u`. Taking symbols gives `gr O=κ[Π]`, deg `Π=1/e`, with `P↦ūΠ^e`. The natural multiplication map `gr O⊗_(κ[P])gr O₀[[G]]→gr O[[G]]` is an isomorphism: on the shifted bases of step 4 both sides have basis `Π^j, 0≤j<e`. Its multiplicativity follows from the actual coefficient extension and the leading relation for `π^e`; lower Eisenstein coefficients have higher valuation. Apply Schneider’s unramified comparison to `gr O₀[[G]]` to obtain `κ[Π]⊗_(𝔽_p[P])U(gr G)`.
6. The ordered homogeneous basis of `gr G` is free over `𝔽_p[P]`. Its enveloping algebra has the PBW filtration by word length, whose associated graded after coefficient extension is the polynomial ring `κ[Π,X₁,…,X_d]`. This ring is a domain, so the enveloping algebra after extension is a domain as well. When `gr G` is abelian, the weighted graded ring itself is that polynomial ring. The zero-group case is `gr O=κ[Π]`.

API: `IwasawaSeries.ofCoefficients` (Send a coefficient family to its convergent ordered sum); `IwasawaSeries.coeff` (Recover `c_α`; coefficient recovery and reconstruction are inverse continuous maps); `IwasawaSeries.coeff_basis` (The coefficient of `b^β` in `b^α` is `δ_(α,β)`); `IwasawaSeries.weightedGraded` (For every finite-rank `p`-valued `(G,ω)` with an ordered basis, Schneider Theorem 28.3, p. 199 gives `gr_ω O[[G]]≅gr O⊗_(𝔽_p[P])U(gr G)` when `p` is a uniformizer of `O`; Corollaries 28.5–28.6, pp. 200–201 give the domain and abelian polynomial consequences in that setting. For the ramified extension proved by the filtered coefficient argument above, for uniformizer `π`, residue field `κ=O/πO, e=v_π(p)`, and `p=uπ^e`, normalize `v(p)=1`. Then `gr O=κ[Π]`, deg `Π=1/e`, and the structural map sends `P` to `ūΠ^e`; the formula is `κ[Π]⊗_(𝔽_p[P])U(gr G)`. If `gr G` is abelian this is `κ[Π,X₁,…,X_d]`, not `(O/pO)[X₀,…,X_d]`. The ramified clause is a consequence of the strict filtered coefficient extension and PBW argument above, rather than a quotation of Schneider under different hypotheses); `IwasawaSeries.rational_iff_bounded` (`A K`-coefficient family is in `K⊗O[[U]]` iff its coefficient valuations are bounded below).

**Checks.**

- `ordered_iwasawa_series_1`: For `U=ℤ_p`, recover the supplied coordinate `γ↦1+T`, with `b^n` mapping to `T^n`.
- `ordered_iwasawa_series_2`: For `U=1` only the constant monomial remains; `O[[1]]=O` and rationalization is `K`.
- `ordered_iwasawa_series_3`: The family `c_n=π^(−n)` is a formal `K`-series but has no common bounded denominator, hence is excluded from `K⊗O[[ℤ_p]]`.
- `ordered_iwasawa_series_4`: For noncommuting `u₁,u₂, b₁b₂` and `b₂b₁` need not have the same coefficients; the module equivalence cannot silently be a commutative ring equivalence.
- `ordered_iwasawa_series_5`: For additive `ℤ_p^d` with `ω(x)=1+min v_p(x_i)` at odd `p` and unramified `O`, the graded ring is `(O/pO)[P,X₁,…,X_d]`. In the ramified target its coefficient variable is `Π`, the symbol of `π`, and the symbol of `p` is `ūΠ^e`. In particular `U=1` and `O=ℤ_p[π]` with `π²=p` give `gr O=𝔽_p[Π]`, a domain, while `O/pO` contains the nonzero nilpotent `π mod p`. A formula polynomial over `O/pO` fails this test.

*Needs:* [0.6](#ne0-ordered-uniform-coordinates) (Ordered coordinates of a uniform group); [0.7](#ne0-p-valuation) (Finite-rank `p`-valuations and the explicit valuation of a uniform group); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7; TauCetiRoadmap ProfiniteProPGroups, Layer 9.

<a id="ne0-uniform-graded-polynomial"></a>
### 0.9 Integral maximal-ideal grading under an extra commutator condition

**Theorem.** For uniform `U` of dimension `d` and `Λ(U)=ℤ_p[[U]]`, set `m=(p,u₁−1,…,u_d−1)` for ordered generators. If `[U,U]⊆U^{p²}` for odd `p`, or `[U,U]⊆U⁴` for `p=2`, then `gr_m Λ(U)≅𝔽_p[X₀,…,X_d]`. This integral maximal-ideal grading differs from the supplied residual augmentation grading: without the extra commutator hypothesis the integral polynomial claim is false. Weighted `p`-valuations handle general uniform groups.

See Ardakov–Brown, §3.1, Theorem, p. 5 (arXiv v1): The PBW theorem. Ardakov–Brown, §3.4, Theorem, p. 7 (arXiv v1): `gr_J Ω(G) ≅ 𝔽_p[X₁, …, X_d]`. Venjakob 2002, Theorem 3.22, pp. 17–18; Theorems 3.26 and 3.30, pp. 18–20: The integral polynomial filtration uses an extra-powerful subgroup; the `mod-p` result holds for uniform groups.

The hypotheses are as follows. `p` prime; `U` uniform with ordered generators; the extra commutator condition is required for the integral `m`-adic clause.

*Proof.*

1. Use the ordered series target to identify the coefficient filtration and augmentation generators.
2. The symbols of `p` and `u_i−1` generate the integral graded ring. The extra commutator condition puts their commutators above degree two.
3. For `Λ` use Venjakob Theorem 3.22 with the stated stronger commutator condition; otherwise use the enveloping-algebra description of Schneider Theorem 28.3, not an unweighted polynomial identification.

**Checks.**

- For `U=ℤ_p^d` obtain `d mod-p` variables and `d+1` integral variables.
- For odd `p`, the uniform semidirect product generated by `a,b` with `aba⁻¹=b^{1+p}` has `[a−1,b−1]` with leading term `p(b−1)`; its integral `m`-adic graded ring is not commutative.
- Passing to a sufficiently small open extra-powerful subgroup repairs the integral polynomial step.

*Needs:* [0.1](#ne0-uniform-pro-p-group) (Constant lower-`p`-series indices); [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality); Mathlib `MvPolynomial`; [0.8](#ne0-ordered-iwasawa-series) (Ordered Iwasawa series and rationalization).

<a id="supplier-completed-cohomology"></a>
<a id="ne-foundations-analytic-algebra"></a>
### `F`.1 Noetherian analytic algebras and the uniform `Ext` comparison

**Construction.** For the coefficient rings `O` and `k` of the Conventions and every compact `p`-adic analytic group `G`, prove `iwasawa_noetherian_left` and `iwasawa_noetherian_right` for `O[[G]]` and `k[[G]]`. No absence of `p`-torsion is required. For an open uniform subgroup `U`, use the complete augmentation filtration of `k[[U]]`, whose associated graded ring is `k[X₁,…,X_d]`. Lift noetherianity by §0.5. For `O[[U]]`, first use the central regular uniformizer and the separated complete coefficient filtration; alternatively descend from a sufficiently small subgroup satisfying the extra commutator condition of §0.9. In particular the unweighted integral polynomial assertion is used only with that extra condition. Pass to `G` by the left and right finite-coset bases of §0.3. Prove that every finite module has its canonical compact quotient topology, that linear maps between such modules are continuous, and that their kernels and images are closed. The finite free coefficient comparison of PadicMeasuresIwasawaAlgebras §1.7 includes ramified `O`; `p` is never silently substituted for its uniformizer. (Venjakob, Theorem 3.22 and the discussion after Theorem 3.30; Schneider–Teitelbaum, *Banach space representations and Iwasawa theory*, Proposition 3.1 and Lemmas 3.2–3.4.)

For uniform `U`, prove the two-sided Auslander `Ext` condition by the filtered-ring argument of §0.5 applied after an extra-powerful shrink, and transport it back by the finite-free Frobenius extension. Its assertion is the vanishing `Ext^j_{Rᵒᵖ}(N,R)=0` for every right submodule `N ⊆ Ext^i_R(M,R)` and `j<i`, for finite left `M`, together with the opposite-ring assertion. This is the uniform input to §0.10. The finite global dimensions and the resulting `iwasawa_auslanderRegular` are proved in §0.11, using the continuous-cohomology argument there; finite-free restriction by itself does not prove finite global dimension. (Venjakob, Definition 3.3, Theorems 3.26 and 3.30.)

Define `iwasawaGrade R M` to be the least degree of nonzero `Ext_R(M,R)`, valued in `ℕ∞` and equal to infinity for the zero module. Give the opposite-ring version and invariance under module isomorphism. For a finite `k[[U]]`-module `M`, prove `iwasawa_grade_coefficient`: `j_{O[[U]]}(M)=j_{k[[U]]}(M)+1`. For a finite `O[[U]]`-module `M` without uniformizer torsion, prove `iwasawa_grade_torsionFree` with the reduction sequence `0 → Ext^i(M,O[[U]])/ϖ → Ext^i(M/ϖM,k[[U]]) → Ext^{i+1}(M,O[[U]])[ϖ] → 0` and the grade equality `j_{O[[U]]}(M)=j_{k[[U]]}(M/ϖM)` by the separate purity argument. Prove `iwasawa_dimension_finiteIndex`: restriction along an open inclusion of compact analytic groups preserves grade, for either coefficient ring, by the Frobenius-extension `Ext` comparison. After §0.11 define canonical dimension by `gldim(R)−j_R(M)` for nonzero finite modules and assign the zero module dimension minus infinity. Include identity and composition for restriction and independence of the uniform open subgroup. (Venjakob, Theorem 3.26, Proposition 3.28 and Theorems 3.29–3.30; the coefficient shift is the change-of-rings argument for the central regular element `ϖ`.)

**Checks.**

- For `G=1`, the rings are `O` and `k`, and `j_O(k)=1` while `j_k(k)=0`; the integral shift cannot be discarded.
- For `G=ℤ_p`, the module `O[[T]]/(T)` has its compact quotient topology and is finite over the Iwasawa ring without being free over it. The zero module has grade infinity, rather than grade zero.
- For `M=(ϖ,T) ⊂ O[[T]]`, the degree-zero reduction map has cokernel `k`. An assertion of degreewise `Ext` isomorphisms in the torsion-free case fails this example.
- The same ideal `(ϖ,T)` has grade zero, as does its reduction modulo `ϖ`; unlike the zero module it has a nonzero map to the ring. Thus the minimum-nonzero-`Ext` definition distinguishes it from both zero and the residue module of positive grade.
- For a finite `p`-group `G`, noetherianity holds although its group algebra need not have finite global dimension. Restriction of the trivial `k[C_p]`-module to `k` does not preserve projective dimension.
- The semidirect-product example of §0.9 prevents using a commutative integral maximal-ideal grading for every uniform group; the residual grading and the smaller extra-powerful subgroup still prove the stated noetherianity.

*Needs:* §§0.1–0.9; PadicMeasuresIwasawaAlgebras §§1.7, 5.2; DerivedModuleAlgebra §1.`E`.0 for general-ring resolutions and `Ext`.

<a id="ne0-iwasawa-auslander-regularity"></a>
### 0.10 The two-sided Auslander condition beyond uniform groups

**Theorem.** For compact `p`-adic analytic `G` without `p`-torsion and `O` a finite extension ring of integers with residue field `k, Λ_O(G)=O[[G]]` and `Ω_k(G)=k[[G]]` satisfy the two-sided Auslander condition; we write `Λ` for either ring: for every finitely generated left `Λ`-module `M` and every right submodule `N⊆Ext^i_Λ(M,Λ), Ext^j_(Λ^op)(N,Λ)=0` for `j<i`, with the analogous opposite-ring statement. These hypotheses are the homological input required by Fu. The grade of a module killed by `ϖ` shifts by one between the two rings (§F.1, `iwasawa_grade_coefficient`, with its finite-index invariance); it is consumed, not restated.

See Venjakob 2002, Definition 3.3, p. 10; Theorems 3.26 and 3.30, pp. 18–20: States the two-sided `Ext` condition and proves it for integral Iwasawa algebras without `p`-torsion and `mod-p` uniform algebras. Fu, §6, pp. 22–23, proof of Theorem 1.4: Finite projective resolutions and dimension bounds are used in the homology argument. §F.1: Auslander regularity, grade and canonical dimension for uniform groups.

The hypotheses are as follows. `G` compact `p`-adic analytic; no element of order `p`. This extends the supplied uniform integral case to `G` that need not be uniform.

*Proof.*

1. For a torsion-free uniform open normal `U`, use the two-sided Auslander `Ext` condition of §F.1. Its filtered-ring proof uses an extra-powerful shrink at `p=2` and a central-uniformizer coefficient extension. The dimensions `d+1` and `d`, and hence `iwasawa_auslanderRegular`, are proved in §0.11.
2. Pass from `U` to `G` by the finite crossed-product `Ext` comparison in Venjakob Theorem 3.26. `Λ(G)` is free of rank `[G:U]` over `Λ(U)` on both sides (§0.3), so `Ext` over `Λ(G)` into `Λ(G)` agrees with `Ext` over `Λ(U)` into `Λ(U)` as `Λ(U)`-modules, and the two-sided `Ext` condition descends from `U`. §F.1 uses the same comparison for its finite-index grade statements.
3. This target proves the `Ext` condition. The following target supplies the finite-global-dimension step needed to conclude Auslander regularity, so no forward dependency is used here.

**Checks.**

- For `A=ℤ_p[[T]]` and `M=A/(T), Ext¹_A(M,A)=A/(T)`, while `Hom_A(A/(T),A)=0`, as the Auslander condition requires in degree `j=0<i=1`.
- For `i=0` the range `j<i` is empty; the condition makes no assertion that `Hom_A(M,A)` vanishes.
- The zero module gives zero `Ext` in every degree. Finite global dimension is established separately in §0.11.

*Needs:* [F.1](#ne-foundations-analytic-algebra) (the uniform Auslander `Ext` condition); [0.5](#ne0-zariskian-noetherian) (Complete filtrations with noetherian graded ring); [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups).

<a id="ne0-iwasawa-finite-global-dimension"></a>
Build §F.2 and §0.13 before §0.11. The order in this part of Layer 0 is §F.1, §0.10, §F.2, §0.13, §0.11, §0.12, §0.14, §0.15.

### 0.11 Finite global dimension without `p`-torsion

**Theorem.** Let `G` be compact `p`-adic analytic of dimension `d` with no element of order `p, O` the ring of integers of a finite extension of `ℚ_p` (ramified or not) with uniformizer `ϖ` and residue field `k`. Then `k[[G]]` has left and right global dimension `d`, and `O[[G]]` has left and right global dimension `d+1`; for `O=ℤ_p` this is `Λ(G)=ℤ_p[[G]]`. With the preceding two-sided `Ext` condition, `O[[G]]` and `k[[G]]` are Auslander regular. In particular every finitely generated `O[[G]]`-module has a resolution of length at most `d+1` by finitely generated projectives. No finite-global-dimension assertion is made for a group containing `p`-torsion.

See Venjakob 2002, §1.1, p. 5 (arXiv v1), and CFKSV, §3, p. 174: both state the equality `gl.dim Λ(G) = cd_p(G) + 1` for `G` without `p`-torsion and attribute it to Brumer (`A`. Brumer, *Pseudocompact algebras, profinite groups and class formations*, `J`. Algebra 4 (1966), 442–470). The proof below, `brumer_gldim`, is complete from the cited ingredients: the minimal-resolution criterion over the adic ring `O[[G]]`, the identification of `Ext` between finite modules with continuous cohomology, and Serre's theorem. Ribes–Zalesskii, Theorem 6.2.4 and Remark 6.2.5, p. 207: continuous cohomology with discrete coefficients is `Ext` over the completed group ring from the trivial module. Ribes–Zalesskii, Proposition 5.4.2`(a)`, p. 174: free profinite modules are projective in the profinite category. Ribes–Zalesskii, Propositions 7.1.1 and 7.1.4, pp. 251–`253: cd_p` is detected by `H^(n+1)` on simple `p`-primary modules. Ribes–Zalesskii, Theorem 7.3.7`(a)`, pp. 265–266: Serre's theorem, an open subgroup of a profinite group without subgroups of order `p` has the same cohomological `p`-dimension. Witte, *On a noncommutative Iwasawa main conjecture for varieties over finite fields*, arXiv:1004.2481v2, Definition 3.1, p. 6, and Proposition 3.2, pp. 6–`7: O[[G]]` is an adic ring (compact, semilocal, Jacobson radical `J` finitely generated and open, `O[[G]]=lim O[[G]]/J^n`). Venjakob 2002, Theorem 3.26, pp. 18–19, and Theorem 3.29, p. 19: Auslander regularity without `p`-torsion, and the rational dimension `d`.

The hypotheses are as follows. No element of order `p` is essential: `ℤ_p[ℤ/p]` has infinite global dimension. Noetherianity of `O[[G]]` is §F.1 together with §0.3.

*Proof.*

1. `cd_p(G)=d`. For an open uniform `U, cd_p(U)=d` (Lazard `V`.2.2.3; equivalently `H^d(U,𝔽_p)≠0` and `H^(d+1)(U,𝔽_p)=0`, the exterior computation recorded in §0.13, with Ribes–Zalesskii Corollary 7.1.6, p. 255, for pro-`p` groups). Serre's theorem gives `cd_p(G)=cd_p(U)`, because `G` has no subgroup of order `p`.
2. Minimal resolutions. Let `Λ` be `O[[G]]` or `k[[G]]`, with Jacobson radical `J`. `Λ` is noetherian and adic, `Λ/J` is a finite semisimple ring, and idempotents lift modulo `J` by `J`-adic completeness, so `Λ` is semiperfect and every finitely generated module `K` has a projective cover `P→K` with `P/JP≅K/JK`. If `Tor₁^Λ(Λ/J,K)=0`, the kernel `N` of the cover satisfies `N/JN=0`, so `N=0` by Nakayama and `K` is projective. By dimension shifting, `pd K≤n` if and only if `Tor_(n+1)^Λ(Λ/J,K)=0`. Hence the left global dimension is at most the projective dimension of the right module `Λ/J`, and symmetrically; both equal the largest projective dimension of a simple module. For a simple `S` with minimal resolution `P_•`, the complex `Hom_Λ(P_•,Λ/J)` has zero differentials, so `pd S=sup{n : Ext^n_Λ(S,S′)≠0 for some simple S′}`.
3. `k[[G]]` has global dimension `d`. Simple `k[[G]]`-modules are finite. Resolve the trivial module `k` by finitely generated free `k[[G]]`-modules (noetherianity). For a finite module `S`, tensor this resolution over `k` with `S` under the diagonal action. Untwisting `g⊗s↦g⊗g⁻¹s` identifies `k[[G]]⊗_k S` (diagonal) with a free module, so the result is a free resolution of `S`. `Hom`-tensor adjunction gives `Ext^n_(k[[G]])(S,S′)=Ext^n_(k[[G]])(k,Hom_k(S,S′))`. The free resolution is also a projective resolution in the profinite category (Ribes–Zalesskii Proposition 5.4.2`(a)`). Homomorphisms from a finitely generated free module into a finite module are automatically continuous. Hence this `Ext` is the profinite `Ext`, which is continuous cohomology `H^n(G,Hom_k(S,S′))` by Ribes–Zalesskii Theorem 6.2.4. It vanishes for `n>cd_p(G)=d`, so every simple module has projective dimension `≤d`. Conversely, Propositions 7.1.1 and 7.1.4 of Ribes–Zalesskii give a simple `p`-primary module A with `H^d(G,A)≠0`. Then `H^d(G,k⊗_(𝔽_p)A)≠0`, and since `H^d` is right exact when `cd_p=d`, some simple `k[[G]]`-constituent `S` of `k⊗A` has `Ext^d_(k[[G]])(k,S)=H^d(G,S)≠0`.
4. `O[[G]]` has global dimension `d+1`, for every `O`. The uniformizer `ϖ` is central, regular and in `J`, and `O[[G]]/ϖ=k[[G]]` whatever the ramification of `O`. For a right `k[[G]]`-module `N` and a finitely generated left `O[[G]]`-module `M`, use the change-of-rings spectral sequence `Tor_a^{k[[G]]}(N,Tor_b^{O[[G]]}(k[[G]],M)) ⇒ Tor_{a+b}^{O[[G]]}(N,M)`. The inner groups are `M/ϖM` for `b=0`, `M[ϖ]` for `b=1`, and zero otherwise; they are actual `k[[G]]`-modules. Since `gl.dim k[[G]]=d`, terms with `a+b>d+1` vanish. Hence `Tor_n^(O[[G]])(N,M)=0` for `n>d+1`, and `pd M≤d+1` by step 2 with `N=Λ/J`. For the lower bound, apply the change-of-rings long exact sequence for the regular central element `ϖ` to the trivial module `k`: for `k[[G]]`-modules `Y` it reads `…→Ext^n_(k[[G]])(k,Y)→Ext^n_(O[[G]])(k,Y)→Ext^(n−1)_(k[[G]])(k,Y)→Ext^(n+1)_(k[[G]])(k,Y)→…`, so `Ext^(d+1)_(O[[G]])(k,S)≅Ext^d_(k[[G]])(k,S)≠0` for the `S` of step 3.
5. Auslander regularity: the two-sided `Ext` condition is §0.10, and finite global dimension is steps 3–4.
6. For uniform `U` the trivial module `ℤ_p` has a resolution by finitely generated free `Λ(U)`-modules of length `d`: by step 2 for the local ring `Λ(U), pd ℤ_p` is the largest `n` with `Tor_n^(Λ(U))(𝔽_p,ℤ_p)=H_n(U,𝔽_p)≠0`, which is `d` by step 1, `H_n(U,𝔽_p)` being dual to `H^n(U,𝔽_p)`; the global dimension `d+1` is attained by `𝔽_p`. `Λ(U)` is local, so finitely generated projectives are free (§0.4).

API: `brumer_gldim` (`gl.dim O[[G]] = d+1` and `gl.dim k[[G]] = d`, both sides, for every `O`); `adic_pd_iff_tor` (`pd K ≤ n` iff `Tor_(n+1)(Λ/J,K)=0` over an adic noetherian ring); `ext_simple_eq_cohomology` (`Ext^n_(k[[G]])(S,S′)=H^n(G,Hom_k(S,S′))` for finite `S,S′`); `iwasawa_auslanderRegular_nonuniform` (with §0.10).

**Checks.**

- For `G=1` and `M=O`, the resolution `[O --ϖ→O]` consists of `O`-modules, not `k`-modules. Its homology `k` in degree zero is the `k`-linear input to the change-of-rings spectral sequence.

- `G = ℤ_p^d`: global dimension `d + 1`, and `d` for `𝔽_p[[ℤ_p^d]] = 𝔽_p[[T₁,…,T_d]]`.
- `G = ℤ_p × ℤ/ℓ` with `ℓ ≠ p: ℤ_p[ℤ/ℓ]` is a product of unramified discrete valuation rings `O_i`, so `Λ(G) ≅ ∏ O_i[[T]]` has global dimension `2 = cd_p(G) + 1`, although `G` is not torsion-free.
- `G = ℤ/p: ℤ_p[ℤ/p]` has infinite global dimension; the hypothesis is sharp. In step 3, `H^n(ℤ/p,𝔽_p)≠0` for every `n`, so the argument correctly gives no bound.
- Ramified `O`: for `O=ℤ_p[√p]` and `G=ℤ_p` the theorem gives global dimension 2 for `O[[T]]`; the residue ring is `k[[T]]` in both the ramified and the unramified case, which is why no separate ramified argument is needed.
- For `k=𝔽_p`, restriction of the trivial module from `k[C_p]` to `k` gives projective dimension 0, whereas its projective dimension over `k[C_p]` is infinite. The extension is finite free and Frobenius, and `Ext^i_{k[C_p]}(k,k[C_p])` vanishes for `i>0` because `k[C_p]` is self-injective. Thus a restriction`/Ext` argument cannot prove finiteness; the proof above uses `Ext` between simple modules instead. This example is outside the no-`p`-torsion conclusion.

*Needs:* §0.13 (built earlier in the displayed order); §F.2; [F.1](#ne-foundations-analytic-algebra); [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality); [0.10](#ne0-iwasawa-auslander-regularity) (The two-sided Auslander condition beyond uniform groups); TauCetiRoadmap ProfiniteCohomology (continuous cochains).

<a id="ne0-rational-iwasawa-global-dimension"></a>
### 0.12 Rational Iwasawa global dimension

**Theorem.** For `G` compact `p`-adic analytic of dimension `d` with no `p`-torsion and `O` a finite extension ring of integers with fraction field `L, L⊗_O O[[G]]=O[[G]][1/ϖ]` is Auslander regular of left and right global dimension `d`; for `O=ℤ_p` this is `ℚ_p⊗_(ℤ_p) ℤ_p[[G]]=ℤ_p[[G]][1/p]`. This is the bounded-denominator rational Iwasawa algebra; it is not the localization at all nonzero elements or Fu’s microlocal completion. The integral dimension is `d+1`.

See Venjakob 2002, Proposition 3.28 and Theorem 3.29, p. 19: Proves rational Auslander regularity and the exact global dimension. Fu, §6, pp. 22–23: Uses the rational dimension bound to truncate group homology.

The hypotheses are as follows. `G` compact `p`-adic analytic of dimension `d`, without elements of order `p`.

*Proof.*

1. Localize the Auslander `Ext` condition centrally at `p` and choose finitely generated integral lattices for rational modules.
2. Use Venjakob Theorem 3.29 to kill the top integral `Ext` after rationalization; its upper bound uses the torsion-free lattice argument, not a general rule that localization drops dimension.
3. Use the degree-`d` duality `Ext` of `ℚ_p` against the rational Iwasawa algebra to attain the lower bound.

**Checks.**

- For `G=1` the integral ring has dimension 1 and its fraction field dimension 0.
- For `G=ℤ_p` the bounded-denominator rational algebra has dimension 1; treating it as the field of all fractions would incorrectly give 0.

*Needs:* [0.10](#ne0-iwasawa-auslander-regularity) (The two-sided Auslander condition beyond uniform groups); [0.8](#ne0-ordered-iwasawa-series) (Ordered Iwasawa series and rationalization); [0.11](#ne0-iwasawa-finite-global-dimension) (Finite global dimension without `p`-torsion).

<a id="ne-foundations-compact-homology"></a>
### `F`.2 Compact tensors and continuous completed homology

**Construction.** For a compact Hausdorff complete ring `A` with a basis of open two-sided ideals of finite index, a compact right `A`-module `M` and a compact left `A`-module `N`, both inverse limits of finite continuous modules, construct `compactTensor M N` as the inverse limit of `(M/U) ⊗_A (N/V)` over open submodules. The algebraic balanced tensor uses §F.0’s noncommutative scalar-extension construction. Retain any commuting outer actions; for noncommutative `A` do not invent an `A`-action on the tensor. Prove the universal property for continuous balanced bilinear maps into compact inverse limits of finite modules, identity and composition for induced maps, independence of cofinal finite-quotient systems, associativity with the indicated bimodule actions, unit isomorphisms and finite direct-sum compatibility. For finite modules over the compact noetherian coefficient rings in §F.1, identify it with the algebraic tensor equipped with its compact quotient topology. (Ribes–Zalesskii, *Profinite Groups*, §5.4, in particular Proposition 5.4.2`(a)`; Venjakob 2002, §2, pp. 4–5.)

For profinite `K` and compact continuous `O`-coefficients `M`, construct `compactGroupHomology K M` as the homology of the continuous completed bar resolution, equivalently the left derived completed coinvariants `O ⊗̂ᴸ_{O[[K]]} M`. Prove that topologically free compact modules are projective in this coefficient category, resolution independence, the augmentation formula for degree zero, the long exact sequence and compatibility with shifts and triangles. Construct the hyper-`Tor` spectral sequence for bounded complexes, and the closed-subgroup Shapiro comparison using compact induction with its actual completed tensor. A bounded complex of compact finite projective `O[[K]]`-modules computes its derived coinvariants by the completed tensor complex; this makes no assertion that every compact module has a finite-length resolution. Compare with discrete finite-level `Tor` and with the Pontryagin dual of continuous cochains on the discrete dual. Give naturality for coefficient maps, conjugation and subgroup maps, and transitivity of Shapiro. (Ribes–Zalesskii, Theorem 6.2.4 and Remark 6.2.5; Venjakob 2002, §2; Fu, §6, pp. 22–23.)

The API comprises `compactTensor.lift`, its pure-tensor evaluation, map identity/composition, the unit and associativity comparisons, `compactGroupHomology.coinvariants`, `compactGroupHomology.longExact`, `compactGroupHomology.shapiro` and `compactGroupHomology.hyperTor`. These constructions precede the rationalization and diagonal-twist comparison of §0.15.

**Checks.**

- Tensoring a compact module with the coefficient ring gives that module with its original topology. In particular `O^ℕ ⊗̂_O O = O^ℕ` has product topology; the coordinate vectors tend to zero.
- For `K=1`, derived completed coinvariants of a bounded finite projective coefficient complex give the same complex. No extra group-homology degree appears.
- For `K=ℤ_p` and trivial `O`, the augmentation resolution has differential `γ−1` and gives `H₀=H₁=O`. Taking the ordinary coinvariants of homology before deriving would lose `H₁`.
- For the compact regular module `O[[K]]`, higher homology is zero and `H₀=O`; closed-subgroup Shapiro for the trivial subgroup gives this comparison.

*Needs:* the pinned completed group algebra and compact-module action; §F.0’s balanced tensor; ProfiniteCohomology Layers 5–8, 10 for the discrete dual; PadicMeasuresIwasawaAlgebras §5.2 for exact compact inverse systems; DerivedModuleAlgebra §§0.2, 1.1.1, 1.`T`.1.

<a id="ne0-lazard-exterior-cohomology"></a>
### 0.13 Lazard exterior cohomology of uniform groups

**Theorem.** For a finitely generated powerful torsion-free pro-`p` group `U` of dimension `d`, continuous cohomology with trivial coefficients is naturally the graded `𝔽_p`-algebra `H*(U,𝔽_p)≅∧*_(𝔽_p) H¹(U,𝔽_p)`, where `dim H¹=d`. Equivalently this is the Yoneda `Ext` algebra of the trivial module over `Ω(U)` in the continuous/compact module comparison. In particular the cup-product generators have square zero, including at `p=2`, and `dim H^i=binomial(d,i)`. At 2 powerful means `[U,U]⊆U⁴`.

See Lazard, `V`.2.2.6.3 and `V`.2.2.7.2, p. 167 (551); `V`.2.5.7.1, p. 183 (567): The first statements give the minimal resolution; the last supplies the exterior cup-product algebra. Calegari–Dimitrov–Tang, Proofs of Lemmas 4.5.6 and 4.5.9, pp. 662–663: Applies the result to level-`p SL₂` at odd `p` and level 4 at `p=2`.

The hypotheses are as follows. `U` uniform, `p` prime; coefficients trivial `𝔽_p`; cohomology is continuous.

*Proof.*

1. Use Lazard’s minimal resolution with binomial ranks and zero `mod-p` differentials to compute cohomology dimensions.
2. Use the multiplicative comparison of Lazard `V`.2.5.7.1 to identify cup products with exterior products; dimensions alone do not prove the ring assertion.
3. Import the continuous cohomology`/Ext` equivalence and identify the augmentation module.

**Checks.**

- For `U=Z_p²`, dimensions are 1,2,1 and `H¹` generators square to zero.
- For `U=Z₂`, the degree-one generator has square zero; replacing exterior by a symmetric algebra in characteristic 2 is wrong.
- For `U=C_p` the positive cohomology does not truncate; powerfulness alone does not suffice.

*Needs:* [0.1](#ne0-uniform-pro-p-group) (Constant lower-`p`-series indices); [F.1](#ne-foundations-analytic-algebra) (residual graded ring for every uniform group); TauCetiRoadmap ProfiniteCohomology (continuous cochains and cup products); §F.2.

<a id="ne3-twisted-module"></a>
### 0.14 Twisting modules by a representation

**Construction.** Let `G` be compact `p`-adic analytic, `O` a finite-free `ℤ_p` coefficient DVR and `ρ:G→GL_n(O)` continuous. For a finitely generated compact `Λ_O(G)`-module `N`, its `O`-linear diagonal twist is `tw_ρ(N)=N⊗_O O^n`, with `g(m⊗z)=gm⊗ρ(g)z`. For a `Λ(G)`-module `M`, first form `M_O=O⊗_(ℤ_p)M`, then take this twist. It is exact, is functorial on equivariant `O`-linear maps and sends `Λ_O(G)^m` to a free `Λ_O(G)`-module of rank `mn`. The `𝔐_H(G)` preservation statement belongs to §2.5; no quotient `G/H` is needed just to define twisting.

See CFKSV, §3, (13) and Lemma 3.2, p. 171: (13) and Lemma 3.2.

The hypotheses are as follows. `G` compact `p`-adic analytic; `ρ` continuous on a finite-free `O`-lattice; `N` finitely generated and compact.

*Construction.*

1. Exactness: tensoring with the free `𝒪`-module `𝒪ⁿ`.
2. Freeness: `Λ_𝒪(G) ⊗ 𝒪ⁿ` with the diagonal action is isomorphic to `Λ_𝒪(G)ⁿ` with the left action (the untwisting `g ⊗ z ↦ g ⊗ ρ(g)^{−1}z`).

API: `twist` (For an `O`-coefficient module `N` take `N⊗_O O^n` with diagonal action; for `M` over `ℤ_p` first extend coefficients to `M_O`); `twist_exact` (`tw_ρ` is exact); `twist_free` (`tw_ρ` of a free `Λ_𝒪(G)`-module is free).

**Checks.**

- `twist_trivial`: For `ρ = 1 (n = 1), tw_ρ(M) = M_𝒪`.
- `twist_character`: For a character `ρ = κ : G → 𝒪^×, tw_κ(Λ_𝒪(G)) ≅ Λ_𝒪(G)` via `g ↦ κ(g)^{−1}g`.
- `twist_direct_sum`: `tw_{ρ₁ ⊕ ρ₂}(M) = tw_{ρ₁}(M) ⊕ tw_{ρ₂}(M)`.
- The action is diagonal, not `ρ` on the coefficients alone; `tw` is used with the contragredient `ρ̂` in the Euler characteristic formula.

*Needs:* [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7.

<a id="ne0-iwasawa-group-homology"></a>
### 0.15 Iwasawa group homology and diagonal twists

**Construction.** For compact `p`-adic analytic `G` without `p`-torsion and `A=ℚ_p⊗ℤ_p[[G]]`, define `H_i(G,M)=Tor_i^A(ℚ_p,M)` for a finitely generated left `A`-module, with `ℚ_p` a right module by augmentation. For an integral compact `Λ`-module use completed `Tor` in the compact module category. If `W` is a finite-dimensional continuous `ℚ_p` representation admitting a `G`-stable `ℤ_p` lattice, the diagonal action `g(m⊗w)=gm⊗gw` defines `M⊗W` as a finitely generated `A`-module. Then `H_i(G,M⊗W)` is finite dimensional over `ℚ_p` and is zero for `i>dim G`. Integral lattices and completed tensor products must be compared before using the rational `Tor` formula.

See Venjakob 2002, §2, pp. 4–5: Defines homology through derived compact coinvariants and completed `Tor`. Fu, §6, pp. 22–23, proof of Theorem 1.4: Uses finite resolutions, diagonal algebraic twists and dimension-shifting of group homology.

The hypotheses are as follows. `G` compact `p`-adic analytic, without `p`-torsion; `M` finitely generated over `A`; `W` finite dimensional with a continuous `G`-action and stable integral lattice.

*Construction.*

1. Import continuous completed homology as derived completed coinvariants, its computation by bounded complexes of compact finite projective modules, the hyper-`Tor` spectral sequence and the Shapiro comparison from §F.2. Prove `rationalHomology_eq_Tor`: for a finitely generated integral lattice `M₀` of `M, ℚ_p ⊗ H_i(G, M₀) = Tor_i^A(ℚ_p, M)`, by computing both sides on one bounded finite projective resolution of `M₀` (finite length by §0.11) and using that inverting `p` is exact.
2. A stable lattice makes the diagonal action continuous; the inverse diagonal twist identifies a twisted free `A`-module with a free module of rank `dim W`.
3. Resolve `M` by finitely generated projectives of length `≤d` and tensor with the augmentation module. Each resulting term is finite dimensional; finite resolution length gives vanishing above `d`.
4. Compare compact integral resolutions after inverting `p` to justify the rational `Tor` description.

API: `IwasawaHomology.coinvariants` (`H₀(G,M)=ℚ_p⊗_A M`; in the integral compact category use the Hausdorff completed coinvariant quotient); `IwasawaHomology.twist` (Diagonal tensor by `W`, compatible with sums, tensor products and coefficient extension); `IwasawaHomology.freeTwist` (`A⊗W` with diagonal action is `A`-free of rank `dim W` by the inverse-action formula); `IwasawaHomology.vanish_above_dim` (`H_i(G,M⊗W)=0` for `i>d`; all homology groups are finite dimensional).

**Checks.**

- `iwasawa_group_homology_1`: For `G=1, H₀(1,M)=M` and all positive homology vanishes; here finitely generated `A`-modules are finite dimensional.
- `iwasawa_group_homology_2`: For `G=ℤ_p` and trivial `M=ℚ_p`, the resolution `A --(γ−1)→` A gives `H₀=H₁=ℚ_p` and higher homology zero.
- `iwasawa_group_homology_3`: For `G=ℤ_p` acting on a one-dimensional `W` with `γ` acting by `a≠1`, the same resolution has differential `a−1`, so `H₀=H₁=0`.
- `iwasawa_group_homology_4`: The free diagonal twist has `H₀` dimension `dim W` and no positive homology; a twist that forgets the inverse action fails this comparison.

*Needs:* [0.12](#ne0-rational-iwasawa-global-dimension) (Rational Iwasawa global dimension); [0.14](#ne3-twisted-module) (Twisting modules by a representation); §F.2.

### Examples

- For `p = 5` and `G = S₃ × ℤ₅, Λ(G)` is free of rank 6 over `Λ(ℤ₅)`, and the `ℤ₅`-augmentation quotient is `ℤ₅[S₃]`, where (12)(123) `≠` (123)(12) (§0.3; Worked examples, example 2).
- At odd `p` the uniform group `⟨a, b | aba⁻¹ = b^{1+p}⟩` has a noncommutative integral graded ring but a polynomial `mod-p` graded ring (§0.9; Worked examples, example 3).
- `ℤ_p^d` is uniform of dimension `d`, with `Λ(ℤ_p^d) ≅ ℤ_p[[T₁, …, T_d]]` of global dimension `d + 1` and `Ω(ℤ_p^d)` of global dimension `d` (§F.1; §0.11).

### Dependencies

the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; Tau Ceti `TauCeti.IsProP`; TauCetiRoadmap ProfiniteArithmetic (lower `p`-series, `p`-adic powers), TauCetiRoadmap ProfiniteCohomology, §F.2, TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7, TauCetiRoadmap ProfiniteProPGroups Layer 9; Mathlib `IsLocalRing`, `IsNoetherianRing`, `MvPolynomial`, `MvPolynomial.isNoetherianRing`, `OpenNormalSubgroup`; §F.1.

## Layer 1: Canonical Ore localization and torsion categories

The exact denominator set is part of the theorem. The proof passes through finite quotients by open pro-`p` subgroups of `H`, uses a central procyclic subgroup and the finite-dimensional algebra `V(G/J)`, and proves the left and right criteria before invoking Mathlib's `OreLocalization`. The `p`-saturated set `S*`, the category `𝔐_H(G)` and the `S`-acyclic perfect complexes are specified separately (Worked examples, example 1). Module `TauCeti/NumberTheory/NoncommIwasawa/CanonicalOre`.

<a id="ne1-canonical-ore-set"></a>
### 1.1 The canonical Ore set `S`

**Definition.** Let `G` be a compact `p`-adic analytic group with a closed normal subgroup `H` such that `G/H ≅ ℤ_p`. The canonical set is `S = {f ∈ Λ(G) : Λ(G)/Λ(G)f is finitely generated as a left Λ(H)-module}`. With `O`-coefficients, `S_O` is defined in the same way with `Λ_O(G), Λ_O(H)`.

See CFKSV, §2, p. 166: The definition.

The hypotheses are as follows. `S` itself needs no hypothesis excluding elements of order `p`; CFKSV assume it only in later sections. Abstractly, for a ring A that is a left `B`-module compatibly with left multiplication, `S = {f : A/Af finitely generated over B}`.

*Construction.*

1. Define `S` by the finiteness condition on the cyclic module `Λ(G)/Λ(G)f`.
2. By §0.3, `H` may be replaced by any open subgroup of `H` in the definition.
3. For the abstract set, `1 ∈ S` because `A/A = 0`, and `S·S ⊆ S` by the exact sequence of §1.7, step 1; neither uses a noetherian hypothesis.

API: `canonicalSet` (`S = {f | Module.Finite B (A ⧸ A f)}` for `(A, B) = (Λ(G), Λ(H))`); `mem_canonicalSet_iff` (The three criteria of Lemma 2.1 and the right-sided ones of Lemma 2.2); `one_mem_canonicalSet` `(1 ∈ S)`; `mul_mem_canonicalSet` (`S` is multiplicatively closed).

The named Lean targets `X_mem_canonicalSet_powerSeries` and `prime_not_mem_canonicalSet_powerSeries` state `T∈S` and `p∉S` on `PowerSeries ℤ_[p]`.

**Checks.**

- `B = A: S = A`, including 0 (degenerate case: the zero-divisor statement needs the group hypotheses).
- `A = 𝔽_p⟦T⟧ = Ω(ℤ_p), B = 𝔽_p (H = 1): S = {f ≠ 0}`.
- `A = ℚ[X], B = ℚ: S = {f ≠ 0}`.
- `Λ(ℤ_p)` with `H = 1: p ∉ S` and `T ∈ S (Λ/ΛT ≅ ℤ_p)`; `S ≠ Λ ∖ {0}`.
- For `H = 1, G = Γ ≅ ℤ_p: Λ(Γ)/Λ(Γ)f` is finitely generated over `ℤ_p` iff `f ≠ 0` and `p ∤ f` (Weierstrass), so `S = Λ(Γ) ∖ pΛ(Γ)`. This is the theorem `mem_canonicalSet_powerSeries_iff`, stated on `ℤ_p[[T]] ≅ Λ(ℤ_p)`.
- Never replace `S` by the set of all nonzero divisors: localisation at all nonzero elements is neither defined in general nor equal to `Λ(G)_S`. For `G = Γ, p` is a nonzero divisor but `p ∉ S`.

*Needs:* TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7; [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); Mathlib `Module.Finite`; Mathlib `Submodule.span`.

<a id="ne1-central-zp-subgroup"></a>
### 1.2 A central copy of `ℤ_p` in `G/J`

**Lemma.** Let `H` ◁ `G` closed with `G/H ≅ ℤ_p` and `J ≤ H` open, normal in `G`. Then `G/J` contains a subgroup `Π ≅ ℤ_p` that is open, central, and maps isomorphically onto an open subgroup of `Γ = G/H`; hence `Ω(Π) ≅ 𝔽_p⟦T⟧` is a discrete valuation ring in the centre of `Ω(G/J)`, and `Λ(Π) ≅ ℤ_p⟦T⟧`.

See CFKSV, §2, (5) and proof of Lemma 2.1, p. 167: CFKSV's equation (5).

The hypotheses are as follows. `J` open in `H` (so `H/J` is finite) and normal in `G`.

*Proof.*

1. Choose a pro-`p` Sylow subgroup of `G/J` mapping onto `Γ`. Since `ℤ_p` is the free pro-`p` group on one generator, lift its generator inside that pro-`p` group. Its procyclic closure maps isomorphically onto `Γ` (an infinite procyclic pro-`p` group is `ℤ_p`), giving the section `G/J=(H/J)⋊Γ`. An arbitrary lift can carry an extra finite prime-to-`p` component and is not sufficient.
2. `⟨γ⟩̄` acts on the finite group `H/J` by conjugation through a finite quotient, so an open subgroup `Π = ⟨γ^{p^k}⟩̄` acts trivially; `Π` commutes with `H/J` and with `⟨γ⟩̄`, hence is central.
3. `Ω(Π) ≅ 𝔽_p⟦T⟧` by the power-series coordinate of ProfiniteProPGroups Layer 9.

**Checks.**

- `Π` is central in `G/J`, not in `G`.
- Test: `G = ℤ_p ⋊ ℤ_p` acting by a unit `u ≠ 1` with `H = ℤ_p: Π = ⟨γ^{p^k}⟩` with `u^{p^k} ≡ 1 mod |H/J|`.
- For `C_ℓ×ℤ_p` with `ℓ≠p`, a lift with nontrivial `C_ℓ`-coordinate need not have pro-`p` closure. The construction first chooses a pro-`p` lift.

*Needs:* [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7.

<a id="ne1-quotient-total-algebra"></a>
### 1.3 The algebra `V(G/J)`

**Construction.** With `Π` as in §1.2 and `R(Π) = Frac Ω(Π) ≅ 𝔽_p((T))`, put `V(G/J) = R(Π) ⊗_{Ω(Π)} Ω(G/J)`. It is a finite-dimensional algebra over the central field `R(Π)`; `Ω(G/J) → V(G/J)` is injective; and for `x ∈ Ω(G/J)`, right multiplication by `x` on `V(G/J)` is injective iff surjective iff `x` is a unit of `V(G/J)`, and the same holds on the left.

See CFKSV, §2, (6), p. 167: CFKSV's `V(G/J)`.

The hypotheses are as follows. `Ω(G/J)` is a finite free `Ω(Π)`-module (§0.3), of rank `[G/J : Π]`.

*Construction.*

1. `V(G/J) = R(Π)^{[G/J:Π]}` as an `R(Π)`-vector space; left and right multiplications are `R(Π)`-linear because `R(Π)` is central.
2. Linear algebra: an injective endomorphism of a finite-dimensional vector space is surjective.
3. If `x z = 1` in `V` then `z x = 1` (finite-dimensional algebra), which gives the left–right symmetry used in Lemma 2.2.

API: `totalAlgebra` `(V(G/J) = R(Π) ⊗_{Ω(Π)} Ω(G/J))`; `totalAlgebra_finiteDimensional` (`V(G/J)` is finite-dimensional over `R(Π)`); `algebraMap_totalAlgebra_injective` `(Ω(G/J) ↪ V(G/J))`; `isUnit_iff_mul_right_injective` (`x` is a unit in `V` iff right multiplication by `x` is injective).

**Checks.**

- `totalAlgebra_abelian`: `G = Γ, J = 1: V = 𝔽_p((T))`, a field.
- `totalAlgebra_product`: `G = Γ × ℤ/p, J = 1: V ≅ 𝔽_p((T))[ε]/(ε^p) (ε = σ − 1)`, with nilpotents.
- `totalAlgebra_dim`: `dim_{R(Π)} V(G/J) = [G/J : Π]`.
- `V(G/J)` is not a division ring in general (`G/J` may be nonabelian with zero divisors in `Ω(G/J)`).

*Needs:* [1.2](#ne1-central-zp-subgroup) (A central copy of `ℤ_p` in `G/J`); [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); Mathlib `FractionRing`; Mathlib `LinearMap.injective_iff_surjective`.

<a id="ne1-canonical-set-left-criteria"></a>
### 1.4 Criteria for membership in `S` (left)

**Lemma.** Let `J ≤ H` be pro-`p`, open in `H` and normal in `G`, with `φ_J : Λ(G) → Λ(G/J)` and `ψ_J : Λ(G) → Ω(G/J)`. For `f ∈ Λ(G)` the following are equivalent: (i) `f ∈ S`; (ii) `Λ(G/J)/Λ(G/J)φ_J(f)` is a finitely generated `ℤ_p`-module; (iii) `Ω(G/J)/Ω(G/J)ψ_J(f)` is finite; (iv) right multiplication by `ψ_J(f)` on `Ω(G/J)` is injective.

See CFKSV, §2, Lemma 2.1, p. 166: Lemma 2.1(iii). CFKSV, §2, proof of Lemma 2.1, p. 167: The key step.

The hypotheses are as follows. `J` pro-`p`, open in `H`, normal in `G` (such `J` exist and are cofinal).

*Proof.*

1. For `M = Λ(G)/Λ(G)f: M_J = Λ(G/J)/Λ(G/J)φ_J(f)` and `M/𝔪_J M = Ω(G/J)/Ω(G/J)ψ_J(f)`; (i) `⇔` (ii) `⇔` (iii) by PadicMeasuresIwasawaAlgebras §5.2 (with `H` replaced by `J`).
2. `Ω(Π)` is a DVR, so a finitely generated `Ω(Π)`-module is torsion iff finite; `Ω(G/J)/Ω(G/J)ψ_J(f)` is finite iff right multiplication by `ψ_J(f)` has finite kernel, iff it is injective on `V(G/J)`.
3. `Ω(G/J)` has no nonzero finite submodule, so finite kernel means zero kernel.

**Checks.**

- Test on `H = 1, G = Γ, J = 1`: (iii) says `𝔽_p⟦T⟧/(f̄)` finite, `i`.`e`. `f̄ ≠ 0`.

*Needs:* [1.1](#ne1-canonical-ore-set) (The canonical Ore set `S`); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.2 (topological Nakayama); [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); [1.3](#ne1-quotient-total-algebra) (The algebra `V(G/J)`); [1.2](#ne1-central-zp-subgroup) (A central copy of `ℤ_p` in `G/J`).

<a id="ne1-canonical-set-right-criteria"></a>
### 1.5 Criteria for membership in `S` (right)

**Lemma.** With `J` as before, `f ∈ S` iff `Λ(G)/fΛ(G)` is finitely generated as a right `Λ(H)`-module, iff `Λ(G/J)/φ_J(f)Λ(G/J)` is a finitely generated `ℤ_p`-module, iff `Ω(G/J)/ψ_J(f)Ω(G/J)` is finite, iff left multiplication by `ψ_J(f)` on `Ω(G/J)` is injective. In particular `S` is the same set whether defined with left or right modules.

See CFKSV, §2, Lemma 2.2, p. 167: Lemma 2.2(iv).

The hypotheses are as follows. As in §1.4.

*Proof.*

1. `f ∈ S` iff `α_J(f) =` image of `ψ_J(f)` in `V(G/J)` has a left inverse, iff it has a right inverse (§1.3), iff left multiplication by `ψ_J(f)` is injective.
2. Reverse the argument of §1.4 for right modules.

**Checks.**

- The left–right symmetry uses that `V(G/J)` is finite-dimensional over `R(Π)`: in an infinite-dimensional algebra such as `End(k^(ℕ))` the shift operator has a left inverse and no right inverse.
- For `G = Γ` and `H = 1` both criteria say `f ∉ pΛ(Γ)`.

*Needs:* [1.4](#ne1-canonical-set-left-criteria) (Criteria for membership in `S` (left)); [1.3](#ne1-quotient-total-algebra) (The algebra `V(G/J)`).

<a id="ne1-s-torsion-iff-finitely-generated"></a>
### 1.6 `S`-torsion equals finite generation over `Λ(H)`

**Theorem.** A finitely generated left (or right) `Λ(G)`-module `M` is `S`-torsion (every `x ∈ M` is killed by some `s ∈ S`) iff `M` is finitely generated over `Λ(H)`.

See CFKSV, §2, Proposition 2.3, p. 168: Proposition 2.3. CFKSV, §2, proof of Proposition 2.3, p. 168: The noetherian step.

The hypotheses are as follows. `G` compact `p`-adic analytic, `H` ◁ `G` closed, `G/H ≅ ℤ_p`.

*Proof.*

1. `S`-torsion `⇒` finitely generated: `M` is a quotient of `⊕ Λ(G)/Λ(G)f_i` with `f_i ∈ S`, each finitely generated over `Λ(H)`.
2. Conversely fix `x ∈ M, J` and `Π` as above, `τ ∈ Λ(G)` lifting `T`; the `Λ(J)`-submodules `U_n = Σ_{k≤n} Λ(J)τ^k x` of the finitely generated `Λ(J)`-module `M` stabilise (`Λ(J)` noetherian), giving `s_n = τ^n − a_{n−1}τ^{n−1} − … − a₀` with `s_n x = 0`.
3. `ψ_J(s_n)` is a nonzero element of `Ω(Π)` (its image `mod` the augmentation of `J` is `T^n + …`), so right multiplication by it is injective on `Ω(G/J)`, and `s_n ∈ S` by §1.4 (iv).

**Checks.**

- The direction `S`-torsion `⇒` finitely generated over `B` holds for any pair `(A, B)`; the converse is the group-theoretic input.
- For `G = Γ` and `H = 1, M = Λ(Γ)/(p)` is not finitely generated over `ℤ_p` and is not `S`-torsion `(p ∉ S)`, although it is `S*`-torsion.

*Needs:* [1.1](#ne1-canonical-ore-set) (The canonical Ore set `S`); [1.4](#ne1-canonical-set-left-criteria) (Criteria for membership in `S` (left)); [1.2](#ne1-central-zp-subgroup) (A central copy of `ℤ_p` in `G/J`); [F.1](#ne-foundations-analytic-algebra); [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups).

<a id="ne1-canonical-ore-theorem"></a>
### 1.7 The canonical Ore set theorem

**Theorem.** `S` is multiplicatively closed, a left and right Ore set in `Λ(G)` (for `s ∈ S, r ∈ Λ(G)` there are `t₁, t₂ ∈ S` and `w₁, w₂` with `s w₁ = r t₁` and `w₂ s = t₂ r`), and consists of nonzero divisors. Hence Mathlib's OreSet structure exists on `S`, on either side.

See CFKSV, §2, Theorem 2.4, p. 168: Theorem 2.4. CFKSV, §2, definition of Ore set, p. 166: The Ore conditions in CFKSV's orientation.

The hypotheses are as follows. `G` compact `p`-adic analytic, `H` ◁ `G` closed, `G/H ≅ ℤ_p`.

*Proof.*

1. Multiplicative: `0 → Λs₂/Λs₁s₂ → Λ/Λs₁s₂ → Λ/Λs₂ → 0` with the first term a quotient of `Λ/Λs₁`.
2. Ore: `Λ/Λf` and `Λ/fΛ` are finitely generated over `Λ(H)`, hence `S`-torsion (Proposition 2.3): `s x ∈ Λf` and `x s′ ∈ fΛ`.
3. Nonzero divisors: `φ_J(f)` is not a zero divisor in `Λ(G/J)` for every `J` (criteria (iv) of Lemmas 2.1 and 2.2 lifted from `Ω` to `Λ`), and `Λ(G) = lim_J Λ(G/J)`.
4. Mathlib's OreSet needs the left Ore condition in the form `t r = w s` and right cancellation, which follows from `S` consisting of nonzero divisors.

**Checks.**

- The scope is the source’s `ℤ_p` quotient, not the arbitrary-normal-subgroup generalization.
- `p ∉ S` always: `Λ(G)/pΛ(G) = Ω(G)` is not finitely generated over `Λ(H)` because `Γ = G/H` is infinite; keep `S` and `S*` distinct.

*Needs:* [1.6](#ne1-s-torsion-iff-finitely-generated) (`S`-torsion equals finite generation over `Λ(H)`); [1.4](#ne1-canonical-set-left-criteria) (Criteria for membership in `S` (left)); [1.5](#ne1-canonical-set-right-criteria) (Criteria for membership in `S` (right)); Mathlib `OreLocalization.OreSet`; Mathlib `OreLocalization.ore_right_cancel`.

<a id="ne1-nilpotent-transition-kernel"></a>
### 1.8 Nilpotent kernels between finite levels

**Lemma.** For pro-`p` subgroups `J ⊆ J′` of `H`, open in `H` and normal in `G`, the kernel `K` of `Ω(G/J) → Ω(G/J′)` is a nilpotent two-sided ideal: `K = Ω(G/J) I_Δ` with `Δ = J′/J` a finite `p`-group and `I_Δ^n = 0`.

See CFKSV, §2, Lemma 2.5, p. 169: Lemma 2.5 (Ardakov's proof).

The hypotheses are as follows. `J ⊆ J′` as stated.

*Proof.*

1. `K` is generated by `δ − 1` for `δ ∈ Δ`; `Δ` is normal so `K = Ω(G/J) I_Δ = I_Δ Ω(G/J)`.
2. The augmentation ideal of `𝔽_p[Δ]` satisfies `I_Δ^|Δ|=0` for the finite `p`-group `Δ`, by the central-element induction proved in §0.4. Since `I_ΔΩ(G/J)=Ω(G/J)I_Δ, K^n=Ω(G/J)I_Δ^n`, so `K^|Δ|=0`.

**Checks.**

- Test: `G = Γ × ℤ/p, J = 1, J′ = ℤ/p: K = (σ − 1)` with `(σ − 1)^p = 0`.

*Needs:* TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7; Mathlib `IsPGroup`; [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality).

<a id="ne1-regular-modulo-prime-radical"></a>
### 1.9 `S` as the elements regular modulo the prime radical

**Theorem.** Let `𝒩` be the preimage in `Λ(G)` of the prime radical of `Ω(G/J)` (independent of `J` by §1.8). Then `S` is the set of elements of `Λ(G)` that are regular (nonzero divisors) modulo `𝒩`.

See CFKSV, §2, Proposition 2.6, p. 169: Proposition 2.6. CFKSV, §2, proof of Proposition 2.6, p. 170: The key step.

The hypotheses are as follows. The prime radical is the intersection of the two-sided prime ideals, not Mathlib's commutative nilradical. `Ω(G/J)` is noetherian on both sides (§F.1) and finite free over the central `𝔽_p[[Π]]`; `V(G/J)` is its localization at the central `𝔽_p[[Π]]∖0`.

*Proof.*

1. The prime radical of a ring `R` noetherian on two-sided ideals is nilpotent. Let `N` be the sum of all nilpotent two-sided ideals. By the ascending chain condition `N` is a finite sum. If `I^a=0` and `J^b=0` then `(I+J)^(a+b−1)=0`, because a product with `k` factors from `I` lies in `I^k`. So `N` is nilpotent.
2. `R/N` has no nonzero nilpotent ideal, so for `a≠0` in `R/N` one can choose `a₀=a` and a nonzero `a_(k+1)∈a_kRa_k`. An ideal maximal among those missing every `a_k` is prime and does not contain a. Hence the prime radical lies in `N`; conversely each nilpotent ideal lies in every prime. The prime radical is `N`, which is nilpotent.
3. Central localization: `Σ=𝔽_p[[Π]]∖0` acts injectively on `Ω(G/J)`, which is free over the domain `𝔽_p[[Π]]`, so `Ω(G/J)⊆V(G/J)`. The extension NV is a nilpotent ideal of `V`. `V` is finite-dimensional over `Frac 𝔽_p[[Π]]`, hence Artinian, so its prime radical is nilpotent; its contraction to `Ω(G/J)` is a nilpotent two-sided ideal, hence lies in `N`, and the prime radical of `V` is NV. A nonzero divisor of an Artinian ring is a unit.
4. `Λ(G)/𝒩 = Ω(G/J)/𝒩(Ω(G/J))`; `f` is regular modulo `𝒩` iff `α_J(f)` is a unit of `V(G/J)/𝒩(V(G/J))`.
5. Units modulo nilpotent ideals are units, so this holds iff `ψ_J(f)` is a nonzero divisor in `Ω(G/J)`, iff `f ∈ S` by Lemmas 2.1(iv) and 2.2(iv).

**Checks.**

- The characterization, due to Schneider, shows that `S` depends only on `Λ(G)` and `H`.
- For `G = Γ, H = J = 1: 𝒩 = pΛ(Γ)` and `S` is the set of elements regular modulo `p`, that is `Λ(Γ) ∖ pΛ(Γ)`.
- For `R=𝔽_p[C_p]`, the prime radical is the augmentation ideal, nilpotent of index `p`; the commutative nilradical gives the same answer here, but for `M₂(𝔽_p[ε]), ε²=0`, the prime radical is `M₂(εF_p[ε])`, although the matrix ring has nonzero nilpotent elements outside it.

*Needs:* [1.8](#ne1-nilpotent-transition-kernel) (Nilpotent kernels between finite levels); [1.4](#ne1-canonical-set-left-criteria) (Criteria for membership in `S` (left)); [1.5](#ne1-canonical-set-right-criteria) (Criteria for membership in `S` (right)); [1.3](#ne1-quotient-total-algebra) (The algebra `V(G/J)`); [F.1](#ne-foundations-analytic-algebra).

<a id="ne1-saturated-ore-set"></a>
### 1.10 The saturated Ore set `S*`

**Construction.** `S* = ⋃_{n≥0} p^n S`. It is a multiplicatively closed left and right Ore set of nonzero divisors, and `Λ(G)_{S*} = Λ(G)_S[1/p]`. A finitely generated `Λ(G)`-module `M` is `S*`-torsion iff `M/M(p)` is finitely generated over `Λ(H)`, where `M(p)` is the `p`-power torsion.

See CFKSV, §3, definition of `S*`, p. `170: S*`.

The hypotheses are as follows. `p` is central in `Λ(G)`.

*Construction.*

1. `p` central and a nonzero divisor, so `{p^n}` is a central Ore set; products of Ore sets with a central Ore set are Ore.
2. `Λ(G)_{S*}` is the localisation of `Λ(G)_S` at `p`.
3. `M/M(p)` finitely generated over `Λ(H)` iff it is `S`-torsion (Proposition 2.3), iff `M` is `S*`-torsion.

API: `saturatedSet` `(S* = ⋃ p^n S)`; `saturatedSet_oreSet` (`S*` is an Ore set of nonzero divisors); `saturatedLocalization_equiv` `(Λ(G)_{S*} ≃ Λ(G)_S[1/p])`; `isSTorsion_saturated_iff` (`S*`-torsion iff `M/M(p)` finitely generated over `Λ(H)`).

The named Lean target `canonicalSet_ne_saturatedSet_powerSeries` states `S≠S*` for `PowerSeries ℤ_[p]`, witnessed by `p`.

**Checks.**

- `G = Γ, H = 1: S* = Λ(Γ) ∖ {0}` and `Λ(Γ)_{S*} = Frac Λ(Γ)`.
- `p ∈ S*` but `p ∉ S`.
- `M = Λ(G)/p` is `S*`-torsion for every `G`.
- `p ∉ S` (`Γ` is infinite), so `S* ≠ S`.

*Needs:* [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem); [1.6](#ne1-s-torsion-iff-finitely-generated) (`S`-torsion equals finite generation over `Λ(H)`).

<a id="ne1-canonical-localization"></a>
### 1.11 The canonical localisation `Λ(G)_S`

**Construction.** `Λ(G)_S` is Mathlib's Ore localisation of `Λ(G)` at the Ore set `S` (on the left; the right localisation is canonically isomorphic because `S` is two-sided Ore). The map `Λ(G) → Λ(G)_S` is injective, every `s ∈ S` becomes a unit, and any ring map `Λ(G) → T` inverting `S` factors uniquely through `Λ(G)_S`. Likewise `Λ(G)_{S*}, O`-coefficients included.

See CFKSV, §3, (11), p. 170: The localisations `Λ(G)_S` and `Λ(G)_{S*} = Λ(G)_S[1/p]` (CFKSV (11)).

The hypotheses are as follows. `S` an Ore set of nonzero divisors (§1.7).

*Construction.*

1. Instantiate OreLocalization with the OreSet structure of §1.7.
2. Injectivity: `numeratorHom_inj`, since `S` consists of (left) nonzero divisors.
3. Universal property: universalHom and `universalHom_unique`.
4. Left and right localisations agree: both satisfy the universal property for maps inverting `S`.

API: `canonicalLocalization` (`Λ(G)_S :=` OreLocalization `S Λ(G)`); `canonicalLocalization.algebraMap_injective` `(Λ(G) ↪ Λ(G)_S)`; `canonicalLocalization.isUnit` (Images of elements of `S` are units); `canonicalLocalization.lift` (Maps inverting `S` factor uniquely).

**Checks.**

- `canonicalLocalization_padic`: `G = Γ, H = 1: Λ(Γ)_S = Λ(Γ)_{(p)}`, the localisation at the height-one prime `(p)`.
- `canonicalLocalization_p_not_unit`: `p` is not a unit in `Λ(G)_S: Λ(G)_S/p` is the nonzero localisation of `Ω(G)` at the image of `S`.
- `canonicalLocalization_commutes`: For `G` abelian, `Λ(G)_S` agrees with the commutative localisation.
- Do not construct `Λ(G)_S` as a commutative fraction ring; `Λ(G)` is noncommutative.

*Needs:* [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem); [1.10](#ne1-saturated-ore-set) (The saturated Ore set `S*`); Mathlib `OreLocalization`; Mathlib `OreLocalization.numeratorRingHom`; Mathlib `OreLocalization.numeratorHom_inj`; Mathlib `OreLocalization.universalHom`; Mathlib `OreLocalization.universalHom_unique`; Mathlib `OreLocalization.numerator_isUnit`.

<a id="ne1-ore-localization-flat"></a>
### 1.12 Ore localisation is flat

**Lemma.** For a left Ore set `S` of a ring `R`, the localisation `R_S = S⁻¹R` is flat as a right `R`-module, `R_S ⊗_R M ≅ S⁻¹M` naturally, and the kernel of `M → R_S ⊗_R M` is the `S`-torsion submodule of `M`. Hence a complex `C` of `R`-modules has `R_S ⊗_R C` acyclic iff every `H^i(C)` is `S`-torsion.

See CFKSV, §4, proof of Theorem 4.4, p. 192: The fact used.

The hypotheses are as follows. `S` left Ore; for the last statement `C` is bounded above with flat or projective terms, or any complex since `R_S` is flat.

*Proof.*

1. `S⁻¹M` (Mathlib's OreLocalization of a module) is exact in `M`: a fraction `m/s` vanishes iff `t m = 0` for some `t ∈ S`.
2. The natural map `R_S ⊗_R M → S⁻¹M` is an isomorphism (both are left adjoint-like; check on free modules and use right exactness).
3. Exactness of left fractions gives flatness of the `(R_S,R)`-bimodule and commutation with cohomology. This is a noncommutative bimodule assertion; Mathlib's `Module.Flat` at the pin is stated for commutative scalars and does not supply it.

**Checks.**

- For `R = ℤ, S = ℤ ∖ {0}` and `M = ℤ/n` with `n ≥ 1, S⁻¹M = 0` and the kernel of `M → ℚ ⊗ M` is all of `M`, the `S`-torsion submodule.
- CFKSV use exactness of localization at `S` in the proof of Theorem 4.4 (p. 192).

*Needs:* [1.11](#ne1-canonical-localization) (The canonical localisation `Λ(G)_S`); Mathlib `OreLocalization`.

<a id="ne1-category-mhg"></a>
### 1.13 The category `𝔐_H(G)`

**Definition.** `𝔐_H(G)` is the full subcategory of finitely generated left `Λ(G)`-modules that are `S*`-torsion; equivalently those `M` with `M/M(p)` finitely generated over `Λ(H)`. It is a Serre subcategory (closed under submodules, quotients and extensions). For `H = 1, G = Γ` it is the category of finitely generated torsion `Λ(Γ)`-modules.

See CFKSV, §3, p. 170: The definition. CFKSV, §3, p. 170: The commutative specialisation.

The hypotheses are as follows. `G, H` as in §1.1.

*Construction.*

1. Closure under submodules uses that `Λ(G)` is noetherian (submodules of finitely generated modules are finitely generated); quotients and extensions are immediate from the torsion description.
2. For `H = 1: S* = Λ(Γ) ∖ {0}`, so `S*`-torsion means torsion.

API: `MH` (The full subcategory of finitely generated `S*`-torsion modules); `mem_MH_iff` (`M ∈ 𝔐_H(G)` iff `M/M(p)` is finitely generated over `Λ(H)`); `MH.isSerre` (Closed under submodules, quotients, extensions); `MH_trivial_H` (For `H = 1`: finitely generated torsion `Λ(Γ)`-modules).

**Checks.**

- `MH_cyclic`: `Λ(G)/Λ(G)f ∈ 𝔐_H(G)` for `f ∈ S*`.
- `not_MH_free`: `Λ(G) ∉ 𝔐_H(G)` (`G` infinite).
- `MH_padic`: For `G = Γ: Λ(Γ)/(T) ∈ 𝔐` and `Λ(Γ)/(p) ∈ 𝔐` (`μ`-type), `Λ(Γ) ∉ 𝔐`.

*Needs:* [1.10](#ne1-saturated-ore-set) (The saturated Ore set `S*`); [1.6](#ne1-s-torsion-iff-finitely-generated) (`S`-torsion equals finite generation over `Λ(H)`); [F.1](#ne-foundations-analytic-algebra).

<a id="ne1-torsion-perfect-complexes"></a>
### 1.14 Perfect complexes acyclic after localisation

**Definition.** For a left denominator (Ore) set `S` of a ring `R, Σ_S` is the full subcategory of the category `C^p(R)` of perfect complexes of `R`-modules consisting of the `C` with `R_S ⊗_R C` acyclic. `Σ_S` contains 0, is closed under quasi-isomorphism, shifts and extensions; by §1.12, `C ∈ Σ_S` iff every `H^i(C)` is `S`-torsion. For `R = Λ(G)` and `S = S*`, a module in `𝔐_H(G)` of finite projective dimension, viewed as a complex, lies in `Σ_{S*}`.

See Burns–Venjakob, §2.2, p. 6 (arXiv v2): The definition.

The hypotheses are as follows. `C^p(R)`: bounded complexes of finitely generated projective `R`-modules, up to quasi-isomorphism (GeneralAlgebraicKTheory §§5.7, 6.3, 6.19).

*Construction.*

1. Define `Σ_S` by the acyclicity condition; check (i) `0 ∈ Σ_S`, (ii) quasi-isomorphism invariance (`R_S ⊗ −` preserves quasi-isomorphisms of perfect complexes), (iii) shifts, (iv) extensions (long exact sequence after the exact functor `R_S ⊗ −`).
2. The cohomological description follows from flatness.

API: `SigmaS` (`Σ_S ⊆ C^p(R), R_S ⊗ C` acyclic); `mem_SigmaS_iff` (`C ∈ Σ_S` iff every `H^i(C)` is `S`-torsion); `SigmaS.of_quasiIso` (Closed under quasi-isomorphism); `SigmaS.extension` (Closed under shifts and extensions).

**Checks.**

- `SigmaS_zero`: `0 ∈ Σ_S`.
- `SigmaS_cone`: The `cone` of multiplication by `s ∈ S` on `R` lies in `Σ_S`.
- `not_SigmaS_R`: `R` (in degree 0) is not in `Σ_S` unless `R_S = 0`.
- Burns–Venjakob need a weaker condition (iv′) for subcategories not closed under extensions; `Σ_S` itself satisfies (iv).

*Needs:* [1.12](#ne1-ore-localization-flat) (Ore localisation is flat); [1.11](#ne1-canonical-localization) (The canonical localisation `Λ(G)_S`); [1.13](#ne1-category-mhg) (The category `𝔐_H(G)`); GeneralAlgebraicKTheory §§5.7, 6.3, 6.19; Mathlib `HomologicalComplex`.

### Examples

- For `Γ = ℤ_p` and `H = 1, S = Λ(Γ) ∖ pΛ(Γ), T ∈ S, p ∉ S, S* = Λ(Γ) ∖ {0}`, and `Λ(Γ)_S = Λ(Γ)_{(p)}` is not the fraction field (Worked examples, example 1).
- For `G = Γ × ℤ/p` and `J = 1, V(G/J) ≅ 𝔽_p((T))[ε]/(ε^p)` has nilpotents, and the prime radical of `Ω(G)` is generated by `σ − 1` (§§1.3, 1.9).

### Dependencies

Layer 0 of this roadmap; the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; GeneralAlgebraicKTheory §§5.7, 6.3, 6.19, TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7; Mathlib `FractionRing`, `HomologicalComplex`, `IsPGroup`, `LinearMap.injective_iff_surjective`, `Module.Finite`, `OreLocalization`, `OreLocalization.OreSet`, `OreLocalization.numeratorHom_inj`, `OreLocalization.numeratorRingHom`, `OreLocalization.numerator_isUnit`, `OreLocalization.ore_right_cancel`, `OreLocalization.universalHom`, `OreLocalization.universalHom_unique`, `Submodule.span`.

## Layer 2: Relative `K`-theory and characteristic elements

The `K`-theory spectrum and the determinant functor of a ring are GeneralAlgebraicKTheory's. This layer fixes the Iwasawa-relative comparison and the boundary sign `∂[s] = [Λ/Λs]`, defines characteristic elements, and proves surjectivity of the boundary. Without `p`-torsion the module and perfect-complex descriptions of the relative group agree by finite global dimension; with `p`-torsion the perfect complexes and relative triples are used directly (§2.15). Modules `TauCeti/NumberTheory/NoncommIwasawa/CharacteristicElement` and `.../LocalizedK1`.

<a id="ne2-k0-complete-quotient"></a>
### 2.1 `K₀` is insensitive to complete ideals

**Lemma.** If `I` is a two-sided ideal of `R` and `R` is `I`-adically complete and separated and `I⊆Jac(R)`, then `K₀(R) → K₀(R/I)` is an isomorphism; in particular `K₀(Λ(G)) ≅ K₀(Ω(G)) ≅ K₀(𝔽_p[G/U]) ≅ K₀(𝔽_p[G/U]/Jac)` for `U` open normal pro-`p`.

See CFKSV, §4, Lemma 4.1, p. 187: Lemma 4.1.

The hypotheses are as follows. `I`-adic completeness and separatedness; `I` a two-sided ideal contained in `Jac(R)`. For the displayed specializations, identify the appropriate complete ideals before applying the theorem.

*Proof.*

1. Surjectivity: idempotent matrices lift modulo `I` (completeness).
2. Injectivity: lift stable isomorphisms between reductions of finite projectives, not merely projectives reducing to free modules. Lift the corresponding inverse maps; their composites are congruent to the identity modulo `I` and hence invertible by the complete geometric series. Thus isomorphism classes and stable relations lift.
3. These are the targets `idempotentLift_completeIdeal` (an idempotent matrix modulo `I` lifts to an idempotent matrix, by successive correction `e ↦ 3e² − 2e³` along the `I`-adic filtration and passage to the limit), `idempotentLift_conjugate` (two idempotent lifts of the same idempotent are conjugate by a matrix `≡ 1 mod I`) and `k0_completeIdeal_equiv`, deduced through the matrix-idempotent description of `K₀` in §F.0. The complete-ideal `K₀` comparison is constructed here from the supplied matrix-idempotent description; this subsection owns it. In the displayed chain choose `U` open normal uniform: the ideal of `Ω(G)` generated by the `u − 1` defines an equivalent complete topology, and the radical of the finite-dimensional final quotient is nilpotent.

**Checks.**

- `R = ℤ_p, I = pℤ_p: K₀(ℤ_p) = ℤ = K₀(𝔽_p)`.
- `R = ℤ_p[ℤ/ℓ]` with `ℓ ≠ p` a prime, `I = pR: R` is a product of `r` unramified discrete valuation rings and `R/I` a product of `r` finite fields, `r` the number of irreducible factors of `x^ℓ − 1` over `𝔽_p`, so both `K₀` are `ℤ^r`.
- `R = ℤ_p[[T]]` with `I = (T)` (complete, `I ⊆ Jac`): `K₀(R) = K₀(ℤ_p) = ℤ`. For the non-complete `R = ℤ_(p)[T]` and `I = (T), I ⊄ Jac(R)` and idempotent lifting is not available from this theorem.

*Needs:* §F.0; [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality); Mathlib `Ideal.Quotient.mk`, `Matrix`.

<a id="ne2-k0-finite-level-injective"></a>
### 2.2 `K₀(Λ(G))` injects into `K₀` of a finite level

**Lemma.** For `P` an open normal pro-`p` subgroup of `G, K₀(Λ(G)) → K₀(ℤ_p[G/P])` is injective.

See CFKSV, §3, Lemma 3.5, p. 174: Lemma 3.5.

The hypotheses are as follows. `P` pro-`p` (Nakayama over `Λ(P)`).

*Proof.*

1. Lift a `ℤ_p[Δ]`-isomorphism `M/IM ⊕ ℤ_p[Δ]^r ≅ N/IN ⊕ ℤ_p[Δ]^r` to `β : M ⊕ Λ^r → N ⊕ Λ^r` (`M` projective).
2. `coker(β)_P = 0` gives `coker β = 0` by Nakayama; `H₁(P, N ⊕ Λ^r) = 0` gives `ker(β)_P = 0`, hence `ker β = 0`.

**Checks.**

- `P` must be pro-`p` for Nakayama.
- `G = P = Γ: K₀(Λ(Γ)) = ℤ → K₀(ℤ_p) = ℤ` is the identity on ranks.

*Needs:* [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.2 (topological Nakayama); [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality).

<a id="ne2-k0-representation-injective"></a>
### 2.3 Detecting `K₀(Λ(G))` by characters of a finite quotient

**Lemma.** With `Δ = G/P` for `P` open normal pro-`p`, and `L ⊃ ℚ_p` a finite splitting field of `Δ`, the composite `λ : K₀(Λ(G)) → K₀(ℤ_p[Δ]) → K₀(ℚ_p[Δ]) → K₀(L[Δ]) ≅ ⊕_{ρ ∈ Irr(Δ)} K₀(L) ≅ ⊕_ρ ℤ` is injective, and `λ([M])_ρ = j(τ[tw_{ρ∨}(M)])` with `τ[U] = Σ_i (−1)^i [H_i(G, U)]` for projective `M`, and for arbitrary finitely generated `M` when `G` has no element of order `p` (finite global dimension).

See CFKSV, §3, proof of Proposition 3.4, p. 175: Injectivity of `λ`. CFKSV, §3, (29), p. 176: The formula for `τ`.

The hypotheses are as follows. Uses the Cartan–Brauer injectivity `K₀(ℤ_p[Δ]) → K₀(ℚ_p[Δ])` and `K₀(ℚ_p[Δ]) → K₀(L[Δ])` (Serre, *Linear representations of finite groups*, §16, Theorem 34, Corollary 2, and §14.6).

*Proof.*

1. Compose the four maps; `λ₁` is injective by §2.2, `λ₂, λ₃` by the representation theory of finite groups, `λ₄` is an isomorphism (Wedderburn and Morita). The coefficient step is the target `cartanBrauer_injective`: the map from projective `ℤ_p[Δ]`-modules to their rational characters is injective, through the Cartan matrix and characteristic-zero lifts of modular characters (Serre, §16, Theorem 34, Corollary 2). Character coordinates are normalized by Morita multiplicity, not by the dimension of the simple matrix block, so the regular representation has multiplicity `dim ρ` at `ρ`; when computed from diagonal twists, the coordinate at `ρ^∨` of a projective `M` is `dim_L H₀(G, tw_ρ(M)_L)`.
2. Compute `τ` on modules through a finite projective resolution: `τ[U] = Σ(−1)^i[Tor_i^{Λ(G)}(𝒪, U)] = Σ(−1)^i[H_i(G, U)]`, and similarly `ε` with `Λ(Γ)` and `H_i(H, −)`.

**Checks.**

- At `p=7`, `G=C₃×ℤ₇`, `P=ℤ₇` and `M=e_χΛ(G)` for nontrivial `χ`, the `χ`-coordinate is `1`. Twisting by `χ∨` gives that coinvariant rank; twisting by `χ` gives zero.

- The Euler-characteristic formula needs finite global dimension (no element of order `p`).
- For `Δ = 1` the map is the rank map `ℤ → ℤ`; for `Δ = C_p, ℤ_p[C_p]` is local with `K₀ = ℤ` and its regular character is nonzero after rationalization although reduction modulo `p` is not semisimple.
- For a one-dimensional character `χ, (χ ⊗ ρ)_G ≠ 0` exactly for `ρ = χ⁻¹`; labelling the coordinate by `χ` instead of its contragredient detects the wrong coordinate.

*Needs:* §F.0; [2.2](#ne2-k0-finite-level-injective) (`K₀(Λ(G))` injects into `K₀` of a finite level); [0.11](#ne0-iwasawa-finite-global-dimension) (Finite global dimension without `p`-torsion).

<a id="ne2-homology-torsion"></a>
### 2.4 `H`-homology of modules in `𝔐_H(G)`

**Lemma.** For `M ∈ 𝔐_H(G)` the homology groups `H_i(H, M) = Tor_i^{Λ(G)}(Λ(Γ), M)` are finitely generated torsion `Λ(Γ)`-modules for all `i ≥ 0`, and vanish for `i ≥ d` if `G` has no element of order `p`.

See CFKSV, §3, Lemma 3.1, p. 171: Lemma 3.1.

The hypotheses are as follows. `cd_p(H) = d − 1` when `H` has no `p`-torsion.

*Proof.*

1. Finite generation over `Λ(Γ): Tor` over `Λ(G)` of finitely generated modules.
2. `M(p)` is killed by `p^t`, so `H_i(H, M(p))` is torsion; `M_f = M/M(p)` is finitely generated over `Λ(H)`, so `H_i(H, M_f)` is a finitely generated `ℤ_p`-module, hence torsion over `Λ(Γ)`; long exact sequence.

**Checks.**

- Test: `G = Γ, H = 1: H₀(1, M) = M` is a torsion `Λ(Γ)`-module and higher homology vanishes.

*Needs:* [1.13](#ne1-category-mhg) (The category `𝔐_H(G)`); [1.10](#ne1-saturated-ore-set) (The saturated Ore set `S*`); [F.1](#ne-foundations-analytic-algebra).

<a id="ne2-twist-preserves-mhg"></a>
### 2.5 Twisting preserves `𝔐_H(G)`

**Lemma.** For a continuous `ρ : G → GL_n(𝒪)` and `M ∈ 𝔐_H(G)`, the diagonal twist `tw_ρ(M) = (M ⊗ 𝒪) ⊗_𝒪 𝒪ⁿ` lies in `𝔐_H(G)`.

See CFKSV, §3, Lemma 3.2, p. 171: Lemma 3.2.

The hypotheses are as follows. `𝒪` finite free over `ℤ_p`.

*Proof.*

1. `M ⊗ 𝒪 ∈ 𝔐_H(G)`; `tw_ρ` of the `p`-power torsion is killed by the same power of `p`.
2. `tw_{ρ|H}(Λ(H)^m)` is free of finite rank over `Λ(H)`, so `tw_ρ(M_f)` is finitely generated over `Λ(H)`.

**Checks.**

- Characteristic elements are evaluated at twists in Layer 3; for `ρ` trivial, `tw_ρ(M) = M ⊗ O`.

*Needs:* [1.13](#ne1-category-mhg) (The category `𝔐_H(G)`); [0.14](#ne3-twisted-module) (Twisting modules by a representation).

<a id="ne2-canonical-localization-semilocal"></a>
### 2.6 `Λ(G)_S` is semilocal, `Λ(G)_{S*}` need not be

**Theorem.** `Λ(G)_S` is a semilocal ring: for `J ≤ H` pro-`p`, open in `H` and normal in `G`, the image `S_J` of `S` consists of all nonzero divisors of `Ω(G/J), Ω(G/J)_{S_J}` is Artinian (`= Ω(G/J)` localised at the central `Ω(Π) ∖ 0`), and the kernel of `Λ(G)_S → Ω(G/J)_S` lies in the Jacobson radical. For `G = ℤ_p²` with `H` one factor, `Λ(G)_{S*} = ℤ_p[[U, V]]_{(p,U)}[1/p]` has infinitely many maximal ideals.

See CFKSV, §4, Proposition 4.2, p. 188: Proposition 4.2. CFKSV, §4, p. 189: The counterexample.

The hypotheses are as follows. `G, H` as in Layer 1.

*Proof.*

1. Lemma 4.3: every `s ∈ S_J` is integral over the central `Ω(Π)` with nonzero constant term, so invertible after inverting `Ω(Π) ∖ 0`; `Ω(G/J)_Σ` is finite-dimensional over `R(Π)`.
2. For `x = s⁻¹θ` with `θ ∈ ker ψ_J, s − θ ∈ S`, so `1 − x = s⁻¹(s − θ)` is a unit: `ker ⊂ Jac`.

**Checks.**

- `G = ℤ_p²` with `H` one factor: `Λ(G)_{S*}` has infinitely many maximal ideals, so the theorem does not extend to `S*`.

*Needs:* [1.11](#ne1-canonical-localization) (The canonical localisation `Λ(G)_S`); [1.4](#ne1-canonical-set-left-criteria) (Criteria for membership in `S` (left)); [1.3](#ne1-quotient-total-algebra) (The algebra `V(G/J)`); [1.2](#ne1-central-zp-subgroup) (A central copy of `ℤ_p` in `G/J`).

<a id="ne2-localized-k1"></a>
### 2.7 The localized `K₁` of Fukaya and Kato

**Construction.** For a full subcategory `Σ` of `C^p(R)` containing 0 and closed under quasi-isomorphism, shifts and direct sums ((i)–(iii), (iv′)), `K_1(R, Σ)` is the abelian group generated by symbols `[C, a]` with `C ∈ Σ` and `a : 1_R → d_R(C)`, subject to `[0, id] = 1, [C′, d_R(f)∘a] = [C, a]` for quasi-isomorphisms `f, [C, a] = [C′, a′][C″, a″]` for short exact sequences in `Σ`, and `[C[1], a^{−1}] = [C, a]^{−1}` (Definition 2.5, after Fukaya–Kato). For a left denominator set `S` and `Σ_S` the complexes with `R_S ⊗ C` acyclic, `[C, a] ↦ θ_{C,a}` (the composite `1 → d(R_S ⊗ C) → 1`) defines `ch_{R,Σ_S} : K_1(R, Σ_S) → K_1(R_S)`, and any `Σ ⊆ Σ_S` gives `ch_{R,Σ} : K_1(R, Σ) → K_1(R_S)`. The map `ch_{R,Σ_S}` is an isomorphism (Fukaya–Kato Proposition 1.3.7); this is the target `chLocalized_bijective`, proved in §2.9 once the localization sequence is available.

See Burns–Venjakob, §2.2, Definition 2.5, Remark 2.6 and the isomorphism `ch_{R,Σ_S}`, pp. 5–6 (arXiv v2): Definition 2.5 (Fukaya–Kato, weakened to (iv′)), Remark 2.6 and the isomorphism `ch_{R,Σ_S}`. Muro–Tonks–Witte, *On determinant functors and `K`-theory*, arXiv:1006.5399 (current version), Definition 1.5.1, pp. 17–18, Theorem 1.5.4, p. 19, and Theorem 1.6.3, p. 23: the universal determinant functor of a Waldhausen category is presented by objects, weak equivalences and cofiber sequences, and its target is the 1-type of Waldhausen `K`-theory.

The hypotheses are as follows. `R` a ring; `S` a left denominator set; `Σ` as stated. When `Σ` satisfies (iv) (closure under extensions) the definition is Fukaya–Kato's.

*Construction.*

1. The determinant. Construct `noncommutativeDeterminant`: Deligne's Picard groupoid `V(R)` of virtual objects of the exact category `P(R)` of finitely generated projective `R`-modules, realized as the fundamental groupoid of the `K`-theory space of `P(R)` (GeneralAlgebraicKTheory §§5.7, 5.11) with the symmetric monoidal structure from its delooping, so that `π₀V(R) = K₀(R)` and `Aut(1_R) = π₁ = K₁(R)` (GeneralAlgebraicKTheory §3.14 with §F.0); `d_R` : (`P(R)`, isomorphisms) `→ V(R)` is the universal determinant functor. Extend `d_R` to bounded perfect complexes by `d_R(C) = ⊗_i d_R(C^i)^((−1)^i)` and prove the properties `detPerfect_quasiIso` (a quasi-isomorphism induces an isomorphism, compatibly with composition), `detPerfect_exact` (additivity on short exact sequences of complexes), `detPerfect_acyclic` (the acyclicity trivialization), `detPerfect_shift` `(d(C[1]) ≅ d(C)⁻¹)`, `detPerfect_cohomology` (`d(C) ≅ ∏ d(H^i(C))^((−1)^i)` when every `H^i(C)` is perfect) and `detPerfect_baseChange` (along every ring map, compatible with all of the above). Additivity and quasi-isomorphism invariance come from Waldhausen additivity (GeneralAlgebraicKTheory §5.10) and the Gillet–Waldhausen comparison (§6.19); the cohomology formula from additivity along the good truncation filtration. Equivalently, by Muro–Tonks–Witte Theorems 1.5.4 and 1.6.`3, d_R` on strictly perfect complexes is the universal determinant functor of the Waldhausen category `C^b(P(R))` (quasi-isomorphisms, degreewise split injections), whose target is the 1-type of `K(R)`. Over a commutative ring there is a symmetric monoidal determinant-line functor from `V(R)` to the graded lines of PadicMeasuresIwasawaAlgebras §5.1, carrying `d_R(C)` to its usual determinant. This does not identify `V(R)` with the category of graded lines for an arbitrary commutative ring: that would discard the information in `K₀(R)` and `K₁(R)` not detected by rank, determinant and units (Burns–Venjakob §2.1, pp. 4–5, recalling Fukaya–Kato §1.2; Deligne, *Le déterminant de la cohomologie*, §4).
2. Relation (3) follows from (0)–(2) (Remark 2.6): apply (2) to `C ↣ Cone(id_C) ↠ C[1]` and (1) to the quasi-isomorphism `Cone(id_C) → 0`.
3. `ch_{R,Σ}` is well defined because each relation is respected by base change to `R_S` and acyclicity. Every symbol can be brought to one term: `[C,a][C′,a′]=[C⊕C′,a⊗a′]` by (2) for the split sequence, and inverses are shifts by (3). Hence every element of `K_1(R,Σ)` is a single symbol `[C,a]` when `Σ` is closed under sums and shifts. The bijectivity of `ch_{R,Σ_S}` is proved in §2.9, step 5, by comparing `K_1(R,Σ_S)` with the fibre of the universal determinant functors along `Σ_S ⊆ C^b(P(R))`. No inverse is built from cleared denominators of matrices. For a matrix `g=s⁻¹h` over `R_S`, with both integral matrices invertible over `R_S` and represented by right-acting matrices on free left modules, the preimage of `[g]` is then `[C_s,can][C_h,can]⁻¹`, recorded as a Check. The weaker closure condition (iv′) is enough for the semisimple subcategory of Layer 7; relations involving an exact sequence apply only when all three terms belong to `Σ`.

API: `LocalizedK1` (`K_1(R, Σ)` by generators `[C, a]` and relations (0)–(3)); `LocalizedK1.mk` (The class `[C, a]`); `LocalizedK1.mk_shift` `([C[1], a^{−1}] = [C, a]^{−1})`; `LocalizedK1.mk_sum` `([C,a][C′,a′]=[C⊕C′,a⊗a′])`; `chLocalized` (`ch_{R,Σ} : K_1(R, Σ) → K_1(R_S)` for `Σ ⊆ Σ_S`); `chLocalized_bijective` (`ch_{R,Σ_S}` is an isomorphism; §2.9); `noncommutativeDeterminant` and the `detPerfect_*` properties of step 1.

**Checks.**

- `two_term`: For `R=ℤ_p[[T]], C=[R --f→ R]` in degrees `−1,0` with `f∈S` and the identity determinant trivialization, `ch([C,id])=f⁻¹`. Hence `∂ch=−[C]=−[R/Rf]`.
- `zero_complex`: `[0, id] = 1`.
- `cone_identity`: for `C ∈ Σ_S, [Cone(id_C), acyclicity] = [0, id] = 1` by (1) for `Cone(id_C) → 0` and (0). Relation (2) for `C ↣ Cone(id_C) ↠ C[1]` then gives `[C,a][C[1],a′]=1` for compatible trivializations, which is (3). A definition that drops (1) for acyclic complexes would leave `[Cone(id_C),acyclicity]` unconstrained.
- `matrix_inverse`: with the orientation of `two_term`, `ch([C_f,can])=f⁻¹` for `C_f=[R --f→ R]`. So for `g=s⁻¹h` the class with `ch` equal to `g` is `[C_s,can][C_h,can]⁻¹`, and the opposite order gives `g⁻¹`. For `R=ℤ_p[[T]], H=1, h=T` and `s=T+p` (both in `S`), `ch([C_(T+p),can][C_T,can]⁻¹)=T/(T+p)`.
- `not_extension_closed`: `Σ^{ss}` satisfies (iv′) but not (iv), which is why Burns–Venjakob weaken (iv) to (iv′).
- For `Σ_{A·}` use the smallest subcategory with (i)–(iii) and (iv′) containing `A·`: the extension-closed version need not lie in `Σ^{ss}` (correction `E11`).

*Needs:* GeneralAlgebraicKTheory §§3.14, 5.7, 5.10, 5.11, 6.19; §F.0; PadicMeasuresIwasawaAlgebras §5.1 (commutative specialization); [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem); [1.14](#ne1-torsion-perfect-complexes) (Perfect complexes acyclic after localisation).

<a id="ne2-relative-perfect-class"></a>
### 2.8 Relative classes of torsion perfect complexes

**Construction.** For a regular two-sided Ore localization `Λ→Λ_S, K₀(Λ,Λ_S)` is represented by triples `(P,α,Q)`, with finitely generated projectives `P,Q` and `α:Λ_S⊗P≅Λ_S⊗Q`, modulo stabilization, direct-sum and composition relations. Equivalently it is `K₀` of perfect complexes acyclic over `Λ_S`. Fix `∂[s]=[Λ/Λs]` for a regular denominator `s`. For a perfect torsion `C` set `[C]=Σ_i(−1)^i[H^i(C)]` whenever the cohomology modules have finite projective resolutions. `Cone` triangles obey `[Cone(f)]=[D]−[C]` for `f:C→D`. Burns–Venjakob’s characteristic map uses `∂ch(C,a)=−[C]`.

See Kakde, §2.2, pp. 6–8, relative triples and Lemma 5: Gives the relative triple model and boundary formula even when `G` has `p`-torsion. Burns–Venjakob, §2.2, pp. 6–7; Proposition 3.8, pp. 10–11: Determines the opposite sign of the characteristic map associated with a determinant trivialization.

The hypotheses are as follows. `Λ` noetherian; `S` a regular two-sided Ore set. For the displayed cohomology sum, each `H^i(C)` has a finite projective resolution.

*Construction.*

1. The relative group in the triple model is `K₀^cl(T)` of the scalar-extension functor `T : P(Λ) → P(Λ_S)` (GeneralAlgebraicKTheory §4.15), with boundary `δ` (§4.16); §8.7 there identifies it with `π₀` of the homotopy fibre of `K(Λ) → K(Λ_S)`.
2. Apply the perfect-localization fibre comparison proved independently in §2.9. Its map to the homotopy fibre, followed by the inverse of the supplier's triple/`fibre` comparison, defines `RelativePerfectClass.ofComplex`. This gives quasi-isomorphism invariance, homotopy invariance and exact-sequence additivity. For an explicit representative choose a splitting of the localized acyclic complex and the resulting odd-to-even isomorphism `α_C`; the fibre construction proves that its triple is independent of that choice.
3. Prove `relativeTriples_equiv_perfectTorsion` by composing these two isomorphisms on `π₀`. This constructs the inverse for arbitrary projectives and noncentral denominators. A formula using left multiplication by `s` on a left module `Q` is unavailable: `q↦sq` need not be `Λ`-linear, and a projective summand has no chosen free basis on which to clear matrices. Only in the free case may denominators be cleared using actual `Λ`-linear maps represented by right-acting matrices; direct summands are handled by the fibre comparison.
4. Fix signs on the one-term torsion module and its two-term resolution: the left-linear map `r_s:x↦xs` gives `[Λ →^{r_s} Λ]` in degrees `−1,0` with class `[Λ/Λs]=∂[s]`. Transport additivity and shift through the comparison, and prove `relativePerfectClass_baseChange` for exact derived coefficient and localization squares. The identity `∂ch(C,a)=−[C]` follows afterwards from §2.7; it is not an input to the comparison.
API: `RelativePerfectClass.ofTriple` (The class of `(P,α,Q)`, with composition and direct-sum relations); `RelativePerfectClass.ofComplex` (The relative class of an `S`-acyclic perfect complex, invariant under quasi-isomorphism); `RelativePerfectClass.triangle` (For `C→D→E→C[1], [D]=[C]+[E]`; a shift negates the class); `RelativePerfectClass.boundary_sign` (`∂[s]=[Λ/Λs]`, while `∂ch(C,a)=−[C]`); `RelativePerfectClass.baseChange` (An exact derived coefficient/localization square carries `[C]` to its derived base-change class).

**Checks.**

- `relative_perfect_class_1`: For `C=[Λ --T→ Λ]` in degrees `−1,0, [C]=[Λ/T], ∂[T]=[C]`, and `ch(C)=T⁻¹`.
- `relative_perfect_class_2`: Shifting `C` once negates its relative class and inverts `ch(C)`, detecting the boundary convention.
- `relative_perfect_class_3`: For `f:C→D`, the `cone` has `[Cone(f)]=[D]−[C]`; the identity `cone` has zero class.
- `relative_perfect_class_4`: For `Λ=ℤ_p[C_p][[T]]`, the perfect complex `[Λ --T→ Λ]` is admitted even though the trivial `𝔽_p`-module has no finite projective resolution.
- Over `Λ=M₂(ℤ_p[[T]])`, take `s=diag(T,1)` and `r=e₁₂`. Then `sr=T e₁₂` but `rs=e₁₂`, so left multiplication by the regular `s` is not a map of left `Λ`-modules. Right multiplication is left-linear. This distinguishes the actual fibre construction from scalar clearing on an arbitrary projective.

*Needs:* [1.14](#ne1-torsion-perfect-complexes) (Perfect complexes acyclic after localisation); [2.9](#ne2-localization-sequence) (the determinant-independent perfect-localization comparison); GeneralAlgebraicKTheory §§4.15–4.17, 8.1, 8.7. The characteristic-map sign comparison additionally uses §2.7 after the relative model has been constructed.

<a id="ne2-localization-sequence"></a>
### 2.9 The localisation sequence for the canonical Ore set

**Theorem.** For `Λ=ℤ_p[[G]]` and the regular two-sided canonical denominator set `S` (or `S*`), the perfect-complex localization theorem gives `K₁(Λ)→K₁(Λ_S)→∂K₀(Λ,Λ_S)→K₀(Λ)→K₀(Λ_S)`. The relative group is modeled by `S`-acyclic perfect complexes. If `G` has no `p`-torsion, finite global dimension identifies it with `K₀` of finitely generated `S`-torsion modules, or with `K₀(𝔐_H(G))` for `S*`. The module identification requires that extra hypothesis; the relative-perfect sequence does not.

See CFKSV, §3, (24), p. 174: The localisation sequence (24). For the perfect-complex comparison use Neeman–Ranicki, *Noncommutative localisation in algebraic `K`-theory `I*`, Definition 0.4 and Theorems 0.5, 0.7, pp. 1388–1390; Theorems 2.3–2.4, pp. 1395–1396 (arXiv:math`/0410620`): localization, its idempotent completion and cofinality. For step 5 use Muro–Tonks–Witte, arXiv:1006.5399, Definition 1.5.1 and relation `(R9)`, pp. 17–18, Theorem 1.5.4, p. 19, and Theorem 1.6.3, p. 23. The hypotheses are verified below, rather than inferred from an abelian-category localization sequence.

The hypotheses are as follows. `G` compact `p`-adic analytic; `H` closed normal with `G/H≅ℤ_p`; canonical regular Ore set `S` or its `p`-saturation. Absence of `p`-torsion is assumed only for replacing relative perfect classes by all finitely generated torsion modules.

*Proof.*

1. First prove the generic target `leftDenominator_perfectLocalization` for a ring A and a left denominator set `S`. Let `B=S⁻¹A` and let `σ` consist of the left-linear maps `r_s:A→A, x↦xs`. The Ore universal property identifies `B` with the universal `σ`-inverting ring. Localization is flat as a right `A`-module, and multiplication `B⊗_A B→B` is an isomorphism; hence `Tor_i^A(B,B)=0` for `i>0`. The regular two-sided Iwasawa case uses §1.12; no arithmetic dimension theorem enters this step.
2. Let `R_S` be the thick subcategory of perfect `A`-complexes generated by the cones of `r_s`. Neeman–Ranicki Theorems 0.5 and 0.7 identify the idempotent completion of `Perf(A)/R_S` with `Perf(B)`, and `K(R_S)` with the connective cover of the fibre of `K(A)→K(B)`. In particular the map is an isomorphism on `π_i` for `i≥0`, including the relative `K₀` used here; surjectivity of `K₀(A)→K₀(B)` is not assumed. Derived localization identifies `R_S` with all perfect complexes becoming acyclic over `B`. This is the target `orePerfectLocalization`, proved from the fibration and cofinality theorems of GeneralAlgebraicKTheory §§6.3, 6.18 and the derived localization just described.
3. Independently, GeneralAlgebraicKTheory §§4.15–4.17 and 8.7 identify the triple group with `π₀` of that same fibre and give its five-term exact sequence. Only after steps 1–2 is this identified with the perfect-torsion model in §2.8. Thus the construction order is this generic fibre comparison, the relative class of §2.8, then the determinant characteristic-map comparison of §2.7; none of those comparisons is assumed to prove itself.
4. With no `p`-torsion, use the resolution theorem (GeneralAlgebraicKTheory §4.6) and finite global dimension (§0.11) to compare torsion complexes with the Grothendieck group of `S`-torsion modules, or of `𝔐_H(G)` for `S*`. Every finitely generated module then has a finite resolution by finitely generated projectives, so the resolution theorem applies; steps 1–3 do not use this.
5. `chLocalized_bijective` (§2.7; Fukaya–Kato Proposition 1.3.7). Let `W` be `Σ_S` viewed as a Waldhausen category: strictly perfect complexes of finitely generated projective `A`-modules that become acyclic over `B`, with quasi-isomorphisms as weak equivalences and degreewise split injections with cokernel in `W` as cofibrations (`Σ_S` is closed under extensions). Let `V(W)` be the target of its universal determinant functor `det_W`, the Picard groupoid of the stable quadratic module `D_*(W)` presented by objects, weak equivalences and cofiber sequences (Muro–Tonks–Witte Definition 1.5.1 and Theorem 1.5.4); by their Theorem 1.6.3 it is the 1-type of `K(W)`. Inclusion gives `i : V(W) → V(A)`, the 1-type of `K(A)` by Gillet–Waldhausen. `(a)` Let `𝒯` be the groupoid of pairs `(x, a)`, with `x` in `V(W)` and `a : 1 → i(x)` in `V(A)`; a morphism `(x,a)→(y,b)` is a morphism `m : x → y` with `i(m)∘a = b`. Then `π₀𝒯` is an abelian group under `⊗`, and it sits in an exact sequence `K₁(W) → K₁(A) → π₀𝒯 → K₀(W) → K₀(A)`. Step 2 identifies `K(W)` with the connective cover of the fibre of `K(A) → K(B)`. The five lemma on the two long exact sequences gives an isomorphism `θ : π₀𝒯 ≅ K₁(B)`. It sends `(x, a)` to the composite of `B ⊗` a with the null-homotopy of `W → V(B)` by the weak equivalences `B ⊗ C → 0`, which is the acyclicity trivialization. `(b) Φ : K₁(A, Σ_S) → π₀𝒯, [C, a] ↦ (det_W(C), a)`, respects (0) by the unit, (1) by the weak-equivalence generators and (2) by the cofiber-sequence generators, and `θ∘Φ = ch_{A,Σ_S}`. It is surjective: every object of `V(W)` is isomorphic to `det_W` of one complex, using the direct-sum cofiber sequences for products and `C ↣ Cone(id_C) ↠ C[1]` with `Cone(id_C) → 0` for inverses. `(c) Φ` is injective. For each object `x` of `V(W)`, fix a normal form `n_x : x → det_W(N(x))`, where `N(x)` is the direct sum of the objects in a word for `x`, with shifts for the inverted letters. Put `Ψ(x, a) = [N(x), i(n_x)∘a]`. Then `Ψ∘Φ = id`, because `N(det_W C) = C`. It remains to show that `Ψ` is constant along every morphism of `𝒯` and additive. Every morphism of `V(W)` is a composite of tensor products of identities with a generator of `D_*(W)`: a weak equivalence, a cofiber sequence, or a bracket. By relation `(R9)` of Muro–Tonks–Witte a bracket is a difference of two cofiber-sequence generators. For a weak equivalence `w` placed between summands `Y, Y′`, relation (1) for `id_Y ⊕ w ⊕ id_(Y′)` gives the invariance. For a cofiber sequence `X ↣ X₂ ↠ X₃` in the same position, `X` and `X₃` need not admit trivializations, so (2) is not directly applicable. Add the canonically trivialized objects `X ⊕ X[1]` and `X₃ ⊕ X₃[1]` (canonical by `cone_identity`). Relation (2) then applies both to the stabilized sequence and to the split sequence with the same ends. Relation (2) for a direct sum with a trivialized complement removes the stabilizers again, giving `[Y ⊕ X₂ ⊕ Y′, b] = [Y ⊕ X ⊕ X₃ ⊕ Y′, b′]` for the trivializations matched by the additivity isomorphism. Additivity of `Ψ` is (2) for split sequences. Hence `Φ` is bijective, and `ch_{A,Σ_S} = θ∘Φ` is an isomorphism. This uses only the generic left-denominator comparison of steps 1–2, not the arithmetic of `Λ(G)`.

**Checks.**

- `chLocalized_bijective` in the simplest case: `A=ℤ_p[[T]]` and `S` the powers of `T`. Then `B=A[1/T]`, every element of `K₁(B)=B^×` is `T^n·u` with `u∈A^×`, and its preimage is `[C_T,can]^(−n)[0,u]`. The class `[Λ/T]` of `C_T` in `K₀(W)` maps to 0 in `K₀(A)`, as the exact sequence of step 5`(a)` requires.
-  The module description needs `G` without elements of order `p`; without it the relative group is described by perfect complexes `(Σ_{S*})` only.
- For `G = Γ, H = 1` and `S*`, the sequence is `Λ^× → Q(Γ)^× → K₀(torsion modules) → ℤ → ℤ`, with the last map an isomorphism. For `S` the middle ring is `Λ(Γ)_(p)`, which does not invert `p`; its relative category consists of `S`-torsion modules instead.

*Needs:* [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem); [1.10](#ne1-saturated-ore-set) (The saturated Ore set `S*`); [1.14](#ne1-torsion-perfect-complexes) (the category of `S`-acyclic perfect complexes); [1.12](#ne1-ore-localization-flat) (Ore localisation is flat); GeneralAlgebraicKTheory §§4.15–4.17, 6.3, 6.18, 6.19, 8.7. The additional module comparison uses §0.11 and §1.13, with GeneralAlgebraicKTheory §4.6. Step 5 uses [2.7](#ne2-localized-k1) (The localized `K₁` of Fukaya and Kato).

<a id="ne2-boundary-map"></a>
### 2.10 The boundary map `∂_G`

**Construction.** `∂_G : K₁(Λ(G)_{S*}) → K₀(𝔐_H(G))` is the connecting map of the localisation sequence, normalised so that for `s ∈ S*` (a nonzero divisor, unit in `Λ(G)_{S*}`), `∂_G([s]) = [Λ(G)/Λ(G)s] = [coker(x ↦ xs)]`; it is a homomorphism. Naturality uses denominator-preserving ring maps and derived base change on perfect complexes; the module-valued comparison additionally needs the resolution identification on both sides.

See CFKSV, §4, proof of Lemma 4.6, p. 191: The explicit description of `∂`.

The hypotheses are as follows. The sign convention is the one of CFKSV §4 (`∂(f(a)) = [Coker α]` for right multiplication `α` by `a`). The module-valued target `K₀(𝔐_H(G))` requires `G` without elements of order `p`; without that hypothesis the same construction takes values in `K₀(Λ(G), Λ(G)_{S*})` of §2.8. For `ℤ_p[[T]]` the complex `[R --T→ R]` in degrees `−1, 0` has class `[R/(T)] = ∂T`, its shift has the opposite class, and the determinant characteristic map for a trivialization `1 → d(C)` gives `T⁻¹` instead; this fixes both signs without identifying the two characteristic conventions.

*Construction.*

1. For a matrix `A ∈ GL_n(Λ_{S*}) ∩ M_n(Λ)` acting by right multiplication on `Λⁿ, ∂_G[A] = [coker A]` (Swan's description).
2. Clear Ore denominators to express a general `K₁` class as a quotient of classes of integral matrices invertible after localization. The boundary is the difference of their cokernel classes. Multiplication by a noncentral denominator must respect the chosen left-module/`right`-matrix convention; a single integral matrix modulo integral units does not represent every class.

API: `boundaryMap` `(∂_G : K₁(Λ(G)_{S*}) → K₀(𝔐_H(G)))`; `boundaryMap_unit` (`∂_G[s] = [Λ(G)/Λ(G)s]` for `s ∈ S*`); `boundaryMap_exact` (`ker ∂_G =` image of `K₁(Λ(G))`); `boundaryMap_natural` (For denominator-preserving maps, relative perfect `K₀` and the connecting map commute with derived coefficient extension. Assert a module-valued square only when the requisite resolution identifications exist).

**Checks.**

- `boundaryMap_padic`: `G = Γ, H = 1: ∂[f] = [Λ(Γ)/(f)]` for `0 ≠ f ∈ Λ(Γ)`.
- `boundaryMap_unit_trivial`: `∂[u] = 0` for `u ∈ Λ(G)^×` (degenerate case).
- `boundaryMap_p`: `∂[p] = [Ω(G)] = [Λ(G)/p] ∈ K₀(𝔐_H(G))`.
- `boundaryMap_inverse`: For `G=Γ` and `H=1, ∂[T⁻¹]=−[Λ/T]`. This negative class cannot be represented by a single integral matrix cokernel modulo integral units.
- Fix the sign: `∂[s] = +[Λ/Λs]`; the opposite convention changes characteristic elements to their inverses.

*Needs:* [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set).

<a id="ne2-boundary-surjective"></a>
### 2.11 Surjectivity of `∂_G`

**Theorem.** If `G` has no element of order `p`, then `∂_G : K₁(Λ(G)_{S*}) → K₀(𝔐_H(G))` is surjective; equivalently every `M ∈ 𝔐_H(G)` has `[M] = 0` in `K₀(Λ(G))`.

See CFKSV, §3, Proposition 3.4, p. 174: Proposition 3.4.

The hypotheses are as follows. No element of order `p`.

*Proof.*

1. By exactness, surjectivity of `∂_G` is equivalent to `[M] ↦ 0` in `K₀(Λ(G))`.
2. For each `ρ ∈ Irr(Δ): H_i(H, tw_ρ M)` is `Λ_𝒪(Γ)`-torsion, so `ε[tw_ρ M] = 0` in `K₀(Λ_𝒪(Γ)) ≅ ℤ` (rank), hence `τ = 0`.
3. `λ[M] = ⊕ j(τ[tw_ρ M]) = 0` and `λ` is injective.

**Checks.**

- For `G = Γ` this is the statement that finitely generated torsion `Λ(Γ)`-modules have zero class in `K₀(Λ(Γ)) = ℤ`.

*Needs:* [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set); [2.3](#ne2-k0-representation-injective) (Detecting `K₀(Λ(G))` by characters of a finite quotient); [2.4](#ne2-homology-torsion) (`H`-homology of modules in `𝔐_H(G)`); [2.5](#ne2-twist-preserves-mhg) (Twisting preserves `𝔐_H(G)`).

<a id="ne2-characteristic-element"></a>
### 2.12 Characteristic elements

**Definition.** For `M ∈ 𝔐_H(G)` (`G` without element of order `p`), a characteristic element of `M` is any `ξ_M ∈ K₁(Λ(G)_{S*})` with `∂_G(ξ_M) = [M]`. Characteristic elements exist (§2.11) and two of them differ by an element of the image of `K₁(Λ(G)) → K₁(Λ(G)_{S*})`.

See CFKSV, §3, definition (33), p. 176: The definition. CFKSV, §1, introduction, p. 163: The analogy with the commutative case.

The hypotheses are as follows. A characteristic element is a lift of a class, not a canonical scalar; its ambiguity is exactly the image of `K₁(Λ(G))`.

*Construction.*

1. Existence by surjectivity of `∂_G`; ambiguity by exactness at `K₁(Λ(G)_{S*})`.
2. `characteristicElement_exact`: for `0 → M′ → M → M″ → 0` in `𝔐_H(G), [M] = [M′] + [M″]` in `K₀(𝔐_H(G))`, so `ξ_M′ξ_M″` is a characteristic element of `M` and `ξ_M = ξ_M′ξ_M″` modulo the image of `K₁(Λ(G))`.

API: `IsCharacteristicElement` `(∂_G ξ = [M])`; `exists_characteristicElement` (Existence for `M ∈ 𝔐_H(G)`); `characteristicElement_unique` (Two characteristic elements differ by the image of `K₁(Λ(G))`); `characteristicElement_exact` (`ξ_M = ξ_{M′}ξ_{M″}` up to `K₁(Λ(G))` for `0 → M′ → M → M″ → 0`).

**Checks.**

- `characteristicElement_cyclic`: `M = Λ(G)/Λ(G)s` with `s ∈ S*: ξ_M = [s]`.
- `characteristicElement_zero`: `M = 0: ξ_M ∈` image of `K₁(Λ(G))` (degenerate case).
- `characteristicElement_padic`: `G = Γ: ξ_M` is the characteristic power series of `M` up to `Λ(Γ)^×`.
- Recover the characteristic power series up to `Λ(Γ)^×` for `G = Γ` (§2.14).

*Needs:* [2.11](#ne2-boundary-surjective) (Surjectivity of `∂_G`); [2.10](#ne2-boundary-map) (The boundary map `∂_G`); [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set).

<a id="ne2-units-surject-k1"></a>
### 2.13 Units surject onto `K₁` of the localisations

**Theorem.** If `G` has no element of order `p`, the natural maps `Λ(G)_S^× → K₁(Λ(G)_S)` and `Λ(G)_{S*}^× → K₁(Λ(G)_{S*})` are surjective. Hence characteristic elements can be represented by units of `Λ(G)_{S*}`.

See CFKSV, §4, Theorem 4.4, p. 189: Theorem 4.4. CFKSV, §4, p. 189: The semilocal input.

The hypotheses are as follows. Units of a semilocal ring surject onto `K₁`, for possibly noncommutative rings: ClassicalArithmeticCompletion §7.27 (`GL_n` of a semilocal ring is generated by elementary and diagonal unit matrices); §F.0 gives the same through stable range one.

*Proof.*

1. `Λ(G)_S` is semilocal (Proposition 4.2). By ClassicalArithmeticCompletion §7.27 every matrix in `GL_n(Λ(G)_S)` is a product of elementary matrices and a diagonal unit matrix, and `diag(u,v)` is `diag(uv,1)` times `diag(v⁻¹,v)`, which lies in `E₂`. So the units surject onto `K₁(Λ(G)_S)`.
2. For `S*` (target `units_surject_K1_saturated`; `Λ(G)_{S*}` need not be semilocal, §2.6, so step 1 does not apply). Put `Ω′(G) = Λ(G)_S/pΛ(G)_S`; by exactness of Ore localization it is the localization `Ω(G)_{S′}` at the image `S′` of `S`, which consists of nonzero divisors (§§1.4–1.5, criterion (iii)) and is an Ore set. The finitely generated `p`-power-torsion `Λ(G)_S`-modules have Grothendieck group `K₀(Ω′(G))` by dévissage, so localization gives the exact sequence `K₁(Λ(G)_S) → K₁(Λ(G)_{S*}) → K₀(Ω′(G))` (CFKSV (85), p. 191). By step 1 it suffices that the units of `Λ(G)_{S*}` map onto `K₀(Ω′(G))`. That map is the composite of the surjection `(Λ(G)[1/p])^× → K₀(Ω(G))` through the classes `[P/pP]` of direct summands (Lemmas 4.5–4.6: right multiplication by `a = α(1)` with `α = p` on `P` and 1 on `P′, ∂(a) = [P/pP]`) with `K₀(Ω(G)) → K₀(Ω(G)_{S′})`, which is onto here: `Ω(G)` has finite global dimension by §0.11, as does its Ore localization. The resolution theorem identifies `K₀` with `G₀` on both sides; finite presentations descend through Ore localization, so `G₀(Ω(G))→G₀(Ω(G)_{S′})` is surjective. The argument uses regularity, not noetherianity alone (GeneralAlgebraicKTheory §4.6; CFKSV, pp. 191–192).

**Checks.**

- For `R=(k[x,y]/(xy))_(x,y)` and the powers of `x+y`, `K₀(R)=ℤ` but `K₀(R[1/(x+y)])=ℤ²`; the map is diagonal. This noetherian singular ring fails the regularity hypothesis of the surjectivity argument.

- The second assertion uses the explicit boundary `∂(a) = [coker α]`, fixing the sign convention.
- An integral unit represents a class in the kernel of the boundary. For `R = ℤ_p[[T]]` a regular scalar `T` has boundary `+[R/T]` and `T⁻¹` has `−[R/T]`, so the whole localized `K₁` cannot be modelled by single integral cokernels.

*Needs:* §0.11; GeneralAlgebraicKTheory §4.6; §F.0; [2.6](#ne2-canonical-localization-semilocal) (`Λ(G)_S` is semilocal, `Λ(G)_{S*}` need not be); [2.1](#ne2-k0-complete-quotient) (`K₀` is insensitive to complete ideals); [2.10](#ne2-boundary-map) (The boundary map `∂_G`); [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set); TauCetiRoadmap ClassicalArithmeticCompletion §7.27.

<a id="ne2-commutative-cyclic-comparison"></a>
### 2.14 The commutative one-variable case

**Comparison.** For `G = Γ ≅ ℤ_p` and `H = 1: S* = Λ(Γ) ∖ {0}, Λ(Γ)_{S*} = Q(Γ)` is the fraction field, `K₁(Q(Γ)) = Q(Γ)^×, K₀(𝔐_H(G))` is the Grothendieck group of finitely generated torsion `Λ(Γ)`-modules, and `∂` sends `f/g` to `[Λ/f] − [Λ/g]`. A characteristic element of a torsion module `M` is its characteristic power series `char(M)` (PadicMeasuresIwasawaAlgebras §§4.2, 4.6) up to `Λ(Γ)^×`.

See CFKSV, §2–3, p. 170: The commutative specialisation.

The hypotheses are as follows. `Λ(Γ) ≅ ℤ_p[[T]]` is a regular local ring of dimension 2; `K₁(Λ(Γ)) = Λ(Γ)^×`.

*Proof.*

1. `Q(Γ)` is a field, so `K₁ =` units by the determinant.
2. For `M ≅ ⊕Λ/(f_i)` up to pseudo-isomorphism, `[M] = Σ[Λ/f_i]`: a pseudo-null (finite) module has class 0 in `K₀(𝔐), e`.`g`. `0 → Λ/p →^T Λ/p → 𝔽_p → 0` gives `[𝔽_p] = 0`; then `∂(∏ f_i) = [M]`.

**Checks.**

- The ambiguity `K₁(Λ(Γ)) = Λ(Γ)^×` is exactly 'up to units'.
- Check a pseudo-null (finite) module: its characteristic element is a unit.

*Needs:* [2.12](#ne2-characteristic-element) (Characteristic elements); [2.10](#ne2-boundary-map) (The boundary map `∂_G`); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§4.2, 4.6.

<a id="ne2-boundary-surjective-p-torsion"></a>
### 2.15 Surjectivity of `∂` for every compact `p`-adic Lie group

**Theorem.** Let `G` be a compact `p`-adic Lie group with closed normal `H` and `G/H ≅ ℤ_p`, possibly with elements of order `p`. In the localisation sequence `K₁(Λ(G)) → K₁(Λ(G)_S) → K₀(Λ(G), Λ(G)_S) → K₀(Λ(G)) → K₀(Λ(G)_S)`, the boundary map `∂` is surjective: the map `η : K₀(Λ(G), Λ(G)_S) → K₀(Λ(G))` is zero.

See Kakde, §2.2, Lemma 5, p. 8 (arXiv v3): Lemma 5 and its proof (pp. 8–9).

The hypotheses are as follows. No hypothesis on `p`-torsion in `G` (CFKSV assume none; see §2.11).

*Proof.*

1. Use Kakde Lemma 5’s injective representation map `λ:K₀(Λ)→∏_ρK₀(L)`, with `ρ` factoring through a finite quotient by an open normal pro-`p` subgroup.
2. Represent a relative class by a bounded perfect `S`-acyclic complex `C`. Twist its finite projective complex by each `ρ` and derive `H`-coinvariants. After the `Γ` fraction-field localization the complex is acyclic; its Euler rank over `O[[Γ]]` is therefore zero.
3. Apply derived augmentation to obtain zero Euler rank over `O`, hence `λ(η[C])=0`. Injectivity implies `η[C]=0` and exactness gives surjectivity of `∂`.
4. A relative triple involves finite projective terms and a localized isomorphism, so its perfect-complex argument applies even with `p`-torsion. If using an integral left-linear map `a:P→Q` with localized isomorphism, its kernel is `S`-torsion and `P` is `S`-torsion-free, hence `a` is injective. `Q`’s torsion-freeness alone would not prove this. No arbitrary scalar clearing of noncentral left denominators is asserted.

**Checks.**

- For `G=C_p×ℤ_p`, the relative boundary is still surjective although the ring does not have finite global dimension.
- A relative triple has projective terms and a localized isomorphism; clearing denominators gives a perfect cokernel, not a resolution theorem for arbitrary modules.

*Needs:* [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set); [2.8](#ne2-relative-perfect-class) (Relative classes of torsion perfect complexes); [2.3](#ne2-k0-representation-injective) (Detecting `K₀(Λ(G))` by characters of a finite quotient); [2.5](#ne2-twist-preserves-mhg) (Twisting preserves `𝔐_H(G)`).

### Examples

- For `C = [Λ --T→ Λ]` in degrees `−1, 0: [C] = [Λ/T], ∂[T] = [C], ch(C) = T⁻¹` and `∂ch(C) = −[C]` (§§2.8, 2.10; Worked examples, example 5).
- For `G = Γ, ∂` sends `f/g ∈ Q(Γ)^×` to `[Λ/f] − [Λ/g]`, and characteristic elements are characteristic power series up to units (§2.14).

### Dependencies

Layers 0, 1 of this roadmap; the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; GeneralAlgebraicKTheory §§4.6, 4.15–4.17, 5.7, 6.3, 6.19, 8.1, 8.7, §F.0, TauCetiRoadmap ClassicalArithmeticCompletion Layer 7, TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§4.2, 4.6; Mathlib `Ideal.Quotient.mk`.

## Layer 3: Artin evaluation, reduced norms and `SK₁`

The matrix twist `Φ_ρ` precedes scalar augmentation, and the domain of the augmentation is respected: the value at `ρ` is defined only where the specialized function is regular, with `∞` recording a pole. The total-quotient and reduced-norm statements have dimension-one hypotheses. Equality of determinant functions and equality at isolated Artin points are not interchangeable without a separation argument, and Kakde's integral `SK₁` and the `SK₁` of the total quotient are different groups. Modules `TauCeti/NumberTheory/NoncommIwasawa/Evaluation` and `.../KOne`.

<a id="ne3-twist-homomorphism"></a>
### 3.1 The ring homomorphism `Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ))`

**Construction.** `G` is a compact `p`-adic Lie group with a closed normal `H` and `G/H = Γ ≅ ℤ_p` (topological generator fixed, `Λ(Γ) = ℤ_p[[T]]`), `𝒪` the ring of integers of a finite extension `L` of `ℚ_p, Λ_𝒪(Γ) = 𝒪[[T]]` with fraction field `Q_𝒪(Γ)`, and `ρ : G → GL_n(𝒪)` continuous. By continuity `ρ` gives `ρ : Λ(G) → M_n(𝒪)` (14). The continuous homomorphism `G → (M_n(𝒪) ⊗_{ℤ_p} Λ(Γ))^×, σ ↦ ρ(σ) ⊗ σ̄` (`σ̄` the image of `σ` in `Γ`) (16), extends to a ring homomorphism `Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ))` (15), with `Φ_ρ(p) = pI_n`; composing with the augmentation `Λ_𝒪(Γ) → 𝒪` gives (14).

See CFKSV, §3, (14)–(16), p. 172: (14), (15) and (16).

*Construction.*

1. `M_n(𝒪) ⊗_{ℤ_p} Λ(Γ) = M_n(Λ_𝒪(Γ))` because `𝒪` is free of finite rank over `ℤ_p`.
2. The map on `G` is a continuous homomorphism into the units of a compact ring, so it extends to the completed group algebra (PadicMeasuresIwasawaAlgebras §1.7).
3. The Morita evaluation of §3.3 uses positive rank `n`; rank zero gives the zero representation and the zero twist and is excluded from that adapter.

API: `representationRingHom` (`ρ : Λ(G) → M_n(𝒪)` (14)); `twistRingHom` (`Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ))` (15)); `twistRingHom_augmentation` (Augmentation `∘ Φ_ρ = ρ`); `twistRingHom_p` `(Φ_ρ(p) = pI_n)`.

**Checks.**

- `twistRingHom_trivial`: `G = Γ, H = 1, ρ = 1: Φ_ρ` is the identity `Λ(Γ) → Λ(Γ)`.
- `twistRingHom_groupElement`: `Φ_ρ(σ) = ρ(σ)·σ̄`, so `det Φ_ρ(σ) = det ρ(σ)·σ̄ⁿ`.
- `twistRingHom_directSum`: `Φ_{ρ₁⊕ρ₂}` is block diagonal with blocks `Φ_{ρ₁}, Φ_{ρ₂}`.
- `Φ_ρ` records the `Γ`-component `σ̄` as well as `ρ(σ)`; for `H = 1` and `ρ` trivial it is the identity of `Λ(Γ)`.

*Needs:* [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7; Mathlib `Matrix`.

<a id="ne3-twist-extends-to-localisation"></a>
### 3.2 `Φ_ρ` extends to the localisation at `S*`

**Lemma.** (Lemma 3.3.) `Φ_ρ` extends to a ring homomorphism `Φ_ρ : Λ(G)_{S*} → M_n(Q_𝒪(Γ))` (17): `Φ_ρ(s)` is invertible for every `s ∈ S* = ∪_n pⁿS`.

See CFKSV, §3, Lemma 3.3, p. 172: Lemma 3.3 and the start of its proof. CFKSV, §3, proof of Lemma 3.3, p. 173: The end of the proof.

The hypotheses are as follows. `S` is the canonical Ore set of Layer 1.

*Proof.*

1. It suffices that the reduction `Φ̃_ρ(s) ∈ M_n(k[[T]])` has nonzero determinant for `s ∈ S`.
2. `Φ̃_ρ` factors through `δ : Ω(G/J) → M_n(k[[T]])` for a pro-`p` open `J ⊆ H` normal in `G` inside `ker ρ̃` (`GL_n(k)` is finite).
3. A central `Π ≅ ℤ_p` of `G/J` inside `ker ρ̃` has `δ(Ω(Π)) ⊆ k[[T]]I_n`, and `Q(k[[T]])` is finite over `R(Π)`; `δ` extends to `R(Π) ⊗_{Ω(Π)} Ω(G/J)`, where `ψ_J(s)` is a unit (§1.4), so `δ(ψ_J(s))` is invertible.

**Checks.**

- The extension is to matrices over the fraction field `Q_𝒪(Γ)`, not over `Λ_𝒪(Γ)`: elements of `S` become invertible only after inverting nonzero power series.

*Needs:* [3.1](#ne3-twist-homomorphism) (The ring homomorphism `Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ))`); [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem); [1.2](#ne1-central-zp-subgroup) (A central copy of `ℤ_p` in `G/J`); [1.3](#ne1-quotient-total-algebra) (The algebra `V(G/J)`); [1.10](#ne1-saturated-ore-set) (The saturated Ore set `S*`).

<a id="ne3-artin-evaluation"></a>
### 3.3 Evaluation of `K₁`-elements at representations

**Construction.** (17) induces `Φ′_ρ : K₁(Λ(G)_{S*}) → K₁(M_n(Q_𝒪(Γ))) = Q_𝒪(Γ)^×` (22) (Morita equivalence and the determinant of the field `Q_𝒪(Γ)`). Let `φ : Λ_𝒪(Γ) → 𝒪` be the augmentation with kernel `𝔭`, extended to `φ : Λ_𝒪(Γ)_𝔭 → L`. For `ξ ∈ K₁(Λ(G)_{S*}), ξ(ρ) := φ(Φ′_ρ(ξ)) ∈ L` if `Φ′_ρ(ξ) ∈ Λ_𝒪(Γ)_𝔭`, and `ξ(ρ) := ∞` otherwise. On `K₁(Λ(G))` this restricts to `K₁(Λ(G)) → K₁(M_n(𝒪)) = 𝒪^×` (21).

See CFKSV, §3, (21)–(22), p. 173: The definition of `ξ(ρ) ∈ L ∪ {∞}`.

The hypotheses are as follows. `ρ : G → GL_n(𝒪)` continuous (Artin or not).

*Construction.*

1. Morita invariance `K₁(M_n(A)) ≅ K₁(A)` and `K₁(F) = F^×` for a field (determinant) come from §F.0.
2. Functoriality of `K₁` along the ring maps (14) and (17), compatible with `K₁(Λ(G)) → K₁(Λ(G)_{S*})`.

API: `twistK1` `(Φ′_ρ : K₁(Λ(G)_{S*}) → Q_𝒪(Γ)^×)`; `evaluate` `(ξ ↦ ξ(ρ) ∈ L ∪ {∞})`; `evaluate_groupElement` (`[g](ρ) = det ρ(g)` for `g ∈ G ⊆ Λ(G)^×`); `evaluate_mul` (`(ξη)(ρ) = ξ(ρ)η(ρ)` when both are finite); `evaluate_directSum` (The rational determinant functions satisfy `Φ′_(ρ₁⊕ρ₂)(ξ)=Φ′_ρ₁(ξ)Φ′_ρ₂(ξ)`. The augmentation values multiply when both factors are finite; do not assign a value to `0·∞`); `evaluate_units` (On `K₁(Λ(G))` the evaluation is (21), with values in `𝒪^×`).

**Checks.**

- `evaluate_known_unit`: For `g ∈ G, Φ′_ρ([g]) = det(ρ(g)ḡ I_n) = det ρ(g)·ḡⁿ`, so `[g](ρ) = det ρ(g)` (augmentation `ḡ ↦ 1`).
- `evaluate_trivial_group`: `G = Γ, H = 1, ρ = 1: Λ(Γ)_{S*} = Q(Γ)`, and `ξ(1) = f(0)` for `ξ = f ∈ Λ(Γ)_𝔭`, while `ξ = T` gives 0 and `ξ = 1/T` gives `∞`.
- `evaluate_induced`: For an open subgroup `G′ ⊆ G` and a character `ψ` of `G′, [g](Ind_{G′}^G ψ) = det(Ind ψ)(g) = sgn(g on G/G′)·ψ(V(g))` with `V` the transfer: the sign of the permutation action survives.
- `evaluate_not_injective`: If `x≠1` lies in the reduced-norm kernel, multiplying a `K₁`-element by `x` leaves all reduced determinant functions unchanged wherever defined. This is a conditional obstruction to uniqueness; the test does not assert existence of such `x` for every `G`.
- `evaluate_zero_pole_cancellation`: For `G=Γ, ξ=(γ−a)/(γ−b)` with distinct `a,b` in `1+pZ_p`, the characters `γ↦`a and `γ↦b` give a zero and a pole. Their direct sum has rational determinant `((aγ−a)/(aγ−b))((bγ−a)/(bγ−b))`; cancelling `T` gives the value `−a/b` at `γ=1`, which is `−4/7` for `p=3, a=4, b=7`. An unconditional `0·∞` value rule is invalid.
- Conventions: `Φ′_ρ` is a determinant of `Φ_ρ`, so for a group element `g, [g](ρ) = det ρ(g)` (not trace, not `det ρ(g^{−1})`); the value `∞` is part of the definition.
- Only the value at the augmentation is taken: `Φ′_ρ(ξ) ∈ Q_𝒪(Γ)^×` carries more information than `ξ(ρ)`.

*Needs:* [3.2](#ne3-twist-extends-to-localisation) (`Φ_ρ` extends to the localisation at `S*`); [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set); §F.0.

<a id="ne3-akashi-series"></a>
### 3.4 Akashi series

**Construction.** Assume `G` has no element of order `p`, let `H`◁`G` with `G/H=Γ`, and let `M∈𝔐_H(G)`. Then `H_i(H,M)` are finitely generated torsion `Λ(Γ)`-modules and vanish above `cd_p H`. With `f_(i,M)` their characteristic series, the finite alternating product `Ak(M)=∏_i f_(i,M)^{(−1)^i}` modulo `Λ(Γ)^×` defines `Ak:K₀(𝔐_H(G))→Q(Γ)^×/Λ(Γ)^×`. For `O`-coefficient `M` use `Λ_O(Γ)`; its coefficient norm satisfies `N(Ak_O(M))=Ak(M)`. A particular bounded-homology perfect variant may be defined separately, but there is no infinite product for arbitrary `p`-torsion `G`.

See CFKSV, §3, Lemma 3.1, p. 171: Lemma 3.1. CFKSV, §3, (37)–(39), p. 177: The Akashi series. CFKSV, §3, (40), p. 178: (40).

The hypotheses are as follows. `G` has no element of order `p`, ensuring a bounded homology product. Alternatively specify a category on which `H`-homology is bounded and the exact-sequence operations preserve that bound.

*Construction.*

1. `H_i(H, M) = Tor_i^{Λ(G)}(Λ(Γ), M)` is finitely generated over `Λ(Γ)`; torsion because `H_i(H, M(p))` is killed by a power of `p` and `H_i(H, M/M(p))` is finitely generated over `ℤ_p`.
2. Additivity on short exact sequences from the long exact sequence of `H`-homology and multiplicativity of characteristic series.
3. (40): `N(g_i) = f_i mod Λ(Γ)^×` (Bourbaki, Commutative Algebra VII §4.8, Prop. 18; PadicMeasuresIwasawaAlgebras §§4.2, 4.6).

API: `akashiSeries` `(Ak : K₀(𝔐_H(G)) → Q(Γ)^×/Λ(Γ)^×)`; `akashiSeriesO` (`Ak_𝒪` over `Λ_𝒪(Γ)`); `akashiSeries_norm` `(N(Ak_𝒪(M)) = Ak(M))`; `homology_torsion` (`H_i(H, M)` torsion over `Λ(Γ)` (Lemma 3.1)).

**Checks.**

- `akashiSeries_commutative`: `G = Γ, H = 1: Ak(M)` is the characteristic power series of `M` (only `H_0 = M`).
- `akashiSeries_H_finite`: If `H` is finite of order prime to `p`, only `H_0(H, M) = M_H` contributes.
- `akashiSeries_p_torsion`: For `G=Z_p², H` the first factor and `M=Λ(G)/p`, multiplication by the `H`-coordinate is injective on `𝔽_p[[T_H,T_Γ]]`. Thus `H₀(H,M)=𝔽_p[[T_Γ]]`, higher `H`-homology vanishes, and `Ak(M)=p` modulo `Λ(Γ)^×`.
- `akashiSeries_unbounded_excluded`: For `G=C_p×Γ, H=C_p` and `M=𝔽_p` with trivial action, `H_i(H,M)≅𝔽_p` for every `i≥0`. The ordinary finite alternating-product definition is unavailable.
- `Ak` is defined only modulo units; the Euler-characteristic formula uses its value at `T = 0` up to `p`-adic units.

*Needs:* [1.13](#ne1-category-mhg) (The category `𝔐_H(G)`); [2.4](#ne2-homology-torsion) (`H`-homology of modules in `𝔐_H(G)`); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§4.2, 4.6.

<a id="ne3-evaluation-akashi-diagram"></a>
### 3.5 The evaluation–Akashi diagram

**Lemma.** (Lemma 3.7.) With `Δ_ρ([M]) = Ak_𝒪(tw_{ρ̂}(M))` (41)–(42), where `ρ̂(g) = ρ(g^{−1})^t` is the contragredient, and `∂_Γ : Q_𝒪(Γ)^× → Q_𝒪(Γ)^×/Λ_𝒪(Γ)^×`, the square `∂_Γ ∘ Φ′_ρ = Δ_ρ ∘ ∂_G` (43) commutes.

See CFKSV, §3, Lemma 3.7, p. 178: Lemma 3.7. CFKSV, §3, proof of Lemma 3.7, p. 179: The proof.

The hypotheses are as follows. `G` without elements of order `p` (so `∂_G` is defined on modules).

*Proof.*

1. Functoriality of the localisation sequence with Morita equivalence gives (47): `∂_1 ∘ v_1 ∘ u_1 = v_0 ∘ u_0 ∘ ∂_G`.
2. For a finite projective resolution `P_•` of `M, u_0([M]) = Σ(−1)^i[M_n(Λ_𝒪(Γ)) ⊗_{Λ(G)} P_i]` (49); the row-vector Morita functor identifies `(Rⁿ)^t ⊗_{M_n(R)} M_n(R) ⊗_{Λ(G)} P_i` with `Λ_𝒪(Γ) ⊗_{Λ_𝒪(G)} tw_{ρ̂}(P_i)` (50), since the right action `(τ ⊗ x^t)g = τḡ ⊗ x^tρ(g)` corresponds, after passing from right modules to left modules, to the contragredient `ρ̂`.
3. `tw_{ρ̂}(P_•)` resolves `tw_{ρ̂}(M)`, and `Λ_𝒪(Γ) ⊗ −` computes `H_i(H, tw_{ρ̂}(M))`, whose alternating class is `Ak_𝒪`.

**Checks.**

- For a one-dimensional `χ` at `p=7` on `C₃`, twisting a `χ`-isotypic module by `χ∨` leaves the trivial constituent; twisting by `χ` does not. The diagram’s dual convention agrees with §2.3.

- The contragredient `ρ̂` appears on the module side: the evaluation at `ρ` corresponds to twisting by `ρ̂`.
- The row action is multiplication by `ρ(g)`, so `(v·g)·h=v·(gh)`. Multiplying rows by `ρ(g)^t` would reverse the order for noncommuting matrices.

*Needs:* [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [3.4](#ne3-akashi-series) (Akashi series); [0.14](#ne3-twisted-module) (Twisting modules by a representation); [2.10](#ne2-boundary-map) (The boundary map `∂_G`); §F.0.

<a id="ne3-euler-characteristic-evaluation"></a>
### 3.6 Characteristic elements compute twisted Euler characteristics

**Theorem.** (Theorem 3.6.) Assume `G` has no element of order `p`. Let `M ∈ 𝔐_H(G)` with characteristic element `ξ_M`. For every continuous `ρ : G → GL_n(𝒪)` with `χ(G, tw_{ρ̂}(M))` finite, `ξ_M(ρ) ≠ 0, ∞` and `χ(G, tw_{ρ̂}(M)) = |ξ_M(ρ)|_p^{−m_ρ}`, where `m_ρ = [L : ℚ_p]` and `|p|_p = 1/p`.

See CFKSV, §3, Theorem 3.6, p. 177: Theorem 3.6. CFKSV, §3, proof of Theorem 3.6, p. 178: (41)–(45).

The hypotheses are as follows. `G` has no element of order `p`; `χ(G, tw_{ρ̂}(M))` finite.

*Proof.*

1. The two inputs are targets of this subsection; no supplier states them. `gammaEulerChar`: for a finitely generated torsion `Λ_O(Γ)`-module `N` with characteristic series `f_N, χ(Γ, N) =` #`H₀(Γ, N)/`#`H₁(Γ, N)` is finite iff `f_N(0) ≠ 0`, and then `χ(Γ, N) = |f_N(0)|_p^(−[L:ℚ_p])`. Proof: both sides are multiplicative in short exact sequences (long exact sequence of `Γ`-homology, which is `H₀ = N_Γ, H₁ = N^Γ`, and multiplicativity of characteristic series, PadicMeasuresIwasawaAlgebras §4.6); a finite module has `H₀` and `H₁` of equal order; by the structure theorem (§4.2 there) reduce to `N = Λ_O(Γ)/(g)` with `g` a power of `ϖ` or distinguished, where `T` is injective on `N` iff `g(0) ≠ 0` and then #`N/TN =` #`O/g(0) = |g(0)|_p^(−[L:ℚ_p])`. `hochschildSerre_eulerChar`: if every `H_i(H, W)` is a finitely generated `Λ_O(Γ)`-module with finite `Γ`-Euler characteristic, then `χ(G, W) = ∏_i χ(Γ, H_i(H, W))^((−1)^i)`, by the Hochschild–Serre spectral sequence for compact homology and multiplicativity of Euler characteristics along a spectral sequence with finite terms. The spectral sequence is the target `hochschildSerre_compactHomology`, constructed here because §F.2 does not state it: for a closed normal subgroup `N` of `G` and `W` with a bounded resolution `P_•` by finitely generated projective `Λ_O(G)`-modules, `Λ_O(G/N) ⊗_{Λ_O(G)} P_•` is a bounded complex of finitely generated projective `Λ_O(G/N)`-modules computing `H_•(N, W)` (Shapiro, `F`.2), and `O ⊗_{Λ_O(G/N)} −` applied to it computes `H_•(G, W)`. The hyper-`Tor` spectral sequence of `F`.2 for this bounded complex is `H_i(G/N, H_j(N, W)) ⇒ H_(i+j)(G, W)`. With these, if `χ(G, W)` is finite `(W = tw_{ρ̂}(M))`, then `φ(f_{i,W}) ≠ 0` for all `i, φ(Ak(W)) ≠ 0, ∞` and `χ(G, W) = |φ(Ak(W))|_p^{−1}` (44) (Coates–Schneider–Sujatha, as CFKSV p. 178 use it).
2. By (40) and `N ∘ φ = φ ∘ N, χ(G, W) = |φ(Ak_𝒪(W))|_p^{−m_ρ}` (45).
3. Lemma 3.7 gives `∂_Γ(Φ′_ρ(ξ_M)) = Ak_𝒪(tw_{ρ̂}(M))` (46), and the value at `T = 0` is `ξ_M(ρ)`.

**Checks.**

- The formula determines `|ξ_M(ρ)|_p` only; the unit part of `ξ_M(ρ)` is not an Euler-characteristic invariant.
- `G = Γ, H = 1, ρ = 1` and `M = Λ(Γ)/(T − p): γ` acts on `M ≅ ℤ_p` by `1 + p`, so `H₀(Γ, M) = ℤ_p/p` and `H₁(Γ, M) = 0, χ(Γ, M) = p`, and `ξ_M(1) = −p` with `|−p|_p^{−1} = p`.
- For `M = Λ(Γ)/(T), χ(Γ, M)` is infinite `(H₀ = H₁ = ℤ_p)` and `ξ_M(1) = 0`, outside the theorem's hypothesis.
- `gammaEulerChar` on a finite module, `M = Λ(Γ)/(p, T) = 𝔽_p: H₀ = H₁ = 𝔽_p, χ = 1`, and its characteristic series is a unit (pseudo-null); on `M = Λ(Γ)/(p): T` acts injectively, `H₀ = 𝔽_p, χ = p = |p|_p⁻¹`, matching `f(0) = p`.

*Needs:* [3.5](#ne3-evaluation-akashi-diagram) (The evaluation–Akashi diagram); [2.12](#ne2-characteristic-element) (Characteristic elements); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§4.2, 4.6; §F.2.

<a id="ne3-artin-evaluation-integral"></a>
### 3.7 Evaluation at Artin representations under a finiteness condition

**Theorem.** (Theorem 3.8, Lemma 3.9.) Assume `G` has no element of order `p` and let `M ∈ 𝔐_H(G)` satisfy `H_i(H′, M)` finite for all `i ≥ 1` and all open `H′ ⊆ H` normal in `G` (51). Then for every Artin representation `ρ` (`ker ρ` open), `Ak_𝒪(tw_ρ(M)) ∈ Λ_𝒪(Γ)[1/p]` modulo units (52), `ξ_M(ρ) ≠ ∞`, and `ξ_M(ρ) ≠ 0` iff `χ(G, tw_{ρ̂}(M))` is finite.

See CFKSV, §3, Theorem 3.8, p. 180: Theorem 3.8. CFKSV, §3, Lemma 3.9, p. 181: Lemma 3.9.

The hypotheses are as follows. `G` without elements of order `p`; (51).

*Proof.*

1. With `H′ = ker ρ ∩ H, W = tw_ρ(M)` is `M_𝒪ⁿ` as an `H′`-module, so `H_i(H′, W)` is finite for `i ≥ 1` (54); Hochschild–Serre for `Δ = H/H′` (`hochschildSerre_compactHomology` of §3.6) shows `H_i(H, W)` is killed by a power of `p` for `i ≥ 1`, so `g_{i,W} = π^{μ_i}` (53).
2. Hence `Ak_𝒪(W) = g_{0,W}∏π^{(−1)^iμ_i}` (56), and `φ(Ak_𝒪(W)) ≠ 0` iff `φ(g_{0,W}) ≠ 0` iff `χ(G, W)` is finite.
3. Lemma 3.7 then gives `Φ′_ρ(ξ_M) ∈ Λ_𝒪(Γ)_𝔭` and the finiteness criterion.

**Checks.**

- Condition (51) is on all open normal `H′ ⊆ H`; it holds for `M` iff it holds for `M(p)` and `M/M(p)`.

*Needs:* [3.6](#ne3-euler-characteristic-evaluation) (Characteristic elements compute twisted Euler characteristics); [3.5](#ne3-evaluation-akashi-diagram) (The evaluation–Akashi diagram); §F.2; §3.6 (`hochschildSerre_compactHomology`).

<a id="ne3-artin-formalism-euler"></a>
### 3.8 Artin formalism for `G`-Euler characteristics

**Theorem.** (Theorem 3.10.) Let `G` be a compact `p`-adic Lie group without elements of order `p` (no `H` needed), `G′ ⊆ G` open normal, `Δ = G/G′, V` the irreducible `Q̄_p`-representations of `Δ`, all realised over `L` with integers `𝒪`. For finitely generated `M, χ(G′, M)` is finite iff `χ(G, tw_ρ(M))` is finite for all `ρ ∈ V`, and then `χ(G′, M)^{[L:ℚ_p]} = ∏_{ρ∈V} χ(G, tw_ρ(M))^{n_ρ}` (58).

See CFKSV, §3, Theorem 3.10, p. 183: Theorem 3.10. CFKSV, §3, proof of Theorem 3.10, p. 184: The end of the proof.

The hypotheses are as follows. `G` without elements of order `p`.

*Proof.*

1. `0 → 𝒪[Δ] → ⊕_ρ L_ρ^{n_ρ} → W → 0` with `W` finite (59); tensor with a projective resolution `P_•` of `M_𝒪` (61).
2. `H_i(C) = H_i(G′, M_𝒪), H_i(D_ρ) = H_i(G, tw_ρ(M))` (64)–(65).
3. `K_i = W ⊗ C_i` is finite and `[C] = 0` in `K₀(𝒪[Δ])` (injectivity into `K₀(L[Δ])`), so `∏`♯`H_i(K)^{(−1)^i} = θ([C]) = 1` (67)–(69).

**Checks.**

- The exponent `[L : ℚ_p]` on the left accounts for the `𝒪`-coefficients.

*Needs:* [0.14](#ne3-twisted-module) (Twisting modules by a representation); [2.3](#ne2-k0-representation-injective) (Detecting `K₀(Λ(G))` by characters of a finite quotient); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7.

<a id="ne3-gl2-euler-example"></a>
### 3.9 The `GL₂` example: `X₁(11)` at `p = 5`

**Application.** (Proposition 3.11.) For `E = X₁(11), p = 5, F_∞ = ℚ(E_{5^∞}), G = Gal(F_∞/ℚ), H = Gal(F_∞/ℚ^cyc), M = X(E/F_∞) ∈ 𝔐_H(G)`, and the degree-4 Artin representations `ρ_i` induced from nontrivial characters of `Gal(F_i/ℚ(μ_5))` with `F_1 = ℚ(E_5), F_2 = ℚ(E_{2,5})` (`E_2` the conductor-11 curve with `E_2(ℚ) = 0`): `χ(G, tw_{ρ_1}(M)) = 5³` and `χ(G, tw_{ρ_2}(M)) = 5`, so `|ξ_{E,5}(ρ_1)|_5^{−1} = 5³` and `|ξ_{E,5}(ρ_2)|_5^{−1} = 5 (ρ̂_i = ρ_i)`.

See CFKSV, §3, Example, p. 185: The example. CFKSV, §3, Proposition 3.11, p. 186: Proposition 3.11 and (75). CFKSV, §3, proof of Proposition 3.11, p. 187: The computation.

The hypotheses are as follows. The arithmetic inputs `χ(G_F, X) = 5⁴, χ(G_{F_1}, X) = 5¹⁶, χ(G_{F_2}, X) = 5⁸` ((78)–(80)) come from Coates–Howson's Euler characteristic formula (77) and Fisher's computations, cited by CFKSV; they are quoted inputs, not proved here.

*Proof.*

1. Theorem 3.10 with `G′ = G_F` (`Δ` cyclic of order 4, four characters over `ℚ_5`) and `G′ = G_{F_1}` (`Δ = Gal(F_1/ℚ)` of order 20: the four characters and `ρ_1`) gives `χ(G, tw_{ρ_1}X)⁴ = 5¹⁶/5⁴ = 5¹²`.
2. Likewise `χ(G, tw_{ρ_2}X)⁴ = 5⁸/5⁴ = 5⁴`.
3. Theorem 3.6 converts these into the absolute values of the evaluations.

**Checks.**

- Checks the Frobenius/contragredient conventions: `ρ_i` are self-dual, so `tw_{ρ̂_i} = tw_{ρ_i}`.

*Needs:* [3.8](#ne3-artin-formalism-euler) (Artin formalism for `G`-Euler characteristics); [3.6](#ne3-euler-characteristic-evaluation) (Characteristic elements compute twisted Euler characteristics).

<a id="ne3-characteristic-element-integrality-conjecture"></a>
### 3.10 The integrality conjecture for characteristic elements (Conjecture 4.8)

**Definition.** Assume `G` has no element of order `p`. Put `R₁ = Λ(G), R₂ = Λ(G)[1/p], R₃ = Λ(G)_{S*}` (so `R₁ ⊂ R₂ ⊂ R₃`), `A₁ = Λ_𝒪(Γ), A₂ = Λ_𝒪(Γ)[1/p]`, and `α : R₃^× → K₁(R₃)` the canonical map (surjective by §2.13). Let `ℜ(G)` be the continuous representations `ρ` of the form (11) (over the integers of finite extensions of `ℚ_p`) and `𝔄(G) ⊂ ℜ(G)` the Artin ones. Conjecture 4.8 is the proposition that, for every `ξ ∈ K₁(R₃)`, in each of four cases the assertions `(a)`–`(d)` are equivalent: Case `1: (a) ξ ∈ α(R₂ ∩ R₃^×), (b) ξ(ρ) ≠ ∞` for all `ρ, (c) Φ′_ρ(ξ) ∈ A₂` for all `ρ, (d) Φ′_ρ(ξ) ∈ A₂` for all Artin `ρ`; Case `2: α(R₁ ∩ R₃^×), ξ(ρ)` finite and in `𝒪, Φ′_ρ(ξ) ∈ A₁`; Case `3: α(R₂^×), ξ(ρ) ≠ 0, ∞, Φ′_ρ(ξ) ∈ A₂^×`; Case `4: α(R₁^×), ξ(ρ)` finite and in `𝒪^×, Φ′_ρ(ξ) ∈ A₁^×`. (Lemma 4.9.) In each case `(a) ⇒ (b), (b) ⇔ (c)` and `(c) ⇒ (d)`.

See CFKSV, §4, Conjecture 4.8 and Lemma 4.9, p. 196: Conjecture 4.8 (above this remark) and the consequence of Case 1 for modules satisfying (51). CFKSV, §4, after Lemma 4.9, p. 197: The evidence (`ℤ_p^d × Δ`; Kato).

The hypotheses are as follows. This is a conjecture: it is stated as a proposition, and no theorem of this roadmap assumes it. CFKSV report it true for `G = ℤ_p^d × Δ` (`Δ` finite of order prime to `p`) without giving the proof, and cite Kato's Proposition 8.19 as further evidence; neither case is a target here, and neither turns the general conjecture into a theorem.

*Construction.*

1. Lemma 4.9: `(c) ⇒ (d)` is trivial, `(c) ⇒ (b)` because `ξ(ρ)` is the image of `Φ′_ρ(ξ)` under augmentation; `(a) ⇒ (b)` since `ξ = α(p^{−m}f)` gives `ξ(ρ) = p^{−mn} det ρ(f)`.
2. For `(b)⇒(c)`, first prove on the defining group-element ring map (and hence on all matrix determinants) the exact identity `Φ′_(ρη)(ξ)(T)=Φ′_ρ(ξ)(a(1+T)−1), a=η(γ)`. This uses `Φ_ρ(g)=ρ(g)ḡ` and does not pass through Akashi series modulo units. A pole at `α` in the maximal ideal is detected by the continuous character `η(γ)=1+α`. Weierstrass preparation then gives the pole criterion; the integral and unit cases also require their stated integral-value/nonvanishing conditions. CFKSV (94) has the inverse substitution under these conventions (correction `E16`).

API: `IntegralityConjecture` (The proposition 'for all `ξ, (a)`–`(d)` are equivalent' in each case); `integrality_a_imp_b` (Lemma 4.9: `(a) ⇒ (b)`); `integrality_b_iff_c` (Lemma 4.9: `(b) ⇔ (c)`); `integrality_c_imp_d` (Lemma 4.9: `(c) ⇒ (d)`); `artinEvaluation_twist` (With `Φ_ρ(g)=ρ(g)ḡ` and `a=η(γ), Φ′_(ρη)(ξ)(T)=Φ′_ρ(ξ)(a(1+T)−1)`. This corrects the inverse in CFKSV (94)).

**Checks.**

- `integrality_zp`: For `G=Γ, p⁻¹` satisfies the pole-free Case 1 criterion but fails Case 2’s integral-value criterion. Do not identify these two cases.
- `integrality_unit`: `ξ = α(u)` with `u ∈ Λ(G)^×` satisfies Case `4 (a)`, hence `(b)`–`(d)`.
- `integrality_pole`: `ξ = α((T − p)^{−1})` for `G = ℤ_p` fails Case `1 (b)` at the character with `η(γ₀) − 1 = p`.
- `integrality_twist_group_element`: For `ξ=[γ]` and `ρ=1, Φ′_η(ξ)=a(1+T)`. Substitution by `a⁻¹(1+T)−1` gives `a⁻¹(1+T)`, which is wrong whenever `a²≠1`.
- For `G=Γ`, Case 2 requires finite integral values at all admitted characters. Absence of poles alone tests Case 1, and is insufficient for Case 2: the constant `p⁻¹` has no poles but is not integral. The function `T/(T−p)` has a pole detected at `η(γ)=1+p`.

*Needs:* [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [3.5](#ne3-evaluation-akashi-diagram) (The evaluation–Akashi diagram); [2.13](#ne2-units-surject-k1) (Units surject onto `K₁` of the localisations); [2.12](#ne2-characteristic-element) (Characteristic elements).

<a id="ne3-k1-prime"></a>
### 3.11 `SK₁` and the quotient `K′₁` of Iwasawa algebras

**Construction.** For a finite group `P` and `𝒪` the integers of a finite extension `L/ℚ_p, SK₁(𝒪[P]) = ker(K₁(𝒪[P]) → K₁(L[P]))` and `K′₁(𝒪[P]) = K₁(𝒪[P])/SK₁(𝒪[P])`, the image of `K₁(𝒪[P])` in `K₁(L[P])`. For a compact `p`-adic Lie group `G, SK₁(Λ_𝒪(G))` is the kernel of `K₁(Λ_𝒪(G)) → lim_Δ K₁(L[Δ])` over the finite quotients `Δ` of `G`, that is, the classes all of whose Artin determinants at finite level are trivial. `SK₁(Λ_𝒪(G)_S)` and `SK₁(Λ̂_𝒪(G)_S)` are its images in `K₁(Λ_𝒪(G)_S)` and in `K₁` of the `p`-adic completion `Λ̂_𝒪(G)_S`, and `K′₁(R) := K₁(R)/SK₁(R)` for each of these rings. Then `K′₁(Λ_𝒪(G)) ≅ lim_Δ K′₁(𝒪[Δ])`, and `K′₁(Λ(G)) ≅ lim_{Ḡ} K′₁(Λ(Ḡ))` over the quotients `Ḡ = G/U` by open pro-`p` subgroups `U ≤ H` normal in `G`. Kakde defines `SK₁(Λ_𝒪(G))` as `lim_Δ SK₁(𝒪[Δ])`, placed inside `K₁(Λ_𝒪(G))` by the continuity isomorphism of Fukaya–Kato. The kernel used here is that subgroup whenever the isomorphism holds (the explicit bijectivity hypothesis of §3.11, step 7, step 7), and its definition does not need it.

See Kakde, §2.2, Definitions 6 and 7, p. 9; Lemma 19 and Corollary 20, pp. 17–19; Theorem 25, p. 20 (arXiv v3). Chinburg–Pappas–Taylor II, *`K₁` of a `p`-adic group ring II. The determinantal kernel `SK₁*`, arXiv:1303.5337v3: Theorem 1.2, p. 3, with its proof in §2.`a`, pp. 7–9 (`K₁(R[Δ]) ≅ lim_n K₁((R/p^n)[Δ])` for a `p`-adically complete noetherian domain `R` of characteristic zero and finite `Δ`); Theorem 1.5, p. 3, proof p. 9 (`SK₁(R[Δ])` embeds into `K₁((R/p^n)[Δ])` once `p^n > 2`); Lemmas 2.1–2.2, pp. 6–7 (along a surjection whose kernel `I` lies in the radical, `K₁` is onto and its kernel is the image of `1 + I`); Proposition 2.3, p. 7 (`SK₁` of a commutative semilocal ring is trivial); §4, pp. 29–32: Proposition 4.2 (lattices act on `K₁(R[Δ])` by tensor product, and `SK₁` is a Frobenius submodule), Theorem 4.3 (stated there at the prime `p`; by Serre, Theorem 28, for every prime `ℓ` and every field `N` of characteristic zero, some integer prime to `ℓ` times `G₀(N[Δ])` is a sum of inductions from `N-ℓ`-elementary subgroups), the Mackey axioms of §4.`c` and its Example (i) (`K₁, Det` and `SK₁` are Green modules), and Theorem 4.4 (Dress's computability lemma); §5, Corollary 5.4, pp. 35–36 (for a `ℚ_p-p`-elementary group `C ⋊ Q` and each component `W[m] ∘ Q` of `W[C ⋊ Q], SK₁` is the image of `SK₁` of the group ring `W[m][H_m]` of `H_m = ker(Q → Aut⟨ζ_m⟩)`). Chinburg–Pappas–Taylor `I, *K₁` of a `p`-adic group ring `I`. The determinantal image*, arXiv:0904.2563v1, Propositions 5.1–5.2, p. 27 (Swan's isomorphism `G₀^{ℤ_p}(ℤ_p[Δ]) ≅ G₀(ℤ_p[Δ]) ≅ G₀(ℚ_p[Δ])` and the resulting action of `G₀(ℚ_p[Δ])` on `K₁` and `SK₁`, from Curtis–Reiner (38.42), (39.10) and Exercise 39.5), and Theorem 5.4, p. 28 (the case `ℓ = p, N = ℚ_p`). Platonov–Rapinchuk–Rapinchuk, vol. `I`, §1.4.3, p. 33, with Theorem 1.23, p. 34: for a central division algebra `D` over a local field the reduced norm is onto and `SL₁(D) = [D^×, D^×]` (Nakayama–Matsushima). ClassicalArithmeticCompletion §7.63 owns the Witt–Berman induction identities with field of definition `ℚ_p`.

The hypotheses are as follows. `G` compact `p`-adic Lie. `𝒪` is the ring of integers of any finite extension `L` of `ℚ_p`, ramified or not, except where a statement names an unramified `W`.

*Construction.*

1. Finite levels. `𝒪[Δ]` is semilocal, so `𝒪[Δ]^× → K₁(𝒪[Δ])` is onto (§F.0) and the matrix and unit determinant images agree (ClassicalArithmeticCompletion §7.27). Hence `K′₁(𝒪[Δ]) ≅ Det(𝒪[Δ]^×)` once the determinant is injective on `K₁(L[Δ])`. That injectivity is the target `sk1_semisimple_padic`: `SK₁(A) = 1` for every finite-dimensional semisimple algebra A over a finite extension of `ℚ_p`. By Wedderburn and Morita (§F.0) reduce to a central division algebra `D` over a `p`-adic field. There the Dieudonné determinant identifies `K₁(D)` with `D^×/[D^×,D^×]`, and the kernel of the reduced norm on `D^×` is `[D^×,D^×]` (Nakayama–Matsushima, proved in Platonov–Rapinchuk–Rapinchuk §1.4.3, pp. 33–34). The reduced norm is that of IntegralHeckeAndGaloisDeterminants Layer 0. It identifies `K₁(L[Δ])` with the product of the unit groups of the centres of the simple components, and it is continuous for the `p`-adic topologies.
2. `k1Prime_equiv_limit` (Lemma 19 for `K′₁`). The map `K₁(Λ_𝒪(G)) → lim_Δ K′₁(𝒪[Δ])` has kernel `SK₁(Λ_𝒪(G))` by definition, because `K′₁(𝒪[Δ])` embeds in `K₁(L[Δ])` and inverse limits are left exact. It is onto. Given a compatible family `(x_Δ)`, the sets `F_Δ = {u ∈ 𝒪[Δ]^× : Det(u) = x_Δ}` are nonempty by step 1 and closed in the compact group `𝒪[Δ]^×` because the reduced norm is continuous, and the quotient maps carry `F_Δ′` into `F_Δ`. An inverse limit of nonempty compact spaces is nonempty. A point of it is a unit of `Λ_𝒪(G) = lim_Δ 𝒪[Δ]` whose class maps to `(x_Δ)`. No continuity theorem for `K₁` is used.
3. `k1Prime_equiv_limit_proP` (Corollary 20). A finite quotient `G/N` is a quotient of `G/U` for `U = N ∩ H ∩ U₀`, with `U₀` an open normal uniform subgroup of `G` (§0.2); this `U` is open in `H`, normal in `G` and pro-`p`. Apply step 2 to `G` and to each `G/U`, and use cofinality.
4. `sk1_finite` and `sk1_pGroup`: `SK₁(𝒪[P])` is a finite `p`-group for every finite group `P` and every `𝒪` (Wall's theorem, cited by Kakde v3, p. 19, as Oliver, *Whitehead groups of finite groups*, Theorem 2.5). `(a)` Finiteness. Chinburg–Pappas–Taylor II, Theorem 1.5, embeds `SK₁(𝒪[P])` in the finite group `K₁((𝒪/p^n)[P])` for `p^n > 2`. `(b)` Order prime to `p`. If `p ∤ |Q|`, the residue algebra `k[Q]` is semisimple, a product of matrix algebras `M_(n_i)(k_i)` over finite fields. Lifting a full system of matrix units to the `ϖ`-adically complete ring `𝒪[Q]` gives `𝒪[Q] ≅ ∏ M_(n_i)(E_i)`, where `E_i` is an `𝒪`-order with `E_i/ϖE_i ≅ k_i`. Hensel's lemma, applied to a lift of a generator of `k_i^×`, embeds the unramified extension `W_i` of `𝒪` with residue field `k_i` in `E_i`. Both are free over `𝒪` of rank `[k_i : k]`, so `E_i = W_i` by Nakayama. Hence `K₁(𝒪[Q]) ≅ ∏ W_i^×` (§F.0; Proposition 2.3) embeds in `K₁(L[Q])`, and `SK₁(𝒪[Q]) = 1`. `(c)` Normal Sylow subgroup. Let `P` have a normal Sylow `p`-subgroup `A`, put `Q = P/A`, and let `I = ker(𝒪[P] → 𝒪[Q]) = I_A·𝒪[P]`, a two-sided ideal. A power of `I` lies in `ϖ𝒪[P]`, since the augmentation ideal of `k[A]` is nilpotent, so `I` lies in the radical. Moreover `I ⊗ L = (1 − e_A)L[P]` for the central idempotent `e_A = |A|⁻¹Σ_{a∈A} a`, so `I = I²` after inverting `p`, each `I^j/I^(j+1)` is a finite `p`-group, and `1 + I` is a pro-`p` group. A class `x ∈ SK₁(𝒪[P])` maps into `SK₁(𝒪[Q]) = 1`, so `x` lies in the image of `1 + I` (Lemmas 2.1–2.2). That image is `ℓ`-divisible for each prime `ℓ ≠ p`, since a pro-`p` group has `ℓ`-th roots. Suppose `x` had order `ℓ`. Choose `z_j` in the image with `z_j^(ℓ^j) = x`. The images of the `z_j` in `K₁(L[P])` are `ℓ`-power torsion, and the `ℓ`-power torsion there is finite, of some exponent `ℓ^e` (roots of unity in the centres, step 1). So `z_j^(ℓ^e)` lies in `SK₁(𝒪[P])` and has order `ℓ^(j+1−e)`, which is unbounded in `j` and contradicts `(a)`. `(d)` General `P`. `SK₁(𝒪[−])` is a Green module over `G₀(ℚ_p[−])` (Chinburg–Pappas–Taylor `I`, Propositions 5.1–5.2; II, Proposition 4.2 and §4.`c`). For `ℓ ≠ p` choose `m` prime to `ℓ` with `m·1_P = Σ_i Ind_(H_i)^P(y_i)`, the `H_i` being `ℚ_p-ℓ`-elementary (Theorem 4.3; ClassicalArithmeticCompletion §7.63). For `x` in the `ℓ`-primary part of `SK₁(𝒪[P])`, Frobenius reciprocity gives `m·x = Σ_i Ind_(H_i)^P(y_i·Res_(H_i)x)`. Each `H_i = C_i ⋊ L_i`, with `C_i` cyclic of order prime to `ℓ` and `L_i` an `ℓ`-group, has a normal Sylow `p`-subgroup, namely the `p`-part of `C_i`. So `SK₁(𝒪[H_i])` is a `p`-group by `(c)`, each `Res_(H_i)x` is trivial, `m·x` is trivial, and `x` is trivial.
5. `sk1_vanish_abelianSylow`: `SK₁(W[D]) = 1` for every finite group `D` with abelian Sylow `p`-subgroup, `W` the integers of a finite unramified extension of `ℚ_p`; and `SK₁(𝒪[D]) = 1` for every `𝒪` when the abelian Sylow `p`-subgroup is normal. `SK₁` is a `p`-group by step 4. Choose `m` prime to `p` with `m·1_D = Σ_i Ind_(H_i)^D(y_i)` over `ℚ_p-p`-elementary subgroups `H_i = C_i ⋊ Q_i`, with `C_i` cyclic of order prime to `p` and `Q_i` a `p`-group, abelian because it lies in a Sylow subgroup. Then `m·x = Σ_i Ind(y_i·Res_(H_i)x)`, so it suffices that `SK₁` vanishes on every `H_i`. In general `W[C_i] = ∏_m W[m]` and `W[H_i] = ∏_m W[m] ∘ Q_i`. Chinburg–Pappas–Taylor II, Corollary 5.4, identifies `SK₁(W[m] ∘ Q_i)` with the image of `SK₁(W[m][H_m]), H_m ≤ Q_i`, and `W[m][H_m]` is commutative semilocal, so this is trivial by Proposition 2.3. If the Sylow subgroup `A` is normal, `Q_i = H_i ∩ A` is normal in `H_i`, so `H_i = C_i × Q_i` is abelian and `SK₁(𝒪[H_i]) = 1` directly, for every `𝒪`. This covers the groups `D = C_(p^n) × (C ⋊ P)` of §6.5, where `C` is a cyclic `p`-group and `|P|` is prime to `p`: their Sylow subgroup `C_(p^n) × C` is normal and abelian. Oliver's Proposition 12.7, cited by Kakde pp. 24 and 26, is this case.
6. `dressWall_induction` (Kakde, Theorem 25, p. 20, citing Oliver Theorem 11.2 and Wall Theorem 5.4). Let `K` be the fraction field of `𝒪` and `ℚ_p ⊆ K′ ⊆ K`. Then `K′₁(𝒪[P]) → lim_π K′₁(𝒪[π])` is an isomorphism, the limit running over the `K′`-elementary subgroups `π` of `P` along restriction (norm) maps and conjugations; moreover `K′₁(𝒪[P])` is the sum of the images of induction from those `π`. Kakde's Theorem 25 is the case `K′ = K`, and §6.4 uses `K′ = ℚ_p`. Proof. The subgroup `K′₁(𝒪[−])` of `K₁(K[−])` is stable under induction, restriction and conjugation, which commute with `K ⊗_𝒪 −`. It is also stable under the action of a `K′[P]`-module `V` by `V ⊗_{K′} −` with the diagonal action: `V` has a full `𝒪_{K′}[P]`-lattice `M, M ⊗_{𝒪_{K′}} −` preserves finitely generated projective `𝒪[P]`-modules, and it induces `V ⊗ −` on `K₁(K[P])`. So `K′₁(𝒪[−])` is a Green module over `G₀(K′[−])` without Swan's theorem; on determinants this is integral-character twisting (ClassicalArithmeticCompletion §7.47). The integers `n` for which `n·1_P` is a sum of inductions from `K′`-elementary subgroups form an ideal of `ℤ`, which by Theorem 4.3 contains an integer prime to `ℓ` for every prime `ℓ`; hence it contains 1, which gives `1_P = Σ_i a_i Ind_(π_i)^P(y_i)` with `π_i K′`-elementary, `y_i ∈ G₀(K′[π_i])` and `a_i ∈ ℤ`. For `K′ = ℚ_p` this is the integral identity of ClassicalArithmeticCompletion §7.63. Dress's argument (Chinburg–Pappas–Taylor II, Theorem 4.4, after Oliver Theorem 11.1) concludes as follows. Injectivity: `x = Σ_i a_i Ind_(π_i)(y_i·Res_(π_i)x)`, which is trivial if every restriction is. Surjectivity: for a compatible family `(x_π)` put `x = Σ_i a_i Ind_(π_i)(y_i·x_(π_i))`. For each `π` the Mackey formula writes `Res_π Ind_(π_i)` as a sum over double cosets of inductions from the subgroups `π ∩ gπ_ig⁻¹` after conjugation. These subgroups are `K′`-elementary, so compatibility replaces each conjugated restriction of `x_(π_i)` by the restriction of `x_π`. Reassembling with the Mackey formula in `G₀(K′[−])` gives `Res_π x = Res_π(1_P)·x_π = x_π`. The identity for `1_P` also gives the statement about induction.
7. `sk1_eq_limit_of_continuity` is conditional: assume explicitly that the natural map `K₁(Λ_𝒪(G))→lim_Δ K₁(𝒪[Δ])` is bijective, where `Δ` runs through the finite continuous quotients of `G`. Taking kernels of the Artin determinants then gives `SK₁(Λ_𝒪(G))≅lim_Δ SK₁(𝒪[Δ])`. The equivalent adic-continuity assertion is Fukaya–Kato Proposition 1.5.1 as restated by Kakde §4.1, p. 18, and Witte, *Unit L-functions*, §2, p. 92; bijectivity for infinite `G` is a hypothesis here. The `K′₁` main-conjecture proof is independent of continuity; the `K₁`-level comparison in §6.5 is conditional on it.

The finite Whitehead inputs used later are the targets of steps 1 and 4–6: `sk1_semisimple_padic`, `sk1_finite`, `sk1_pGroup`, `sk1_vanish_abelianSylow` and `dressWall_induction`. The limit comparison in step 7 retains its bijectivity hypothesis.

The torsion formula for `K₁(ℤ_p[P])` of a finite `p`-group (Wall; Oliver Theorem 7.4) is not used: §6.5 proves its injectivity by characters, and §6.12 uses only the torsion `Det(G_n)` supplied by ClassicalArithmeticCompletion §7.73. In §6.5, `G=Γ×(C⋊P)` with `C` cyclic of `p`-power order and `|P|` prime to `p`; its finite quotients `Γ/Γ^(p^n)×(C⋊P)` have the displayed form. No vanishing for arbitrary `p`-groups or `p`-elementary groups is asserted: §6.6 uses the character-component decomposition proved there and ClassicalArithmeticCompletion §7.109, not Proposition 12.7.

**Source status of the finite Whitehead inputs.** Steps 1–6 have freely readable proofs, from the sources above and the owners named. Two classical textbook statements enter only as stated. Swan's isomorphism `G₀^{ℤ_p}(ℤ_p[Δ]) ≅ G₀(ℚ_p[Δ])` (Curtis–Reiner (38.42), (39.10); Chinburg–Pappas–Taylor `I`, Proposition 5.1) is used in steps `4(d)` and 5, so that `SK₁` is a module over the rational representation ring; `K′₁` in step 6 does not need it. The Witt–Berman induction theorem (Serre, Theorem 28; Chinburg–Pappas–Taylor `I`, Theorem 5.4, and II, Theorem 4.3) is the field-of-definition induction theorem owned by ClassicalArithmeticCompletion §7.63. The Dress–Oliver induction theorems (Oliver, Theorems 11.2 and 11.9) and Oliver's `SK₁` computations are not used: steps 4–6 replace them. The `K′₁` main-conjecture proof is independent of continuity; `sk1_eq_limit_of_continuity` and the `K₁`-level clause of §6.5 retain the bijectivity hypothesis of step 7.

API: `SK1` (`SK₁` of `𝒪[P]`; of `Λ_𝒪(G)` as the kernel to `lim_Δ K₁(L[Δ])`; and its images in the localizations); `K1Prime` `(K′₁(R) = K₁(R)/SK₁(R))`; `k1Prime_equiv_limit` (`K′₁(Λ_𝒪(G)) ≅ lim_Δ K′₁(𝒪[Δ])`, step 2); `k1Prime_equiv_limit_proP` (`K′₁(Λ(G)) ≅ lim K′₁(Λ(G/U))` over open pro-`p U ≤ H` normal in `G`, step 3); `k1Prime_map` (natural in `G`: quotient maps and norms); `evaluate_k1Prime` (Artin evaluation factors through `K′₁` (§3.3)); `sk1_semisimple_padic`; `sk1_finite`; `sk1_pGroup`; `sk1_vanish_abelianSylow`; `dressWall_induction`; `sk1_eq_limit_of_continuity` (under the stated bijectivity hypothesis); `k1Prime_compat` (the inverse-limit isomorphisms commute with quotient maps and norms).

**Checks.**

- For `p=7`, `ℤ₇[C₃]≅ℤ₇³`: the two nontrivial characters are distinct degree-one factors, so one factor per divisor would lose a component.

- `abelian`: `G` abelian: `SK₁(Λ(G)) = 1` and `K′₁(Λ(G)) = K₁(Λ(G)) ≅ Λ(G)^×`.
- `kernel_needs_all_levels`: For `G = Γ` and `T = γ − 1`, the unit `γ^(p^n) = (1 + T)^(p^n)` of `ℤ_p[[T]]` has trivial image in `K₁` of every level `Γ/Γ^(p^m)` with `m ≤ n`, but its value at a character of order `p^(n+1)` is a primitive `p`-th root of unity. So a definition of `SK₁(Λ_𝒪(G))` testing only the augmentation, or only finitely many levels, would put a nontrivial unit in `SK₁`. With all levels `SK₁(Λ(Γ)) = 1`: a power series `u` with `u(ζ − 1) = 1` at every `p`-power root of unity `ζ` is 1, since a nonzero power series has finitely many zeros in the open unit `disc` (Weierstrass preparation).
- `prime_to_p_times_abelian`: `G = G_ab × Δ` with #`Δ` prime to `p: K′₁(Λ(G)_S) = K₁(Λ(G)_S)` (Kakde, Lemma 17).
- `finite_cyclic`: `P` cyclic: `SK₁(ℤ_p[P]) = 1`, so `K′₁(ℤ_p[P]) = K₁(ℤ_p[P]) = ℤ_p[P]^×`.
- `prime_to_p_order`: `P = C_ℓ, ℓ ≠ p: ℤ_p[C_ℓ]` is `ℤ_p × ∏_{i=1}^{(ℓ−1)/f}ℤ_p[ζ_ℓ]`, where `f=ord_ℓ(p)`, as step 4`(b)` predicts, and `SK₁ = 1`.
- `normal_versus_general_sylow`: `S₃` at `p = 3` has the normal abelian Sylow subgroup `C₃`, so step 5 applies for every `𝒪` through abelian `ℚ₃-3`-elementary subgroups. At `p = 2` its Sylow subgroup `C₂` is abelian but not normal, `S₃` is itself `ℚ₂-2`-elementary, and step 5 uses Corollary 5.4 with `W` unramified. Both give `SK₁ = 1`.
- `elementary_family`: `P = S₃` and `p = 7`: since `7 ≡ 1 (mod 3), Gal(ℚ₇(μ₃)/ℚ₇)` is trivial, `S₃` is not `ℚ₇`-elementary, and step 6 computes `K′₁(𝒪[S₃])` from `C₃`, the three subgroups `C₂` and the trivial group. The two-dimensional character of `S₃` is a `ℤ`-combination of characters induced from `C₃` and `C₂`, as the Witt–Berman identity requires.
- `continuity_commutative`: For `G = Γ, Λ = ℤ_p[[T]]` is commutative local, `K₁(Λ) = Λ^×` and `lim_n (Λ/J^n)^× = Λ^×`, so the explicit bijectivity hypothesis of §3.11, step 7 is immediate; its content is noncommutative.
- For `p=2` and the trivial group, the torsion units of `ℤ₂` are `{1,−1}=μ₂`. Replacing `μ(ℤ₂)` by `μ_(p−1)=μ₁` would lose `−1` even before a group ring is formed.
- `sk1_invisible`: Elements differing by an element of `SK₁` have identical Artin evaluations and identical boundary. If `SK₁` is nontrivial, these data cannot give uniqueness in `K₁`; no nontriviality or vanishing for every group is assumed.
- The abelian Sylow hypothesis of step 5 is needed: for a `p`-group `P`, Chinburg–Pappas–Taylor II, Theorem 1.6, gives `SK₁(W[P]) ≅ H̄₂(P,ℤ) ⊗ W/(1−F)W`, which is nonzero whenever `H₂(P,ℤ)` is not generated by the images of abelian subgroups.
- `K′₁` is used because `SK₁` is invisible to Artin evaluations; uniqueness in the main conjecture holds in `K′₁`.

*Needs:* [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set); [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality); [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); TauCetiRoadmap ClassicalArithmeticCompletion §§7.27, 7.47, 7.63; §F.0; RepresentationTheory`/`SemisimpleAlgebras; IntegralHeckeAndGaloisDeterminants Layer 0.

<a id="ne3-semisimple-total-quotient"></a>
### 3.12 Semisimple total quotient in dimension one

**Construction.** Suppose `G` is compact `p`-adic analytic with an open central `Γ₀≅ℤ_p`, and `O` is a finite extension ring of integers. With `R=O[[Γ₀]]` and `F=Frac(R)`, define `Q_O(G)=F⊗_R O[[G]]`. It is the classical total ring of fractions and a finite-dimensional separable semisimple `F`-algebra; changing `Γ₀` gives the canonically isomorphic total quotient. It is distinct from `Λ(G)_S` and `Λ(G)[1/p]`.

See Kakde, §5.1.4, Lemma 37, pp. 31–32: Identifies the total fraction algebra with the central fraction-field scalar extension. Nickel, Example 2.7 and §2.2, pp. 7–8: Treats one-dimensional Iwasawa algebras as orders in separable semisimple total quotient algebras.

The hypotheses are as follows. `G` has an open central `ℤ_p`-subgroup (the one-dimensional situation of the cited routes); `O` finite over `ℤ_p`; coefficients are characteristic zero after tensoring.

*Construction.*

1. The finite free `Λ_O(Γ₀)`-basis from open-subgroup freeness has multiplication given by a central finite-group cocycle; use the pinned `TauCeti.twistedMonoidAlgebra` from `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`. This argument does not depend on the later Kakde carry calculations.
2. After extending to an algebraic closure of `F`, the finite twisted group algebra is semisimple by averaging in characteristic zero.
3. Every regular element becomes an invertible endomorphism of the finite-dimensional semisimple algebra; use the universal localization property.

API: `IwasawaTotalQuotient.ofCentralSubgroup` `(Q_O(G)=Frac(O[[Γ₀]])⊗O[[G]])`; `IwasawaTotalQuotient.map` (The injective map `Λ_O(G)→Q_O(G)` inverts all regular elements); `IwasawaTotalQuotient.centralChange` (For two open central subgroups the two constructions commute with the `Λ_O(G)` embeddings); `IwasawaTotalQuotient.split` (After a common finite splitting extension the simple factors become matrix algebras, with their individual centers retained).

**Checks.**

- `semisimple_total_quotient_1`: For `G=ℤ_p, Q_O(G)=Frac(O[[T]])`, whereas the canonical `S`-localization still does not invert `p`.
- `semisimple_total_quotient_2`: For `G=C₂×ℤ_p` with `p` odd, `Q_Zp(G)` is the product of two copies of `Frac(ℤ_p[[T]])`; it is not a field.
- `semisimple_total_quotient_3`: For the trivial finite quotient, the construction is just the central field `F`; changing `Γ₀` to `Γ₀^p` gives the same total quotient of the larger algebra.

*Needs:* [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); [1.11](#ne1-canonical-localization) (The canonical localisation `Λ(G)_S`); TauCetiRoadmap ProfiniteProPGroups, Layer 9; Tau Ceti `twistedMonoidAlgebra`.

<a id="ne3-reduced-norm-sk1-comparison"></a>
### 3.13 Reduced norms and the surviving `SK₁` ambiguity

**Theorem.** For the dimension-one total quotient `Q=∏_i M_(n_i)(D_i)`, use the componentwise reduced norms supplied by IntegralHeckeAndGaloisDeterminants Layer 0. They induce `Nrd:K₁(Q)→ζ(Q)^×`, with kernel `SK₁(Q)`. After a common splitting field, equality of determinant functions on all simple factors is equivalent to equality of reduced norms. Thus equality of all such characterwise determinants determines a localized class only modulo the inverse image of `SK₁(Q)`; without injectivity `K₁(Λ_S)→K₁(Q)`, it need not even determine a unique class modulo an internally defined kernel. Artin evaluations at admissible cyclotomic points require a separate separation argument. Kakde’s finite-level `SK₁(Λ)` and this `SK₁(Q)` are different definitions.

See Ritter–Weiss 2011, Introduction and §1, pp. 1–5: Uses `Det` as the reduced-norm-valued character function; the main theorem is an existence assertion. Ritter–Weiss 2026, Introduction and Theorem 1`A`, pp. 1–7: Makes the total quotient `SK₁` obstruction explicit and reduces its vanishing conditionally. Nickel, §2.2, pp. 7–8; Remark 2.19, p. 11: Relates splitting determinants to reduced norms and explains why a Fitting equality cannot recover a relative boundary.

The hypotheses are as follows. Dimension-one `Q` as above; all simple factors and their centers retained; a common splitting field. For conclusions about `Λ_S` additionally state the kernel of its map to `Q`; equality at isolated points is not substituted for equality of determinant functions.

*Proof.*

1. Import the reduced norm as the splitting-independent determinant law, extend to stable matrices and factor through `K₁` using elementary matrices. Define `reducedNormCharacter` on the central simple factors and prove its independence of the splitting field and its compatibility with the Artin determinants of §3.3.
2. Read equality of split determinants componentwise; faithful extension of centers detects equality of the reduced norms.
3. Take the kernel of `K₁(Λ_S)→K₁(Q)→ζ(Q)^×` and retain it explicitly; use a proved power-series separation theorem only when converting interpolation values to functions.

**Checks.**

- For `Q=M₂(F), Nrd` is the ordinary determinant, so `diag(a,b)` maps to ab, not (ab)`²`.
- For `Q=F×F` the two components remain ordered; `(a,b)` and `(b,a)` cannot be identified by multiplying them.
- A hypothetical nontrivial `x∈SK₁(Q)` has every split determinant equal to 1 but `x≠1`; no proof of uniqueness can discard this possibility.

*Needs:* [3.12](#ne3-semisimple-total-quotient) (Semisimple total quotient in dimension one); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); §F.0; IntegralHeckeAndGaloisDeterminants Layer 0.

<a id="ne3-artin-evaluation-functoriality"></a>
### 3.14 Functoriality and induction of Artin evaluation

**Theorem.** For the CFKSV twist `Φ_ρ(g)=ρ(g)⊗ḡ` and Artin representations admitting the localized map, coefficient extension carries its determinant to the extended determinant, `Φ_(ρ⊕σ)` gives the product of evaluations, and the trivial `n`-dimensional representation evaluates a scalar unit `u` as `u^n`. For an open subgroup `U⊆G` with compatible canonical denominator sets, the transfer in `K₁` evaluates at `σ` as the original class at `Ind_U^G σ`. Quotient descent evaluates at a representation of `G/N` by inflation. All augmentation evaluations are asserted only on the regular-at-zero domain, with zeros/`poles` recorded separately.

See CFKSV, §3, pp. 171–173, equations (13)–(22); Theorem 3.10, pp. 183–184: Defines the matrix map and its augmentation, and gives the induction comparison behind Artin formalism. Kakde, §§3–4, pp. 13–30; Proposition 95, pp. 67–69: Uses norm, quotient and induced-character compatibilities in the interpolation reductions.

The hypotheses are as follows. Representations continuous with finite image on stable `O`-lattices; coefficient extension contains their values. For transfer/quotient statements require the relevant ring maps or finite-projective restriction functors to carry the localized perfect subcategories to each other.

*Proof.*

1. Compare the matrix twisting maps on group elements and use continuity of the coefficient extension.
2. Use block determinants for sums and the coset matrix for an induced representation; apply Morita invariance with the same left-module convention.
3. Transport through the Ore universal property when denominators are invertible; restrict augmentation to its domain of regularity.

**Checks.**

- For a scalar unit `u∈O^×` and `dim ρ=n`, evaluation is `u^n`.
- For `G=C₂×Γ, U=Γ` and `σ=1, Ind σ=1⊕sgn`; evaluation after transfer is the product of the two scalar evaluations.
- A class represented by `T` has augmentation zero and `T⁻¹` a pole; neither belongs to an everywhere `O^×`-valued evaluation map.

*Needs:* [3.1](#ne3-twist-homomorphism) (The ring homomorphism `Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ))`); [3.2](#ne3-twist-extends-to-localisation) (`Φ_ρ` extends to the localisation at `S*`); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); §F.0; TauCetiRoadmap InductionRestriction, Layer 6.

### Examples

- For `G = Γ, H = 1` and `M = Λ(Γ)/(T − p): ξ_M(1) = −p` and `χ(Γ, M) = p = |−p|_p^{−1}` (§3.6).
- For `ξ = [γ]` and a character `η` with `η(γ) = a: Φ′_η(ξ) = a(1 + T)`; the inverse substitution would give `a⁻¹(1 + T)` (§3.10, correction `E16`).
- For noncommuting matrices the transpose reverses products, so the row action uses `ρ(g)` and the module twist uses the contragredient (§3.5, correction `E29`).

### Dependencies

Layers 0, 1, 2 of this roadmap; the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; §F.0, IntegralHeckeAndGaloisDeterminants Layer 0, §F.2, TauCetiRoadmap ClassicalArithmeticCompletion Layer 7, TauCetiRoadmap InductionRestriction Layer 6, Tau Ceti `twistedMonoidAlgebra`, TauCetiRoadmap PadicMeasuresIwasawaAlgebras §1.7, TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§4.2, 4.6, TauCetiRoadmap ProfiniteProPGroups Layer 9; Mathlib `Matrix`.

<a id="ne-foundations-arithmetic-duality"></a>
### `F`.3 Continuous arithmetic cochains and duality

**Construction.** Start with ProfiniteCohomology’s cochain carrier, connecting maps and cup products. For finite coefficients use its existing discrete theory. For a compact `O`-module `T=lim T/U` with finite continuous quotients, construct the continuous cochain complex as the inverse limit of the finite-coefficient complexes, with the derived inverse-limit comparison; for discrete torsion coefficients use filtered unions, and for a finite-dimensional `L`-representation use a stable lattice and inversion of `ϖ`. Prove independence of the lattice, identity and composition for coefficient maps, restriction/corestriction, cup products, and the comparison with continuous function cochains. Admissible topological coefficient sequences must have the continuous sections or strict inverse-limit exactness needed to induce the connecting maps; exactness of arbitrary topological cochain sequences is not presumed. Construct the Hochschild–Serre spectral sequence for a closed normal subgroup, with its five-term sequence and the existing restriction, inflation and transgression. (Nekovář, *Selmer complexes*, §§3.7, 4.2.1–4.2.9; NSW, Chapters `I`–II; Ribes–Zalesskii, Theorem 6.2.4.)

For a finite extension `K/ℚ_ℓ`, finite `p`-primary continuous `G_K`-module `M`, and Cartier dual `Mᴰ=Hom(M,μ_{p∞})`, transport the local Tate pairing from ClassFieldTheory Layer 5 to these cochains: `H^i(K,M) × H^{2−i}(K,Mᴰ) → ℚ_p/ℤ_p` is perfect, with trace normalized by the local invariant. Construct its derived form and pass through compact limits and scalar extension. For finite free `O`-lattices and finite-dimensional `L`-representations use the dual with the Tate twist, preserving the degree-two duality and the natural evaluation pairing. The extension adds topological and derived comparisons to the supplied finite local theorem. At `K/ℚ_p`, for finite `𝔽_p`-representations prove `Σ_i (−1)^i dim_{𝔽_p} H^i(K,M)=−[K:ℚ_p] dim_{𝔽_p} M`. For general finite `p`-primary `M`, use `Σ_i (−1)^i log_p #H^i(K,M)=−[K:ℚ_p] log_p #M`. (Nekovář, §§5.2.2–5.2.3 and Propositions 5.2.5–5.2.7; NSW, local duality and local Euler characteristic.)

For a number field `F`, finite `Σ` containing the `p`-adic and infinite places and all coefficient ramification, and finite `p`-primary `M`, prove finiteness of global cohomology and Poitou–Tate’s exact sequence, including every degree-zero term and the local sums. For odd `p`, or for totally imaginary `F`, prove `cd_p G_{F,Σ}≤2`. For odd `p` and finite `𝔽_p`-representations prove the global Euler formula `Σ_i (−1)^i dim H^i(F_Σ/F,M)=−r₂(F) dim M−Σ_{v real} dim M^{c_v=−1}`. None of these assertions implies weak Leopoldt along a tower. (NSW, §8.6, in particular Theorem 8.6.7 and the duality argument of 8.6.13; Nekovář, §§5.3–5.4.)

Define compact support as the mapping fibre of localization from the global cochains to the sum of local cochains, using complete Tate cochains at every real place. Give the localization triangle, naturality for extension and trace, and the evaluation cup product with the dual coefficients. Prove the degree-three global duality isomorphism on the admissible compact/discrete coefficient categories; for finite free `T` the perfect-complex form is `RΓ_c(F,T) ≃ RHom_O(RΓ(F,T*(1)),O)[−3]` whenever the stated complexes are perfect. The pairing on finite coefficients takes values in `ℚ_p/ℤ_p[−3]`. Preserve the induced contragredient group action and the involution `g↦g⁻¹` on completed coefficients. Write `RΓ_c` for this Tate-modified compact support in every global duality and determinant statement below. At odd `p` the real Tate complexes are acyclic. Define `RΓ_c,ord` with ordinary real cochains separately, and retain the comparison triangle `RΓ_c,ord → RΓ_c → ⨁_{v real} Cone(RΓ(F_v,T)→RΓ̂(F_v,T))[−1]`; its final term is `⨁_{v real}T^{c_v=1}` in degree zero at odd `p`. It vanishes when there are no real places. (Nekovář, §§5.3.1–5.3.3, §§5.4.2–5.4.5 and §§5.7.1–5.7.5.)

The API is `arithmeticContinuousCochains`, its finite/compact/rational comparisons and coefficient maps; `arithmeticHochschildSerre`, its edge maps and five-term sequence; `arithmeticLocalDuality`; `arithmeticPoitouTate`; `arithmeticCompactSupport`, its localization triangle and real-place comparison; and `arithmeticGlobalDuality`. The trace maps, duality shifts, cups and local/global compatibility are part of these targets, rather than fields standing in for unproved identities.

**Checks.**

- For `F=ℚ`, `Σ={p,∞}`, odd `p` and `T=ℚ_p`, ordinary compact support has a degree-one `ℚ_p` from the diagonal degree-zero map. Tate-modified support has no such summand, consistently with degree-three duality.
- For `M=ℤ/p²`, the local Euler formula uses logarithms of cardinalities; `H⁰(K,M)` is not an `𝔽_p`-vector space.

- For a finite coefficient module the construction is the supplied continuous cochain complex; replacing its topology by an arbitrary discrete topology on an infinite `p`-adic vector space changes the cochains and fails the compact-limit comparison.
- Local duality pairs `H⁰(K,M)` with degree two of `Mᴰ`; for `M=μ_{p^n}`, the normalized degree-two invariant has values in `(1/p^n)ℤ/ℤ`. Removing the twist interchanges the wrong coefficients.
- Over `ℚ` at odd `p` the trivial `𝔽_p`-coefficient has global Euler characteristic zero, while the cyclotomic `𝔽_p(1)` has Euler characteristic minus one; the real minus eigenspace distinguishes them.
- At a real place and `p=2`, `Ĥ^{2i}(C₂,ℤ₂)=ℤ/2` and odd Tate degrees vanish. Thus modified and ordinary compact support cannot be identified by discarding the real term. With no real places the comparison is an isomorphism.
- For the trivial group, continuous cohomology has `H⁰=T` and zero positive cohomology. For `ℤ_p` and trivial compact `O`, its procyclic resolution gives `H⁰=H¹=O`; replacing the compact theory by the cohomology of one finite quotient fails this comparison.
- The compact-support fibre of the identity map of a coefficient complex is acyclic, while the fibre of its map to zero is the original complex. These two cases fix the mapping-fibre shift and distinguish it from the unshifted `cone`.

*Needs:* ProfiniteCohomology Layers 5–12; ClassFieldTheory Layers 5, 10–13; DerivedModuleAlgebra §§0.2, 1.1.1, 1.`T`.1; §F.2; PadicMeasuresIwasawaAlgebras §5.2.

<a id="ne-foundations-selmer-iwasawa"></a>
### `F`.4 Selmer mapping fibres, Iwasawa cochains and control

**Construction.** For the number field, coefficient and ramification data of §F.3, a compact lattice `T`, its rational representation `V=T⊗_O L` and discrete quotient `A=V/T`, define local Kummer, unramified and Greenberg conditions on the actual continuous cochains. For an elliptic curve the Kummer image is `E(K_v)⊗ℚ_p/ℤ_p → H¹(K_v,E[p∞])`. For a finite free representation with a specified stable direct summand `T_v^+` at `v|p`, the strict ordinary complex is `C(G_v,T_v^+)→C(G_v,T)`; away from `p` the unramified complex is `C(G_v/I_v,T^{I_v})`. Distinguish the ordinary kernel condition on `H¹(I_v,A/A_v^+)` from the image of the strict ordinary complex, and retain the degree-zero correction and finite local errors. Define the Selmer group as the kernel of the localization map modulo the chosen images and its Pontryagin dual with action `(gφ)(x)=φ(g⁻¹x)`. Prove functoriality for coefficient maps and compatible local conditions, exactness of Pontryagin duality, the restriction/corestriction comparisons and the comparison with the elliptic Selmer group of §4.1. (Nekovář, §§6.2.1–6.2.7, §§6.7.1–6.7.6 and §§8.9–8.10; CFKSV, §5, pp. 197–200.)

Define `arithmeticSelmerComplex` as `Cone(C(G_{F,Σ},T) ⊕ ⨁_v U_v^+ → ⨁_v C(G_v,T))[−1]`, with the localization-minus-local-condition map, the real convention of §F.3 and the cohomological sign convention of this roadmap. Construct its long exact sequence, the exact `H⁰` correction comparing `H¹` with the kernel-defined Selmer group, and the triangle for changing local conditions. Define the dual local complex as the actual orthogonal mapping-fibre condition under the local pairing; prove the global degree-three duality of the two Selmer complexes, including its cup-product transposition sign. For strict ordinary direct summands identify the dual summand as the annihilator with the Tate twist. For unramified conditions at primes away from `p` retain the integral inertia error; it vanishes after rationalization in the hypotheses of Nekovář’s unramified duality theorem. (Nekovář, Theorem 6.3.4, §§6.7, 7.8.4.5–7.8.7 and §§8.9.6–8.9.7.)

For a Galois tower `F_∞/F` unramified outside `Σ`, with compact `p`-adic analytic group `G`, define `arithmeticIwasawaCochains` by the derived inverse limit of finite-layer cochains under corestriction, and define the Iwasawa Selmer complex from the compatible local diagrams. Compare it with cochains of the completed induced coefficient, using `g⁻¹` on the coefficient factor so that the remaining completed action is the stated left action. Prove Iwasawa Shapiro, identity and transitivity under changing finite layers, and derived specialization along quotient towers whenever the local diagrams are transported by derived scalar change. Finite generation of the bounded cohomology follows from finite-coefficient finiteness, the compact-limit comparison and compact Nakayama; when `G` has no `p`-torsion this gives perfectness by §0.11. For arbitrary `G`, use the separate perfection constructions and hypotheses of §§4.5–4.7 instead. For odd `p`, or without real places, global cohomology is bounded in degrees zero to two before the Selmer mapping fibre; at real dyadic places keep the specified Tate modification. (Nekovář, §§8.9–8.10, in particular Proposition 8.10.1; the induced-coefficient and perfection construction of Witte, *Unit `L`-functions*, §2, p. 92.)

Prove the control exact sequences from these derived specialization triangles, retaining the global `H⁰` terms and every local kernel and cokernel. Finite-level Selmer groups are ordinary tensor specializations only when these explicit error terms vanish. Give rational and integral duality with the completed-group-algebra involution, the determinant-line consequence in the commutative case using PadicMeasuresIwasawaAlgebras §5.1, and the comparison of the cochain model with continuous étale cohomology of `Spec 𝒪_{F,Σ}`. This comparison includes restriction, corestriction and compact support; finite étale covers and descent use SchemeAndStackFoundations and EtaleCohomologyFoundations on main. (Nekovář, §§8.9–8.10; NSW, §8.6; Witte, *Unit `L`-functions*, §2.)

Define `LeopoldtConjecture F p` to assert injectivity of the localization of global units after tensoring with `ℚ_p` into the product of the `p`-adic local multiplicative completions. Equivalently its defect is zero, where the defect is `r₁+r₂−1` minus the rank of that localization. Prove invariance under choices of bases and under replacing local units by their principal-unit finite-index subgroups, and the equivalence with the nonvanishing of a correctly sized `p`-adic regulator. This is a proposition, not a theorem for every number field. Field-level Leopoldt and the tower weak-Leopoldt vanishing of §4.4 are distinct. (NSW, Chapter `X` §3; Burns–Venjakob, §5, Lemma 5.1 and Conjecture 5.2.)

The API includes the three local-condition maps and their coefficient compatibilities; `arithmeticSelmerComplex.changeCondition`; `arithmeticSelmerComplex.h1_exact`; `arithmeticSelmerComplex.duality`; `arithmeticIwasawaCochains.shapiro`, its quotient-tower specialization; `arithmeticSelmerComplex.control` with named errors; and `LeopoldtConjecture.regulator_iff`.

**Checks.**

- With no imposed local conditions the defining `cone` gives the corresponding global/`local` fibre, not the kernel of the cochain map in each degree. A nonzero local `H⁰` term survives in the `H¹` comparison.
- For the zero representation the global, local and Selmer complexes are zero. For the strict condition `T_v^+=T`, the local ordinary quotient is zero; for `T_v^+=0` it is the full local complex. These two extremes have opposite dual local conditions.
- For `G=ℤ_p` and a two-term free complex with differential `T`, specialization at `T=0` has two nonzero cohomology groups. Specializing only the cokernel misses the `Tor` correction, so it cannot be used as a control theorem.
- At a real place and `p=2` the Tate term from §F.3 remains present; a bounded odd-prime amplitude assertion cannot be transferred to ordinary real dyadic cochains.
- The unit group of `ℚ` has rational rank zero, so its Leopoldt map is injective. For any field with positive unit rank, the zero localization map would fail this definition; a rank bound alone is not injectivity.
- The Kummer condition for an elliptic curve fits into `0 → E(K_v)/pⁿ → H¹(K_v,E[pⁿ]) → H¹(K_v,E)[pⁿ] → 0`. It includes every local division-point cocycle and excludes a class with nonzero last image. For `ℤ_p(1)` over a `p`-adic field, local units and a uniformizer give distinct directions; the finite unit condition excludes the latter.
- The unramified condition is the kernel of restriction to inertia: an inflated class is admitted, a class with nonzero inertia restriction is excluded, and a zero inertia-invariant coefficient module gives a zero unramified complex. Its degree-zero term is still present when inertia invariants are nonzero.
- For Greenberg conditions, `T_v^+=T`, `T_v^+=0` and a proper stable direct summand give respectively zero, full and proper ordinary quotients. In a split direct sum the condition keeps the indicated summand; exchanging it with its complement changes the localization kernel.
- Leopoldt’s defect is unchanged by a change of unit basis, and by replacing each local unit group with a finite-index principal-unit subgroup after tensoring with `ℚ_p`. A nontrivial linear relation among the localized fundamental units makes the defect positive and the regulator zero. This distinguishes the proposition from the automatic upper rank bound.

*Needs:* §F.3; §§0.3–0.4, 0.`11, F`.1–`F`.2; ProfiniteCohomology Layers 5–12; PadicMeasuresIwasawaAlgebras §§1.7, 5.1–5.2; ClassFieldTheory Layers 5, 10–13; DerivedModuleAlgebra §§0.2, 1.1.1, 1.`T`.1, 1.`E`.0; SchemeAndStackFoundations (finite étale descent); EtaleCohomologyFoundations (continuous étale coefficients).

## Layer 4: Equivariant arithmetic complexes

The module-level `GL₂` example and the equivariant complexes are both targets. The totally real dual Galois complex `C(F_∞/F)` is not identified with ordinary compact support without duality, shifts and local corrections, and the real-place correction at `p = 2` is a separate comparison. Modules `TauCeti/NumberTheory/NoncommIwasawa/GL2Selmer` and `.../Layer4`.

<a id="ne4-gl2-dual-selmer-module"></a>
### 4.1 The dual Selmer module over the trivialising extension of `E[p^∞]`

**Construction.** Let `E/ℚ` be an elliptic curve and `p ≥ 5` a prime of good ordinary reduction, `F_∞ = ℚ(E_{p^∞}) ⊇ ℚ(μ_{p^∞}) ⊇ ℚ^cyc` (Weil pairing), `G = Gal(F_∞/ℚ)` (a closed subgroup of `GL₂(ℤ_p)`, of dimension 4 without CM and 2 with CM, and with no element of order `p`), `H = Gal(F_∞/ℚ^cyc), Γ = Gal(ℚ^cyc/ℚ)`. For an algebraic extension `L/ℚ` the Selmer group is `𝒮(E/L) = ker(H¹(L, E_{p^∞}) → Π_w H¹(L_w, E(L̄_w)))` over the non-archimedean `w`, and `X(E/L) = Hom(𝒮(E/L), ℚ_p/ℤ_p)`; for `L/F` Galois with compact `p`-adic Lie group `Gal(L/F)` and finitely many ramified primes, `X(E/L)` is a finitely generated left `Λ(Gal(L/F))`-module. Also `G_F = Gal(F_∞/F), H_F = Gal(F_∞/F^cyc)` and `Y(E/K) = X(E/K)/X(E/K)(p)`.

See CFKSV, §5, set-up, p. `197: F_∞ = ℚ(E_{p^∞}), G, H, Γ`. CFKSV, §5, Selmer groups and the hypotheses on `p`, p. `198: 𝒮(E/L), X(E/L)` and the hypotheses on `p`.

The hypotheses are as follows. `p ≥ 5` and good ordinary reduction; `p ≥ 5` is what rules out `p`-torsion in `G ⊂ GL₂(ℤ_p)`. This is the module-level Selmer instance; the separate §4.6 and dual-complex targets specify the complex-level objects.

*Construction.*

1. Import the Selmer definition, local Kummer conditions and restriction maps from §F.4; arithmetic duality is supplied by §F.3.
2. For a compact pro-`p` open subgroup `U` of `Gal(L/F)`, prove finiteness of the `mod-p U`-coinvariants using the appropriate Selmer restriction/control theorem, including its local error terms. Compact Nakayama then gives finite generation over `Λ(U)`, and the open-index comparison gives it over `Λ(Gal(L/F))`. The control theorem is a target of this subsection, using §F.4 for the cyclotomic-level control; finite generation of `X(E/F)` alone does not give it. The specialization targets are `ellipticSelmer_eq_greenberg` (for good ordinary `p` the classical elliptic Kummer condition at `p` agrees with the Greenberg condition of §F.4 defined by the kernel of reduction, and away from `p` with the unramified condition up to the finite local error terms) and `ellipticDualSelmer_fg` (finite generation over `Λ(Gal(L/F))` for `L/F` Galois with compact `p`-adic Lie group and finitely many ramified primes; for an arbitrary algebraic `L` the Selmer group is only a direct limit over finite subextensions and no finite generation is asserted).

API: `trivialisingField` (`F_∞ = ℚ(E_{p^∞})` with `G, H, Γ`); `selmerGroup` (`𝒮(E/L)` for an algebraic extension `L/ℚ`); `dualSelmer` (`X(E/L) = Hom(𝒮(E/L), ℚ_p/ℤ_p)` as a `Λ(Gal(L/F))`-module); `dualSelmer_fg` (`X(E/L)` is finitely generated over `Λ(Gal(L/F))`); `G_noPTorsion` (`G` has no element of order `p` when `p ≥ 5`).

**Checks.**

- `selmer_cm_dim`: For `E` with CM, `G` has dimension 2; without CM, dimension 4 (Serre).
- `selmer_weil_pairing`: `F_∞ ⊇ ℚ(μ_{p^∞}) ⊇ ℚ^cyc`, so `Γ` is a quotient of `G`.
- `selmer_p3_excluded`: `p = 3: GL₂(ℤ_3)` contains elements of order `3, e`.`g`. (`0 −1`; `1 −1`), so `G` may have 3-torsion; the hypotheses exclude `p = 3`.
- `selmer_Y`: `Y(E/K) = X(E/K)/X(E/K)(p)` removes the `p`-primary torsion.
- For `L = F` a number field, `X(E/F)` is the Pontryagin dual of the `p`-primary Selmer group, with `ℤ_p`-corank the Mordell–Weil rank plus the corank of `Ш[p^∞]`.

*Needs:* TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.2 (topological Nakayama); [1.13](#ne1-category-mhg) (The category `𝔐_H(G)`); §F.3; §F.4.

<a id="ne4-mh-conjecture-and-mazur"></a>
### 4.2 The `𝔐_H(G)` conjecture and Mazur's torsion conjecture (Conjectures 5.1–5.2)

**Definition.** (Conjecture 5.1.) Under the hypotheses on `p, X(E/F_∞)` belongs to `𝔐_H(G), i`.`e`. is `S*`-torsion (§1.13). (Conjecture 5.2, Mazur.) If `E` has good ordinary reduction at `p`, then for each finite extension `F` of `ℚ, X(E/F^cyc)` is `Λ(Γ_F)`-torsion. Both are conjectural propositions. Every later conditional theorem retains its stated `𝔐_H(G)`, interpolation and main-conjecture hypotheses.

See CFKSV, §5, Conjectures 5.1 and 5.2, p. 198: The two conjectures (stated just above) and their relation.

The hypotheses are as follows. CFKSV expect Conjecture 5.1 to be equivalent to Conjecture 5.2 for all `F ⊂ F_∞`, and prove the partial results of §4.3.

*Construction.*

1. Definitions.

API: `MHConjecture` `(X(E/F_∞) ∈ 𝔐_H(G))`; `MazurTorsionConjecture` (`X(E/F^cyc)` is `Λ(Γ_F)`-torsion for every finite `F`); `MHConjecture.of_criteria` (The sufficient conditions of §4.3).

**Checks.**

- `mh_cm_case`: For CM curves Conjecture 5.2 holds (two-variable main conjecture; CFKSV p. 200), and 5.1 reduces to `μ = 0` over some `L` (Corollary 5.5).
- `mh_conductor11`: For the conductor-11 curves at `p = 5`, Conjecture 5.1 holds (§4.3).
- `mh_p_primary`: In the membership predicate, if `X` is annihilated by a power of `p` then `X/X(p)=0`, so it lies in `𝔐_H(G)`. Requiring `X` itself to be `Λ(H)`-finite would reject the test `X=Λ(G)/p` for positive-dimensional `H`.
- Conjecture 5.2 is the cyclotomic input of every `GL₂` main-conjecture statement; keep it separate from 5.1.
- For the zero Selmer module both predicates hold; for the free module `Λ(G)` the `𝔐_H(G)` predicate fails because its localization is nonzero. The proved criteria and CM cases of §4.3 do not prove Conjecture 5.1 for every ordinary elliptic curve.

*Needs:* [4.1](#ne4-gl2-dual-selmer-module) (The dual Selmer module over the trivialising extension of `E[p^∞]`); [1.13](#ne1-category-mhg) (The category `𝔐_H(G)`).

<a id="ne4-noncommutative-mu"></a>
### 4.2a Noncommutative module μ and pseudo-nullity

**Construction.** Let `G` be compact analytic pro-`p` without elements of order `p`, and `M` a finitely generated `Λ(G)`-module. Its submodule `M(p)` is killed by some `p^n` by noetherianity. For a uniform open subgroup `U`, put

`noncommMu G M = [G:U]⁻¹ Σ_{i≥0} rank_{𝔽_p[[U]]}(p^i M(p)/p^{i+1}M(p))`.

The sum is finite, and residual rank is computed over the Ore division ring of the uniform residual domain. Prove that this normalized rational number is an integer, is independent of `U`, agrees with the Euler-characteristic definition `Σ_j(−1)^j log_p #H_j(G,M(p))`, and satisfies `noncommMu V M=[G:V] noncommMu G M` for every open subgroup `V`. Prove invariance under module isomorphisms, additivity on exact sequences of `p`-primary modules, and agreement for `G=Γ≅ℤ_p` with PadicMeasuresIwasawaAlgebras’ one-variable `muInvariant`. Do not claim additivity on all exact sequences of finitely generated modules: taking `p`-primary submodules is not exact. Define `noncommPseudoNull G M` by `iwasawaGrade (Λ(G)) M≥2`, including the zero module, and prove its finite-index invariance and its compatibility with the coefficient grade shift. For every pro-`p` `G_L` in §4.3 use this `noncommMu`; for the positive `H_L`-homology use its one-variable comparison over `Γ_L`.

Source: Venjakob 2002, §3.4, Definition 3.32, Remark 3.33 and Proposition 3.34, pp. 20–22; the equivalence with Howson’s homological definition is discussed immediately after Definition 3.32. The uniform-domain division ring follows from the polynomial residual grading and the noetherian Ore theorem; finite-index restriction is §§0.3, F.1 and the homology comparison of §0.15. Pseudo-nullity is Venjakob, Definition 3.1 and the grade filtration of §3.2.

**Checks.**

- For `M=Λ(G)/p^n`, the `n` residual layers each have `U`-rank `[G:U]`, so `noncommMu G M=n`. Omitting the normalization makes the answer depend on `U`.
- `noncommMu G Λ(G)=0`. The sequence `Λ(G) --p→ Λ(G) → Λ(G)/p` shows why additivity is restricted to the `p`-primary category.
- For positive-dimensional `G`, a finite module has μ zero and grade at least two. For `G=1`, `ℤ_p/p^n` has μ `n` and grade one; the dimension hypothesis cannot be dropped.
- For `Γ=ℤ_p` and `M=Λ(Γ)/(p²T)`, the `p`-primary part contributes μ `2`, whereas its `T`-primary quotient contributes zero; this agrees with the one-variable structure theorem.

*Needs:* §§0.3, 0.9, F.1, 0.11, 0.15; PadicMeasuresIwasawaAlgebras §§4.2, 4.6.

<a id="ne4-mh-criteria"></a>
### 4.3 Criteria for `X(E/F_∞) ∈ 𝔐_H(G)` (Lemmas 5.3–5.4, Corollary 5.5, Proposition 5.6)

**Theorem.** (Lemma 5.3.) If `X(E/F_∞) ∈ 𝔐_H(G)`, then for each finite `F ⊂ F_∞`: (i) `X(E/F^cyc)` is `Λ(Γ_F)`-torsion; (ii) `H_i(H_F, X(E/F_∞)) = 0` for `i ≥ 1`; (iii) `H_i(H_F, Y(E/F_∞))` is finite for `i = 1, 2` and zero for `i > 2`; and `μ_{G_L}(X(E/F_∞)) = μ_{Γ_L}(X(E/L^cyc))` when `G_L` is pro-`p`. (Lemma 5.4.) If `X(E/F^cyc)` is `Λ(Γ_F)`-torsion for all finite `F` and some `L` has `G_L` pro-`p, μ_{G_L}(X(E/F_∞)) = μ_{Γ_L}(X(E/L^cyc))` and `H₁(H_L, Y(E/F_∞))` finite, then `X(E/F_∞) ∈ 𝔐_H(G)`. (Corollary 5.5.) If `E` has CM, `X(E/F_∞) ∈ 𝔐_H(G)` iff `μ_{Γ_L}(X(E/L^cyc)) = 0` for some `L` with `G_L` pro-`p`. (Proposition 5.6.) If some `L ⊂ F_∞` with `G_L` pro-`p` carries an elliptic curve `E′` isogenous to `E` over `L` with `X(E′/L^cyc)` finitely generated over `ℤ_p`, then `X(E/F_∞) ∈ 𝔐_H(G)`. Example: the three conductor-11 curves `E₀, E₁, E₂` at `p = 5` with `L = ℚ(μ₅)` (`G_L` pro-5 and `X(E₁/L^cyc) = 0`) satisfy Conjecture 5.1.

See CFKSV, §5, Lemma 5.3, p. 199: Lemma 5.3 (statement on this page). CFKSV, §5, Lemma 5.4 and Corollary 5.5, p. 200: Corollary 5.5 and the lead-in to Proposition 5.6. CFKSV, §5, Proposition 5.6 and the conductor-11 example, p. 201: The example `E₀, E₁, E₂` at `p = 5`.

The hypotheses are as follows. The proofs use results of Coates–Howson (CFKSV references [8], [9], [11]: finiteness of `H¹(H_F, E_{p^∞})`, and Proposition 2.13 and Lemma 2.5 of [9]), Venjakob's theory of pseudo-null modules [26], Schneps' thesis [28] and Rubin's two-variable CM main conjecture [27]; the example quotes `X(E₁/ℚ(μ₅)^cyc) = 0` from [16]. These inputs are consumed as CFKSV state them on pp. 199–201.

*Proof.*

1. Lemma 5.3: the restriction map `r_F : X(E/F_∞)_{H_F} → X(E/F^cyc)` has finite cokernel (dual to `ker t_F ⊂ H¹(H_F, E_{p^∞})`, finite), so `Y(E/F^cyc)` is finitely generated over `ℤ_p` and `X(E/F^cyc)` is `Λ(Γ_F)`-torsion; the rest from [9].
2. Lemma 5.4: `H₀(H_L, Y(E/F_∞))` is `Λ(Γ_L)`-torsion, and formula (25) of [9] forces its `μ`-invariant to vanish; Nakayama over the pro-`p H_L`.
3. Corollary 5.5 from Lemmas 5.3–5.4 with Schneps and Venjakob; Proposition 5.6 by Nakayama from `r_L` and an isogeny `f : E′ → E` whose induced map `X(E/F_∞) → X(E′/F_∞)` has kernel killed by a power of `p`.
4. The inputs that CFKSV take from Coates–Howson, Schneps, Rubin and Venjakob are stated as targets of this subsection in the present specialization: `ellipticControl_kernelFinite` (restriction from the cyclotomic level to `F_∞` has finite dual cokernel and `ℤ_p`-finitely generated kernel), `ellipticHomology_vanishing` (cyclotomic torsion at all finite levels gives `H_i(H_F, X) = 0` for `i ≥ 1`) and `ellipticMu_homologyFormula` (the `μ`-difference is the alternating `μ`-invariant of the `H_i(H_L, Y)`); for the CM corollary `cmCyclotomicTorsion` (`Λ(Γ_F)`-torsion for every finite `F ⊂ F_∞`), `cmTwoVariableMuZero` (`μ_(G_L)(X) = 0` for every pro-`p G_L`, under the hypothesis of the corollary) and `cmDual_noPseudoNull` (`X` has no nonzero pseudo-null `Λ(G_L)`-submodule). Together they give `X(p) = 0`, so `Y = X` and its positive `H_L`-homology vanishes. They are arithmetic targets, not properties built into the Selmer definition; their sources are the ones CFKSV cite on pp. 199–201, whose own proofs are not re-located here.

**Checks.**

- In the pro-`p` regime, restricting from `G_L` to a uniform open subgroup multiplies μ by the subgroup index; the equality in the criterion uses normalized μ on each named group.

- Curves joined by an isogeny defined over the base field have the same infinite `p`-power division field, so `E₀, E₁, E₂` share `F_∞ = ℚ(E_{5^∞})`; Proposition 5.6's example uses this.
- Lemma 5.3(i) is the necessary condition: if `X(E/F^cyc)` is not `Λ(Γ_F)`-torsion for some `F`, then `X(E/F_∞) ∉ 𝔐_H(G)`.

*Needs:* §4.2a (`noncommMu`, `noncommPseudoNull`); [4.2](#ne4-mh-conjecture-and-mazur) (The `𝔐_H(G)` conjecture and Mazur's torsion conjecture (Conjectures 5.1–5.2)); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.2 (topological Nakayama); [1.6](#ne1-s-torsion-iff-finitely-generated) (`S`-torsion equals finite generation over `Λ(H)`).

<a id="ne4-admissible-extension"></a>
### 4.4 Admissible extensions, `μ = 0` and weak Leopoldt

**Definition.** Let `F` be a totally real number field and `p` odd. An admissible `p`-adic Lie extension `F_∞/F` is a Galois extension, unramified outside a finite set of primes, with `F_∞` totally real, `G = Gal(F_∞/F)` a `p`-adic Lie group and `F_cyc ⊆ F_∞`; put `H = Gal(F_∞/F_cyc), Γ = G/H`, and fix a finite set `Σ` of finite primes containing those ramified in `F_∞`. `F_∞/F` satisfies `μ = 0` if some open pro-`p` subgroup `H′ ≤ H` has `Gal(M/F_∞^{H′})` finitely generated over `ℤ_p, M` the maximal abelian pro-`p` extension of `F_∞^{H′}` unramified outside `Σ`; equivalently, the Iwasawa `μ`-invariant of `L(μ_p)` vanishes for `L` with `L_cyc = F_∞^{H′}`. Equivalently (Lemma 9), `X = Gal(M_∞/F_∞)` is finitely generated over `Λ(H), M_∞` the maximal abelian pro-`p` extension of `F_∞` unramified outside `Σ`.

See Kakde, §2.1, Definition 1, p. 4 (arXiv v3): Definition 1; Definition 8 and Lemma 9 (pp. 9–10).

The hypotheses are as follows. `F` totally real, `p` odd, `Σ` finite containing the primes above `p` and the ramified primes (those above `p` ramify in `F_cyc ⊆ F_∞` in any case). For closed normal `N ⊆ H`, `AdmissibleExtension.sub` proves admissibility and `μ = 0` for `F_∞^N/F` (Nakayama over the image of `H′`); `AdmissibleExtension.res` proves them for `F_∞/F′` with `[F′ : F]` finite (restriction to an open subgroup preserves finite generation over `Λ(H ∩ Gal(F_∞/F′))`, §0.3).

*Construction.*

1. Lemma 9: for `H′` pro-`p, Λ(H′)` is local, so by Nakayama `X` is finitely generated over `Λ(H)` iff `X_{H′}` is finitely generated over `ℤ_p`; the inflation–restriction sequence for `Gal(F_Σ/F_∞) ⊆ Gal(F_Σ/F_∞^{H′})` with `ℚ_p/ℤ_p` coefficients (§F.3) and the cofiniteness of `H^i(H′, ℚ_p/ℤ_p)` compare `X_{H′}` with `Gal(M/F_∞^{H′})`.

API: `AdmissibleExtension` (`F_∞/F` with `G, H, Γ` and `Σ`); `MuZero` (The hypothesis `μ = 0` (Definition 8)); `muZero_iff_fg` (`μ = 0 ⇔ Gal(M_∞/F_∞)` is finitely generated over `Λ(H)` (Lemma 9)); `AdmissibleExtension.sub` (`F_∞^U/F` for `U ≤ H` closed normal in `G` is admissible, and `μ = 0` passes to it); `AdmissibleExtension.res` (`F_∞/F′` for `F ⊆ F′ ⊆ F_∞` with `[F′:F]` finite is admissible).

**Checks.**

- `cyclotomic`: `F_∞ = F_cyc: G = Γ ≅ ℤ_p` and `H = 1`; `μ = 0` is Iwasawa's `μ = 0` for `F(μ_p)`.
- `abelian_q`: `F = ℚ(μ_p)^+, F_∞` the maximal abelian `p`-extension of `F_cyc` unramified outside `p`: admissible, and `μ = 0` holds by Ferrero–Washington (Kakde's first example).
- `cm_nonexample`: `F(μ_{p^∞})/F` is not admissible: it is not totally real.
- `no_cyclotomic`: A finite totally real extension is not admissible: it does not contain `F_cyc`.
- `μ = 0` is a hypothesis, recorded separately; Ferrero–Washington proves it for abelian `L/ℚ`, and nothing more general is claimed.

**Theorem (weak Leopoldt in a cyclotomic overfield).** Let `p` be odd, `F` any number field, `Σ` a finite set containing the archimedean places and all primes above `p`, and `F_Σ` the maximal extension unramified outside `Σ`. For every algebraic intermediate field `F_cyc ⊆ E ⊆ F_Σ`,

`H²(Gal(F_Σ/E), ℚ_p/ℤ_p) = 0`,

with the trivial discrete coefficient action. Neither total reality, a `p`-adic analytic Galois group nor `μ=0` is needed for this assertion. For admissible `E=F_∞` it supplies the missing cohomology vanishing in §4.5. Its API uses the supplied `cyclotomic_weakLeopoldt` through `weakLeopoldt_cyclotomic` at `E=F_cyc`, and proves `weakLeopoldt_overfield` for general `E`, compatible with restriction to finite base fields inside `E`.

The cyclotomic case is NSW, (10.3.25), p. 640, for every number field and every prime (equivalent forms (10.3.22), p. 639; open subgroups in the proof of (10.3.26), p. 641), and continuity of cohomology along the union of the `L_cyc` is NSW, (1.5.1), p. 45. See also Wingberg, *Duality theorems for `Γ`-extensions of algebraic number fields*, Proposition 5.1 and proof, pp. 348–349; the notation for the full and maximal pro-`p` restricted-ramification groups is on p. 346, and the duality sequences are (4.2)–(4.5), pp. 346–347. Venjakob, *On the Iwasawa theory of `p`-adic Lie extensions*, Remark 4.3, p. 26 (author PDF), gives the extension from cyclotomic fields to `E` by a direct limit. These are vanishing inputs separate from the cohomological dimension bound.

*Proof.*

1. Apply IntegralIwasawaTheory §2.6, `cyclotomic_weakLeopoldt`, at every finite number field `L` inside `E`. The local notation `weakLeopoldt_cyclotomic` is its odd-prime coefficient-convention adapter, not an independent cyclotomic vanishing theorem.
2. Every finite extension `L/F` inside `E` has `L_cyc ⊆ E`, and `E` is their union. For trivial discrete coefficients, continuity gives `H²(Gal(F_Σ/E),ℚ_p/ℤ_p)` as the restriction direct limit of the `H²` groups over `L_cyc`. Each is zero by step 1 applied to `L`. Concretely, a continuous cocycle on `Gal(F_Σ/E)` has finite image and factors through a finite quotient. Choose an open normal subgroup of `Gal(F_Σ/F)` realizing that quotient; the cocycle then extends to the open subgroup generated by it and `Gal(F_Σ/E)`, corresponding to a finite `L⊆E`. Restricting further to `L_cyc` kills its class. This proves the continuity assertion needed here on the existing continuous-cohomology model.

**Checks.**

- For `E=F_cyc`, recover the cyclotomic theorem without a `μ=0` hypothesis. Taking `F` imaginary quadratic still gives `H²=0`; total reality is needed elsewhere, not for this vanishing.
- For `E/F` an infinite noncommutative extension containing `F_cyc`, each finite `L⊆E` still has `L_cyc⊆E`. The argument uses restriction and a direct limit, rather than asserting that `H²` vanishes for every closed subgroup of a group with `H²=0`.
- A finite `E/F` cannot contain `F_cyc`, so this theorem does not assert finite-level Leopoldt. For `p=2` the odd-primary real-place and prime-to-`p` descent arguments above do not apply; the separate two-primary comparison is §4.8.

*Needs:* IntegralIwasawaTheory §2.6 (`cyclotomic_weakLeopoldt`); [0.2](#ne0-compact-padic-analytic-group) (Compact `p`-adic analytic groups); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.2 (topological Nakayama); [1.6](#ne1-s-torsion-iff-finitely-generated) (`S`-torsion equals finite generation over `Λ(H)`); §F.3 (Poitou–Tate and class field theory); TauCetiRoadmap ProfiniteCohomology (continuous cohomology and restriction); NSW (10.3.25) and (1.5.1); Wingberg, Proposition 5.1.

<a id="ne4-totally-real-iwasawa-complex"></a>
### 4.5 The complex `C(F_∞/F)`

**Construction.** For an admissible `F_∞/F, C(F_∞/F) = RHom(RΓ_ét(Spec 𝒪_{F_∞}[1/Σ], ℚ_p/ℤ_p), ℚ_p/ℤ_p) ≅ RHom(RΓ(Gal(F_Σ/F_∞), ℚ_p/ℤ_p), ℚ_p/ℤ_p)`, with `H^{−1} = Gal(M_∞/F_∞), H⁰ = ℤ_p` and `H^i = 0` otherwise. It is a perfect complex of `Λ(G)`-modules, `Λ(Gal(K/F)) ⊗^L_{Λ(G)} C(F_∞/F) ≅ C(K/F)` for `F ⊆ K ⊆ F_∞` with `K/F` Galois, and, under `μ = 0`, it is `S`-torsion, so it has a class `[C(F_∞/F)] ∈ K₀(Λ(G), Λ(G)_S)`.

See Kakde, §2.3, p. 11 (arXiv v3): The complex, its cohomology, and Fukaya–Kato's results (i)–(ii). Witte, arXiv:1004.2481v2, Definition 3.1, p. 6, Proposition 3.2, pp. 6–7, and Definition 3.6 with Proposition 3.7, p. `8: Λ(G)` is an adic ring, and compatible systems of perfect complexes over its finite quotients have perfect inverse limits (after Fukaya–Kato Proposition 1.6.5).

The hypotheses are as follows. `F_∞/F` admissible, so `p` is odd; `μ = 0` for the class in relative `K₀`. This is the dual Galois-cochain complex in degrees `−1,0`, not the ordinary compact-support `cone`; the two are compared only through the duality and local-correction comparison of §4.6.

*Construction.*

1. The étale–Galois comparison, since `ℚ_p/ℤ_p` is a colimit of finite `p`-groups.
2. Cohomology: `H⁰ = ℤ_p` is the dual of `H⁰(Gal(F_Σ/F_∞), ℚ_p/ℤ_p)`; `H^{−1}` is the dual of `Hom(Gal(F_Σ/F_∞), ℚ_p/ℤ_p) = Gal(M_∞/F_∞)^∨`; `H^i(Gal(F_Σ/F_∞), ℚ_p/ℤ_p) = 0` for `i ≥ 3` because `cd_p ≤ 2` (§F.3, inherited by closed subgroups); and `H² = 0` by `weakLeopoldt_overfield` of §4.4 with `E = F_∞`. A cohomological-dimension bound alone does not give this vanishing.
3. Perfectness and base change (1) are the Fukaya–Kato results (i)–(ii) quoted in Kakde §2.3. They are the targets `iwasawaComplex_perfect_withPTorsion` and `iwasawaComplex_baseChange`, proved as follows whether or not `G` has `p`-torsion (`p` is odd, so `cd_p G_{F,Σ} ≤ 2`). `(a)` Shapiro. Let `Λ=Λ(G)` and `Λ^∨=Hom_cts(Λ,ℚ_p/ℤ_p)`, the discrete induced module. Shapiro's lemma for the open subgroups `Gal(F_Σ/L)` (TauCetiRoadmap ProfiniteCohomology), and the passage to the colimit over the finite layers `L` (NSW (1.5.1), p. 45), give `RΓ(Gal(F_Σ/F_∞),ℚ_p/ℤ_p) ≅ RΓ(G_{F,Σ},Λ^∨)`. For the open two-sided ideals `I_{U,n}=ker(Λ→Λ_{U,n}), Λ_{U,n}=(ℤ/p^n)[G/U]`, put `C_{U,n}=RHom(RΓ(G_{F,Σ},Λ_{U,n}^∨),ℚ_p/ℤ_p)`. Cohomology commutes with filtered colimits of discrete modules, and inverse limits of compact modules are exact (PadicMeasuresIwasawaAlgebras §5.2). Hence `C(F_∞/F)` is the inverse limit of the `C_{U,n}`. `(b)` Finite level. `A=Λ_{U,n}` is finite, and `M=A^∨≅A` is free of rank one, because a group algebra over `ℤ/p^n` is a symmetric algebra. The continuous cochains `C^i(G_{F,Σ},M)` are filtered colimits of finitely generated free `A`-modules, hence flat. So for every right `A`-module `N, N⊗^L_A RΓ(G_{F,Σ},M)` is `RΓ(G_{F,Σ},N⊗_A M)`, whose cohomology vanishes outside [0,2] (§F.3, applied to the discrete `p`-primary module `N⊗_A M`); the cohomology of `RΓ(G_{F,Σ},M)` is finite by the same section. Represent `RΓ(G_{F,Σ},M)` by a bounded-above minimal complex `P` of finitely generated projective `A`-modules, with differentials in `J(A)P`; this exists because `A` is finite and hence semiperfect. Then `A/J⊗P` has zero differentials and computes `Tor`, so `P^i=0` outside [0,2], and the complex is perfect of amplitude [0,2]. Pontryagin duality over the symmetric algebra A exchanges finitely generated projective left and right modules, so `C_{U,n}` is perfect of amplitude `[−2,0]`. `(c)` Transition. For `I_{V,m}⊆I_{U,n}`, the flat-cochain identity of `(b)` gives `Λ_{U,n}⊗^L_{Λ_{V,m}}C_{V,m}≅C_{U,n}`. `(d)` Limit. `Λ` is adic (Witte Proposition 3.2), and the ideals `I_{U,n}` and `J^k` are mutually cofinal. Let `Q_k` be a minimal strictly perfect model of the level-`J^k` complex. Two quasi-isomorphic minimal complexes over a semiperfect ring are isomorphic: a homotopy inverse composed with the map is the identity modulo `J`, hence invertible by Nakayama. So `Λ/J^k⊗Q_(k+1)≅Q_k`, and the `Q_k` form an inverse system with surjective transition maps. `Q=lim Q_k` is a bounded complex of finitely generated projective `Λ`-modules (idempotents lift), with `Λ/J^k⊗_Λ Q≅Q_k`; by the Mittag-Leffler property, `Q≅C(F_∞/F)`. This is the argument of Fukaya–Kato Proposition 1.6.5, stated by Witte as Proposition 3.7. Hence `C(F_∞/F)` is perfect of amplitude `[−2,0]`, and `(c)` passes to the limit to give `iwasawaComplex_baseChange` for every closed normal subgroup, `Λ(G/N)` being the limit of the corresponding finite quotients. No finite global dimension is used. `iwasawaComplex_restrict` is restriction of scalars along `Λ(G′) ⊆ Λ(G)` with the same `Σ`; `Λ(G)` is finite free over `Λ(G′)` (§0.3), so restriction preserves perfection.
4. `S`-torsion: its cohomology is finitely generated over `Λ(H)` by §4.4's Lemma 9, so `Λ(G)_S ⊗^L C` is acyclic (§1.6); the class is in §1.14.

API: `iwasawaComplex` (`C(F_∞/F)` as a perfect complex of `Λ(G)`-modules); `iwasawaComplex_cohomology` (`H^{−1} = Gal(M_∞/F_∞), H⁰ = ℤ_p`, and `H^i = 0` otherwise); `iwasawaComplex_baseChange` (`Λ(Gal(K/F)) ⊗^L C(F_∞/F) ≅ C(K/F)` (Kakde (1))); `iwasawaComplex_class` (`[C(F_∞/F)] ∈ K₀(Λ(G), Λ(G)_S)` under `μ = 0`); `iwasawaComplex_restrict` (Restriction to an open subgroup `G′` is the complex of `F_∞/F_∞^{G′}`); `iwasawaComplex_perfect_withPTorsion` (perfection without a finite-global-dimension hypothesis).

**Checks.**

- `perfect_amplitude`: for `G=ℤ/p×Γ` (`p`-torsion present), the finite-level complexes `C_{U,n}` are perfect over `(ℤ/p^n)[G/U]` of amplitude `[−2,0]`, even though the trivial module has infinite projective dimension there. Perfection comes from the induced coefficients, not from any finiteness of global dimension.
-  `cyclotomic`: For `F∞=F_cyc`, with `H^(−1)(C)=X` and `H⁰(C)=ℤ_p`, the cohomological class is `[C]=[ℤ_p]−[X]`. Thus `∂ζ=−[C]` has module expression `[X]−[ℤ_p]` whenever those module classes exist.
- `h0`: `H⁰(C(F_∞/F)) = ℤ_p` with trivial action for every admissible `F_∞/F`.
- For a totally real `F` and `F_∞ = F_cyc`, weak Leopoldt is NSW (10.3.25) itself, and (10.3.22)(iii) gives rank over `Λ` of `X_Σ` equal to `r₂ = 0` with no nonzero finite submodule, so `H^(−1)(C)` is `Λ`-torsion. A finite totally real extension of `F` in place of `F_∞` is excluded: it does not contain `F_cyc` and the `H²` vanishing is not available.
- `module_not_enough`: For `G` with `p`-torsion, `X = Gal(M_∞/F_∞)` can fail to have a finite projective resolution, so `[X]` need not be defined in `K₀(Λ(G), Λ(G)_S)`, while `[C(F_∞/F)]` is.
- When `G` has elements of order `p, X` itself need not have finite projective dimension; the complex, not the module, is what has a class.

*Needs:* [4.4](#ne4-admissible-extension) (Admissible extensions, `μ = 0` and weak Leopoldt); [1.14](#ne1-torsion-perfect-complexes) (Perfect complexes acyclic after localisation); [1.6](#ne1-s-torsion-iff-finitely-generated) (`S`-torsion equals finite generation over `Λ(H)`); [0.3](#ne0-iwasawa-free-over-open-subgroup) (Completed group algebras are free over open subgroups); [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality); §F.3; §F.3; TauCetiRoadmap ProfiniteCohomology (Shapiro); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.2; §F.4.

<a id="ne4-equivariant-compact-support"></a>
### 4.6 Equivariant compactly supported Iwasawa complexes

**Construction.** Let `p` be odd, `F∞/F` a Galois compact `p`-adic Lie extension containing the cyclotomic tower unramified outside a finite `Σ` containing `p`, ramified and archimedean places, and `T` a finite free `ℤ_p` Galois lattice unramified outside `Σ`. Define `RΓ_Iw,c(F∞,T)=Rlim_L RΓ_c(O_(L,Σ),T)`, with corestriction transitions and left `Λ(G)`-action. At finite `L`, compact support is `Cone(RΓ(O_(L,Σ),T)→⊕_(v∈Σ_L)RΓ(L_v,T))[−1]`, with complete Tate cochains at real places, acyclic at odd `p`. Greenberg`/`Selmer local conditions replace the indicated local targets by their specified quotients or mapping fibres. The construction imports continuous Galois cochains, local conditions and the derived inverse limit; it adds the noncommutative coefficient action and comparison squares.

See Burns–Venjakob, §4, pp. 20–21; §6, pp. 28–36: Uses compactly supported and Selmer determinant complexes with specified local conditions. Kakde, §2.3, p. 11, especially base change (1): The totally real dual complex is the specialized arithmetic input; its comparison with compact support must include duality and shifts.

The hypotheses are as follows. `p` odd; `G=Gal(F∞/F)` compact `p`-adic analytic; `F∞` contains the cyclotomic tower; finite ramification set `Σ` as stated. `T` finite free, with continuous Galois action; local conditions and their transition maps are specified.

*Construction.*

1. Use the mapping-fibre construction and Iwasawa cochains of §F.4 at the finite layers.
2. Use compatible corestriction and conjugation maps to give the derived inverse limit its `Λ(G)`-action.
3. Compare the global and every local cochain by the same Shapiro bimodule, so base change respects the defining triangle; do not infer the local comparison from the global one alone.
4. Construct `iwasawaComplex_dualityTriangle` by applying compact Poitou–Tate (§F.3) to `ℚ_p/ℤ_p` and the dual lattice `ℤ_p(1)`, retaining the involution on `Λ(G)`, the dualizing shift `[−3]` and the real and local correction terms. At finite level it is `RΓ_c(O_{L,Σ}, ℤ_p(1)) ≃ RHom(RΓ(O_{L,Σ}, ℚ_p/ℤ_p), ℚ_p/ℤ_p)[−3]` with the Tate-modified real-place convention of §F.3; passage to the tower uses restriction on discrete cochains dual to corestriction on compact cochains. This supplies the precise shift; it does not identify the unshifted compact-support complex with `C(F_∞/F)`.
5. PadicMeasuresIwasawaAlgebras §5.2 supplies exact inverse limits of compact systems in this construction; it supplies neither the derived Shapiro comparisons nor the arithmetic local conditions, which are the cochain contracts above and the comparison of §4.7.

API: `EquivariantCompactSupport.triangle` (The `cone` shifted by `−1` fits in the stated global-to-local distinguished triangle); `EquivariantCompactSupport.action` (The conjugation/corestriction actions extend to the left completed group ring); `EquivariantCompactSupport.quotient` (For `N` closed normal with derived base-change hypotheses, `Λ(G/N)⊗^L_Λ RΓ_Iw,c(F∞,T)≅RΓ_Iw,c(F∞^N,T)`, including the local terms); `EquivariantCompactSupport.openRestriction` (Restriction of scalars to `Λ(U), U` open in `G`, agrees with the complex over `F∞^U`); `EquivariantCompactSupport.duality` (The duality comparison with the totally real dual cochain complex includes its twist, shift and local correction triangle; no silent equality of these two complexes is allowed).

**Checks.**

- `equivariant_compact_support_1`: For a cyclotomic abelian tower and the same `T` and local conditions, recover §F.4’s complex with identical cohomological degrees.
- `equivariant_compact_support_2`: At a real place and odd `p`, the complete Tate complex is acyclic. Ordinary degree-zero invariants occur in the comparison with `RΓ_c,ord`, not in the duality complex’s local term.
- `equivariant_compact_support_3`: For `Σ` enlarged by a finite prime, the difference is the corresponding local correction complex; dropping it changes the determinant.
- `equivariant_compact_support_4`: Taking `N=1` gives the identity base-change map on both global and local terms.

*Needs:* §§F.3–F.4 (continuous arithmetic cochains, duality, Selmer fibres and Iwasawa specialization); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§5.1–5.2; [F.1](#ne-foundations-analytic-algebra).

<a id="ne4-equivariant-perfect-base-change"></a>
### 4.7 Perfection, torsion and derived arithmetic base change

**Theorem.** Let `p` be odd and `G` have no element of order `p`. If the equivariant compact-support complex is bounded and all its cohomology groups are finitely generated over `Λ(G)`, then it is perfect, by the finite-global-dimension theorem. Under the global/`local` Shapiro and duality hypotheses, quotient derived base change and open-subgroup restriction identify it with the corresponding arithmetic complexes and commute with the local triangles. It belongs to `Σ_S` exactly when its localized cohomology vanishes. In the totally real odd-primary `μ=0` setting, the dual complex `C` has `H^(−1)=X_Σ, H⁰=ℤ_p` and `Λ(H)`-finite cohomology, hence is `S`-torsion. When `G` has `p`-torsion, perfection of this `C` is `iwasawaComplex_perfect_withPTorsion` (§4.5, step 3), proved from the induced coefficients and the adic limit; finite global dimension gives no argument.

See Kakde, §2.3, Lemma 9 and equation (1), pp. 10–11: States the dual complex’s perfectness and quotient base change and gives the `μ=0` finiteness input. Burns–Venjakob, §4, pp. 20–21; Lemma 6.2, pp. 29–30: Uses precisely the perfect arithmetic complexes required by determinant descent, citing Fukaya–Kato for their perfection.

The hypotheses are as follows. For the finite-global-dimension route: `p` odd, `G` compact `p`-adic analytic with no element of order `p`, bounded complex and finitely generated `Λ(G)`-cohomology; boundedness and finite generation must come from the stated arithmetic hypotheses, not from rational dimensions alone. For the comparisons: `F∞/F` unramified outside finite `Σ` containing `p` and infinity, finite-free continuous coefficient lattice and compatible perfect local conditions, with global and local Shapiro/duality supplied. For the final torsion clause: totally real admissible `F∞/F` and Kakde `μ=0`. For a group with `p`-torsion the cochain-perfection theorem of §4.5 is used instead.

*Proof.*

1. Use the cochain supplier for boundedness and finite generation. Without `p`-torsion replace the bounded finite-cohomology complex by a finite-projective resolution using global dimension `d+1` (§0.11). For `C(F_∞/F)` with `p`-torsion in `G` use `iwasawaComplex_perfect_withPTorsion` of §4.5, which does not pass through finite global dimension.
2. Use exact derived base change on the bounded projective model; keep finite correction modules under control in the resulting cohomology long exact sequences.
3. Apply flatness of canonical Ore localization to test acyclicity on cohomology. For `C` use the explicit weak-Leopoldt input and the `Λ(H)`-finiteness criterion of Kakde Lemma 9.
4. At `p=2` this theorem does not assert perfection of ordinary compact support; the real-place correction is §4.8.

**Checks.**

- A complex with a single `Λ`-free cohomology module is perfect but is not `S`-torsion.
- For the totally real cyclotomic specialization `H=1`, verify `H^(−1)=X_Σ` and `H⁰=ℤ_p`, rather than shifting both degrees by one.
- Derived specialization of a two-term resolution `[Λ --T→ Λ]` at `T=0` has two nonzero terms; underived tensor of its cokernel loses `Tor₁`.

*Needs:* [4.6](#ne4-equivariant-compact-support) (Equivariant compactly supported Iwasawa complexes); [4.5](#ne4-totally-real-iwasawa-complex) (The complex `C(F_∞/F)`); [1.12](#ne1-ore-localization-flat) (Ore localisation is flat); [1.14](#ne1-torsion-perfect-complexes) (Perfect complexes acyclic after localisation); §F.4; §F.3; [0.11](#ne0-iwasawa-finite-global-dimension) (Finite global dimension without `p`-torsion).

<a id="ne4-real-two-primary-correction"></a>
### 4.8 Real-place correction at the prime two

**Comparison.** At `p=2` an ordinary real-place local cochain term cannot be erased or replaced by the odd-primary averaging argument. The required extension is a compact-support/`local`-condition triangle with complete Tate cochains for `Gal(C/R)=C₂` at real places and a specified comparison with the chosen arithmetic dual complex. Its bounded/perfect replacement, duality shift and localization class require a separate theorem under explicit hypotheses. This subsection states that comparison; it does not claim that the odd-primary complexes satisfy it.

See Burns–Venjakob, Standing assumption in §4, pp. 20–21, and §6, p. 28: The arithmetic descent theorems are stated with `p` odd; no two-primary real-place conclusion is supplied there.

The hypotheses are as follows. `p=2`; number field with real places; a chosen integral Tate-cochain model and arithmetic local conditions.

*Proof.*

1. Compute the real local cohomology and Tate complex explicitly; nonvanishing 2-primary terms rule out the odd-prime simplification.
2. Name the real term `realTateCorrection` (complete Tate cochains of `Gal(ℂ/ℝ) = C₂` with the coefficient lattice), the triangle `ordinary_to_modifiedCompactSupport` comparing the ordinary and modified compact-support complexes, and `realCorrection_eq_zero_of_noRealPlaces`. For the trivial `ℤ₂`-coefficient the real Tate cohomology is `ℤ/2` in every even degree and 0 in odd degrees, so the term is unbounded and not perfect; the comparison keeps it in the derived category, and a bounded perfect replacement is asserted only when the real correction vanishes, for instance with no real places. Prove compatibility with finite-level restriction and corestriction (§F.3).
3. Transport a relative class only after that theorem proves both perfection and localized acyclicity.

**Checks.**

- For the trivial `Z₂`-module, `H²(C₂,Z₂)=Z/2`, whereas positive cohomology vanishes with `ℤ_p` coefficients at odd `p`.
- For a totally imaginary field there is no real-place correction sum.
- For trivial `ℤ₂` over `ℝ`, multiplication by 2 and by 0 alternate in the Tate resolution, giving `ℤ/2` in every even degree; a bounded perfect replacement of this term does not exist.
- An alleged `p=2` comparison that discards the real Tate term cannot preserve the compact-support triangle.

*Needs:* §F.3; [4.6](#ne4-equivariant-compact-support) (Equivariant compactly supported Iwasawa complexes).

### Examples

- For `F_∞ = F_cyc: H^{−1}(C) = X, H⁰(C) = ℤ_p` and `[C] = [ℤ_p] − [X]`, so `∂ζ = −[C]` reads `[X] − [ℤ_p]` in module classes (§4.5).
- At a real place and `p = 2, H²(C₂, ℤ₂) = ℤ/2`, whereas positive cohomology vanishes with `ℤ_p` coefficients at odd `p` (§4.8).

### Dependencies

Layers 0–3 of this roadmap; the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; §F.3; §F.4; NSW, Chapter `X` §3 for weak Leopoldt; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§5.1–5.2.

## Layer 5: Zeta elements and normalized interpolation

Each main conjecture carries its full arithmetic normalization: periods, removed Euler factors, the contragredient and the cyclotomic variable. Existence of a zeta element, its interpolation property, its boundary and uniqueness in a named quotient are separate assertions, and functoriality transports the arithmetic complex as well as the values. Modules `TauCeti/NumberTheory/NoncommIwasawa/GL2MainConjecture` and `.../Layer5`.

<a id="ne5-gl2-padic-l-function-conjecture"></a>
### 5.1 The conjectural `GL₂ p`-adic `L`-function `ℒ_E` (Conjecture 5.7)

**Definition.** For an Artin representation `ρ` of `G` realised over `K_ρ, L(E, ρ, s) = Π_q P_q(E, ρ, q^{−s})^{−1}` with `P_q(E, ρ, T) = det(1 − Frob_q^{−1}T | (H¹_l(E) ⊗ V_{ρ,λ})^{I_q})`; `Ω_`±`(E)` are the periods of the Néron differential over the ±-eigenvectors of complex conjugation on `H₁(E(ℂ), ℤ)`; `d^`±`(ρ)` are the ±-dimensions of `ρ`; `L_R(E, ρ, s)` omits the Euler factors at `R = {p} ∪ {q : ord_q(j_E) < 0}`; `p^{f_ρ}` is the `p`-part of the conductor of `ρ`; `1 − a_pX + pX² = (1 − uX)(1 − wX)` with `u ∈ ℤ_p^×`; `e_p(ρ)` is the local `ε`-factor at `p`. Assume (103): `L(E, ρ, 1)/(Ω_+^{d⁺(ρ)}Ω_−^{d⁻(ρ)}) ∈ ℚ̄` and the analytic continuation of `L(E, ρ, s)` to `s = 1`. Let `K(F_∞)` be the maximal abelian extension of `ℚ` in `F_∞` unramified at `p` (a finite extension), A the integers of the completion of `K(F_∞)` at a prime above `p, Λ_A(G) = Λ(G) ⊗_{ℤ_p}` A and `S(A)*` the corresponding Ore set, with `Λ_A(G)_{S(A)*} = Λ(G)_{S*} ⊗ A`. Conjecture 5.7 (`p ≥ 5`, good ordinary reduction) is the proposition that there is `ℒ_E ∈ K₁(Λ_A(G)_{S(A)*})` with `ℒ_E(ρ) ≠ ∞` and `ℒ_E(ρ) = L_R(E, ρ, 1)/(Ω_+^{d⁺(ρ)}Ω_−^{d⁻(ρ)}) · e_p(ρ) · P_p(ρ̂, u^{−1})/P_p(ρ, w^{−1}) · u^{−f_ρ}` for all Artin `ρ` (107).

See CFKSV, §5, the `L`-functions `L(E, ρ, s)`, p. `202: L(ρ, s), L(E, ρ, s)` and (101)–(102). CFKSV, §5, (103)–(106), p. 203: Periods, `L_R, f_ρ, u, w`. CFKSV, §5, Conjecture 5.7, p. `204: K(F_∞)`, A and Conjecture 5.7 with (107).

The hypotheses are as follows. This is a conjecture. The period conjecture (103) and the analytic continuation are assumptions of its formulation. The enlarged coefficient ring A comes from the Tamagawa number conjecture (Fukaya–Kato, Theorem 4.2.26); evaluation extends to `K₁(Λ_A(G)_{S(A)*})` as in CFKSV §3.

*Construction.*

1. Definitions; `S(A)` is a left and right Ore set by the arguments of §1.7, and `Λ_A(G) = Λ(G) ⊗` A since `A` is free of finite rank over `ℤ_p`.

API: `twistedEllipticL` (`L(E, ρ, s)` and `L_R(E, ρ, s)` for Artin `ρ`); `interpolationFactor` (The right-hand side of (107)); `coefficientRingA` (A from `K(F_∞)` and `Λ_A(G)_{S(A)*}`); `PAdicLFunctionConjecture` (Existence of `ℒ_E` with (107) and `ℒ_E(ρ) ≠ ∞`); `PAdicLFunctionConjecture.unique_mod_K1` (`ℒ_E` is determined only through its evaluations; no uniqueness in `K₁` is claimed, and the reduced-norm kernel of §3.13 is retained).

**Checks.**

- `padicL_trivial_rho`: For trivial `ρ`, formula (107) includes `(L(E,1)/Ω_+)·(1−u⁻¹)²·∏_(q∈R∖{p})P_q(E,1,q⁻¹)`. The primitive Mazur–Swinnerton-Dyer value is recovered only when the additional removed-factor product is 1; it is not silently dropped.
- `padicL_factorisation`: `1 − a_pX + pX² = (1 − uX)(1 − wX)` with `uw = p` and `u + w = a_p`.
- For the zero virtual representation the rational interpolation factors multiply to 1; existence of an element with all required values and boundary remains the asserted proposition. `PAdicLFunctionConjecture` occurs only as a stated hypothesis.
- `padicL_x111`: `E = X₁(11), p = 5: A` is the integers of the unramified extension of `ℚ₅` of degree 5 (§5.4).
- The abelian specialisation (`ρ` a Dirichlet character of `Γ`-type) must recover the Mazur–Swinnerton-Dyer `p`-adic `L`-function with the same normalisation, not merely one with the same ideal.

*Needs:* [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem); [4.1](#ne4-gl2-dual-selmer-module) (The dual Selmer module over the trivialising extension of `E[p^∞]`).

<a id="ne5-gl2-main-conjecture"></a>
### 5.2 The `GL₂` main conjecture (Conjecture 5.8)

**Definition.** Assume `p ≥ 5`, good ordinary reduction and `X(E/F_∞) ∈ 𝔐_H(G)`, and let `ξ_E` be a characteristic element of `X(E/F_∞)` (§2.12). Let `i : K₁(Λ(G)_{S*}) → K₁(Λ_A(G)_{S(A)*})` be induced by the ring extension. Granted Conjecture 5.7, Conjecture 5.8 is the proposition that `i(ξ_E)` and `ℒ_E` have the same image in `K₁(Λ_A(G)_{S(A)*})/(image of K₁(Λ_A(G)))`.

See CFKSV, §5, Conjecture 5.8, p. 204: Conjecture 5.8 (stated just above) and the lead-in to its corollaries.

The hypotheses are as follows. Existence (Conjecture 5.7) and the equality (Conjecture 5.8) are separate propositions; a conjectural interpolation object proves no other statement. For CM curves (`G` of dimension 2) CFKSV observe that 5.8 follows from the two-variable main conjecture of Rubin and Yager once `X(E/F_∞) ∈ 𝔐_H(G)` (Corollary 5.5); that deduction is not a target here.

*Construction.*

1. Definition; well defined since characteristic elements are unique up to the image of `K₁(Λ(G))` (§2.12).

API: `GL2MainConjecture` (`i(ξ_E) ≡ ℒ_E` modulo the image of `K₁(Λ_A(G))`); `GL2MainConjecture.welldefined` (Independent of the choice of `ξ_E`); `GL2MainConjecture.evaluation` (Evaluations of `i(ξ_E)` and `ℒ_E` agree up to `p`-adic units).

**Checks.**

- `mc_ambiguity`: Changing `ξ_E` by the image of `u ∈ K₁(Λ(G))` changes every evaluation by a `p`-adic unit `(|η(ρ)|_p = 1)`.
- `mc_cm`: `E` with CM: the conjecture reduces to Rubin–Yager given `X(E/F_∞) ∈ 𝔐_H(G)`.
- `mc_scalar_ambiguity`: A scalar unit `u≠1` multiplies the value at a degree-`n` representation by `u^n` while leaving the boundary fixed. Thus equality of boundaries alone cannot be the main-conjecture interpolation predicate.
- The ambiguity is exactly the image of `K₁(Λ_A(G))`; an equality in `K₁(Λ_A(G)_{S(A)*})` itself is not asserted.

*Needs:* [5.1](#ne5-gl2-padic-l-function-conjecture) (The conjectural `GL₂ p`-adic `L`-function `ℒ_E` (Conjecture 5.7)); [4.2](#ne4-mh-conjecture-and-mazur) (The `𝔐_H(G)` conjecture and Mazur's torsion conjecture (Conjectures 5.1–5.2)); [2.12](#ne2-characteristic-element) (Characteristic elements); [4.1](#ne4-gl2-dual-selmer-module) (The dual Selmer module over the trivialising extension of `E[p^∞]`).

<a id="ne5-gl2-main-conjecture-consequences"></a>
### 5.3 Consequences of the main conjecture (Corollaries 5.9–5.10)

**Theorem.** Assume CFKSV Conjecture 5.8, including the `𝔐_H(G)` and interpolation hypotheses. For an Artin representation `ρ` and its contragredient `ρ∨`, the twisted Euler characteristic `χ(G,tw_(ρ∨)X(E/F∞))` is finite if and only if `L(E,ρ,1)≠0` (equivalently reindex the whole statement by `ρ∨`). When finite it equals `|ℒ_E(ρ)|_p^(−[L:ℚ_p])`, with `ℒ_E(ρ)` the complete period- and Euler-factor-normalized expression (107). The coefficient-field degree and every local factor are retained; no scalar equality with an unnormalized complex `L`-value is asserted.

See CFKSV, §5, Corollaries 5.9–5.10, p. 204: Corollary 5.9 (on this page) and Corollary 5.10 (p. 205) with their proofs.

The hypotheses are as follows. Conditional on Conjecture 5.8 (hence on 5.1 and 5.7). CFKSV note that Case 1 of Conjecture 4.8 would put `ξ_E` in the image of `Λ(G)[1/p]^× ∩ Λ(G)_{S*}^×`.

*Proof.*

1. Corollary 5.9: for `X` in `𝔐_H(G)`, Lemma 5.3 and Theorem 3.8 (§3.7) give `ξ_E(ρ) ≠ 0` iff `χ(G, tw_ρ̂(X))` is finite; `|η(ρ)|_p = 1` for `η` in the image of `K₁(Λ_A(G))`; and `ℒ_E(ρ) ≠ 0` iff `L(E, ρ, 1) ≠ 0`.
2. Corollary 5.10 from (36) (§3.6) and (107).

**Checks.**

- The source proves Corollary 5.9 with `ρ` and `ρ̂` interchanged relative to the statement. At an Artin character complex conjugation sends `L(E, ρ, 1)` to `L(E, ρ̂, 1)`; comparing the two readings needs the fixed complex and `p`-adic embeddings and the same period and local-factor conventions, and no `p`-adic equality follows from complex conjugation alone, so both readings are stated with those conventions.

*Needs:* [5.2](#ne5-gl2-main-conjecture) (The `GL₂` main conjecture (Conjecture 5.8)); [4.3](#ne4-mh-criteria) (Criteria for `X(E/F_∞) ∈ 𝔐_H(G)` (Lemmas 5.3–5.4, Corollary 5.5, Proposition 5.6)); [3.7](#ne3-artin-evaluation-integral) (Evaluation at Artin representations under a finiteness condition); [3.6](#ne3-euler-characteristic-evaluation) (Characteristic elements compute twisted Euler characteristics); [3.10](#ne3-characteristic-element-integrality-conjecture) (The integrality conjecture for characteristic elements (Conjecture 4.8)).

<a id="ne5-gl2-main-conjecture-example-x1-11"></a>
### 5.4 The main conjecture for `X₁(11)` at `p = 5`: the data and the consistency check

**Application.** For `E = X₁(11)` and `p = 5` (continuing §3.9): `K(F_∞) = ℚ(μ₁₁)⁺, 5` is inert in it, and `A` is the integers of the unramified extension of `ℚ₅` of degree 5. For the two degree-4 Artin representations `ρ₁, ρ₂: d⁺ = d⁻ = 2`; `f_{ρ₁} = 3, f_{ρ₂} = 5`; `P₅(ρ₁, X) = 1 − X, P₅(ρ₂, X) = 1`; `P₅(E, ρ₁, X) = 1 − X + 5X², P₅(E, ρ₂, X) = 1`; `P₁₁(E, ρ_i, X) = 1`; `|e₅(ρ₁)|₅ = 5^{−3/2}, |e₅(ρ₂)|₅ = 5^{−5/2}`; `1 − a₅X + 5X² = 1 − X + 5X²`; and `L(E, ρ₁, 1)/(Ω₊Ω₋)² = −2²/(11²√5), L(E, ρ₂, 1)/(Ω₊Ω₋)² = −2⁶/(11²·5√5)`. Both `L`-values are nonzero, so with Proposition 3.11 Corollary 5.9 holds for `ρ₁, ρ₂`; the right-hand side of (107) has the 5-adic valuations predicted by (74), so Corollary 5.10 holds for them too.

See CFKSV, §5, Example, p. 205: The data (108)–(114). CFKSV, §5, the `L`-values (115) and the conclusion, p. 206: The modest evidence, after (115).

The hypotheses are as follows. The numerical data are quoted from Dokchitser–Dokchitser (CFKSV reference [15]); the target is the consistency of Conjecture 5.8 with those data, not the conjecture.

*Proof.*

1. Insert (108)–(115) into (107): `u, w` are the roots of `Y² − Y + 5` with `u ≡ 1, w ≡ 0 mod 5`, so `v₅(1 − u^{−1}) = v₅(w) = 1` and `v₅(1 − w^{−1}) = −1`.
2. `ρ₁: v₅ = −1/2` (`L`-value) `+ 3/2 (e₅) + (1 − (−1))` (the `P₅` ratio) `= 3`; `ρ₂: v₅ = −3/2 + 5/2 + 0 = 1`. These match Proposition 3.11's Euler characteristics `5³` and 5 (with `m_ρ = 1, ρ_i` realised over `ℤ₅`).

**Checks.**

- The numerical consistency checks give `−1/2+3/2+2=3` and `−3/2+5/2=1`; they do not validate the source `L`-values independently.

*Needs:* [5.3](#ne5-gl2-main-conjecture-consequences) (Consequences of the main conjecture (Corollaries 5.9–5.10)); [3.9](#ne3-gl2-euler-example) (The `GL₂` example: `X₁(11)` at `p = 5`).

<a id="ne5-totally-real-main-conjecture"></a>
### 5.5 The main conjecture for totally real fields

**Definition.** For an admissible `F_∞/F` satisfying `μ = 0, MC(F_∞/F)` is the proposition: there is a unique `ζ(F_∞/F) ∈ K′₁(Λ(G)_S)` with `∂(ζ(F_∞/F)) = −[C(F_∞/F)]` and `ζ(F_∞/F)(ρκ_F^r) = L_Σ(ρ, 1 − r)` for every Artin character `ρ` of `G` and every positive integer `r` divisible by `[F_∞(μ_p) : F_∞]`, where `κ_F` is the `p`-adic cyclotomic character and `L_Σ(ρ, 1 − r)` the Klingen–Siegel value with the Euler factors at `Σ` removed.

See Kakde, §2.5, Theorem 11 (Main Conjecture), p. 13 (arXiv v3): The statement, with Remarks 12–14.

The hypotheses are as follows. `μ = 0`; `p` odd; `F` totally real. Kakde states it as Theorem 11 because he proves it (Layer 6).

*Construction.*

1. Definition; the evaluation is §3.3 on `K′₁` (§3.11), `∂` is the boundary of the localisation sequence, surjective by §2.15.

API: `MainConjecture` (`MC(F_∞/F)` as a proposition); `IsZetaElement` (`ζ ∈ K′₁(Λ(G)_S)` with `∂ζ = −[C]` and the interpolation property); `isZetaElement_unique` (Two zeta elements agree (uniqueness is part of MC; in `K′₁` it follows from Burns's description of `SK₁`)); `mainConjecture_quotient` (MC for `F_∞/F` gives MC for `F_∞^U/F, U ≤ H` closed normal (inflation of Artin characters)); `mainConjecture_open` (MC for `F_∞/F` gives MC for `F_∞/F′, F′ ⊆ F_∞` finite over `F` (norms; induction of characters)).

**Checks.**

- `cyclotomic`: `F_∞ = F_cyc`: MC is Wiles's theorem, with `ζ` the Deligne–Ribet pseudomeasure `G₁(T)/T` (Kakde §3).
- `sigma_independence`: Enlarging `Σ` by a prime `v` multiplies `ζ` by the Euler factor at `v` and changes `[C]` accordingly (Remark 14).
- `k1_nonuniqueness`: Stated in `K₁(Λ(G)_S)` instead of `K′₁`, uniqueness fails whenever `SK₁(Λ(G)_S) ≠ 1`.
- `wrong_sign`: Replacing `∂ζ = −[C(F_∞/F)]` by `∂ζ = +[C(F_∞/F)]` reverses the boundary convention: `ζ⁻¹` has that boundary and interpolates the reciprocal values wherever they are nonzero, so the sign is fixed by the interpolation data.
- `kprime_normalization`: `K′₁(Λ(G)_S)` is `K₁(Λ(G)_S)` modulo the image of the classes of `K₁(Λ(G))` that are invisible to every Artin determinant at finite level (§3.11). Kakde's `K′₁` (Definition 7) presupposes the continuity isomorphism of Fukaya–Kato, and with the explicit bijectivity hypothesis of §3.11, step 7 (§3.11, step 7) it is the group here. Both `∂` and the evaluations factor through this quotient, and Layer 6 proves MC in this form without the continuity input.
- Uniqueness is in `K′₁`; in `K₁` it can fail (Kakde, Remark 12). Kakde's Remark 12 also cites Burns for `SK₁(Λ(G)_S) = ker ∂ ∩ ⋂_ρ ker(evaluation at ρ)`; that identity is not used here.

*Needs:* [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [2.15](#ne2-boundary-surjective-p-torsion) (Surjectivity of `∂` for every compact `p`-adic Lie group); [4.5](#ne4-totally-real-iwasawa-complex) (The complex `C(F_∞/F)`); [4.4](#ne4-admissible-extension) (Admissible extensions, `μ = 0` and weak Leopoldt).

<a id="ne5-zeta-interpolation-contract"></a>
### 5.6 Localized zeta interpolation contract

**Definition.** For a specified perfect `S`-torsion arithmetic complex `C`, a specified sign `ε∈{1,−1}`, an allowed Artin`/Tate`-twist set A and normalized values `I(ρ,r)`, define `ZetaContract(C,ε,A,I)` to be the set of `ζ∈K₁(Λ_S)` with `∂ζ=ε[C]` and `ev_(ρκ^r)(ζ)=I(ρ,r)` wherever ordinary evaluation is defined. At exceptional zeros replace the last equality by the stated leading-term formula, with its Bockstein trivialization. Existence means this set is nonempty; uniqueness means it has at most one element in the specified group, or only after passing to an explicitly named quotient. Periods, removed Euler factors and contragredients are part of `I`, not adjustable units.

See CFKSV, Conjectures 5.7–5.8, pp. 201–204, equation (107): Fixes periods, local factors, the Artin dual and the boundary formulation. Kakde, §2.4, p. 12, and Theorem 11, p. 13 (arXiv v3): Uses the negative class of the totally real dual complex and a uniqueness statement in `K′₁`. Burns–Venjakob, Conjecture 4.1, pp. 20–21; Theorems 5.5 and 6.7: Connects a determinant zeta isomorphism to specialized leading-term data.

The hypotheses are as follows. `C` perfect and `S`-acyclic; its boundary sign is specified; evaluation maps are defined on the chosen domain. Interpolation data include coefficient field, periods, Frobenius convention, Artin dual and Euler factors.

*Construction.*

1. Use the existing CFKSV and totally real formulations as two choices of the data, keeping their different signs.
2. Express the contract as a predicate on actual localized `K₁`, with a separate quotient version for `K′₁`.
3. For leading-term clauses require the semisimplicity and Bockstein data of Layer 7; these never come from nonzero interpolation values.

API: `ZetaContract.boundary` (Every member has exactly the specified boundary `ε[C]`); `ZetaContract.interpolate` (Every allowed nonexceptional representation/`twist` has the prescribed normalized value `I`); `ZetaContract.exists` (Existence is nonemptiness, distinct from uniqueness in `K₁` or `K′₁`); `ZetaContract.quotient` (A contract descends through a quotient only when its boundary and evaluations kill that quotient kernel); `ZetaContract.leadingTerm` (At an exceptional zero compare the normalized leading coefficient with the Bockstein determinant and specified local factors).

**Checks.**

- `zeta_interpolation_contract_1`: For `C=[Λ --T→ Λ]`, the positive-boundary characteristic lift is `T`, while the Burns–Venjakob characteristic map is `T⁻¹` with negative boundary.
- `zeta_interpolation_contract_2`: Multiplying by a nontrivial integral unit preserves a boundary class but can change the normalized interpolation value; boundary equality does not imply the contract.
- `zeta_interpolation_contract_3`: If `x≠1` belongs to the common kernel of boundary and every evaluation, then `ζ` and `ζx` meet the same contract; uniqueness needs an extra kernel theorem.
- `zeta_interpolation_contract_4`: Changing an Artin representation to its dual without changing the period/`local`-factor formula is a different contract.

*Needs:* [2.8](#ne2-relative-perfect-class) (Relative classes of torsion perfect complexes); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [3.13](#ne3-reduced-norm-sk1-comparison) (Reduced norms and the surviving `SK₁` ambiguity); [4.7](#ne4-equivariant-perfect-base-change) (Perfection, torsion and derived arithmetic base change).

<a id="ne5-zeta-functoriality"></a>
### 5.7 Norm, quotient and restriction of zeta contracts

**Theorem.** Let a quotient `G→G/N` or an open subgroup `U⊆G` induce a compatible localization square; for `U` require `Λ(G)_S` finite projective over the chosen `Λ(U)`-localization. Quotient derived base change induces a map on relative `K₀` and localized `K₁`; open-subgroup restriction of scalars induces the `K`-theory transfer. Their boundaries commute. Evaluation after quotient uses inflated representations; evaluation after transfer uses induced representations. Consequently the image of a zeta element satisfies the transported contract exactly when the arithmetic complex comparison and the normalized interpolation identities hold. For `G^ab` use `N=[G,G]` only when this quotient localization is admitted.

See Kakde, §2.3, equation (1), p. 11; §4, pp. 17–30; Proposition 95, pp. 67–69: Uses quotient base change, subgroup norms and induction of Artin `L`-values. CFKSV, Theorem 3.10, pp. 183–184: Supplies the determinant/induction convention for the evaluation comparison.

The hypotheses are as follows. Canonical denominator/localization compatibility is proved for the chosen quotient or open subgroup. The arithmetic base-change/restriction and normalized `L`-function induction identities hold, with identical Euler-factor sets and periods.

*Proof.*

1. Use functoriality of the perfect localization fibre sequence; quotient tensor and finite-projective restriction carry the supported subcategories into the correct supported subcategories.
2. Apply the evaluation induction and inflation identities of §3.14.
3. Use the arithmetic complex comparison to identify the transported relative boundary, then compare the actual normalized interpolation values. No equality of ideals suffices for the last step.

**Checks.**

- The identity quotient and identity subgroup induce identity maps on contracts.
- For `U=Γ⊆C₂×Γ`, transfer evaluation at 1 equals the product of the 1 and sign evaluations.
- A chosen map that sends an `S`-denominator to a nonunit cannot define a map from `Λ_S`; the theorem must refuse it.

*Needs:* [5.6](#ne5-zeta-interpolation-contract) (Localized zeta interpolation contract); [3.14](#ne3-artin-evaluation-functoriality) (Functoriality and induction of Artin evaluation); [4.7](#ne4-equivariant-perfect-base-change) (Perfection, torsion and derived arithmetic base change); GeneralAlgebraicKTheory §§4.15–4.17, 6.3, 6.19, 8.7; `Σ`-truncated Artin `L`-values at negative integers and their inductivity, as defined in the Conventions of Layer 6 from finite-order Hecke `L`-functions (the finite-Hecke/Artin comparison in Exact supplier contracts) and Brauer induction.

<a id="ne5-abelian-normalization-comparison"></a>
### 5.8 Normalized abelian determinant comparison

**Comparison.** For an abelian specialization, compare the transported arithmetic complex and determinant trivialization, then identify the image of the zeta element with the normalized abelian `p`-adic `L`-function (target `abelianDeterminantComparison`). That function is characterized by its interpolation formula, which determines it uniquely because Artin characters of finite order times powers of the cyclotomic character separate the elements of the abelian localized ring; its existence is the Deligne–Ribet construction of §6.1, which does not use this subsection, so the comparison is stated here for any element with that interpolation property. The comparison fixes the variable `γ↦1+T`, arithmetic/geometric Frobenius convention, Artin dual, `S`-removal and `T`-smoothing, and any period or epsilon factors. An equality of principal ideals or Fitting ideals is only the divisor-level consequence. The element-level comparison is the target. Fix the Deligne–Ribet pseudomeasure, the involution and the distinguished denominator in the trivial-character component before comparing; an equality of characteristic ideals supplies only a unit ambiguity, and the interpolation values choose the normalized representative. The normalized boundary of the Deligne–Ribet element is proved in §6.1; at `p = 2` the real-place comparison of §4.8 is additionally required.

See Kakde, §3, pp. 13–17, abelian comparison: The abelian pseudomeasure interpolation and boundary use the established classical main conjecture. Gambheera–Popescu, Theorem 6.30, pp. 33–34; §2.3, pp. 5–6: The newer abelian minus formula is a Fitting equality with a fixed covariant dual action; it does not alone provide the stronger determinant trivialization.

The hypotheses are as follows. A common abelian extension, coefficient ring, prime and local conventions in the two formulations; both arithmetic complexes are perfect and the same localization is admitted. The imported all-prime theorem is used only in its proved hypotheses; an odd-prime result does not settle the real two-primary comparison.

*Proof.*

1. Use derived base change and duality to identify the arithmetic determinant lines and their trivializations, retaining local correction factors.
2. Compare normalized interpolation formulas at a dense allowed set and invoke the exact one-variable/pseudomeasure separation theorem.
3. Apply the reduced-norm kernel statement only if lifting the scalar identity back to noncommutative `K₁`; leave every undetected kernel explicit.

**Checks.**

- Multiplication of a power series by `1+p` preserves its ideal and changes its value at `T=0`, detecting a comparison that proves only ideal equality.
- Under `γ↦1+T`, replacing `γ` by `γ⁻¹` sends `T` to `(1+T)⁻¹−1`; the normalized formula must track this substitution.
- `T`-smoothing multiplies the `L`-element by the prescribed local factor; deleting it while retaining the same Selmer module fails the comparison.

*Needs:* [5.7](#ne5-zeta-functoriality) (Norm, quotient and restriction of zeta contracts); [3.13](#ne3-reduced-norm-sk1-comparison) (Reduced norms and the surviving `SK₁` ambiguity); [4.8](#ne4-real-two-primary-correction) (Real-place correction at the prime two); TauCetiRoadmap PadicMeasuresIwasawaAlgebras Layer 3; TauCetiRoadmap PadicMeasuresIwasawaAlgebras Layer 5.

### Examples

- For `X₁(11)` at `p = 5` the 5-adic valuations of the right-hand side of (107) at `ρ₁, ρ₂` are `−1/2 + 3/2 + 2 = 3` and `−3/2 + 5/2 = 1`, matching the Euler characteristics `5³` and 5 of §3.9 (§5.4).
- For `F_∞ = F_cyc` the totally real main conjecture is Wiles's theorem with `ζ = G₁(T)/T` (§5.5).

### Dependencies

Layers 1–4 of this roadmap; the finite-Hecke/Artin comparison in Exact supplier contracts; the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; GeneralAlgebraicKTheory §§4.15–4.17, 6.3, 6.19, 8.7; TauCetiRoadmap PadicMeasuresIwasawaAlgebras Layer 3 and §5.1.

<a id="ne-foundations-hilbert-forms"></a>
### `F`.5 Hilbert modular forms and coefficient families

For every totally real number field `F`, integral parallel weight `k≥2`, fractional-ideal polarization component, congruence level and finite-order character of weight-compatible parity, construct the classical Hilbert modular-form space on the product of upper half-planes. Use the slash action with the norm weight, transformation law, holomorphy and cusp expansions of Deligne–Ribet §5; include holomorphy at the cusps when the degree-one case requires it. Define cusp forms by vanishing of all cusp constants. The rational structure consists of the forms whose normalized expansions at all components and cusps have coefficients in the specified coefficient field. For a coefficient valuation ring `O`, define the integral lattice by integrality of all coefficients, including constants. Treat every totally real degree and all polarization components, rather than replacing these spaces by classical modular forms over `ℚ`. Construct their scalar extensions and the integral coefficientwise inverse-limit comparison; arbitrary nonflat lifting is not asserted. (Deligne–Ribet, *Values of abelian `L`-functions at negative integers over totally real fields*, §5, (5.1)–(5.7), pp. 259–262.)

The targets `hilbertForms`, `hilbertCuspForms` and `hilbertQExpansion` include linearity, change of cusp, change of fractional-ideal representative, identity/composition for slash actions and scalar changes, and expansion injectivity using one cusp on each component. Prove the `q`-expansion principle for descent to a coefficient subring in the source’s coefficient regime. Give the normalized ideal-coefficient dictionary, with the different, weight and representative factors, and retain the separate cusp constants. Construct the Hecke and level-dividing operators by their double cosets and transport their Fourier formulas to ideal coefficients, with composition and change-of-level maps. Diagonal restriction, the `U_β` comparison at a unit-idele cusp and the Eisenstein constant-term formulas are the additional targets of §§6.19, 6.22; they use these full form spaces. (Deligne–Ribet, §5, especially (5.2), (5.4)–(5.8); Kakde, Lemma 109 and Proposition 111, pp. 79–80.)

**Checks for forms, integral lattices and expansions.**

- For `F=ℚ`, the construction is the usual modular-form space and its `q`-expansion, with the constant term retained; its cusp subspace is the kernel of every cusp constant.
- When the narrow class group is nontrivial, a form supported on one component is not detected by a cusp on another. Expansions on all components are injective, and the ideal dictionary cannot retain only principal ideals.
- Rescaling the cusp differential by `x` multiplies the weight-`k` expansion by `Norm(x)^(−k)`; the ideal-coefficient dictionary compensates by exactly this factor. Dropping it changes both the integral lattice and the restriction formula.
- Zero belongs to the form and cusp spaces and to every integral lattice. A nonzero Eisenstein constant distinguishes the form space from its cusp subspace; a coefficient of negative valuation distinguishes a rational form from its integral lattice.
- A compatible integral expansion is recovered from all reductions modulo `ϖⁿ`, rather than from its first reduction. Finite coefficient extension includes ramified `O`, with no splitting into nonexistent integral embedding idempotents.

For odd `p`, `Λ=O[[T]]`, `u` a generator of `1+pℤ_p`, and a totally odd narrow ray class character `χ` of conductor prime to `p`, define `hilbertCoefficientFamily` by its normalized ideal coefficients and cusp constants in `Λ`, subject to classical specialization at every `k≥2` under `T↦u^{k−1}−1`, of weight `k`, level multiplied by the primes over `p` and character `χω^{1−k}`. The API includes the `Λ`-module and cuspidal submodule, extensionality in every ideal coefficient and cusp constant, specialization and its coefficient formula, and coefficientwise Hecke operators. The ordinary submodule is the image of the limit projector for the product of the operators at primes over `p`. Prove its existence from the locally finite operators on the actual finite coefficient quotients. Construct the all-degree parallel-weight ordinary tower and its moment maps, calculate the ordinary specialization kernels/cokernels, and prove the first-coefficient Hecke duality and finite freeness. These are general Hilbert parallel-weight control targets, with their finite character and conductor retained; the even-degree definite-quaternionic route alone is insufficient. (Dasgupta–Kakde–Ventullo, *On the Gross–Stark conjecture*, §3.1, (25)–(27), pp. 846–847, including its recalled Hida–Wiles ordinary construction.)

**Checks for families and ordinary control.**

- The Eisenstein family specializes to the Eisenstein series of character `χω^{1−k}`, with the `p`-divisor terms removed in every weight, including weights congruent to one modulo `p−1`. Its constant is the normalized `p`-adic `L`-value, not zero.
- At weight one the coordinate specializes to `T=0`; classicality at weight one is not a defining requirement. A coefficient family classical at only one weight fails the condition at every `k≥2`.
- For `F=ℚ`, compare the ordinary cuspidal module with the ordinary elliptic module after the stated weight-coordinate and Teichmüller-component conversion. For odd-degree `F`, the theorem still applies without a quaternion algebra ramified at exactly all real places.
- The ideal `(ϖ,T)` is torsion-free of rank one over `O[[T]]` and is not free; finite freeness uses ordinary control and the integral duality, rather than torsion-freeness alone.

*Needs:* GlobalNumberFields Layers 0–3 and 9 for ideals and ray characters; ModularForms Layer 0 for the degree-one comparison; Mathlib holomorphic functions, products of upper half-planes and `PowerSeries`; PadicMeasuresIwasawaAlgebras §§1.7, 4.1–4.2 for coefficient coordinates and finite-module algebra. The classical slash-action and cusp constructions, their rational structure, and the full parallel-weight ordinary construction are targets here.

## Layer 6: The main theorems for totally real fields

This layer proves the main conjecture for totally real fields (§6.34) for odd `p` under `μ = 0`, following Kakde's reductions and algebraic theorems, with the analytic congruences supplied by the full Möbius congruences of Ritter–Weiss and the canonical descent of §6.31. The Ritter–Weiss theorem, its conditional uniqueness reduction and the unconditional abelian minus theorem of Gambheera–Popescu are stated in their own hypotheses and do not strengthen one another. Modules `TauCeti/NumberTheory/NoncommIwasawa/TotallyReal`, `.../KakdeCongruences` and `.../Layer6`.

Artin `L`-values. For a totally real field `F`, a finite set `Σ` of finite primes and a finite-order Artin character `ρ` of `G_F` unramified outside `Σ`, the `Σ`-truncated value `L_Σ(ρ, 1 − k)` at a positive integer `k` is defined through Brauer induction from finite-order Hecke characters, whose continuation and functional equation are the finite-Hecke/Artin comparison in Exact supplier contracts (the finite-order Hecke functional equation); its independence of the Brauer expression follows from the Euler-product identities for `Re s > 1` (the Dedekind complex-germ comparison in Exact supplier contracts) and uniqueness of continuation, and the same argument gives inductivity `L_{Σ_F}(Ind_K^F ρ, 1 − k) = L_{Σ_K}(ρ, 1 − k)`, where `Σ_K` is the set of primes above `Σ_F` for `Σ_K` the primes of `K` above `Σ`. These are the targets `artinLValue` and `artinLValue_induction` of §6.1.

Two sets of standing hypotheses recur.

- **(A)** `G` is a one-dimensional pro-`p p`-adic Lie group with a closed normal `H, G/H ≅ Γ ≅ ℤ_p`, a fixed lift `G = H ⋊ Γ, Z = Γ^{p^e}` open in `Γ` and acting trivially on `H` (so `Z` is central), `Ḡ = G/Z`, and `U_P ≤ G` the preimage of `P ≤ Ḡ`; `p` is odd; `𝒪` is the ring of integers of a finite unramified extension of `ℚ_p`. Finite products are handled componentwise, taking products of the entire groups and exact sequences, including separate `G^ab` factors.
- **(B)** `F_∞/F` is admissible with `μ = 0` and `p` odd; `Gal(F_∞/F) = Δ × G` with `Δ` cyclic of order prime to `p` and `G` a one-dimensional pro-`p p`-adic Lie group; `Z ≤ G` is central open pro-cyclic, `Ḡ = G/Z, U_P ≤ G` the preimage of `P ≤ Ḡ, F_P = F_∞^{Δ×U_P}, d_P = [F_P : F], r_P = [F_P : ℚ], Σ_P` the primes of `F_P` above `Σ`, and `ζ_P` the Deligne–Ribet `p`-adic zeta function of the abelian extension with group `Δ × U_P^ab` (Kakde, Notations 91).

<a id="ne6-abelian-case"></a>
### 6.1 The main conjecture for abelian `×` prime-to-`p` Galois groups

**Theorem.** Let `F_∞/F` be admissible with `μ = 0` and `Gal(F_∞/F) = G × Δ, G` abelian and `Δ` finite of order prime to `p`. Then `MC(F_∞/F)` holds, and `K₁(Λ(G × Δ)) → K₁(Λ(G × Δ)_S)` is injective. For `G = H × Γ` with `H` finite abelian, the Deligne–Ribet pseudomeasure `ζ` is a unit of `Λ(G)_S` (Lemma 15) with `∂ζ = −[C(F_∞/F)]` (Theorem 16).

See Kakde, §3, Theorem 18, p. 17 (arXiv v3): Theorem 18 with Lemma 15, Theorem 16 and Lemma 17 (pp. 14–17).

The hypotheses are as follows. `μ = 0`; `p` odd; #`Δ` prime to `p`.

*Proof.*

0. Analytic inputs and arithmetic adapters. `(a)` `artinLValue`, `artinLValue_induction` are the `Σ`-truncated Artin-value adapters in the layer introduction. `(b)` Use IntegralIwasawaTheory §6.0, `totallyRealHeckeValue_rational`, for the rational partial-zeta values; `partialZeta_rational` is its characteristic-function specialization, with even `k≥2`. `(c)` The Hilbert Eisenstein series `G_{k,ε} ∈ M_k(Γ₀₀(𝔣))` with standard `q`-expansion `2^{−r}L_Σ(ε, 1 − k) + Σ_μ (Σ_{𝔞∋μ} ε(g_𝔞)N𝔞^{k−1}) q^μ` and constant term `N((α))^k 2^{−r} L_Σ(ε_g, 1 − k)` at the cusp determined by any finite idele `α` with Artin symbol `g` (Deligne–Ribet, Proposition 6.1, §6, pp. 267–273; restated by Kakde, Proposition 111, p. 80), and the `q`-expansion principle: if `f ∈ M_k(Γ₀₀(𝔣), ℚ)` has nonconstant standard coefficients in `ℤ_(p)`, then `c(0, f) − N(α_p)^{−k}c(0, α, f) ∈ ℤ_p` for every finite idele `α` (Deligne–Ribet (0.3) and 5.13–5.15; Kakde §6.11, p. 81). These use the Hilbert modular forms and `q`-expansions of §F.5. `(d)` Use IntegralIwasawaTheory §§6.0–6.3, `deligneRibet_distributionCongruences` and `deligneRibetPseudomeasure`, for smoothing, Kummer congruences and distributions. The notation `deligneRibet_kummerCongruences` transports that supplied congruence to `Σ_k ε_k N^{k−1}` and `Δ_c(1−k,ε_k)`, with the same integral coefficient lattice. `(e)` Its pseudomeasure has `∫εN^k dλ=L_Σ(ε,1−k)`; construct the equivariant quotient and coefficient adapters using its distribution relations, rather than constructing a second measure. `(f)` `abelianMainConjecture_Wiles` is the convention adapter of IntegralIwasawaTheory §12.1, `wilesMainConjecture` and `ramifiedModule_characterQuotientMainConjecture`. Use the actual character quotient when the character has `p`-power order; integral eigenspace comparison is used only for prime-to-`p` order. The trivial quotient cancels its pole by `T`, and the full characteristic-ideal equality needed here retains the `μ=0` hypothesis and the supplied quotient theorem’s disjointness and ramification assumptions, after finite base change where necessary. `(g)` Prove `abelianZeta_boundary`: character detection transports these normalized characteristic identities to `∂ζ=−[C(F_∞/F)]`. Brauer induction constructs the prime-to-`p` Artin pseudomeasures, and interpolation proves independence of the induction expression.
1. Lemma 15: `Λ(G)_S ≅ ⊕_{ψ∈Ĥ′} Λ_{𝒪_ψ}(H_p × Γ)_S`, each summand local; `(ψ × 1)(ζ) ∉ π_ψΛ_{𝒪_ψ}(Γ)_S` by `μ = 0` and Wiles's theorem, so `ζ` is a unit.
2. Theorem 16: characterwise, `∂(ψ(ζ)) = −[C_ψ]` is Wiles's main conjecture (step 0`(f)`) for the Deligne–Ribet functions `G_ψ` (step 0`(e)`); `θ₀ : K₀(Λ(G), Λ(G)_S) → ∏_ψ K₀(Λ_{𝒪_ψ}(Γ), Λ_{𝒪_ψ}(Γ)_S)` is injective, because `x = |H|^{−1}Σ_h h Σ_ψ x_ψ ψ(h^{−1})` shows the cokernel of `θ` injects into that of `θ_S` (snake lemma).
3. Lemma 17: for `p ∤` #`Δ, K₁(Λ(G × Δ)_S) ≅ ⊕_{χ∈R(Δ)} Λ_{𝒪_χ}(G)_S^×`, and `ζ = Σ e_χ L_p(χ)`, with `L_p(χ)` built from Deligne–Ribet functions by Brauer induction (step 0`(g)`; Tau Ceti integral Brauer induction), is the zeta element.
4. Theorem 18: `K₀(Λ(G × Δ), Λ(G × Δ)_S) ≅ ⊕_χ K₀(Λ_{𝒪_χ}(G), Λ_{𝒪_χ}(G)_S)`, and the same decomposition for `K₁` gives injectivity.

**Checks.**

- For a character of `p`-power order, the integral character quotient is used before inverting `p`; the rational idempotent eigenspace does not determine this quotient’s integral lattice.

- The analytic input (Deligne–Ribet) and the arithmetic input (Wiles) come from IntegralIwasawaTheory §§6.0–6.3 and §12.1; step 0 constructs their equivariant adapters. The `μ=0` hypothesis gives the unit property.
- For the cyclotomic trivial character over `ℚ` the pseudomeasure has a `T`-denominator; treating it as an integral measure loses the `−[ℤ_p]` contribution to its boundary.
- For any locally constant `ε`, smoothing by `c = 1` gives `(1 − 1)λ = 0`, consistent with `Δ_1(1 − k, ε) = 0`; it does not determine `λ`.
- On a nontrivial character component, `h_ψ` and `G*_ψ` generate the same ideal; multiplying a representative by a unit preserves the ideal and changes interpolation, so the normalization is additional data.
- For `F = ℚ, Σ = {3}, ε = 1` and `k = 2: L_Σ(1, −1) = (1 − 3)ζ(−1) = 1/6`, and the Eisenstein constant `2^{−1}L_Σ(1, −1) = 1/12`, against `2^{−1}ζ(−1) = −1/24` before truncation.

*Needs:* IntegralIwasawaTheory §§6.0–6.3 and §12.1; [5.5](#ne5-totally-real-main-conjecture) (The main conjecture for totally real fields); [4.5](#ne4-totally-real-iwasawa-complex) (The complex `C(F_∞/F)`); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); [2.9](#ne2-localization-sequence) (The localisation sequence for the canonical Ore set); §F.5; the finite-Hecke/Artin and Dedekind comparisons in Exact supplier contracts; TauCetiRoadmap PadicMeasuresIwasawaAlgebras Layer 3; RepresentationTheory`/`InductionRestriction Layer 6.

<a id="ne6-burns-kato-patching"></a>
### 6.2 The Burns–Kato patching principle

**Lemma.** Let `𝒞` be a family of pairs `(U, V), U` open in `G` and `V` closed normal in `U` with `U/V` admissible, and `θ = (θ_{U,V}) : K′₁(Λ(G)) → ∏_𝒞 K′₁(Λ(U/V)), θ_S` the same on the localisations, each `θ_{U,V}` the norm to `U` followed by the quotient map. Suppose each component localization map `K′₁(Λ(U/V)) → K′₁(Λ(U/V)_S)` is injective, `θ` is an isomorphism onto a subgroup `Φ, θ_S` lands in a subgroup `Φ_S` with `Φ_S ∩ ∏ K′₁(Λ(U/V)) = Φ`, MC holds for every `F_∞^V/F_∞^U` with `(ζ_{U,V}) ∈ Φ_S`, and every Artin character of `G` is a `ℤ`-combination of characters induced or inflated from the `U/V`. Then `MC(F_∞/F)` holds, and `K′₁(Λ(G)) → K′₁(Λ(G)_S)` is injective.

See Kakde, §1, the observation of Burns and Kato, p. 3 (arXiv v3): The principle stated in the introduction and carried out in each reduction.

The hypotheses are as follows. The hypotheses listed; `μ = 0` for each subquotient. `p` is odd.

*Proof.*

1. Choose `f ∈ K′₁(Λ(G)_S)` with `∂f = −[C(F_∞/F)]` (§2.15); `θ_S(f)` has components `f_{U,V}` with `∂f_{U,V} = −[C(F_∞^V/F_∞^U)]` by base change (§4.5).
2. `u_{U,V} = ζ_{U,V} f_{U,V}^{−1}` has boundary zero, so it is in the image of integral `K′₁`. Component injectivity identifies its unique integral preimage with that image. Thus `(u_{U,V}) ∈ Φ_S ∩ ∏ K′₁ = Φ`, and `θ` has a unique preimage `u`; put `ζ=uf`.
3. The boundary is `−[C]`. Interpolation follows by expressing `ρ` as an integer combination of induced/inflated component characters and using Kakde §2.4 (i)–(iii). If an integral class dies after localization, each component dies, hence is 1 by component injectivity, so the class is 1 by injectivity of `θ`. For uniqueness, the ratio of two candidates is integral by exactness; component main-conjecture uniqueness and the two injectivities then make it 1.

**Checks.**

- This is the argument Kakde repeats in Theorems 21, 27, 33 and 36; stating it once lets each reduction supply only the description of `Φ`.
- Component injectivity is a hypothesis: without it the integral preimage in step 2 need not be unique.

*Needs:* [5.5](#ne5-totally-real-main-conjecture) (The main conjecture for totally real fields); [2.15](#ne2-boundary-surjective-p-torsion) (Surjectivity of `∂` for every compact `p`-adic Lie group); [4.5](#ne4-totally-real-iwasawa-complex) (The complex `C(F_∞/F)`); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations).

<a id="ne6-reduction-to-dimension-one"></a>
### 6.3 Burns's reduction to one-dimensional extensions

**Theorem.** Let `F_∞/F` be admissible with `μ = 0`. If MC holds for every `F_∞^U/F` with `U ≤ H` open pro-`p` and normal in `G`, and each `K′₁(Λ(G/U))` injects into `K′₁(Λ(G/U)_S)`, then `MC(F_∞/F)` holds.

See Kakde, §4.1, Theorem 21, p. 19 (arXiv v3): Theorem 21 and its proof (pp. 19–20).

The hypotheses are as follows. `μ = 0`; the quotients `G/U` are one-dimensional. `p` is odd.

*Proof.*

1. §3.11 (Corollary 20): `K′₁(Λ(G)) ≅ lim_U K′₁(Λ(G/U))`.
2. Uniqueness makes `(ζ_{G/U})` a compatible system; §6.2 with `𝒞 = {(G, U)}` and `Φ` the inverse limit; every Artin character of `G` factors through some `G/U`, and `[F_∞(μ_p) : F_∞] = [F_∞^U(μ_p) : F_∞^U]` as `U` is pro-`p`.

**Checks.**

- The injectivity hypothesis on `K′₁` is carried, not dropped.

*Needs:* [6.2](#ne6-burns-kato-patching) (The Burns–Kato patching principle); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras).

<a id="ne6-reduction-to-qp-elementary"></a>
### 6.4 Reduction to `ℚ_p`-elementary Galois groups

**Theorem.** Let `F_∞/F` be admissible, one-dimensional, with `μ = 0`. If MC holds, and `K′₁(Λ(U)) → K′₁(Λ(U)_S)` is injective, for every admissible subextension whose Galois group `U` is `ℚ_p`-elementary (`U = P ⋊ Γ` with a central open `Γ^{p^r}` and `(P ⋊ Γ)/Γ^{p^r}` an `l-ℚ_p`-elementary finite group `C_n ⋊ P₁`, the image of `P₁` in `(ℤ/n)^×` lying in `Gal(ℚ_p(μ_n)/ℚ_p)`), then `MC(F_∞/F)` holds and `K′₁(Λ(G))` injects into `K′₁(Λ(G)_S)`.

See Kakde, §4.2, Theorem 27, p. 21 (arXiv v3): Theorem 27 with Definitions 23–24, Theorem 25 and Lemma 26 (pp. 20–23).

The hypotheses are as follows. `G` one-dimensional: `G ≅ H ⋊ Γ` with `Γ^{p^e}` central. `p` is odd.

*Proof.*

1. Dress–Wall induction: `K′₁(ℤ_p[P]) ≅ lim_π K′₁(ℤ_p[π])` over the `ℚ_p`-elementary subgroups `π` of each finite quotient `P`, with norms and conjugations (`dressWall_induction` of §3.11, step 6, with `K′ = ℚ_p`; Kakde's Theorem 25, citing Oliver, *Whitehead groups of finite groups*, Theorem 11.2). It is proved there from the integral Witt–Berman identity of ClassicalArithmeticCompletion §7.63 and Dress's Mackey-formula argument, with `K′₁` read as the Artin-determinant image, so no theorem of Oliver's book is used.
2. Lemma 26: `K′₁(Λ(G)) ≅ lim_P K′₁(Λ(U_P))` over the `ℚ_p`-elementary `P ≤ G_n = G/Γ^{p^{e+n}}, U_P` their preimages: step 1 at each finite level `G_(n+i)`, and `k1Prime_equiv_limit` of §3.11 for `G` and for each `U_P`, combined as in Kakde's proof, pp. 21–22; no `K₁`-continuity theorem is needed.
3. §6.2, with compatibility of `(ζ_P)` under conjugation and norms from uniqueness and the invariance of `L_Σ` under conjugation and induction; interpolation by Brauer's induction theorem (Tau Ceti InductionRestriction Layer 6), elementary subgroups being `ℚ_p`-elementary.

**Checks.**

- Uses `ℚ_p`-elementary subgroups for the `K₁` isomorphism, although Brauer induction needs only elementary ones.

*Needs:* [6.2](#ne6-burns-kato-patching) (The Burns–Kato patching principle); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); TauCetiRoadmap ClassicalArithmeticCompletion §7.63.

<a id="ne6-l-elementary-case"></a>
### 6.5 The `l-ℚ_p`-elementary case, `l ≠ p`

**Theorem.** If `F_∞/F` is admissible with `μ = 0` and `G = Gal(F_∞/F)` is `l-ℚ_p`-elementary for a prime `l ≠ p`, then `MC(F_∞/F)` holds and `K′₁(Λ(G))` injects into `K′₁(Λ(G)_S)`. Here `G ≅ Γ^{p^e} × Ḡ` with `Ḡ = C ⋊ P` finite (Lemma 28); reducing to `C` a cyclic `p`-group and `P` of order prime to `p`, with `C̄ = H₀(P, C) = C/[P, C]` (isomorphic to `H⁰(P, C)`, as `|P|` is prime to `p`), `P₁ = ker(P → Aut C)` and `G₁ = Γ × C × P₁`, the map `θ =` (quotient, norm) : `K′₁(Λ(G)) → K′₁(Λ(Γ × C̄ × P)) × K′₁(Λ(G₁))` is an isomorphism onto `Φ = {(x₀, x₁) : norm(x₀) = can(x₁), x₁ fixed by P}` (Proposition 30). Moreover `SK₁(ℤ_p[Δ]) = 1` at every finite level `Δ` of `G`. Hence, granted the explicit bijectivity hypothesis of §3.11, step 7, `SK₁(Λ(G)) = 1, K₁ = K′₁` for `Λ(G)` and `Λ(G)_S`, and `K₁(Λ(G))` injects into `K₁(Λ(G)_S)`, which is Kakde's Theorem 33 as printed.

See Kakde, §4.3, Theorem 33, p. 27 (arXiv v3): Theorem 33 with Lemmas 28, 31, Definition 29 and Proposition 30 (pp. 23–27).

The hypotheses are as follows. `l ≠ p`; `μ = 0`. `p` is odd. The coefficient ring is `ℤ_p`. The `K₁`-level clause additionally assumes the explicit bijectivity hypothesis of §3.11, step 7 (§3.11, step 7); the main conjecture and the `K′₁` statements do not.

*Proof.*

1. Lemma 28: the minimal central `Γ^{p^e}` splits off.
2. If `p ∤` #`C`, §6.1 applies. Otherwise work at the finite levels `Δ_n = Γ/Γ^(p^n) × (C ⋊ P)`, with `Δ̄_n` and `Δ_(1,n)` the corresponding levels of `Γ × C̄ × P` and `G₁`. By `k1Prime_equiv_limit` (§3.11, step 2) `θ` is the inverse limit of the finite-level maps `θ_n` on `K′₁ = Det(units)`, and `Φ` is the inverse limit of the corresponding `Φ_n`, so it suffices that each `θ_n` is an isomorphism onto `Φ_n`. `θ_n` lands in `Φ_n`: conjugation by `P` preserves the norm's matrix class, and the norm square commutes.
3. Surjectivity at level `n`. Units of `ℤ_p[Δ_n]` surject onto those of `ℤ_p[Δ̄_n]`, so one may take `x₀ = 1`. Then `x₁` lies in `J_n = ker(K′₁(ℤ_p[Δ_(1,n)]) → K′₁(ℤ_p[Γ/Γ^(p^n) × C̄ × P₁]))`. The kernel of the group-ring map is `I = I_N·ℤ_p[Δ_(1,n)]` for the `p`-group `N = [P, C] = ker(C → C̄)`, and it lies in the radical. So `J_n = Det(1 + I)` (Chinburg–Pappas–Taylor II, Lemmas 2.1–2.2), which is a pro-`p` group as the continuous image of the pro-`p` group `1 + I` (§3.11, step 4`(c)`). Since `n₀ = (P : P₁)` is prime to `p, x₁ = z^(n₀)` for some `z ∈ J_n^P`. The image `z̃` of `z` under the inclusion `K′₁(ℤ_p[Δ_(1,n)]) → K′₁(ℤ_p[Δ_n])` has `θ_n(z̃) = (1, z^(n₀)) = (1, x₁)`: its norm to `Δ_(1,n)` is the product of the `P/P₁`-conjugates of the `P`-fixed `z`, and its quotient factors through the image of `z` in `K′₁(ℤ_p[Γ/Γ^(p^n) × C̄ × P₁])`, which is trivial. Kakde cites Oliver Theorem 2.10(ii) and Fukaya–Kato Proposition 1.5.3 for the pro-`p` property; on `Det(units)` it is the compactness argument just given.
4. Injectivity at level `n`, by characters. Let `x ∈ ker θ_n`. By Lemma 31 every irreducible character `χ` of `Δ_n` is inflated from `Δ̄_n` or induced from `Δ_(1,n)`. Hence `Det_χ(x) = Det_(χ₀)(x̄) = 1` or `Det_χ(x) = Det_ρ(N(x)) = 1`, by functoriality of determinants under inflation and induction (§3.14 at finite level). The family `(Det_χ)_χ` is injective on `K₁(ℚ_p[Δ_n])` (Wedderburn and `sk1_semisimple_padic`), and `K′₁(ℤ_p[Δ_n])` embeds there by definition, so `x = 1`. This replaces Kakde's logarithm argument on p. 26, which used the torsion formula `μ_(p−1)×Ḡ^ab×SK₁` for arbitrary finite quotients; that formula is false at that generality (the `C₂` Check below), and no logarithm is needed.
5. Then §6.2 with §6.1 for the two components `Γ × C̄ × P` and `G₁` and for `Γ × C̄ × P₁`, which are abelian `×` prime-to-`p`. Their `K′₁` groups inject into those of the localizations (§6.1), so an element of `Φ_S` whose components are integral satisfies the defining conditions integrally, and `Φ_S ∩ ∏ K′₁ = Φ`.
6. The `SK₁` clause. Each `Δ_n = C_(p^n) × (C ⋊ P)` has the normal abelian Sylow `p`-subgroup `C_(p^n) × C`, so `SK₁(ℤ_p[Δ_n]) = 1` by `sk1_vanish_abelianSylow` (§3.11, step 5). Hence `lim_n SK₁(ℤ_p[Δ_n]) = 1`. With the explicit bijectivity hypothesis of §3.11, step 7 this limit is `SK₁(Λ(G))` (`sk1_eq_limit_of_continuity`), its images `SK₁(Λ(G)_S)` are trivial, and the injectivity of step 5 holds for `K₁`.

**Checks.**

- Oliver's Proposition 12.7 and Theorem 2.10 and Fukaya–Kato's Propositions 1.5.1 and 1.5.3 enter as Kakde cites them (pp. 17–18, 25). The first is `sk1_vanish_abelianSylow` of §3.11, proved there by induction and Chinburg–Pappas–Taylor; the second and fourth are replaced by step 3; the third is the explicit bijectivity hypothesis of §3.11, step 7 and is used only in the `K₁`-level clause.
- If `p ∤` #`C` the theorem is the case of §6.1.
- For `p=5` and the finite group `D=C₂, ℤ₅[D]≅ℤ₅×ℤ₅` by the idempotents (1±`g`)`/2`. Thus the torsion of `K₁` is `μ₄×μ₄` of order 16 and `SK₁=1`, whereas `μ₄×D^ab` has order 8. Every homomorphism from this torsion group to the additive `ℚ₅`-class algebra kills it, so the logarithm cannot have only the latter kernel. The character argument of step 4 does not use that formula: on `K₁(ℤ₅[C₂])=ℤ₅^×(e₊)×ℤ₅^×(e₋)` the pair `(Det_triv, Det_sign)` is the identity map, hence injective, and `SK₁=1`.
- `n0_prime_to_p`: step 3 needs `(P : P₁)`-th roots in a pro-`p` group, which exist because `P` has order prime to `p`. For `l = p` the corresponding index can be divisible by `p`, which is why the `p-ℚ_p`-elementary case (§6.6) is treated differently.
- `kernel_is_pro_p`: for `C = C_p, P = C₂` acting by inversion (`p` odd) and the level `n = 0, Δ_(1,0) = C_p, C̄ = 1` and `N = C_p`. Then `J_0 = Det(1 + I_(C_p))`, whose values at the nontrivial characters lie in `1 + (ζ_p − 1)ℤ_p[ζ_p]`, a pro-`p` group, and `z ↦ z²` is bijective on it.

*Needs:* [6.2](#ne6-burns-kato-patching) (The Burns–Kato patching principle); [6.1](#ne6-abelian-case) (The main conjecture for abelian `×` prime-to-`p` Galois groups); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); [3.14](#ne3-artin-evaluation-functoriality) (Functoriality and induction of Artin evaluation).

<a id="ne6-reduction-to-p-elementary"></a>
### 6.6 Reduction of the `p-ℚ_p`-elementary case to `Δ ×` pro-`p`

**Theorem.** Let `F_∞/F` be admissible with `μ = 0` and `G p-ℚ_p`-elementary, `G/Γ^{p^e} = C_n ⋊ H_p` with `p ∤ n, U` the preimage of `H_p`, and for `χ ∈ Ĉ_n` let `U_χ = ker(U → Gal(L_χ/ℚ_p)), L_χ = ℚ_p(χ)`. Then `K′₁(Λ(G)) ≅ ⊕_{χ∈C} K′₁(Λ_{𝒪_χ}(U_χ))^{U/U_χ}` (Proposition 35), and if MC holds for each `F_∞^{C_χ}/F_∞^{C_n ⋊ U_χ}` with `K′₁(Λ_{𝒪_χ}(U_χ)) → K′₁(Λ_{𝒪_χ}(U_χ)_S)` injective, then `MC(F_∞/F)` holds and `K′₁(Λ(G))` injects into `K′₁(Λ(G)_S)`. This reduces the main conjecture to `G = Δ × G_p` with `Δ` cyclic of order prime to `p` and `G_p` one-dimensional pro-`p`.

See Kakde, §4.4, Theorem 36, p. 29 (arXiv v3): Theorem 36 with Remark 34 and Proposition 35 (pp. 27–30).

The hypotheses are as follows. `G p-ℚ_p`-elementary; `μ = 0`. `p` is odd.

*Proof.*

1. Proposition 35 at finite level: `characterComponent_decomposition`, owned here (Kakde, p. 28, cites Oliver Proposition 11.6 and Theorem 12.3(4)). Since `p ∤ n, ℤ_p[C_n] = ∏_{χ∈𝒞} O_χ` by its primitive idempotents `e_χ`. The `e_χ` are central in `ℤ_p[G_n]` because `U_n` acts on `C_n` through `Gal(ℚ_p(μ_n)/ℚ_p)`, which preserves each Galois orbit of characters. Hence `ℤ_p[G_n] = ∏_χ O_χ∘U_n`, the twisted group ring in which `U_n` acts on `O_χ` through `t_χ`. In `O_χ∘U_n` the subgroup `U_{χ,n}` acts trivially on `O_χ`, so `O_χ[U_{χ,n}] ⊆ O_χ∘U_n`, and `A_χ=U_n/U_{χ,n}` acts faithfully on the unramified `O_χ` by Galois automorphisms. After extending scalars to an algebraic closure, `A_χ` permutes the embeddings of `O_χ` freely, so `O_χ∘U_n` becomes a product of matrix algebras of size `|A_χ|` over group algebras of `U_{χ,n}`. Hence every irreducible representation is induced from `O_χ[U_{χ,n}]`, and restriction of determinants is injective on `Det((O_χ∘U_n)^×)`. Chinburg–Pappas–Taylor (part `I, J`. Algebra 326 (2011), Theorem 6.2 and Proposition 6.3, restated in part II, arXiv:1303.5337v3, as Theorem 5.1, p. 33) identify its image with `Det(O_χ[U_{χ,n}]^×)^{A_χ}`. With `K′₁=Det` for these semilocal orders (§3.11, step 1) this gives `K′₁(ℤ_p[G_n]) ≅ ⊕_χ K′₁(O_χ[U_{χ,n}])^{U/U_{χ,n}}`. ClassicalArithmeticCompletion §7.109 supplies the coefficient fixed-point step, invariant determinant units of `O_χ[Δ]` descending to `ℤ_p[Δ]` for the unramified `O_χ`; its trace and Frobenius hypotheses hold here. Pass to the limit with `k1Prime_equiv_limit` (§3.11, step 2), which needs no continuity theorem for `K₁`. No induction theorem is used.
2. `Gal(F_∞^{C_χ}/F_∞^{C_n ⋊ U_χ}) ≅ C_n/C_χ × U_χ`, and `[F_∞(μ_p) : F_∞]` is unchanged.
3. §6.2; every irreducible `ρ` is `Ind(χρ_χ)` (Serre, Proposition 25), giving interpolation.

**Checks.**

- This reduction leaves the pro-`p` dimension-one case, supplied by the congruence and zeta-tuple targets in this layer.

*Needs:* [6.2](#ne6-burns-kato-patching) (The Burns–Kato patching principle); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); TauCetiRoadmap ClassicalArithmeticCompletion §7.109.

<a id="ne6-twisted-group-ring-presentation"></a>
### 6.7 The Iwasawa algebra of a one-dimensional pro-`p` group as a twisted group ring

**Construction.** In the standing dimension-one setting choose representatives `hγ^a, 0≤a<p^e`, of `G/Z`, where `Z=Γ^(p^e)` is central. The carry cocycle `τ(hγ̄^a,h′γ̄^b)=γ^(p^e floor((a+b)/p^e))` gives an Iwasawa-specific isomorphism `Λ_O(G)≅Λ_O(Z)[G/Z]^τ`, using the pinned `TauCeti.twistedMonoidAlgebra` from `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`. The cocycle is symmetric and normalized at the identity; in general `τ(g,g⁻¹)≠1`, and the inverse of a basis element is `τ(g,g⁻¹)⁻¹` times the inverse-labelled basis element. Changing the selected section gives the corresponding cohomologous presentation rather than literal equality of cocycles. Restriction gives `Λ_O(U_P)≅Λ_O(Z)[P]^τ`; `U_P` is abelian for cyclic `P`. For a coefficient domain put `R=Λ_O(Z)` and `T=R∖pR`. For a finite product `R=∏_i R_i` put `T=∏_i(R_i∖pR_i)`, not `R∖pR`. With this central denominator set, both canonical localizations identify as `Λ_O(G)_T=Λ_O(G)_S=Λ_O(Z)_(p)[G/Z]^τ`, and their `p`-adic completions agree. For `R=Λ_O(Z)` or its localized `p`-adic completion the cocenter is the free `R`-module on `Conj(G/Z)`, with the inherited carry convention.

See Kakde, §5.1.2, p. 31, with Lemmas 37, 43, 45, 46 and Remark 38, pp. 31–33 (arXiv v3): §§5.1.1–5.1.4: the twisted group ring, the Ore set `T` (Lemma 37, Remark 38), Lemma 43 and Lemmas 45–46. `Ḡ = G/Z` throughout.

The hypotheses are as follows. The standing hypotheses `(A)` of this layer.

*Construction.*

1. Expand products of the selected section `hγ^a`. The integer carry is central, verifies the cocycle identity, and is symmetric; identity normalization does not imply inverse-pair normalization. Changing section conjugates the presentation by the associated central 1-cochain.
2. `T` is central and consists of regular denominators. Apply Kakde Lemma 37 componentwise in the admitted unramified coefficient rings to identify localization at `T` with localization at `S`; in each coefficient domain the finite free central algebra embeds in its total quotient. The `p`-divisibility intersection calculation removes common `p`-powers from denominators.
3. Lemma 43: the map is surjective, and its kernel contains the commutators because `τ` is symmetric; conversely an element of the kernel is `Σ_{x∈Ḡ/C_g} r_{xgx⁻¹}(xgx⁻¹ − g) = Σ r_{xgx⁻¹} τ(xg, x⁻¹)⁻¹(xg·x⁻¹ − x⁻¹·xg)`, a sum of commutators.
4. Lemma 45 by restricting the presentation to `U_P`; Lemma 46 because `U_P/Z` is cyclic and `Z` is central.

API: `carryExponent` (the integer exponent (a `mod q + b mod q`) `div q` of the carry, `q = p^e`) and `carryExponent_cocycle` (its cocycle identity); `iwasawaCarryCocycle` (For the chosen section of `G→G/Z`, the central carry formula defines a normalized 2-cocycle valued in `Λ_O(Z)^×`. The generic twisted algebra is imported, not redefined); `iwasawaAlgebra_equiv_twisted` (`Λ_𝒪(G) ≃ Λ_𝒪(Z)[Ḡ]^τ`, restricting to `Λ_𝒪(U_P) ≃ Λ_𝒪(Z)[P]^τ` (Lemma 45)); `twistingCocycle_symm` (`τ(g,g′)=τ(g′,g)` and `τ(g,1)=τ(1,g)=1`. The basis inverse uses `τ(g,g⁻¹)⁻¹`; no inverse-pair normalization is imposed); `oreSetT` (For a coefficient domain `R=Λ_O(Z), T=R∖pR` is central and consists of regular elements. For `R=∏_i R_i` take the componentwise product `∏_i(R_i∖pR_i)`); `localizationT_equiv_localizationS` (`Λ_𝒪(G)_T ≃ Λ_𝒪(G)_S` (Lemma 37)); `cocenter_equiv_conj` (`R[Ḡ]^τ/[R[Ḡ]^τ, R[Ḡ]^τ] ≃ R[Conj Ḡ]^τ` (Lemma 43)).

**Checks.**

- `trivial_cocycle`: `τ ≡ 1` gives `R[P]^1 =` MonoidAlgebra `R P`.
- `direct_product`: `G = ℤ_p × C_p` with `e = 0: Z = Γ, Ḡ = C_p` and `τ ≡ 1`, so `Λ(G) = Λ(ℤ_p)[C_p]`.
- `carry`: `G = Γ = ℤ_p` with `Z = Γ^p (e = 1): Ḡ = ℤ/p` and `τ(γ^a, γ^b) = γ^p` when `a + b ≥ p (0 ≤ a, b < p)`, so `γ̄^p = γ^p·1` and `Λ(Γ) = Λ(Z)[X]/(X^p − γ^p)`.
- `Z_must_be_open`: For `G = ℤ_p` and `Z = 1` (no open `Z`), `T = ℤ_p^×` and `Λ(G)_T = Λ(G) ≠ Λ(G)_S = Λ(G)_{(p)}`; Lemma 37 needs `Z` open.
- `carry_inverse_not_one`: For `G/Z` generated by `γ̄` of order `p^e>1, τ(γ̄,γ̄⁻¹)=γ^{p^e}≠1`; multiplying the two basis elements requires this central carry.
- `product_denominator_set`: In `R=ℤ_p[[T]]×ℤ_p[[T]]`, (1,0) and (0,1) both belong to `R∖pR` but their product is zero. The correct componentwise set excludes both.
- For `Ḡ = 1 (G = Z ≅ ℤ_p)` the construction is `Λ_𝒪(ℤ_p)` itself, and `Conj Ḡ` is a point.
- For trivial carry the imported twisted algebra agrees with MonoidAlgebra; no separate generic twisted group ring is owned here.

*Needs:* [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem); [0.4](#ne0-iwasawa-local-iff-pro-p) (Finite-quotient Jacobson radicals and semilocality); Mathlib `MonoidAlgebra`; Mathlib `ConjClasses`; Tau Ceti `twistedMonoidAlgebra`.

<a id="ne6-congruence-group-phi"></a>
### 6.8 The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`

**Construction.** For `P ≤ Ḡ, θ^G_P : K′₁(Λ_𝒪(G)) → K′₁(Λ_𝒪(U_P)) → K′₁(Λ_𝒪(U_P^ab)) = Λ_𝒪(U_P^ab)^×` is the norm followed by abelianisation (just the norm when `P` is cyclic), `θ^G = (θ^G_P)_{P≤Ḡ}`, and `θ^G_S, θ̂^G` are the same maps on `K′₁(Λ_𝒪(G)_S)` and `K′₁(Λ̂_𝒪(G)_S)`. The data: `ver^{P′}_P : U_{P′}^ab → U_P^ab` the transfer and `ϕ : U_P → U_{P^p}` the transfer for cyclic `P`, both extended to Iwasawa algebras with Frobenius on `𝒪` (Notations 40); for `[P′,P′] ≤ P ≤ P′`, the trace `tr^{P′}_P`, norm `nr^{P′}_P` and projection `π^{P′}_P` into `Λ_𝒪(U_P/[U_{P′},U_{P′}])` (Definition 48); `T_{P,P′}` the image of `x ↦ Σ_{g∈P′/P} g̃xg̃⁻¹` on `Λ_𝒪(U_P), T_P = T_{P,N_ḠP}` (Definition 49); and `α_P(x) = x^p/∏_{k=0}^{p−1}ω_P^k(x)` for nontrivial cyclic `P`, where `ω_P` is a fixed character of order `p` and its twists `g ↦ ω_P(g)g` are computed after scalar extension to `𝒪[ζ_p]`, and `α_P(x) = x^p` otherwise (Definition 47). `Φ^G` is the subgroup of `∏_{P≤Ḡ} Λ_𝒪(U_P^ab)^×` of tuples `(x_P)` with `M1: nr^{P′}_P(x_{P′}) = π^{P′}_P(x_P)` whenever `[P′,P′] ≤ P ≤ P′`; `M2: (x_P)` is fixed by conjugation by `G`; `M3: ver^{P′}_P(x_{P′}) ≡ x_P mod T_{P,P′}` when `[P′ : P] = p`; `M4: α_P(x_P) ≡ ∏_{P′} ϕ(α_{P′}(x_{P′})) mod pT_P` for nontrivial cyclic `P`, over the cyclic `P′ ≠ P` with `P′^p = P`, and `x_{1}^p ≡ ϕ(x_{1})∏_{P′} ϕ(α_{P′}(x_{P′})) mod pT_{1}` over the nontrivial cyclic `P′` with `P′^p = 1`. `Φ^G_S` and `Φ̂^G_S` impose the same conditions in `∏Λ_𝒪(U_P^ab)^×_S` and `∏Λ̂_𝒪(U_P^ab)_S^×` (Definition 51). For `[P′ : P] = p` and `ω` a nontrivial character of `P′/P, nr^{P′}_P(x) = ∏_k ω^k(x)` and `tr^{P′}_P(x) = Σ_k ω^k(x)` (Lemma 50).

See Kakde, §5.2.2, Definition 51, p. 35 (arXiv v3): Definition 51 (`M1`–`M4`) with §5.2.1 `(θ^G)` and Notations 40, Definitions 47–49 and Lemma 50 (pp. 32–35). Theorem 94 restates `M4` as quotients `≡ 1`; the two forms agree.

The hypotheses are as follows. The standing hypotheses `(A)` of this layer. For `𝒪 = 𝒪₁ ⊕ ⋯ ⊕ 𝒪_n` the groups split as `⊕ Φ^G_{𝒪_i}` (Remark 54), so `𝒪` is unramified in the proofs.

*Construction.*

1. Compute the character twists over `𝒪[ζ_p]`. Their product and sum descend because they are the embedded norm and trace of the index-`p` finite free group-algebra extension. Define `α_P` over `𝒪` by `x^p` times the inverse of this embedded norm. For Lemma 50, in the basis `1, g, …, g^{p−1}` of `R[P′^ab]^τ` over `R[P/[P′,P′]]^τ`, multiplication by `x = Σ a_i g^i` is the twisted circulant matrix with rows `(a₀, …, a_{p−1}), (g^p a_{p−1}, a₀, …), …`; the vectors `(1, ω^k(g)g, …, ω^k(g^{p−1})g^{p−1})` are eigenvectors with eigenvalues `ω^k(x)`, so the determinant and trace are the product and sum.
2. `M4` is well posed: `α_C(x) ≡ 1 mod p` for nontrivial cyclic `C` (Remark 83), and `T_P` is an ideal of `Λ_𝒪(U_P)^{W_ḠP}`.

API: `thetaMap` (`θ^G_P =` abelianisation `∘` norm, `θ^G = (θ^G_P)_P`, and `θ^G_S, θ̂^G`); `alphaMap` (`α_P(x) = x^p/∏_k ω_P^k(x)` for nontrivial cyclic `P, x^p` otherwise); `traceIdeal` (`T_{P,P′}` and `T_P`, with their localised and completed versions); `Phi` (`Φ^G, Φ^G_S` and `Φ̂^G_S` as subgroups of the products (`M1`–`M4`)); `norm_eq_prod_twists` (after extension to `𝒪[ζ_p]`, with norm/trace descent and compatibility with scalar extension, Lemma 50: `nr^{P′}_P(x) = ∏_k ω^k(x)` and `tr^{P′}_P(x) = Σ_k ω^k(x)` for `[P′ : P] = p`); `Phi_directSum` (`Φ^G_{𝒪₁⊕𝒪₂} = Φ^G_{𝒪₁} ⊕ Φ^G_{𝒪₂}` (Remark 54)).

**Checks.**

- For `p=3`, `𝒪=ℤ₃` and `P=C₃`, `g↦ζ₃g` is an automorphism only after scalar extension. The product of the three twists descends to the norm over `ℤ₃`.

- `trivial_quotient`: `Ḡ = 1 (G = Z ≅ ℤ_p): C(Ḡ) = {1}, T_{1} = Λ_𝒪(Z)`, and `M4` reads `x^p ≡ ϕ(x) mod p`, which every unit satisfies (Lemma 72), so `Φ^G = Λ_𝒪(Z)^×`.
- `group_element_odd`: For `G=Γ×C_p, Z=Γ` and odd `p`, let `g` generate `C_p`. The tuple `θ([g])=(1,g)` satisfies the conditions. In `M1, nr(g)=g^p ζ_p^{p(p−1)/2}=1`; at `p=2` the corresponding norm is `−1`, which is why the odd-prime hypothesis matters.
- For `p=3`, `P=C₃`, `g³=1` and `x=1+3g`, the norm is `28` and `α_P(x)=1+(9g+27g²)/28≠1`.
- `scalar_unit_odd`: Over `ℤ_p` the scalar unit `u` has `θ([u])=(u^p,u)`. `M1` gives `nr(u)=u^p, M3` reduces to `u^p≡u mod p`, and the identity-subgroup `M4` reduces to `u^{p²}≡u^p mod p²`. Taking `u=1+p` gives a nonconstant positive control.
- `incompatible_scalar`: In the same odd-prime example the tuple `(1,1+p)` fails `M1` because `nr(1+p)=(1+p)^p≠1` in `ℤ_p`. Merely asking that each component be a unit does not define `Φ^G`.

*Needs:* [6.7](#ne6-twisted-group-ring-presentation) (The Iwasawa algebra of a one-dimensional pro-`p` group as a twisted group ring); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); Mathlib `MonoidHom.transfer`; Mathlib `Algebra.norm`; Mathlib `Algebra.trace`; Mathlib `Abelianization`.

<a id="ne6-additive-map-beta"></a>
### 6.9 The additive maps `t^G_P, η_P, β^G` and the group `ψ^G_R`

**Construction.** Let `R = Λ_𝒪(Z)` or `Λ̂_𝒪(Z)_{(p)}`. For `P ≤ Ḡ, t^G_P : R[Conj Ḡ]^τ → R[P^ab]^τ` is `t^G_P([g]) = Σ_{x∈C(Ḡ,P)} {x⁻¹gx : x⁻¹gx ∈ P}` over left coset representatives, independent of their choice. For cyclic `P, η_P : R[P]^τ → R[P]^τ` is the `R`-linear map with `η_P(h) = h` for generators `h` of `P` and 0 otherwise, For `P≠1`, after scalar extension to `𝒪[ζ_p]`, this is `η_P(x) = x − (1/p)Σ_k ω_P^k(x)`; the basis projection defines the integral map and proves the averaged sum is divisible by `p`; for `P=1` it is `η_1=id`. `β^G_P = η_P ∘ t^G_P` for cyclic `P` and `t^G_P` otherwise, and `β^G_R = (β^G_P)_P` (Definition 55). For cyclic `P, T_{P,R}` is the image of `x ↦ Σ_{g∈W_ḠP} gxg⁻¹` on `R[P]^τ, W_ḠP = N_ḠP/P` (Definition 56). `ψ^G_R ⊂ ∏_{P≤Ḡ} R[P^ab]^τ` is the group of tuples `(a_P)` with `A1`: for `[P′,P′] ≤ P ≤ P′` (and `[P′,P′] ≠ P` if `P` is nontrivial cyclic), `tr^{P′}_P(a_{P′}) = π^{P′}_P(a_P)` if `P` is not cyclic, `η_P(tr^{P′}_P(a_{P′})) = π^{P′}_P(a_P)` if `P` is cyclic and `P′` is not, and `tr^{P′}_P(a_{P′}) = 0` if `P′` is cyclic and `P<P′` (equality imposes no vanishing); `A2: (a_P)_{P∈C(Ḡ)}` is invariant under conjugation by `Ḡ`; `A3: a_P ∈ T_{P,R}` for every cyclic `P` (Definition 57). `δ = Σ_{P cyclic} δ_P : ∏_P R[P^ab]^τ → R[Conj Ḡ]^τ[1/p], δ_P(x) = [x]/[Ḡ : P]`, is a left inverse of `β^G_R` (Definition 61, Lemma 62), and `β^G_R` lands in `ψ^G_R` (Lemma 60).

See Kakde, §5.3, Definitions 55–57, p. 37 (arXiv v3): Definitions 55–57 with the map `t^G_P` (p. 36), Definition 61 and Lemmas 60, 62 (pp. 38–40). "`Cong(G)`" on pp. 36, 38, 41, 47–51 is a misprint for `Conj(G)`.

The hypotheses are as follows. The standing hypotheses `(A)` of this layer. `R[Conj Ḡ]^τ` is only an `R`-module (Remark 42).

*Construction.*

1. Lemma 60, `A1`: reindex coset representatives of `P` in `Ḡ` through `P′`. Both `tr^{P′}_P ∘ t^G_{P′}` and `π^{P′}_P ∘ t^G_P` sum the same conjugates lying in `P`, with the same multiplicities, in the common quotient. For a basis element `h` of `P′` the relative trace is `[P′:P]·h` if `h∈P` and zero otherwise, since `P` contains `[P′,P′]`. Apply `η_P` when `P` is cyclic; if `P<P′` are cyclic, `β^G_{P′}` has only generator-labelled terms and their relative traces vanish.
2. Lemma 60, `A2`: transport coset representatives, `t^G_{g₁Pg₁⁻¹}([g]) = g₁t^G_P([g])g₁⁻¹`. `A3: t^G_P = t^{N_ḠP}_P ∘ t^G_{N_ḠP}`, and `t^{N_ḠP}_P([g]) = Σ_{x∈W_ḠP} x⁻¹gx ∈ T_{P,R}` for `g ∈ P`.
3. Lemma 62: for `P = ⟨g⟩` and its conjugates `P′, δ(β([g])) = ([Ḡ : P])⁻¹ Σ_{P′}[N_ḠP′ : P′][g] = [g]`.

API: `tMap` `(t^G_P : R[Conj Ḡ]^τ → R[P^ab]^τ)`; `etaGen` (`η_P` keeps the basis elements generating the cyclic `P`. Thus `η_1=id`; the character-averaging formula is restricted to `P≠1`); `beta` `(β^G_R = (β^G_P)_P)`; `Psi` (`ψ^G_R ⊂ ∏_P R[P^ab]^τ` cut out by `A1`–`A3`); `delta` (`δ = Σ_{P cyclic} δ_P` with `δ_P(x) = [x]/[Ḡ : P]`); `delta_comp_beta` (`δ ∘ β^G_R = id` (Lemma 62)); `beta_mem_Psi` (`β^G_R` lands in `ψ^G_R` (Lemma 60)).

**Checks.**

- `trivial_quotient`: `Ḡ = 1: β^G` is the identity of `R` and `ψ^G_R = T_{1,R} = R`.
- `cyclic_p`: `Ḡ = C_p: C(Ḡ) = {1, Ḡ}, t^G_{1}(Σ r_g[g]) = p·r₁` and `β^G_Ḡ(Σ r_g[g]) = Σ_{g≠1} r_g g`; `ψ^G_R = pR × {b : b has no identity coefficient}` (`A1` for `{1} ≤ Ḡ` forces `p·b₁ = 0, A3` gives `a_{1} ∈ pR`), and `β` is the bijection onto it.
- `eta_values`: For a nontrivial cyclic `P, η_P(1)=0` and `η_P(h)=h` for a generator `h`. For `P=1`, the identity is a generator and `η_1(1)=1`. The averaging formula applies only in the nontrivial case.
- `not_multiplicative`: `β^G_R` is `R`-linear but not multiplicative, and `ψ^G_R` is only a group: for `Ḡ = C_p, β^G_{1}(1) = p` while `β^G_{1}(1·1) ≠ β^G_{1}(1)² = p²`.
- For `Ḡ=1, β=id` and `ψ=R`: imposing cyclic trace-zero also at `P=P′` would give `ψ=0` and fail this test. For `Ḡ=C_p, ψ=pR×{b with identity coefficient zero}`, which is abstractly `R^p`.

*Needs:* [6.7](#ne6-twisted-group-ring-presentation) (The Iwasawa algebra of a one-dimensional pro-`p` group as a twisted group ring); Mathlib `ConjClasses`; Mathlib `IsPrimitiveRoot.geom_sum_eq_zero`.

<a id="ne6-additive-theorem"></a>
### 6.10 Kakde's additive theorem

**Theorem.** `β^G_R` induces an isomorphism `R[Conj Ḡ]^τ ≅ ψ^G_R` (Theorem 58). Moreover `id_{ℚ_p} ⊗ β^G_R : ℚ_p ⊗ R[Conj Ḡ]^τ → ∏_P ℚ_p ⊗ R[P^ab]^τ` is injective with image the tuples satisfying `A1` and `A2`, and if `(id ⊗ β^G_R)(a) = (a_P)` with `a_P ∈ T_{P,R}` for every cyclic `P`, then `a ∈ R[Conj Ḡ]^τ` and `a_P ∈ R[P^ab]^τ` for all `P` (Proposition 64).

See Kakde, §5.3.1, Theorem 58, p. 38 (arXiv v3): Theorem 58 with Lemmas 60, 62, 63 and Proposition 64 (pp. 38–42).

The hypotheses are as follows. The standing hypotheses `(A)` of this layer.

*Proof.*

1. Lemma 63, cyclic components: `δ_P(a_P)` and `δ_{P′}(a_{P′})` can cancel only for conjugate `P, P′`, where `A2` makes them equal; so `δ((a_P)) = 0` gives `a_P = 0` for cyclic `P` (the coefficients are constant on `N_ḠP`-orbits by `A2`).
2. Lemma 63, noncyclic components: take `P′` of least order with `a_{P′} ≠ 0, h₀` in its support and a maximal `P ∋ h̃₀` of index `p`. If `P` is cyclic, `h̃₀` generates `P` (otherwise `A1` for `P^p ⋊ C_p ≤ P′`, or for `{1} ≤ P′ = P × C_p`, contradicts minimality), and `η_P(tr^{P′}_P(a_{P′})) ≠ 0 = π^{P′}_P(a_P)` contradicts `A1`; if `P` is not cyclic, the coefficient `p·a_{h₀}` of `tr^{P′}_P(a_{P′})` contradicts `A1`.
3. `δ(ψ^G_R) ⊆ R[Conj Ḡ]^τ`: by `A3` write `a_P = Σ_{x∈W_ḠP} xb_Px⁻¹`; summing `δ` over the conjugates of `P` gives `[Ḡ : P]δ_P(b_P) ∈ R[Conj Ḡ]^τ`.
4. Theorem 58: `δ ∘ β = id` (Lemma 62) and `β(R[Conj Ḡ]^τ) ⊆ ψ^G_R` (Lemma 60); `δ` injective on `ψ^G_R` gives `β ∘ δ = id` there.
5. Proposition 64 from Theorem 58 after `⊗ℚ_p`; `A2` puts `a_P` in `ℚ_p ⊗ T_{P,R}`, and `δ` recovers a from the cyclic components.

**Checks.**

- Artin's induction theorem would give injectivity after projecting to cyclic `P` (Remark 59); Kakde proves injectivity directly.
- The cyclic test of §6.9 `(Ḡ = C_p)` is an instance.

*Needs:* [6.9](#ne6-additive-map-beta) (The additive maps `t^G_P, η_P, β^G` and the group `ψ^G_R`); [6.7](#ne6-twisted-group-ring-presentation) (The Iwasawa algebra of a one-dimensional pro-`p` group as a twisted group ring).

<a id="ne6-iwasawa-algebra-logarithm"></a>
### 6.11 The `p`-adic logarithm on relative `K₁` of Iwasawa algebras

**Construction.** Let `R = Λ̂_𝒪(Z)_{(p)}` and `J_R` the Jacobson radical of the local ring `R[Ḡ]^τ`. Then `J_R/pR[Ḡ]^τ` is nilpotent (Lemma 65). For every ideal `I ⊆ J_R, Log(1 + x) = Σ_{i≥1}(−1)^{i+1}x^i/i (x ∈ I)` induces a unique homomorphism `log_I : K₁(R[Ḡ]^τ, I) → (I/[R[Ḡ]^τ, I]) ⊗_{ℤ_p} ℚ_p`; if `I ⊆ ξR[Ḡ]^τ` for a central `ξ` with `ξ^p ∈ pξR[Ḡ]^τ`, it lands in `I/[R[Ḡ]^τ, I]`, and it is an isomorphism if moreover `I^p ⊆ pIJ_R` (Proposition 67). For `Λ_𝒪(G)`, with `G_n = G/Z^{p^n}` and `F = Frac 𝒪`, the logarithms `log : K₁(𝒪[G_n]) → F[Conj G_n]` of Oliver kill torsion and pass to the limit, `log : K′₁(Λ_𝒪(G)) → lim_n F[Conj G_n] = F⟦Z⟧[Conj Ḡ]^τ`.

See Kakde, §5.4, Proposition 67, p. 46 (arXiv v3): Proposition 67 with Lemmas 65–66 (pp. 42–47), Remark 68, and the limit of finite-level logarithms (p. 47).

The hypotheses are as follows. The standing hypotheses `(A)` of this layer. `G` pro-`p`, so `R[Ḡ]^τ` is local.

*Construction.*

1. Lemma 65: over `k = 𝒪/p` there is an exact sequence `0 → J_R/p → Q(k⟦G⟧) → Q(k⟦Γ⟧) → 0`; the kernel `N` of `k⟦G⟧ → k⟦Γ⟧` is `k⟦G⟧I_H` with `I_H` nilpotent (`H` is a finite `p`-group), and by Lemma 37 the denominators can be taken central.
2. Lemma 66 (Oliver's Lemma 2.7 for twisted Iwasawa algebras): `R[Ḡ]^τ` is `J_R`-adically complete, so `Log` converges on `1 + I` into `I[1/p]` (into `I` under the `ξ`-hypothesis, since then `I^n ⊆ nI`); `Log(uv) ≡ Log u + Log v` modulo `U(I) = Σ_{m≥0,n≥1}(1/(m+n))[I^m, I^n]` by summing the coefficients of cyclically equivalent words; under `I^p ⊆ pIJ_R, Exp` converges and inverts `Log`, and `Exp([R[Ḡ]^τ, I]) ⊆ E(R[Ḡ]^τ, I)` by Vaserstein's identity `Exp(rx)Exp(xr)⁻¹ ∈ E(R[Ḡ]^τ, I)` and successive approximation through `D_k = ⟨rx − xr : rx, xr ∈ IJ_R^k⟩`.
3. Proposition 67 (Oliver's Theorem 2.8): apply Lemma 66 to `M_n(I) ⊆ M_n(R[Ḡ]^τ)`, compose with the trace `Tr_n`, note `L_n([r, u]) = Tr_n(rLog(u)r⁻¹) − Tr_n(Log u) = 0`, and pass to `K₁(R[Ḡ]^τ, I) = GL(R[Ḡ]^τ, I)/[GL(R[Ḡ]^τ), GL(R[Ḡ]^τ, I)]`.
4. The logarithm on `K′₁(Λ_𝒪(G))` is the finite-level logarithm in the limit. At finite level it kills the torsion `Det(G_n)` by ClassicalArithmeticCompletion §7.73; the rest of Oliver's finite-level input is the exact sequence `finiteIntegralLog_exact` of §6.12 and the finite Whitehead inputs of §3.11.

API: `logRel` `(log_I : K₁(R[Ḡ]^τ, I) → (I/[R[Ḡ]^τ, I]) ⊗ ℚ_p)`; `logRel_integral` (Under the `ξ`-hypothesis, `log_I` lands in `I/[R[Ḡ]^τ, I]`); `logRel_bijective` (`log_I` is an isomorphism when moreover `I^p ⊆ pIJ_R`); `log_mul_mod_commutators` (`Log(uv) ≡ Log u + Log v mod [R[Ḡ]^τ[1/p], I[1/p]]` (Lemma 66)); `logK1Prime` (`log : K′₁(Λ_𝒪(G)) → F⟦Z⟧[Conj Ḡ]^τ`, the limit of the finite-level logarithms); `log_natural` (`log` commutes with the maps induced by group homomorphisms (used in Lemma 81)).

**Checks.**

- `commutative_case`: `Ḡ = 1: [R, I] = 0` and `log_I(1 + x) = log(1 + x)` is the usual `p`-adic logarithm.
- `jacobson_nilpotent`: `G = ℤ_p × C_p, k = 𝔽_p: J_R/p` is generated by `g − 1`, and `(g − 1)^p = g^p − 1 = 0` in `k[C_p]`.
- `torsion_killed`: `log` is not injective: for `G = ℤ_p × C_p` the class of `g` has order `p` in `K′₁(Λ(G))`, so `log(g) = 0` although `g ≠ 1`.
- `bijectivity_hypothesis`: The analogue over `ℤ₂` with `I = 2ℤ₂` fails `I^p ⊆ pIJ_R (4ℤ₂ ⊄ 8ℤ₂)`, and `log(1 + 2ℤ₂) = 4ℤ₂ ≠ 2ℤ₂`; for odd `p` and `I = pℤ_p` the hypothesis holds and `log : 1 + pℤ_p ≅ pℤ_p`.
- Kakde notes (Remark 68) that for `R = Λ̂_𝒪(Z)_{(p)}` it is unclear whether `log_{J_R}` extends canonically to `K₁(R[Ḡ]^τ)`; only `log_{J_R}` is used.

*Needs:* [6.7](#ne6-twisted-group-ring-presentation) (The Iwasawa algebra of a one-dimensional pro-`p` group as a twisted group ring); §F.0 (the relative group `K₁(R, I)` and the relative elementary subgroup); Chinburg–Pappas–Taylor II, Lemmas 2.1–2.2, pp. 6–7 (`K₁(R, I)` is generated by `1 + I` for `I` in the radical); TauCetiRoadmap ClassicalArithmeticCompletion §7.73.

<a id="ne6-integral-logarithm"></a>
### 6.12 The integral logarithm on `K′₁` of Iwasawa algebras

**Construction.** Let `ϕ` be the endomorphism of `R` (Frobenius on `𝒪, p`-power map on `Z`), extended to `R[Conj Ḡ]^τ` by `[g] ↦ [g^p]` (Definition 69). Oliver–Taylor's integral logarithm `L = log − (ϕ/p)log : K′₁(𝒪[G_n]) → 𝒪[Conj G_n]` sits in an exact sequence `1 → μ(𝒪) × G_n^ab → K′₁(𝒪[G_n]) → 𝒪[Conj G_n] → G_n^ab → 1` with `ω(Σ a_g g) = ∏ g^{tr_{𝒪/ℤ_p}(a_g)}` (Oliver, Theorem 6.6); its inverse limit is `L : K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ` with `1 → μ(𝒪) × G^ab → K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ → G^ab → 1` exact (Definition 70). On the completed localisation, with `J = ker(Λ̂_𝒪(G)_S → Λ̂_𝒪(Γ)_{(p)})` and the splitting `Γ ↪ G`, every `x ∈ K′₁(Λ̂_𝒪(G)_S)` is `x =` uy with `u` in the image of `K₁(Λ̂_𝒪(G)_S, J)` and `y ∈ K′₁(Λ̂_𝒪(Γ)_{(p)})` (Lemma 71); `y^p/ϕ(y) ≡ 1 mod p` (Lemma 72); and `L(uy) = log(u) − (ϕ/p)log(u) + (1/p)log(y^p/ϕ(y))` is a homomorphism `K′₁(Λ̂_𝒪(G)_S) → Λ̂_𝒪(Z)_{(p)}[Conj Ḡ]^τ`, independent of the splitting (Definition 73, Proposition 74).

See Kakde, §5.5, Definition 70 and Proposition 74, pp. 48–49 (arXiv v3): Definitions 69–70 with the sequence (9) (p. 48), Lemmas 71–72, Definition 73 and Proposition 74 (pp. 48–50), Remark 75 (p. 51).

The hypotheses are as follows. The standing hypotheses `(A)` of this layer. `G` pro-`p`; `𝒪` unramified, so `(p)` is the maximal ideal of `𝒪`.

*Construction.*

1. Definition 70, finite level. Read `K′₁(O[G_n])` as the determinant image (§3.11). Write `O[G_n]^×=O^×·(1+I)` with `I` the augmentation ideal. ClassicalArithmeticCompletion Layer 7 supplies the integral logarithm with its character formula (§7.46), `L(1+I)⊆pφ(I)` and `L(1+A)=pφ(A)` on the commutator ideal `A` (§7.62), and `ker(L/p on Det(1+I))=Det(G_n)` (§7.73), which is `G_n^ab` because one-dimensional characters detect `G_n^ab`; its `L/p` is the `L` of this subsection. On `O^×` this `L` is `(1−F/p)log`, with kernel `μ(O)` and image `O·[1]`, because `log(O^×)=pO` and `F−p` is bijective on unramified `O`. Since `O·[1]∩φ(I)=0`, the kernel is `μ(O)×G_n^ab` and the image contains `O·[1]+φ(A)`. `ω` is onto because the trace of `O` onto `ℤ_p` is onto. The abelian image `L(1+I)=I∩ker ω` for `G_n^ab`, with `ω∘L=1`, is the abelian case of Oliver's Theorem 6.6 (as Kakde restates it, §5.5, exact sequence (9), p. 48), proved here from §§7.46 and 7.62 of ClassicalArithmeticCompletion by the character formula on the finite abelian group `G_n^ab`. Together these steps are the target `finiteIntegralLog_exact`, whose inverse limit is `iwasawaIntegralLog_exact` (step 2); surjectivity in the limit uses the compatible finite quotients and compactness, not separate lifts.
2. Definition 70, limit: the sequences (9) for `n ≥ 0` are compatible sequences of profinite groups, so the inverse limit is exact.
3. Lemma 71: `Λ̂_𝒪(G)_S` is local, so its units surject onto `K′₁` and `1 + J` onto `K₁(Λ̂_𝒪(G)_S, J)`; `1 → 1 + J → Λ̂_𝒪(G)_S^× → Λ̂_𝒪(Γ)_{(p)}^× → 1` splits by `Γ ↪ G`.
4. Lemma 72: modulo `p, Λ̂_𝒪(Γ)_{(p)}` is the Laurent series field `𝔽_q((X))`, on which `ϕ` is `X ↦ (1 + X)^p − 1 = X^p` with Frobenius on `𝔽_q`, so `y^p = ϕ(y)`.
5. Integrality: `L(1 − v) ≡ Σ_k (v^{pk} − ϕ(v^k))/(pk)` modulo the integral elements, and `pk ∣ v^{pk} − ϕ(v^k)` follows from `p^n ∣ v^{p^n} − ϕ(v^{p^{n−1}})`, proved by grouping the monomials of `v^{p^n}` into orbits under cyclic permutation (legitimate because `τ` is symmetric) and `p^t ∣ r̂^{p^t} − ϕ(r̂^{p^{t−1}})`.
6. Independence of the splitting: the finitely many splittings agree on an open `A ≤ G`; `L` is independent on the images of `K₁(Λ̂_𝒪(G)_S, J_R)` and `K₁(Λ̂_𝒪(A)_S)`, whose product has torsion cokernel in `K′₁(Λ̂_𝒪(G)_S)`, and the target is torsion free.

API: `finiteIntegralLog_exact` (the finite-level exact sequence (9)); `integralLog_compat` (the completed logarithm restricts to the integral one along `K′₁(Λ_𝒪(G)) → K′₁(Λ̂_𝒪(G)_S)`); `frobeniusPhi` (`ϕ` on `R` and on `R[Conj Ḡ]^τ, [g] ↦ [g^p]`); `integralLog` `(L : K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ)`; `omegaMap` `(ω : Λ_𝒪(Z)[Conj Ḡ]^τ → G^ab)`; `integralLog_exact` (`1 → μ(𝒪) × G^ab → K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ → G^ab → 1` is exact); `integralLogCompleted` (`L : K′₁(Λ̂_𝒪(G)_S) → Λ̂_𝒪(Z)_{(p)}[Conj Ḡ]^τ` (Definition 73)); `integralLogCompleted_indep` (Independent of the splitting `Γ ↪ G` (Proposition 74)); `integralLog_compat` (The completed `L` restricts to `L` on the image of `K′₁(Λ_𝒪(G))`).

**Checks.**

- `scalar_integrality`: `𝒪 = ℤ_p` and `v` scalar: `p^n ∣ v^{p^n} − v^{p^{n−1}}`; for `p = 3, n = 3` checked on `ℤ/27`.
- `frobenius_mod_p`: Modulo `p` the completed localization of `O[[Γ]]` at `(p)` is `F_q((T))`, where `ϕ(T)=T^p` and coefficients undergo Frobenius. In particular `T` is invertible; `F_q[[T]]` would be the wrong residue ring.
- `torsion_kernel`: For `G=Γ×C_p, L` vanishes on `G^ab`. In particular `L(γ)=0` although `γ` has infinite order. The whole kernel is not the torsion-unit subgroup.
- `not_log`: `L ≠ log`: for `Ḡ = 1, 𝒪 = ℤ_p` and `x = 1 + p` (`p` odd), `L(x) = (1 − 1/p)log(1 + p) ≠ log(1 + p)`, because `ϕ` is trivial on `ℤ_p`.
- Kakde leaves the kernel and cokernel of `L` on `K′₁(Λ̂_𝒪(G)_S)` open (Remark 75, citing Ritter–Weiss); only the homomorphism is a target here.

*Needs:* [6.11](#ne6-iwasawa-algebra-logarithm) (The `p`-adic logarithm on relative `K₁` of Iwasawa algebras); [6.7](#ne6-twisted-group-ring-presentation) (The Iwasawa algebra of a one-dimensional pro-`p` group as a twisted group ring); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); Mathlib `ZMod.expand_card`; TauCetiRoadmap ClassicalArithmeticCompletion §7.46; TauCetiRoadmap ClassicalArithmeticCompletion §7.62; TauCetiRoadmap ClassicalArithmeticCompletion §7.73.

<a id="ne6-theta-beta-relation"></a>
### 6.13 The additive and multiplicative sides: `β^G(L(x))` through `θ^G(x)`

**Theorem.** Define `v^G_P` on `∏_C F⟦Z⟧[C^ab]` by `v^G_P((x_C)) = Σ_{P′} ([P′ : P′^p]/[P : P′^p])ϕ(x_{P′})` over cyclic `P′` with `P′^p ≤ P` when `P` is not cyclic, and `Σ_{P′ ≠ P′^p = P} [P′ : P′^p]ϕ(x_{P′})` when `P` is cyclic (Definition 78); and `u^G_P` on `∏_C Λ_𝒪(U_C^ab)^×` by `u^G_P((x_C)) = ∏_{P′^p ≤ P} ϕ(x_{P′})^{|P′|}` for noncyclic `P` and `∏_{P′ ≠ P′^p = P} ϕ(x_{P′})` for cyclic `P`, over cyclic `P′` (Definition 80). Then for `x ∈ K′₁(Λ_𝒪(G)): β^G_P(L(x)) = (1/(p²|P|))log(α_P(θ^G_P(x))^{p|P|}/u^G_P(α(θ^G(x))))` for noncyclic `P`; `β^G_P(L(x)) = (1/p)log(α_P(θ^G_P(x))/u^G_P(α(θ^G(x))))` for nontrivial cyclic `P`; and `β^G_{1}(L(x)) = (1/p)log(α_{1}(θ^G_{1}(x))/(ϕ(θ^G_{1}(x))u^G_{1}(α(θ^G(x)))))` (Proposition 84); the same holds on `K′₁(Λ̂_𝒪(G)_S)`. The logarithms are defined: `α_P(θ^G_P(x))^{p|P|} ≡ u^G_P(α(θ^G(x))) mod p` for noncyclic `P` (Lemma 82), and the cyclic quotients are `≡ 1 mod p` (Remark 83).

See Kakde, §5.6, Proposition 84, p. 56 (arXiv v3): Proposition 84 with Lemmas 76, 77, 79, 81, 82, Definitions 78, 80 and Remark 83 (pp. 51–58). Schneider–Venjakob (splitting), Proposition 2.3 and proof, pp. 11–12 (arXiv v1): Proposition 2.3 continues: `K₁(Ω(H)) → K₁(Ω(N)) → K₁(Ω(H))`, the norm followed by the canonical map, is `x ↦ x^{[H:N]}`, with `Ω = 𝔽_p⟦−⟧`. This is the input to Kakde's Lemma 82.

The hypotheses are as follows. The standing hypotheses `(A)` of this layer.

*Proof.*

1. Lemma 76: `log ∘ θ^G_P = t^G_P ∘ log` (Oliver, Theorem 6.8); in the completed case from `log(u) = lim p^{−n}(u^{p^n} − 1)` and `θ̂^G_P(u) = lim (1 + t^G_P(u^{p^n} − 1))^{1/p^n}`.
2. Lemma 77: `log ∘ α_P = pη_P ∘ log` for nontrivial cyclic `P`, since `ω_P` commutes with `log` and `η_P = (1/p)(p − Σ_k ω_P^k)`.
3. Lemma 79: `β^G_P ∘ ϕ = v^G_P ∘ β^G` for `P ≠ {1}`, and `β^G_{1} ∘ ϕ = (ϕ + v^G_{1}) ∘ β^G`, by counting cosets.
4. Lemma 81: `log ∘ u^G_P = |P|·v^G_P ∘ log` for noncyclic `P` and `(1/p)·v^G_P ∘ log` for cyclic `P`, by naturality of `log`.
5. Lemma 82: modulo `p, α_C(θ^G_C(x)) ≡ 1` for nontrivial cyclic `C` and `θ^G_P(x)^{|P|} ≡ θ^G_{1}(x)`, the latter by Schneider–Venjakob, Proposition 2.3 (on `K₁(𝔽_p⟦H⟧)`, the norm to an open normal `N` followed by the inclusion is `x ↦ x^{[H:N]}`).
6. Proposition 84 by chaining Lemmas 76, 77, 79 and 81. On the completed ring write `x =` uy (Lemma 71): `u` is handled identically; for `y ∈ Λ̂_𝒪(Z)_{(p)}, θ^G_P(y) = y^{[Ḡ:P]}, α_P(θ^G_P(y)) = 1` for nontrivial cyclic `P` and `β^G_P(L(y)) = [Ḡ : P]L(y)` or 0; a general `y` has `ϕ^r(y) ∈ Λ̂_𝒪(Z)_{(p)}` and `y^{p^r}/ϕ^r(y) ≡ 1 mod p`, and the targets are torsion free.

**Checks.**

- At `Ḡ = 1` both sides are `(1/p)log(x^p/ϕ(x))`.

*Needs:* [6.12](#ne6-integral-logarithm) (The integral logarithm on `K′₁` of Iwasawa algebras); [6.11](#ne6-iwasawa-algebra-logarithm) (The `p`-adic logarithm on relative `K₁` of Iwasawa algebras); [6.9](#ne6-additive-map-beta) (The additive maps `t^G_P, η_P, β^G` and the group `ψ^G_R`); [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`).

<a id="ne6-phi-integral-log-sequence"></a>
### 6.14 The multiplicative sequence for `Φ^G`

**Lemma.** `θ^G(K′₁(Λ_𝒪(G))) ⊆ Φ^G` and `θ̂^G_S(K′₁(Λ̂_𝒪(G)_S)) ⊆ Φ̂^G_S` (Lemma 85). The map `μ(𝒪) × G^ab → ∏_P Λ_𝒪(U_P^ab)^×, (ζ,g)↦(ζ^[G:U_P]·ver^G_(U_P)(g))_P`, with the scalar norm exponent and the group transfer in each component, is injective and commutes with `θ^G` (Lemma 86). There is a surjection `ω : ψ^G → G^ab, ω_ψ=ω_A∘δ`, using the additive inverse `δ:ψ^G≅Λ_O(Z)[Conj Ḡ]^τ`, with `ω ∘ β^G = ω` (Lemma 87). The map `ℒ = (ℒ_P) : Φ^G → ψ^G`, with `ℒ_P((x_C))` given by the right-hand sides of Proposition 84 with `x_C` in place of `θ^G_C(x)`, sits in an exact sequence `1 → μ(𝒪) × G^ab → Φ^G → ψ^G → G^ab → 1` (Lemma 88).

See Kakde, §5.7, Lemmas 85–89, pp.58–65 (arXiv v3): The statement and the kernel and cokernel arguments here correct the scalar embedding and the cokernel computation of the source (corrections `E21`–`E22`). Schneider–Venjakob (after Kakde), §4, Lemmas 4.7–4.9, pp. 26–30: The abelianized logarithm, torsion-free quotient and trace-rigidity proof provide the replacement route. Their `α_Z=x_Z^p/ϕ(x_Z)` absorbs the extra central factor that Kakde writes separately; their untruncated top map must not be identified with cyclic `β_Ḡ`. Its noncyclic kernel proof drops the central factor and makes a false intermediate torsion claim (correction `E37`); the argument here retains `φ(x_1)^p` and uses the torsion-free quotient instead.

The hypotheses are as follows. The standing hypotheses `(A)` of this layer.

*Proof.*

1. Lemma 85, `M1`: the norm to `U_P` equals the norm to `U_{P′}` followed by `nr^{P′}_P` after abelianising, because the bases agree. `M2`: the norm is conjugation-equivariant.
2. Lemma 85, `M3`: write `x = Σ x_k g^k` over `Λ_𝒪(U_P)` for `g ∈ U_{P′} ∖ U_P`; the norm is the determinant of the twisted circulant matrix, whose terms not fixed by `σ =` conjugation by `g` cancel modulo `T_{P,P′}`, and `Σ_h a_h^p ∏_k σ^k(h) ≡ Σ_h ϕ(a_h)∏_k σ^k(h) = ver^{P′}_P` modulo `T_{P,P′}`.
3. Lemma 85, `M4`: by Proposition 84 and Lemma 60, `pβ^G_P(L(x)) = log(α_P(θ^G_P(x))/u^G_P(α(θ^G(x)))) ∈ pT_P`, and `log : 1 + pT_P ≅ pT_P`.
4. Lemma 89: if `C^p ⊆ P′` but `C^p ⊄ P` with `[P′ : P] = p`, then `nr^{P′}_P(ϕ(α_C(x_C))) = 1`, by Lemma 50.
5. `ℒ` lands in `ψ^G: A1` by cases (`P` not cyclic; `P` cyclic and `P′` not, using `α_P(ϕ(α_C(x_C))) = 1` unless `C^p = P`; `P′` cyclic by Lemma 89) from `M1`; `A2` and `A3` from `M2` and `M4`; integrality from Proposition 64.
6. Correct the first map to `θ∘ι`: the component of a scalar `ζ` is `ζ^[G:U_P]`, since a scalar acts on a free module of that rank; the group component is the ordinary transfer. The top component identifies `μ(O)×G^ab` inside `Λ_O(G^ab)^×`, proving injectivity. The other end is `ω_ψ=ω_Aδ` and is surjective because `ω_A` is surjective and `δ` is the inverse additive isomorphism.
7. Kernel, cyclic components: `log` is injective on `1+pΛ_O(U_P)`, since `p` is odd. Descend from maximal nontrivial cyclic `P` in the defining `ℒ` equations to obtain `α_P(x_P)=1` for every nontrivial cyclic `P`. At `P=1` obtain `x_1^p=ϕ(x_1)`, not `α_1(x_1)=1`. The integral logarithm for the abelian group `Z` therefore gives `x_1∈μ(O)×Z`. For successive nontrivial cyclic `P, M1` and `α_P=1` give `x_P^p=x_(P^p)`, viewed by inclusion, hence `x_P^{|P|}=x_1`.
8. Kernel, finite-level input and limit: for each abelian `A=U_P^ab` and finite quotient `A_n=A/image(Z^{p^n})`, ClassicalArithmeticCompletion §7.73 (kernel `Det(A_n)` on `1+I`) and the scalar computation in §6.12 identify the kernel with `μ(O)×A_n`. Compatibility and compactness give `ker L_A=μ(O)×A`. Since the additive target of `L_A` is `ℤ_p`-torsion-free, `Λ_O(A)^×/(μ(O)×A)` is torsion-free. The cyclic power relation puts `x_P` in `μ(O)×U_P`. For noncyclic `P` its defining equation gives `x_P^{p²|P|}=ϕ(x_1)^p` after all nontrivial `α_C` have become 1, and gives `x_P∈μ(O)×U_P^ab` by the same torsion-free quotient argument. This uses the finite integral logarithm of TauCetiRoadmap ClassicalArithmeticCompletion Layer 7, not a torsion-unit assertion about completed group units.
9. Kernel, trace rigidity: along any index-`p` inclusion `P≤P′`, write `x_P=ξh` and `x_(P′)=ζg`. `M3` compares `ξh` with `ζ^p ver(g)`. In every finite quotient `U_P^ab`/`image(Z^{p^n})`, augmentation and distinct Teichmüller residues imply `ξ=ζ^p`. The difference of the two remaining basis units is invariant under `P′/P`. Its support has at most two elements, so odd `p` makes each element fixed individually; coefficients on fixed elements in an index-`p` trace are divisible by `p`. Thus the difference is zero. Passing through the finite quotients proves `x_P=ζ^p ver(g)` exactly. An index-`p` subgroup chain from `Ḡ` to `P` recovers `θ∘ι` of `x_Ḡ`, with the scalar exponent `[Ḡ:P]`.
10. Cokernel, untruncated abelianization: let `π_ab` be the projection of the additive conjugacy module to `Λ_O(G^ab)`. Prove `π_abδℒ(x)=L_(G^ab)(x_Ḡ)`. If `Ḡ` is cyclic, `M1` identifies `x` with `θ(x_Ḡ)`, and `δℒθ=δβL=L`. In particular do not replace `δ` by the generator-truncated top `β` component.
11. Cokernel, noncyclic calculation: work in `ℚ_p⊗Λ_O(G^ab)`, put `m=|Ḡ|, A_C=log α_C(x_C)` for cyclic `C (A_1=p log x_1)`, and `U=Σ_(C cyclic)|C|ϕ(A_C)`. Since `a∈ψ` and `Ḡ` is noncyclic, its top `β` component is untruncated and equals `π_abδa`. The additive inverse gives `π_abδa=m⁻¹Σ_(C cyclic)|C|a_C`. For `a=ℒ(x)`, substitution yields `(pΣ|C|A_C−U)/(p²m)`; the untruncated top component is `log x_Ḡ−U/(p²m)`. Equality of these two expressions forces `Σ|C|A_C=pm log x_Ḡ`; applying `ϕ` gives `U=pmϕ(log x_Ḡ)`. Thus `π_abδℒ(x)=log x_Ḡ−ϕ(log x_Ḡ)/p`. Here `log` denotes the rational logarithm of the preceding logarithm construction; no unsupported power-series logarithm of an arbitrary unit is introduced.
12. Exactness at `ψ: ω_A` factors through `π_ab` and `ω_(G^ab)L_(G^ab)=1`, so `ω_Aδℒ=1`. Conversely, if `ω_Aδa=1`, the integral-`log` exact sequence gives `z∈K′₁(Λ_O(G))` with `Lz=δa`. Then `ℒθz=βLz=a`. Products of coefficient domains take products of this entire argument. The five-lemma ladder of §6.15 uses these maps and this kernel and cokernel computation.

**Checks.**

- For `p=3` and `O` unramified of degree 2, let `ζ` have Teichmüller order 8. A rank-3 norm sends `ζ` to `ζ³≠ζ`; the scalar embedding cannot be the identity in every component.
- For `G=Γ, Z=Γ^p` and `a=z=γ^p, β_(C_p)(a)=0` while `ω_A(a)=z`. Recovering `ω` from only `a_(C_p)` is false; `ω_Aδ` retains it.
- The kernel contains `γ` of infinite order. For `O=∏_i O_i` take `∏_i(μ(O_i)×G^ab)`, not `μ(O)×`a single `G^ab`.
- At a noncyclic `P, ker ℒ` gives a power of `x_P` in `μ(O)×U_P^ab`; it need not make `x_P` torsion. The torsion-free quotient supplied by the integral logarithm is the inference required here.

*Needs:* [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`); [6.13](#ne6-theta-beta-relation) (The additive and multiplicative sides: `β^G(L(x))` through `θ^G(x)`); [6.10](#ne6-additive-theorem) (Kakde's additive theorem); [6.12](#ne6-integral-logarithm) (The integral logarithm on `K′₁` of Iwasawa algebras); TauCetiRoadmap ClassicalArithmeticCompletion §7.73.

<a id="ne6-main-algebraic-theorems"></a>
### 6.15 Kakde's congruence description of `K′₁`

**Theorem.** Let `G` be a one-dimensional pro-`p p`-adic Lie group with `G/H ≅ ℤ_p, Z ≤ G` central open pro-cyclic, `Ḡ = G/Z`, and `𝒪` the integers of a finite unramified extension of `ℚ_p` or a finite direct sum of such rings. Then `θ^G` induces an isomorphism `K′₁(Λ_𝒪(G)) ≅ Φ^G` (Theorem 52); `θ^G_S` maps `K′₁(Λ_𝒪(G)_S)` into `Φ^G_S`, and `Φ^G_S ∩ ∏_{P≤Ḡ} Λ_𝒪(U_P^ab)^× = θ^G(K′₁(Λ_𝒪(G)))` (Theorem 53).

See Kakde, §5.2.3, Theorems 52–53, p. 36 (arXiv v3); proofs p. 65: Theorems 52 and 53 (p. 36) with their proofs (p. 65).

The hypotheses are as follows. The standing hypotheses `(A)` of this layer.

*Proof.*

1. Reduce to `𝒪` unramified over `ℤ_p` (Remark 54).
2. Theorem 52: the five lemma on the ladder `μ(𝒪) × G^ab → K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ → G^ab` (§6.12) over `μ(𝒪) × G^ab → Φ^G → ψ^G → G^ab` (§6.14), with `θ^G, β^G` (an isomorphism by §6.10) and the identities as vertical maps; the squares commute by Lemmas 86–87 and `ℒ ∘ θ^G = β^G ∘ L` (§6.13).
3. Theorem 53: `θ^G_S` lands in `Φ̂^G_S ∩ ∏Λ_𝒪(U_P^ab)^×_S = Φ^G_S` (Lemma 85 on the completed ring), and `Φ^G_S ∩ ∏Λ_𝒪(U_P^ab)^× = Φ^G`, which is `θ^G(K′₁(Λ_𝒪(G)))` by Theorem 52.

**Checks.**

- The theorem is for `G` pro-`p` of dimension one and `𝒪` unramified. The general one-dimensional `G` reaches this case through §6.6, with `𝒪 = ℤ_p[Δ] ≅ ⊕_χ 𝒪_χ`.
- For `Ḡ = 1, Φ^G = Λ_𝒪(Z)^× = K′₁(Λ_𝒪(Z))` (§6.8, `trivial_quotient`).

*Needs:* [6.14](#ne6-phi-integral-log-sequence) (The multiplicative sequence for `Φ^G`); [6.10](#ne6-additive-theorem) (Kakde's additive theorem); [6.13](#ne6-theta-beta-relation) (The additive and multiplicative sides: `β^G(L(x))` through `θ^G(x)`); [6.12](#ne6-integral-logarithm) (The integral logarithm on `K′₁` of Iwasawa algebras); [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras).

<a id="ne6-k1-injects-localisation"></a>
### 6.16 `K′₁(Λ_𝒪(G))` injects into `K′₁(Λ_𝒪(G)_S)`

**Theorem.** Let `G` be a compact `p`-adic Lie group with a quotient `G/H ≅ ℤ_p`, and `𝒪` the ring of integers of a finite unramified extension of `ℚ_p`. Then the map `K′₁(Λ_𝒪(G)) → K′₁(Λ_𝒪(G)_S)` is injective (Corollary 90).

See Kakde, §5.7, Corollary 90, p. 65 (arXiv v3): Corollary 90, stated after the proofs of Theorems 52–53; no proof is printed.

The hypotheses are as follows. `G` compact `p`-adic Lie with `G/H ≅ ℤ_p`; `𝒪` unramified. `p` is odd.

*Proof.*

1. `G` pro-`p` of dimension one: `θ^G_S` composed with `K′₁(Λ_𝒪(G)) → K′₁(Λ_𝒪(G)_S)` is `θ^G` followed by the injection `∏Λ_𝒪(U_P^ab)^× ↪ ∏Λ_𝒪(U_P^ab)^×_S`, and `θ^G` is injective (Theorem 52).
2. `G` of dimension one: §6.4, §6.5 and §6.6 each carry the injectivity of `K′₁ → K′₁` of the localisation from their subquotients to `G`; they end at `Δ × G_p` with `𝒪[Δ] ≅ ⊕_χ 𝒪_χ` unramified, which is the pro-`p` case.
3. Arbitrary dimension: if `x ↦ 1` in `K′₁(Λ_𝒪(G)_S)`, then for every open `U ≤ H` normal in `G` and pro-`p` its image in `K′₁(Λ_𝒪(G/U)_S)` is 1, hence its image in `K′₁(Λ_𝒪(G/U))` is 1 by the dimension-one case, and `x = 1` because `K′₁(Λ_𝒪(G)) ≅ lim_U K′₁(Λ_𝒪(G/U))` (§3.11, Corollary 20).

**Checks.**

- The source states the corollary without proof (p. 65); the proof above supplies it. It runs the reductions of Kakde §4 with `𝒪 = ℤ_p`, as printed; a larger unramified `𝒪` needs the same reductions over `𝒪`, which are part of this target.

*Needs:* [6.15](#ne6-main-algebraic-theorems) (Kakde's congruence description of `K′₁`); [6.4](#ne6-reduction-to-qp-elementary) (Reduction to `ℚ_p`-elementary Galois groups); [6.5](#ne6-l-elementary-case) (The `l-ℚ_p`-elementary case, `l ≠ p`); [6.6](#ne6-reduction-to-p-elementary) (Reduction of the `p-ℚ_p`-elementary case to `Δ ×` pro-`p`); [3.11](#ne3-k1-prime) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); [1.7](#ne1-canonical-ore-theorem) (The canonical Ore set theorem).

<a id="ne6-main-conjecture-congruence-criterion"></a>
### 6.17 The main conjecture as congruences between abelian zeta functions

**Theorem.** Let `F_∞/F` be admissible with `μ = 0` and `Gal(F_∞/F) = Δ × G`, with `Δ` cyclic of order prime to `p` and `G` a one-dimensional pro-`p p`-adic Lie group; fix `Z ≤ G` central open pro-cyclic, `Ḡ = G/Z`. For `P ≤ Ḡ` put `F_P = F_∞^{Δ×U_P}` and `K_P = F_∞^{[U_P,U_P]}`, so that `Gal(K_P/F_P) = Δ × U_P^ab`, and let `ζ_P ∈ Λ(Δ × U_P^ab)^×_S` be the Deligne–Ribet (Cassou-Noguès, Barsky) `p`-adic zeta function of `K_P/F_P` (Notations 91). Then `MC(F_∞/F)` holds if and only if `(ζ_P)_P ∈ Φ^G_S`, where `Φ^G_S = Φ^G_{ℤ_p[Δ],S}` (Proposition 93). Every irreducible Artin representation `ρ` of `G` has a one-dimensional `χ` inflated from `Γ` with `ρ ⊗ χ` trivial on `Z` (Lemma 92).

See Kakde, §6.1, Proposition 93, pp. 66–67 (arXiv v3): Notations 91, Lemma 92 and Proposition 93 with its proof (pp. 66–67), and the statement of Theorem 94 (p. 67).

The hypotheses are as follows. `F_∞/F` admissible, `μ = 0, p` odd; `Gal(F_∞/F) = Δ × G` as stated.

*Proof.*

1. Lemma 92. `Z` is central, so by Schur's lemma `ρ(z)` is a scalar `χ_Z(z)` for `z ∈ Z`, and `χ_Z` has finite order because `ρ` has finite image. `Z ≅ ℤ_p` meets the finite group `H` trivially, so it maps isomorphically onto an open subgroup of `Γ`, and `χ_Z` extends to a character `χ′` of `Γ` (the `p`-power roots of unity form a divisible group); `χ = χ′⁻¹`, inflated to `G`, works. Kakde proves the lemma by induction on `|G/Z|` through Clifford's dichotomy; with `Z` central the direct argument suffices.
2. If: take `f ∈ K′₁(Λ(Δ × G)_S)` with `∂f = −[C(F_∞/F)]` (§2.15). By Theorem 53, `θ_S(f) = (f_P) ∈ Φ^G_S`. Since `∂ζ_P = ∂f_P = −[C(K_P/F_P)]` (§6.1 and base change of `C`), `u_P = ζ_Pf_P^{−1}` lies in `K′₁(Λ(Δ × U_P^ab))`, and `(u_P) ∈ Φ^G_S ∩ ∏Λ(Δ × U_P^ab)^× = θ(K′₁(Λ(Δ × G)))` (Theorem 53); with `θ(u) = (u_P)` (Theorem 52), `ζ = uf` has `∂ζ = −[C(F_∞/F)]`.
3. Interpolation: for irreducible `ρ` choose `σ` by Lemma 92, so `ρ ⊗ σ` factors through the `p`-group `Ḡ` and equals `Ind_{U_P}^G η` for some `P ≤ Ḡ` and a character `η` of `U_P`, by `pGroup_monomial`: every irreducible representation of a finite `p`-group over an algebraically closed field of characteristic zero is induced from a one-dimensional character of a subgroup (Serre, Theorem 16, for supersolvable groups). Its proof is owned here, since InductionRestriction does not state it. Induct on the order of the image `Q` of the representation. If `Q` is abelian the representation is one-dimensional. Otherwise pick `x` in the second centre of `Q` but not in its centre `Z(Q)`; `A = ⟨Z(Q), x⟩` is abelian and normal, because `[Q, x] ⊆ Z(Q)`, and not central. So the restriction to `A` is not isotypic: an isotypic representation of an abelian group is scalar, and a faithful representation of `Q` is scalar only on `Z(Q)`. By `clifford_isotypic_or_induced` (Serre, Proposition 24, from Clifford's theorem and the Clifford correspondence of InductionRestriction Layer 5: the stabilizer of one isotypic component of the restriction is a proper subgroup containing `A`, and the representation is induced from that component), the representation is induced from an irreducible representation of a proper subgroup, to which the induction hypothesis applies; induction is transitive. then `ρ = Ind_{U_P}^G(η ⊗ σ^{−1})` and `ζ(χρκ^r) = ζ_P(χησ^{−1}κ^r_{F_P}) = L_{Σ_P}(χησ^{−1}, 1 − r) = L_Σ(χρ, 1 − r)` by inductivity of Artin `L`-functions.
4. Only if (not printed): if `ζ` satisfies MC, the components of `θ_S(ζ)` interpolate the same values as the `ζ_P`, hence equal them, so `(ζ_P) = θ_S(ζ) ∈ Φ^G_S` by Theorem 53.

**Checks.**

- The source proves the 'if' direction; the converse (step 4) is part of this target.
- This is §6.2 with `Φ = Φ^G, Φ_S = Φ^G_S` and the pairs `(U_P, [U_P, U_P])`.
- The §6.33 target reduces MC to `M1`–`M4`. The §6.18, §6.25 and §6.32 targets supply the four conditions.

*Needs:* [6.15](#ne6-main-algebraic-theorems) (Kakde's congruence description of `K′₁`); [6.2](#ne6-burns-kato-patching) (The Burns–Kato patching principle); [6.1](#ne6-abelian-case) (The main conjecture for abelian `×` prime-to-`p` Galois groups); [5.5](#ne5-totally-real-main-conjecture) (The main conjecture for totally real fields); [2.15](#ne2-boundary-surjective-p-torsion) (Surjectivity of `∂` for every compact `p`-adic Lie group); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [4.5](#ne4-totally-real-iwasawa-complex) (The complex `C(F_∞/F)`); [6.1](#ne6-abelian-case) (step 0, Deligne–Ribet functions); the Dedekind complex-germ comparison in Exact supplier contracts; RepresentationTheory`/`InductionRestriction Layer 5 (Clifford theory).

<a id="ne6-zeta-tuple-m1-m2"></a>
### 6.18 The abelian zeta functions satisfy `M1` and `M2`

**Lemma.** In the setting of §6.17, the tuple `(ζ_P)_P` satisfies `M1: nr^{P′}_P(ζ_{P′}) = π^{P′}_P(ζ_P)` in `Λ(Δ × U_P/[U_{P′}, U_{P′}])_S` whenever `[P′, P′] ≤ P ≤ P′`; and `M2: gζ_Pg^{−1} = ζ_{gPg^{−1}}` in `Λ(Δ × U_{gPg^{−1}}^ab)_S` for every `g ∈ G` (Proposition 95).

See Kakde, §6.1, Proposition 95, pp. 67–68 (arXiv v3): Proposition 95 and its proof (pp. 67–68).

The hypotheses are as follows. As in §6.17. `p` is odd.

*Proof.*

1. `M1`: for an irreducible Artin representation `ρ` of `U_P/[U_{P′}, U_{P′}]`, a character `χ` of `Δ` and `r` divisible by `[F_∞(μ_p) : F_∞], nr^{P′}_P(ζ_{P′})(χρκ^r) = ζ_{P′}(χ Ind_{U_P}^{U_{P′}}(ρ)κ^r) = L_{Σ_{P′}}(χ Ind ρ, 1 − r) = L_{Σ_P}(χρ, 1 − r) = π^{P′}_P(ζ_P)(χρκ^r)`.
2. Two elements of the abelian `Λ(Δ × U_P/[U_{P′}, U_{P′}])_S` interpolating the same values on this dense set of characters are equal.
3. `M2: (gζ_Pg^{−1})(χρκ^r) = ζ_P(χ gρg^{−1} κ^r) = L_Σ(χ Ind_{U_P}^G(gρg^{−1}), 1 − r)` and `ζ_{gPg^{−1}}(χρκ^r) = L_Σ(χ Ind_{U_{gPg^{−1}}}^G ρ, 1 − r)`, and the two induced representations agree.

**Checks.**

- Conjugate subgroups have conjugate fixed fields and the same normalized partial-zeta values after transport. Dropping conjugation invariance would allow unrelated components that fail `M2`.

- For a tower of abelian extensions, applying two quotient maps equals their composite on every interpolated character value; `M1` must use the norm in one direction and the quotient projection in the other.

- `M3` is the index-`p` case of the full Möbius congruence. `M4` is supplied by the independent completed construction and canonical descent; no claim about validity of Kakde v3 (12) is required.

*Needs:* [6.17](#ne6-main-conjecture-congruence-criterion) (The main conjecture as congruences between abelian zeta functions); [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`); [6.1](#ne6-abelian-case) (The main conjecture for abelian `×` prime-to-`p` Galois groups); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [6.1](#ne6-abelian-case) (step 0`(a)`, Artin `L`-values and inductivity); the Dedekind complex-germ comparison in Exact supplier contracts.

<a id="ne6-partial-zeta-values"></a>
### 6.19 Partial zeta values and the smoothed values `Δ^u_P`

**Definition.** For `j ≥ 0` and a coset `x` of `Z^{p^j}` in `Δ × U_P^ab, δ(x)` is its characteristic function and `ζ(δ(x), s) = Σ_𝔞 δ(x)(g_𝔞)N𝔞^{−s}` (`Re s > 1`, over integral ideals `𝔞` of `F_P` prime to `Σ_P, g_𝔞` the Artin symbol) is the partial zeta function; by Klingen and Siegel it continues meromorphically with a simple pole at `s = 1` only, and `ζ(δ(x), 1 − k) ∈ ℚ` for even `k ≥ 2`. For a locally constant `ε = Σ ε(x)δ(x)` with values in a `ℚ`-vector space `V, L_{Σ_P}(ε, 1 − k) = Σ_x ε(x)ζ(δ(x), 1 − k) ∈ V` (15); for a degree-one Artin character it is the `Σ_P`-truncated `L`-value. For `ε` locally constant `ℚ_p`-valued, `u ∈ U_P^ab` and `k` divisible by `[F_∞(μ_p) : F_∞], Δ^u_P(ε, 1 − k) = L_{Σ_P}(ε, 1 − k) − κ(u)^k L_{Σ_P}(ε_u, 1 − k)` with `ε_u(g) = ε(ug)` (16). These values are invariant under conjugation: `Δ^u_P(δ(y), 1 − k) = Δ^u_{gPg^{−1}}(δ(gyg^{−1}), 1 − k)` for `u ∈ Z, g ∈ G` (Lemma 103).

See Kakde, §6.3, (15)–(16), pp. 69–70, and Lemma 103, p. 73 (arXiv v3): The definitions (15) and (16) of §6.3 and Lemma 103 of §6.5.

The hypotheses are as follows. The standing hypotheses `(B)` of this layer.

*Construction.*

1. `L_{Σ_P}(ε, 1 − k)` is well defined: refining `j` splits `δ(x)` into the `δ` of its sub-cosets, and `ζ` is additive in `δ`.
2. Lemma 103: for `Re s > 1, ζ(δ(gyg^{−1}), s) = Σ_𝔞 δ(y)(g_{𝔞^g})N(𝔞^g)^{−s} = ζ(δ(y), s)` by reindexing `𝔞 ↦ 𝔞^g`, and meromorphic continuation carries the equality to `s = 1 − k`; `δ(y)_u = δ(u^{−1}y)` and `u ∈ Z` is central.

API: `partialZeta` (`ζ(δ(x), s)` for a coset `x` of `Z^{p^j}`); `sigmaLValue` (`L_{Σ_P}(ε, 1 − k)` for locally constant `ε` with values in a `ℚ`-vector space); `sigmaLValue_linear` (`ε ↦ L_{Σ_P}(ε, 1 − k)` is `ℚ`-linear and compatible with refining `j`); `smoothedValue` `(Δ^u_P(ε, 1 − k) = L(ε, 1 − k) − κ(u)^k L(ε_u, 1 − k))`; `smoothedValue_conj` (Lemma 103: invariance under conjugation by `G`); `sigmaLValue_character` (For a degree-one Artin character, the `Σ_P`-truncated `L`-value at `1 − k`).

**Checks.**

- `rational_value`: `F_P = ℚ, Σ = {3}, ε = 1` and `k = 2: L_Σ(1, −1) = (1 − 3)ζ(−1) = (−2)(−1/12) = 1/6`.
- `zero_function`: `ε ≡ 0` gives `L_{Σ_P}(0, 1 − k) = 0`.
- `trivial_u`: `u = 1: κ(1) = 1` and `ε_1 = ε`, so `Δ^1_P(ε, 1 − k) = 0`; the smoothing needs `u` of infinite order.
- `odd_k`: For `F_P = ℚ` and odd `k ≥ 3, ζ(1 − k) = 0`; the construction uses `k` divisible by `[F_∞(μ_p) : F_∞]`, which is even.
- The Klingen–Siegel rationality and continuation are §6.1, step 0`(a)`–`(b)`.

*Needs:* [6.17](#ne6-main-conjecture-congruence-criterion) (The main conjecture as congruences between abelian zeta functions); [6.1](#ne6-abelian-case) (step 0`(a)`–`(b)`).

<a id="ne6-deligne-ribet-approximation"></a>
### 6.20 Finite-level approximations of the abelian zeta functions

**Lemma.** Let `f` be such that `κ^{p−1}(Z) = 1 + p^fℤ_p`. For `P` normal in `P′` let `T_{P,P′,j}` be the image of `x ↦ Σ_{g∈P′/P} gxg^{−1}` on `ℤ_p[Δ × U_P^ab/Z^{p^j}]/(p^{f+j}), T_{P,j} = T_{P,N_ḠP,j}` (Definition 100). Then `Λ(Δ × U_P^ab) ≅ lim_j ℤ_p[Δ × U_P^ab/Z^{p^j}]/(p^{f+j})`, and `T_{P,P′} ≅ lim_j T_{P,P′,j}` (Lemma 101). For `u ∈ U_P^ab, j ≥ 0` and `k` divisible by `[F_∞(μ_p) : F_∞]`, the image of `(1 − u)ζ_P` in `ℤ_p[Δ × U_P^ab/Z^{p^j}]/(p^{f+j})` is `Σ_x Δ^u_P(δ(x), 1 − k)κ(x)^{−k}x mod p^{f+j}`; in particular the limit does not depend on `k` (Proposition 102, attributed to Ritter–Weiss).

See Kakde, §6.4, Definition 100, Lemma 101 and Proposition 102, pp. 70–73 (arXiv v3): Definition 100, Lemma 101 and Proposition 102 with its three-step proof.

The hypotheses are as follows. The standing hypotheses `(B)` of this layer.

*Proof.*

1. Lemma 101: a compatible family `(x_j)` lifts canonically — for `t ≥ j` the images of `x_t` in `ℤ_p[Δ × U^ab/Z^{p^j}]/(p^{f+t})` converge to `x̃_j` — and the `x̃_j` form an element of the limit; for `T_{P,P′}` pass to the limit in `0 → ker(tr_{P,P′,j}) → ℤ_p[…]/(p^{f+j}) → T_{P,P′,j} → 0`, exact on the right because the groups are finite.
2. Step 1: the sums form an inverse system, since `κ(x)^k ≡ κ(y)^k mod p^{f+j}` when `x ↦ y`.
3. Step 2: independence of `k` is congruence (17), `Δ^u_P(δ(x), 1 − k)κ(x)^{−k} ≡ Δ^u_P(δ(x), 1 − k′)κ(x)^{−k′} mod p^{f+j}`; with `η` locally constant, `η^{[F_∞(μ_p):F_∞]} ≡ κ^{[F_∞(μ_p):F_∞]} mod p^{f+j}`, and `ε_k = p^{−f−j}η^{−k}δ(x)`, the function `ε_kκ^{k−1} − ε_{k′}κ^{k′−1}` is `ℤ_p`-valued, so Deligne–Ribet Theorem 0.4 applies.
4. Step `3: ζ_u = lim_j(Σ_x Δ^u_P(δ(x), 1 − k)κ(x)^{−k}x)` satisfies `ζ_u(κ^kε) = Δ^u_P(ε, 1 − k) = (1 − u)ζ_P(κ^kε)` for all locally constant `ε`, by the Deligne–Ribet construction of `ζ_P`; so `(1 − u)ζ_P = ζ_u`.

**Checks.**

- The Deligne–Ribet congruences (their Theorem 0.4) and the interpolation property of `ζ_P` are §6.1, step 0`(d)`–`(e)`.
- For `u = 1` both sides vanish: `(1 − 1)ζ_P = 0` and `Δ^1_P = 0` (§6.19, `trivial_u`).

*Needs:* [6.19](#ne6-partial-zeta-values) (Partial zeta values and the smoothed values `Δ^u_P`); [6.1](#ne6-abelian-case) (The main conjecture for abelian `×` prime-to-`p` Galois groups).

<a id="ne6-basic-congruence-reduction"></a>
### 6.21 Smoothed Möbius values and trace ideals

**Lemma.** In the finite-extension setting of §6.24, let `λ̃_F=2^{−[F:Q]}λ_{F,S}`. Fix `g` first. If its smoothed value congruences hold for that same `g` for every even locally constant `ε`, then the image of `s_g=Σ_F μ_Σ(Σ_F) ver_F^L((1−g_F)λ̃_F)` in `ℤ_p[[H_S^+]]` lies in `tr_Σ(ℤ_p[[H_S^+]])`. Here `H_S^+` is the maximal totally real quotient of `H_S`. This is an implication from the explicit stabilizer-modulus congruences, not from Kakde's list (18), (22), (24), (28), (29).

See Ritter–Weiss, Congruences II, §1, Proposition 4 and its full coefficient argument, pp.5–6: The value modulus is exactly the finite permutation-module trace modulus.

The hypotheses are as follows. `p` odd; finite totally real `p`-extension `L/K`; same `S`, transfers, Möbius coefficients, normalization and `g_F` as in §6.24. The Deligne–Ribet finite-level approximation of each smoothed pseudomeasure holds. The quantifier is one fixed `g` for all `ε`; §6.24 constructs such a `g`, independent of `ε, k` and the conductor.

*Proof.*

1. Choose cofinal admissible `Σ`-stable finite quotients `H_S/V`, with `V` containing complex conjugations and with cyclotomic precision exceeding all `[L:F]` exponents plus `v_p(|Σ|)`. The transfer kernels are included before taking a finite quotient; no injectivity of a global transfer is assumed.
2. The coefficient of `y` is `c_y=N_L(y)^{−k} Σ_F μ_Σ(Σ_F) Δ̃_{g_F}(1−[L:F]k, δ_y∘ver_F^L)`, using `N_F(x)^{[L:F]}=N_L(ver_F^L x)`. If `y` is not in the image of a transfer the corresponding function is zero.
3. Conjugation carries the term for `F` to the term for its conjugate, so `s_g` is `Σ`-invariant. Apply the value congruence to `δ_y`, which is even on this quotient, to obtain `c_y` divisible by `|St_Σ(y)|`. An invariant element in a finite permutation group ring is a trace precisely when its orbit coefficient is divisible by that stabilizer order.
4. The approximation initially gives this assertion modulo a power of `p` at least `|Σ|`. The residual invariant multiple of `|Σ|` is also a trace. Pass to the inverse limit of the finite trace images; compactness of the integral group rings supplies compatible trace preimages.

**Checks.**

- For `Σ=C_p` and a fixed `y`, trace membership demands coefficient divisibility by `p`; for a free orbit it only demands constant coefficients on the orbit.
- The factor `2^{−[F:Q]}` is retained until its Möbius-weighted removal in §6.25; it is not removed termwise by an unsupported equality.
- The statements `∀ε ∃g` and `∃g ∀ε` cannot be interchanged. Compactness of trace preimages applies after `g` has been fixed; it does not supply a common `g` from conductor-dependent choices, which is why §6.24 uses a cusp independent of the conductor.

*Needs:* [6.20](#ne6-deligne-ribet-approximation) (Finite-level approximations of the abelian zeta functions); [6.19](#ne6-partial-zeta-values) (Partial zeta values and the smoothed values `Δ^u_P`).

<a id="ne6-hilbert-eisenstein-toolkit"></a>
### 6.22 Restriction and Hecke comparison for smoothed constant terms

**Lemma.** For totally real `L′⊇L` of relative degree `r′` and the Hilbert modular forms of §F.5, diagonal restriction `R_{L′/L}` maps `M_k(Γ₀₀(𝔣O_{L′}))` to `M_{r′k}(Γ₀₀(𝔣))`, with `c(μ,Rf)=Σ_{tr(ν)=μ}c(ν,f)`, and carries the constant term at `α` to that at `α*` (Kakde Lemma 109). For totally positive `β∈O_L` with `𝔣⊆βO_L`, the operator `U_β` satisfies `c(μ,f|U_β)=c(μβ,f)` (Lemma 110). Applying these comparisons to the Eisenstein series and `q`-expansion principle of §6.1, step 0`(c)`, gives `c(0,G_{k,ε})−N(α_p)^(−k)c(0,α,G_{k,ε})=2^(−[L:Q])Δ^u(ε,1−k)` when `α` has Artin symbol `u` (Remark 112). Moreover (target `hilbertU_commutes_unitCusp`): if `γ ∈ Ô_L^×` is a unit idele and `β | 𝔣`, then `f|U_β` and `f` have the same constant term at the cusp determined by `γ`, for every `f ∈ M_k(Γ₀₀(𝔣))`. The new targets are the restriction and Hecke comparison maps, this unit-cusp comparison and the smoothed constant-term identity, rather than the underlying Eisenstein theory.

See Kakde, §§6.6–6.11, Lemmas 109–110, Proposition 111 and Remark 112, pp. 77–81 (arXiv v3): The Hilbert-modular toolkit of §§6.6–6.11; Lemmas 109 and 110 are proved in the text, Proposition 111 and the `q`-expansion principle are cited to Deligne–Ribet.

The hypotheses are as follows. `L` totally real; `Σ` a finite set of finite primes containing those above `p`; `𝔣` an integral ideal supported on `Σ`. `p` is odd.

*Proof.*

1. Lemma 109: `(R_{L′/L}f)|α = R_{L′/L}(f|α^*)`, and constant terms are read off at `τ → i∞`.
2. Use the normalized `U_β` with upper-triangular representatives (`1 b`; `0 β`): `f|U_β(τ)=N(β)^{k/2−1}Σ_b f|(1 b; 0 β)`. At each polarization component `b` ranges over the appropriate different/fractional-ideal lattice modulo `β` times that lattice. The character sum is `N(β)` for the corresponding `μ` divisible by `β` and 0 otherwise, giving `c(μ,f|U_β)=c(μβ,f)`, including `μ=0`. Its adelic double coset is `K diag(1,β) K` for the compact level `K`. Kakde's proof of Lemma 110, p. 79, labels this double coset by `diag(β,1)`; the two labels cannot be interchanged at a prime dividing the level. The upper-triangular formula fixes the operator used here.
3. Proposition 111 and the `q`-expansion principle are Deligne–Ribet (Proposition 6.1, 2.22, 0.3 and 5.13–5.15), stated in §6.1; Remark 112 combines them with `N((α))^kN(α_p)^{−k} = κ(u)^k`.
4. Unit cusps. Work with the adelic level `K` attached to `Γ₀₀(𝔣;𝔞,𝔟)` on each polarization component, including its different and fractional-ideal lattices (Deligne–Ribet, p. 262, before (5.7)). For `γ∈Ô_L^×` put `D_γ=diag(γ,γ⁻¹)`. Conjugation by `D_γ` multiplies the upper-right and lower-left entries by `γ²` and `γ⁻²` and fixes the diagonal entries. These are units at every finite place, so they preserve the two off-diagonal lattices and every diagonal congruence: `D_γ K D_γ⁻¹=K`. With `t_β=diag(1,β)`, the diagonal matrices commute literally. Consequently `D_γ(Kt_βK)D_γ⁻¹=Kt_βK`, including the normalized counting measure on the finite coset set. Thus slash by `D_γ` commutes with the `U_β` of step 2 on the full family of components. Strong approximation transports this identity to the classical slash action and `q`-expansions (Deligne–Ribet (5.7)–(5.8), pp. 262–263). Now `c(0,γ,f|U_β)=c(0,(f|U_β)|D_γ)=c(0,(f|D_γ)|U_β)=c(0,f|D_γ)=c(0,γ,f)`. This proves the target without choosing an integral rational matrix that ignores the fractional-ideal lattices. No comparison for non-unit ideles is asserted.

**Checks.**

- For `ε=0` the smoothed constant-term difference is 0. For `ε=1` over `Q` with `Σ={3}, k=2` and `u=1` it is again 0, although the unsmoothed value is `1/6`; omitting the second cusp would fail.
- For `L′ = L, R_{L′/L}` is the identity and `c(μ, f)` is unchanged; for `β = 1, U_β` is the identity.
- For `γ = 1` the unit-cusp comparison is the standard-cusp formula; for `γ ≡ 1` modulo `𝔣` it is the special-cusp case of Ritter–Weiss with `M₂ = 1`. For a non-unit idele, the cusps (`1 b`; `0 β`)`·M` are not all equivalent to the cusp of `M`, and the comparison is not claimed.
- For `γ` a unit not congruent to 1 modulo `𝔣`, the two off-diagonal lattices are still preserved by `γ²` and `γ⁻²`. Thus the proof does not use the special-cusp congruence. If `v(γ)>0` at a place, multiplication of the lower-left lattice by `γ⁻²` need not preserve it; this detects the unit hypothesis.
- Over `Q` with `β=p` and level `p`, reduction of `Γ₀₀(p)` modulo `p` fixes the line spanned by `e₁`. The matrices `diag(p,1)` and `diag(1,p)` have respective nonzero images spanned by `e₂` and `e₁` modulo `p`. Left and right multiplication by `Γ₀₀(p)` cannot change between those lines, so these are distinct double cosets. The standard `q`-expansion formula must use the second one.

*Needs:* [6.1](#ne6-abelian-case) (step 0`(c)`, Eisenstein series and `q`-expansion principle); [6.19](#ne6-partial-zeta-values) (Partial zeta values and the smoothed values `Δ^u_P`); §F.5.

<a id="ne6-transfer-image-not-generator"></a>
### 6.23 The transfer into a maximal cyclic subgroup misses its generators

**Lemma.** Let `P ∈ C(Ḡ)` be such that no `P′ ∈ C(Ḡ)` has `P′^p = P`, and let `P ⊊ N ≤ N_ḠP`. Then the image of the transfer `ver : N^ab → P` is a proper subgroup of `P` (Lemma 114).

See Kakde, §6.12, Lemma 114, pp. 82–83 (arXiv v3): Lemma 114 and its proof.

The hypotheses are as follows. `Ḡ` a finite `p`-group. `p` is odd.

*Proof.*

1. For `g∈N`, put `m=ord(gP)` in `N/P`, the length of each orbit on `N/P` (`P` is normal in `N`). With one representative `x_j` per `⟨g⟩`-orbit, transfer is `∏_j x_j⁻¹g^m x_j`. The order of `g` itself is not the orbit length.
2. If `g∉P` and `g^m` generated `P`, then `⟨g⟩` would be cyclic with a cyclic subgroup above `P` whose `p`-th powers equal `P`, contradicting maximality. Thus every factor lies in `P^p` and their product does too.
3. If `g ∈ P, ver(g) = ∏_{x∈N/P} x^{−1}gx`; `N` acts trivially on the order-`p` subgroup of `P`, so `ver(g)^{p^{r−1}} = ∏ g^{p^{r−1}} = g^{p^{r−1}[N:P]} = 1` for #`⟨g⟩ = p^r`, since `p` divides `[N : P]`.

**Checks.**

- For `Ḡ = C_{p²} × C_p` and `P = C_{p²} × 0` (maximal cyclic), `N = Ḡ: ver(N^ab) ⊆ pC_{p²}`, a proper subgroup.
- Kakde uses the lemma in Proposition 115: nontrivial stabilizers kill `δ(y)(g_𝔟)`.

*Needs:* Mathlib `MonoidHom.transfer`.

<a id="ne6-basic-congruence-values"></a>
### 6.24 Möbius-weighted Hilbert Eisenstein value congruences

**Theorem.** Let `L/K` be a finite `p`-extension of totally real number fields, `Σ=Gal(L/K)`, and `S` contain `p` and every ramified finite prime. Put `Σ_F=Gal(L/F), g_F=ver_K^F(g)`, and use the smoothed values of `2^{−[F:Q]}ζ_{F,S}`, denoted by `Δ̃`. For the element `g ∈ Gal(K_S/K)` constructed below, which is independent of `ε, k` and of every conductor, and for every positive even `k` and even locally constant `Z_(p)`-valued `ε` on `H_S=Gal(L_S/L), Σ_{K⊆F⊆L} μ_Σ(Σ_F) Δ̃_{g_F}(1−|Σ_F|k, ε∘ver_F^L) ∈ |St_Σ(ε)| Z_(p)`. Here `μ_Σ(V)=μ(1,V)` is the subgroup-poset Möbius coefficient and even means factoring through the maximal totally real quotient. This replaces the unsupported cyclic-overgroup sum of Kakde v3 (12); it is not a claim to repair that false sum by changing weights.

See Ritter–Weiss, Congruences II, Propositions 5 and 9, pp.6–9; Lemma 10 and conclusion, pp.10–11 (arXiv v3): relative restriction weights, complete stabilizer sums and the cusp calculation prove the value congruence; there the cusp `γ` satisfies `γ ≡ 1` modulo the conductor `𝔣` chosen from `ε` (Proposition 5), so their `g` depends on `ε`. Here the cusp is a unit idele, and the Hecke comparison at it is §6.22, step 4. Kakde, Propositions 115–117, pp.83–86; Proposition 98, (12), p.69 (arXiv v3): For comparison only: the proof here does not use Kakde's cyclic-overgroup sum, its fixed-pair cancellation, or the omitted proof of (29) (corrections `E33`–`E34`).

The hypotheses are as follows. `p` odd; `L/K` and `S` as in the statement. No `μ=0` hypothesis is needed for this finite analytic congruence. Let `α` be the rational finite idèle with component `1+p` at `p` and 1 at every other prime, `γ=α_K` its image in `K̂^×` (a unit idele) and `g=Art_K(γ)` (target `uniformSmoothingElement`). The image of `γ` in `F̂^×` is a unit idele with Artin symbol `g_F=ver_K^F(g)`, and `g_F` acts on `p`-power roots of unity through `N_F(g_F)=(1+p)^{−[F:Q]}≠1`, so every `g_F` has nontrivial cyclotomic image. For given `ε` and `k` choose a common conductor ideal `f` supported on `S`, divisible by `|Σ|`, for all `ε∘ver_F^L`; `γ` does not depend on this choice.

*Proof.*

1. For each intermediate field form `G_{[L:F]k, ε∘ver_F^L}`, restrict from `F` to `K`, then apply `U_[F:K]`. The common weight is `[F:K][L:F]k=[L:K]k`, and the `q^a` coefficient sums over `(β,b)` with `β∈b⊆O_F, b` prime to `S` and `Tr_{F/K}(β)=[F:K]`a. Keep these relative degrees; an absolute degree from a different bottom field cannot replace them.
2. Identify these pairs with the `Σ_F`-fixed pairs in `L`. Because `S` includes every ramified prime, an invariant ideal prime to `S` descends to the fixed field. For a pair with stabilizer `P≤Σ` the full subgroup sum contributes `ε(b)N_L(b)^k Σ_{V≤P} μ_P(V) r^[P:V]`, where `r=N_L(b)^(−1/|P|)` is a rational `p`-unit, obtained by descending `b` to `L^P`. This uses every subgroup `V≤P` with its multiplicity.
3. For `P≠1` take the Teichmüller lift `z` of `r` modulo `p`. Then `r^{p^n}≡z` modulo `p^{n+1}`. The finite `p`-group Möbius identity gives `|V|` divides `p μ_P(V): μ(1,V)=0` unless `V` is elementary abelian, and for rank `d` its value is `(−1)^d p^{d(d−1)/2}`. This identity is a finite subgroup-poset induction using the Frattini quotient and the Gaussian-binomial recursion; that combinatorial lemma is part of this target. Each summand is congruent to `μ_P(V)z` modulo `|P|`. Their sum vanishes since `Σ_{V≤P} μ_P(V)=0`. For `P=1` the required modulus is 1 and the assertion is automatic.
4. Group pairs under `St_Σ(ε)`. An orbit has `|St_Σ(ε)|/|St_Σ(ε)∩P|` elements, while its single-pair contribution is divisible by `|P|`, hence by `|St_Σ(ε)∩P|`. Every nonconstant coefficient of the Möbius sum `E` is divisible by `|St_Σ(ε)|`.
5. Use the unit cusp `γ` above. By §6.22, step 4, applying `U_[F:K]` (with `[F:K]` dividing `f`) preserves the constant coefficient at the cusp determined by `γ`, because `D_γ` normalizes the full adelic level and commutes with the diagonal Hecke representative, giving the double-coset identity proved there. When `γ ≡ 1` modulo `f` this includes Ritter–Weiss's special case `M₂ = 1`. No assertion at cusps determined by non-unit ideles is used.
6. The constant term of `res_F^K E_F` at `γ` is `N_K((γ))^{[L:K]k} ζ̃_F(1−[L:F]k, (ε∘ver_F^L)_{g_F})` with `N_K((γ)) = 1` (§6.1, step 0`(c)`), and the normalized cusp expansion `E(γ)=N_K(γ_p)^{−[L:K]k}E_γ` multiplies the constant coefficient by `N_K(g)^{[L:K]k}=N_F(g_F)^{[L:F]k}`, since `N_K(γ_p)^{−1}N_K((γ))=N_{K,p}(g)`. Therefore the constant coefficient of `E(1)−E(γ)` is exactly the stated sum of `Δ̃` values, including each smoothing exponent and each relative weight. The `q`-expansion principle transfers the nonconstant-coefficient divisibility to this constant difference.

**Checks.**

- For `Σ=C_p×C_p` the coefficients are 1 at `1, −1` at each of the `p+1` lines, and `p` at `Σ`. At `p=3` and `r=2` the stabilizer polynomial is `2^9−4·2^3+3·2=486`, divisible by 9. Replacing the full Möbius sum by an unweighted sum of cyclic overgroups fails this test.
- For a proper normalizer `N` in a larger finite quotient, restriction to its fixed field multiplies a weight by `[N:P]`, not `[Ḡ:P]`. The special-cusp norm identity must use the same bottom field as that restriction.
- For the full stabilizer `P=1` no cancellation `Σμ=0` is asserted: divisibility modulo 1 is enough. For `P≠1` retain all fixed pairs, including `β` rational and `b=O_L`.
- The element `g` does not change when `ε` is replaced by a function of larger conductor: for `K = ℚ` it is the Artin symbol of the idèle (`1+p` at `p, 1` elsewhere), which acts on `μ_{p^∞}` by `(1+p)⁻¹` whatever the level. The special element of Ritter–Weiss Proposition 5 for the conductor `𝔣` is trivial on the ray class field of `𝔣` and tends to 1 as `𝔣` grows; a statement only for such `g` would not give one `g` for all `ε`.

*Needs:* [6.1](#ne6-abelian-case) (step 0`(c)`–`(d)`); [6.22](#ne6-hilbert-eisenstein-toolkit) (Restriction and Hecke comparison for smoothed constant terms); [6.19](#ne6-partial-zeta-values) (Partial zeta values and the smoothed values `Δ^u_P`).

<a id="ne6-basic-congruences"></a>
### 6.25 Analytic Möbius and index-`p` transfer congruences

**Theorem.** Let `G` be a one-dimensional `p`-elementary totally real Galois group, A an abelian normal open subgroup containing its prime-to-`p` cyclic factor, and `Q=G/A`. In the central localization `Λ•A, Σ_{A≤U≤G} μ_Q(U/A) ver_A^{U^ab}(ζ_{U^ab})` belongs to `tr_Q(Λ•A)`, with the same `S`-truncation on every abelian pseudomeasure. For `|Q|=p` this is the index-`p` transfer congruence `M3`. In the finite-over-cyclotomic pro-`p` setting, central localization by central elements regular modulo `p` agrees with the canonical `S`-localization; unramified coefficient factors are treated componentwise.

See Ritter–Weiss 2011, Proposition 6, p.3; §3, Lemma `c` and (3.1)–(3.3), pp.10–12: Normalization removal, legitimate pseudomeasure deflation and division by the common smoothing factor. Ritter–Weiss, Congruences II, Theorem, p.2, and concluding Remark, p.11: The special-`g` congruence and the limitation on universal localization with a prime-to-`p` factor.

The hypotheses are as follows. `p` odd; totally real extension finite over the cyclotomic tower; `S` contains `p` and all ramified primes. Use abelian pseudomeasures with the Deligne–Ribet normalization; `μ=0` is required when viewing them as units in the completed/canonical main-conjecture construction, not for the finite analytic value congruence.

*Proof.*

1. Take the single `g` of §6.24, with nontrivial cyclotomic transfer in every intermediate field. By §6.24 its value congruences hold for every even locally constant `ε`, so §6.21 puts the smoothed Möbius sum `s_g` in the trace ideal (the uniform smoothing lemma below). Work on the universal abelian `S`-ramified groups and their totally real quotient, with `L` the fixed field of `A`.
2. Remove the tilde normalization in the Möbius sum. For `V=Gal(L/F)`, the difference `μ_Q(V)(2^{−[F:Q]}−2^{−[L:Q]})` is divisible by `|Q|`. Indeed `|V|` divides `p μ_Q(V)`, and for `V≠1` the factor `(2^{|V|−1})^{[F:Q]}−1` has `p`-adic valuation at least `1+v_p([F:Q])`; for `V=1` the difference is zero. Its invariant sum is a trace. This only uses the `p`-primary modulus, not divisibility modulo `[F:Q]`.
3. Put `h=ver_K^L(g)`. Each summand has the common factor `1−h`. Localize the universal group ring only at `ℤ_p[[closure〈h〉]]∖p`, then map to `Λ•A`. The cyclotomic image of `h` is nontrivial, so `1−h` becomes a unit there. This is the deflation of a pseudomeasure in Ritter–Weiss Lemma `c`; it also works when `A` has a prime-to-`p` factor. The entire universal augmentation localization need not map to that factor and is not used.
4. The transfer/deflation square follows from corresponding coset representatives in `G(L_S/K)` and its quotient `G`. Divide the smoothed sum by the `Q`-fixed unit `1−h` after this square; trace ideals commute with this central localization. This proves the displayed ordinary-pseudomeasure congruence.
5. To obtain Kakde `M3` for `P≤P′` of index `p`, apply the index-`p` case to `U_{P′}/[U_P,U_P]`, whose normal subgroup `U_P^ab` is abelian. The full `G` need not itself be abelian.

**Checks.**

- For `Q=C_p` this gives `ζ_A−ver_A^{G^ab}(ζ_{G^ab})` in `tr_Q`, with the sign determined by `μ_Q(Q)=−1`.
- Kakde v3 (12) is not a target: take `Ḡ=C_{p²}×C_p, P=pC_{p²}×0`. There are `p` cyclic `P′` with `P′^p=P`, and `W_Ḡ(P)` has order `p²` acting trivially. `M3` implies `ζ_P≡φ(ζ_{P′})` modulo `p` for each `P′`, whereas (12) would imply `ζ_P≡pζ_P=0` modulo `p`, contradicting that `ζ_P` is a unit. The corrected full Möbius sum preserves the missing multiplicity.
- The uniform existence assertion is `∃g ∀ε`, not `∀ε ∃g`. A conductor-dependent cusp (Ritter–Weiss, Congruences II, Proposition 5) proves only the latter; the unit cusp of §6.24 proves the former.
- Compactness negative control. In `ℤ_p` the compact open subgroups `p^nℤ_p` are nested; every finite intersection contains the nonzero `p^N`, whereas `⋂_n p^nℤ_p = {0}` (if `x ≠ 0` then `x ∉ p^(v_p(x)+1)ℤ_p`), for every prime including 2. Closed conditions with a nontrivial solution at each finite stage need not have one in the full intersection, and under a cyclotomic coordinate 0 is the identity, useless as a smoothing denominator.
- Quantifier test. The `g` that work form a closed subgroup: `s_(gh)=s_g+ver_K^L(g)s_h`, because `ver_F^L` is a ring map and `ver_K^L(g)` is `Σ`-invariant. Proposition 5's element for the conductor `𝔣` has trivial image at that level, and its norm tends to 1 as `𝔣` grows. So no fixed `g` follows from the per-conductor construction by compactness; the fixed `g` comes from the unit cusp.

**Uniform smoothing lemma.** For `L/K, S` and `Σ` as in §6.24, the element `g` of §6.24 has image in `Gal(K_cyc/K)` of infinite order, and the smoothed Möbius sum `s_g` of §6.21 lies in `tr_Σ(ℤ_p[[H_S^+]])` for every even locally constant `ε` at once. This is the statement of Ritter–Weiss, Congruences II, Theorem, p. 2, used in their Proposition 4, pp. 5–6. Their own proof chooses the cusp from the conductor of `ε` (Proposition 5) and so gives the congruence for an element depending on `ε`, as they note on p. 3; the unit-cusp comparison of §6.22, step 4, and §6.24 supply one `g` for all `ε`, and §6.21 converts the value congruences into trace membership. This is the analytic input that §§6.28, 6.32 and 6.34 use.

*Needs:* [6.21](#ne6-basic-congruence-reduction) (Smoothed Möbius values and trace ideals); [6.24](#ne6-basic-congruence-values) (Möbius-weighted Hilbert Eisenstein value congruences); [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`).

<a id="ne6-mu-zero-finite-p-extension"></a>
### 6.25a μ zero under a finite p-extension

**Theorem.** For odd `p`, let `L_∞/K_∞` be a finite Galois `p`-extension of totally real cyclotomic towers and let `S` be a finite set of primes at a finite base, containing `p` and all ramification. If the maximal abelian pro-`p` `S`-ramified Galois group `X_S(K_∞)` is finitely generated over `ℤ_p`, then so is `X_S(L_∞)`. The theorem `muZero_finitePExtension` includes enlarging `S` by finitely many primes away from `p`. Prove its conversion to §4.4’s `MuZero` by taking a cyclotomic fixed field witnessing that predicate and its finite `p`-extension, and then applying `muZero_iff_fg`.

Source: the finite-quotient Hochschild–Serre homology sequence of §F.3 (Ribes–Zalesskii, §6.8, and NSW, §I.6) and compact Nakayama (PadicMeasuresIwasawaAlgebras §5.2). This gives the required ramified-module form directly. The classical unramified μ-preservation result is Iwasawa, *On the μ-invariants of Z_l-extensions*, in *Number Theory, Algebraic Geometry and Commutative Algebra, in honor of Yasuo Akizuki* (1973), Theorem 3, pp. 1–11, as cited in Lim, *Notes on the fine Selmer groups*, Theorem 3.5 and proof, p. 343.

*Proof.* Put `P=Gal(L_∞/K_∞)`. The maximal pro-`p` `S`-ramified extensions above the two fields coincide, since an extension of pro-`p` groups is pro-`p`. The five-term homology sequence places the kernel of `X_S(L_∞)_P→X_S(K_∞)` in the image of the finite group `H₂(P,ℤ_p)`, and its cokernel in `P^ab`. Thus `X_S(L_∞)_P` is `ℤ_p`-finite. Compact Nakayama over the local ring `ℤ_p[P]` makes `X_S(L_∞)` finite over `ℤ_p[P]`, hence over `ℤ_p`. Added primes away from `p` have open cyclotomic decomposition groups; their local inertia contributes finitely many finitely generated `ℤ_p`-modules, so finite enlargement preserves this property. For `MuZero` first apply this argument at its witnessing cyclotomic field, rather than treating a general analytic tower as a cyclotomic one.

**Checks.**

- If `P=1`, the comparison is the identity, with no added μ hypothesis.
- For `P=C_p`, coinvariant finite generation implies finite generation over the finite ring extension `ℤ_p[P]`; the module need not be free over either ring.
- A finite added prime outside `p` has finitely many primes in a cyclotomic tower. Allowing infinitely many added primes would invalidate this finite-rank argument.
- The assertion preserves μ zero, not the λ-invariant or equality of the two Iwasawa modules.

*Needs:* §§F.3, 4.4; IntegralIwasawaTheory §§2.4–2.6; PadicMeasuresIwasawaAlgebras §5.2; ClassFieldTheory’s restricted-ramification reciprocity.

<a id="ne6-enlarged-extension"></a>
### 6.26 The auxiliary extension `F̃_∞` and the trace-ideal bound

**Lemma.** Choose a prime `l ≡ 1 mod |Ḡ|` with `ℚ(μ_l) ∩ F_∞ = ℚ`, let `K ⊆ ℚ(μ_l)` have degree `|Ḡ|` over `ℚ`, and put `F̃ = KF, F̃_∞ = F̃F_∞`. Then `Gal(F̃_∞/F)=Δ×G̃`, where `G̃=H̃×G` is pro-`p, H̃` is cyclic of order `|Ḡ|`, and the finite `p`-group `G̃_bar=G̃/Z` is `H̃×Ḡ`. For `P∈C(G̃_bar)` let `i_P=max{[P′:P]:P⊆P′∈C(G̃_bar)}`, and let `U_P` be its preimage in `G̃`. The prime-to-`p` factor `Δ` remains in the coefficient algebra, outside this subgroup lattice. If `P ≠ {1}` then `T_P ⊆ p·i_P²·Λ(Δ × U_P)`, and `T_{1} = |G̃_bar|Λ(Δ × Z)`; the same holds for `T_{P,S}` and `T̂_P` (Lemma 118). The main conjecture for `F̃_∞/F` implies it for `F_∞/F`.

See Kakde, §§6.13.1–6.13.2, Lemma 118, pp. 86–87 (arXiv v3): The trick of §6.13, the field `F̃_∞` and Lemma 118 with its proof.

The hypotheses are as follows. The standing hypotheses `(B)` of this layer.

*Proof.*

1. Case `P ⊆ H̃: i_P = [H̃ : P]` and `N_{G̃_bar}P = G̃_bar` acts trivially on `Λ(Δ × U_P)`, so `T_P = [G̃_bar : P]Λ = |Ḡ|[H̃ : P]Λ ⊆ p·i_P²Λ` since `|Ḡ| ≥ p·i_P`.
2. Case `P ⊄ H̃: P = ⟨(h̃, h)⟩` with `h ≠ 1`; for `P′ = ⟨(h̃₀, h₀)⟩` realising `i_P, H̃ × ⟨h₀⟩ ⊆ N_{G̃_bar}P` acts trivially, so `T_P ⊆ (|H̃||⟨h₀⟩|/|P|)Λ = |H̃|i_PΛ ⊆ p·i_P²Λ` as `|H̃| ≥ p·i_P`.
3. Admissibility and `μ = 0` for `F̃_∞`, which the source asserts without argument (correction `E10`): `K` is totally real because `|Ḡ|` is odd and divides `(l − 1)/2`, and `μ = 0` passes from `F_∞` to the finite `p`-extension `F̃_∞` (apply `muZero_finitePExtension`, §6.25a, at a cyclotomic field witnessing `MuZero`, with the enlarged ramification set).
4. Descent: MC for `F̃_∞/F` gives MC for its quotient `F_∞/F` by the compatibility of `∂, C` and interpolation with the quotient map (as in §6.3).

**Checks.**

- Choose `l` away from the finite ramification set with `l≡1 mod |Ḡ|`. Every nontrivial subfield of `ℚ(μ_l)` ramifies at `l`; hence it is disjoint from `F_∞`. Chebotarev applied to the cyclotomic congruence field gives such primes.
- The finite `p`-extension preserves `MuZero` by §6.25a; this does not assert preservation of λ.

- The descent along `G̃ → G` uses Fukaya–Kato's base change for `C` (§4.5).
- For `Ḡ = 1, H̃` and `G̃_bar` are trivial, `F̃_∞=F_∞`, and `T₁=Λ(Δ×Z)`: the trace is the identity, rather than an undefined multiple by the order of an infinite group.

*Needs:* §6.25a; TauCetiRoadmap Chebotarev (existence of primes with specified Frobenius); [6.17](#ne6-main-conjecture-congruence-criterion) (The main conjecture as congruences between abelian zeta functions); [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`); [6.3](#ne6-reduction-to-dimension-one) (Burns's reduction to one-dimensional extensions); [4.4](#ne4-admissible-extension) (Admissible extensions, `μ = 0` and weak Leopoldt).

<a id="ne6-rw-logarithmic-inputs"></a>
### 6.26a Completed logarithm, torsion correction and restriction

Fix odd `p`, a totally real finitely ramified extension `K/k`, finite over `k_cyc`, with `μ=0` and `p`-elementary group `G=C×G_p`, where `C` is cyclic of order prime to `p` and `G_p` is pro-`p`. Put `B_G=Λ∧G`, the `p`-adic completion of the localization at central elements regular modulo `p`, and `Q_G=B_G[1/p]`. Use `T(B_G)=B_G/[B_G,B_G]_add`, its map `τ_G`, and `a=ker(B_G→B_{G^ab})`. Extend §6.12’s logarithm `L` componentwise over the unramified character rings of `C`. On the admissible character-function space set `𝓛(f)(χ)=p⁻¹ log(f(χ)^p/Ψ(f(ψ_pχ)))`. Reduced trace identifies `T(Q_G)` with the additive character-function space; define `t_{K/k}` there by `Tr(t_{K/k})=𝓛(L_{K/k})`. Section 6.27 supplies its pseudomeasure interpretation and functorial API.

**Theorem (`rw_relativeLog_surjective`).** The logarithm has image in `T(B_G)`, commutes with `Det` and `Tr`, and maps `1+a` onto `τ_G(a)`. The rows `1+a→B_Gˣ→B_{G^ab}ˣ→1` and `τ_G(a)→T(B_G)→B_{G^ab}→0` are exact and the logarithms give a commuting diagram. Source: Ritter–Weiss 2011, §6, Lemma i(i)–(ii), pp. 22–23; RW3, Proposition 11, especially 2(b).

**Checks.**

- For abelian `G`, `a=0`; relative surjectivity asserts `1→0`, not surjectivity of the full logarithm.
- A prescribed `v∈τ_G(a)` has a lift with abelianized unit exactly `1`, rather than merely a torsion abelianized determinant.
- Splitting `C` into its unramified coefficient components gives the diagram componentwise; discarding a component can lose a nonzero relative additive class.

**Theorem (`rw_logTorsion`).** For `x∈1+a`, if `Det(x)` is torsion in the admissible multiplicative character-function group, then `Det(x)=1`. Consequently the relative determinant image has no nontrivial torsion. This does not assert torsion-freeness of `K₁(B_G)` or of the full determinant image. Source: RW3, Lemma 12, as applied componentwise in Ritter–Weiss 2011, Lemma k(i), proof, pp. 24–25.

**Checks.**

- `x=1` has determinant `1`, and satisfies the assertion.
- A commutator group element lies in `1+a` and has determinant `1`; nonidentity as a group-ring unit need not mean nontrivial determinant.
- A nontrivial scalar root of unity survives abelianization and is outside `1+a`; omitting that relative hypothesis falsely excludes full-logarithm torsion.

**Theorem (`rw_pPower_logIntegrality`).** There is an integer `n≥0` with `p^n t_{K/k}∈T(B_G)`. More generally every element of `T(Q_G)` has such a multiple: the finite free central algebra description gives `Q_G=B_G[1/p]`, and localization commutes with the additive commutator quotient, so finitely many denominators can be cleared. No conclusion `t_{K/k}∈T(B_G)` follows by division by `p`. Source: RW4, Proposition 9, used in Ritter–Weiss 2011, §5, Uniqueness Principle, p. 19; the central-localization description is its Remark B, p. 5.

**Checks.**

- An already integral class permits `n=0`.
- For `G=Γ`, the additive scalar `p⁻¹` needs `n≥1`; clearing denominators does not prove its integrality.
- Zero has every `p`-power multiple integral, and injectivity of `T(B_G)→T(Q_G)` permits cancelling a `p`-power in an equality, not in an integrality assertion.

**Theorem (`rw_multiplicativeLift_torsionCorrection`).** If `t_{K/k}∈T(B_G)`, there is a unique torsion admissible character function `w` with abelian deflation `1` and `wL_{K/k}∈Det K₁(B_G)`. If `G` has an abelian subgroup `G′` of index `p`, then `w=1` is equivalent to `ver_{G^ab}^{G′}(λ_{K^{[G,G]}/k})≡λ_{K/K^{G′}} mod tr_{G/G′}(B_{G′})`. Retain the arithmetic and character-space hypotheses from this subsection; this is not a lift theorem for arbitrary functions with a logarithm. Source: Ritter–Weiss 2011, Lemma k(i)–(ii), pp. 24–25, extending RW5, Propositions 2.2, 2.4 and 3.2; the reduction to the index-`p` tests is RW5, Theorem, p. 1096.

**Checks.**

- For abelian `G`, deflation is the identity, so `w=1`.
- Equality of two logarithms permits a torsion discrepancy; the index-`p` congruence is needed to remove it.
- For `G/G′=C_p` acting trivially, the trace ideal is `pB_{G′}`; the displayed congruence is a congruence modulo `p`, not an equality of pseudomeasures.

**Theorem (`rw_additiveRestriction`).** For every open `G′≥C`, construct `Res_{G}^{G′}:T(Q_G)→T(Q_{G′})` by transporting the character-space restriction through `Tr`. On a character `χ′`, it sends `f` to `f(Ind χ′)+Σ_{r≥1}p^{−r}Ψ^r f(ψ_p^{r−1}(ψ_p Ind χ′−Ind ψ_pχ′))`; the sum is finite. Prove additivity, integrality on `T(B_G)`, transitivity, commutation with the multiplicative norm through `L`, and `Res t_{K/k}=t_{K/K^{G′}}`. If `A≥C` is abelian normal open, prove detection: an integral `v` with `defl_{U}^{U^ab} Res_G^U v=0` for every `U≥A` is zero. Source: Ritter–Weiss 2011, Lemma j, pp. 23–24, and Lemma h, pp. 17–18; RW8, §1, Lemma 1 and Proposition A.

**Checks.**

- For `G′=G`, the Adams defect is zero and restriction is the identity.
- For a chain `G″≤G′≤G` containing `C`, the two successive restrictions agree with direct restriction, including their Adams correction terms.
- For abelian `G=A`, detection includes `U=G` and is the identity test. For nonabelian `G`, abelianization at `U=G` alone kills commutator-labelled differences; the whole family of overgroups is required.

*Needs:* §§3.11–3.14, 6.1, 6.11–6.12; the central algebra and coefficient-component comparisons of §§3.12 and 6.7; the trace/character maps just specified; ClassicalArithmeticCompletion Layer 7.

<a id="ne6-rw-logarithmic-pseudomeasure"></a>
### 6.27 Ritter–Weiss logarithmic pseudomeasure

**Construction.** In the one-dimensional Ritter–Weiss setting, let `Λ^G` be the `p`-adic completion after inverting central elements regular modulo `p, Q^G` its total quotient, and `T(R)=R/[R,R]_add` the additive commutator quotient. The reduced-trace character map `Tr` identifies `T(Q^G)` with the admissible character-function space. Define `t_(K/k)` by `Tr(t)=L(L_(K/k))`, where `L(f)(χ)=p⁻¹ log(f(χ)^p/Ψ(f(ψ_pχ)))` and `Ψ` is induced by `γ↦γ^p`. For `p`-elementary `G` the integral group logarithm satisfies `Tr∘L=L∘Det` and has image in `T(Λ^G)`. This completion and this `t` are distinct from the canonical localization and a multiplicative zeta element.

See Ritter–Weiss 2011, §1, diagram `(D1)`, pp. 4–5; §6, Lemma `i`, pp. 22–24: Defines the additive logarithmic object and gives the integral logarithm comparison, with references to the earlier papers for the general trace character space.

The hypotheses are as follows. `p` odd; `K/k` totally real, `k/Q` finite and `K/k_cyc` finite; the stated character functions satisfy Galois and cyclotomic twisting compatibilities. For integrality of the group logarithm use `p`-elementary `G=C×P` with `C` finite cyclic of order prime to `p` and `P` pro-`p`.

*Construction.*

1. Import reduced trace and the additive commutator quotient; form the central localization and `p`-adic completion.
2. Use the reduced-trace character isomorphism to define `t` uniquely.
3. Use the integral logarithm square and Adams`/`Frobenius normalization from Ritter–Weiss diagram `(D1)`, with the completed logarithm and restriction targets of §6.26a.

API: `RWLogarithmicPseudomeasure.ofCharacterFunction` (`t` is the inverse reduced-trace image of `L(L_(K/k))`); `RWLogarithmicPseudomeasure.trace` (`Tr(t)=L(L_(K/k))`; injectivity of `Tr` gives uniqueness in the additive quotient); `RWLogarithmicPseudomeasure.deflation` (Deflation and the source-defined additive restriction commute with `t` and with the trace character maps); `RWLogarithmicPseudomeasure.logDet` (`Tr(L(x))=L(Det(x))`; additive restriction is the Ritter–Weiss map, not naive deletion of basis terms).

**Checks.**

- `rw_logarithmic_pseudomeasure_1`: For an abelian group, `T(Λ^G)=Λ^G` and the trace comparison is the scalar character comparison.
- `rw_logarithmic_pseudomeasure_2`: For the group-like unit `γ, p⁻¹log(γ^p/Ψγ)=0`; a logarithm omitting `Ψ` fails this test.
- `rw_logarithmic_pseudomeasure_3`: For the scalar unit `1+p` over `ℤ_p`, the logarithm is `(1−p⁻¹)log(1+p)`, not the ordinary `log`.
- `rw_logarithmic_pseudomeasure_4`: The zero additive pseudomeasure is uniquely determined by zero trace but does not imply uniqueness of a multiplicative preimage when `SK₁` survives.

*Needs:* §6.26a; [3.12](#ne3-semisimple-total-quotient) (Semisimple total quotient in dimension one); [3.13](#ne3-reduced-norm-sk1-comparison) (Reduced norms and the surviving `SK₁` ambiguity); [6.12](#ne6-integral-logarithm) (The integral logarithm on `K′₁` of Iwasawa algebras); §F.0.

<a id="ne6-rw-mobius-congruences"></a>
### 6.28 The algebraic Möbius–Wall congruence

**Theorem.** Let A be an abelian normal open subgroup of `p`-elementary `G` and `Q=G/A` a finite `p`-group. For `ε∈(Λ^G)^×, Σ_(A⊆U⊆G) μ_Q(U/A) ver_A^U(res_U^G ε)` lies in `tr_Q(Λ^A)`. Here `res` denotes the `K₁` transfer before the abelian group-transfer map `ver`, and `μ_Q` is the subgroup-poset Möbius function. The analytic pseudomeasure congruence is the earlier target §6.25; this target adds the algebraic unit congruence.

See Ritter–Weiss 2011, Propositions 5–6, p. 3; §2, pp. 6–10; §3, pp. 10–12: The two congruences supply the algebraic and analytic trace-ideal constraints. Ritter–Weiss, Congruences II, Propositions 4–5 and 9; Lemma 10, pp.5–11: Proof of the analytic congruence used by RW2010 Proposition 6.

The hypotheses are as follows. `p` odd; one-dimensional totally real Ritter–Weiss setting; A includes the prime-to-`p` cyclic direct factor. The analytic clause uses the `S`-truncated abelian pseudomeasures and their Deligne–Ribet congruences.

*Proof.*

1. For the algebraic clause, expand the restriction determinant using representatives of `G/`A and the associated group-extension cocycle. For each coset permutation group the coefficients into orbits under `Q`. Its cocycle factor is invariant under the permutation stabilizer (Ritter–Weiss §2, Lemma a and the claim after (2.5)).
2. The remaining stabilizer sum is the Möbius sum in §2 Lemma `b`. Prove that lemma by induction on subgroup order: split a coefficient as `e₀+e₁`, expand into functions on the coset set with values in `{0,1}`, and group nonconstant functions by their proper stabilizers. Their contributions are iterated traces by induction; constant functions cancel against the two pure terms. This retains all subgroups and conjugacy multiplicities.
3. For the analytic clause use §6.25, whose Hilbert coefficient and special-cusp calculation is supplied above, with the uniform smoothing lemma stated there. The algebraic and analytic sums have the same subgroup indexing and target trace ideal; neither is the unweighted cyclic-overgroup sum of Kakde (12).

**Checks.**

- If `Q=C_p, μ_Q(1)=1` and `μ_Q(Q)=−1`, giving the norm-transfer difference in the `Q`-trace ideal.
- If `Q=C_p×C_p`, the subgroup Möbius coefficients are 1 on `1, −1` on each of the `p+1` lines and `p` on `Q`; for cyclic `Q=C_(p²)` the coefficient of `Q` is 0.
- If `A=G`, the trace ideal is all `Λ^A`; the resulting congruence imposes no extra condition.

*Needs:* [6.27](#ne6-rw-logarithmic-pseudomeasure) (Ritter–Weiss logarithmic pseudomeasure); [6.22](#ne6-hilbert-eisenstein-toolkit) (Restriction and Hecke comparison for smoothed constant terms); [6.25](#ne6-basic-congruences) (Analytic Möbius and index-`p` transfer congruences); [6.1](#ne6-abelian-case) (step 0); TauCetiRoadmap InductionRestriction, Layer 6.

<a id="ne6-rw-logarithmic-integrality"></a>
### 6.29 Ritter–Weiss logarithmic integrality criterion

**Theorem.** Under the odd-prime, totally real, one-dimensional Ritter–Weiss hypotheses and `μ_(K/k)=0`, existence of `Θ∈K₁(QG)` with `Det Θ=L_(K/k)` and `∂Θ=℧_(K/k)` is equivalent to `L_(K/k)∈Det K₁(Λ^G)`. After `p`-elementary reduction, this is equivalent to `t_(K/k)∈T(Λ^G)`. The implication from integral `t` to a multiplicative preimage requires the torsion congruence; the logarithm alone loses torsion information. The refined class `℧` is not identified with `−[C]` without the arithmetic comparison of §5.8.

See Ritter–Weiss 2011, Propositions 1–3, pp. 2–5; §6, Lemma `k`, pp. 24–25: States both reductions and explains the indispensable torsion correction in the logarithmic converse.

The hypotheses are as follows. `p` odd; `K/k` totally real, `k/Q` finite, `K/k_cyc` finite; finite `S` contains all archimedean and ramified primes; `μ_(K/k)=0`. For the second equivalence use `p`-elementary `G` and the source’s compatible character-function space.

*Proof.*

1. Use Wiles’s abelian main conjecture to identify the localization boundary in the central-completion reduction.
2. Apply character induction to reduce to `p`-elementary `G`.
3. Apply `rw_relativeLog_surjective` and `rw_pPower_logIntegrality` for the relative additive lift and denominator clearing. Apply `rw_additiveRestriction` for detection by abelianized restrictions, and `rw_multiplicativeLift_torsionCorrection` with `rw_logTorsion` for the converse. The index-`p` torsion congruence removes the surviving torsion function; the logarithm alone does not.

**Checks.**

- In an abelian component the relative ideal is zero and the torsion correction is `1`; logarithmic lifting recovers the supplied abelian pseudomeasure.

- A torsion character function may have zero logarithm; zero logarithm alone does not put it in `Det` of the integral `K₁`.
- The `μ=0` hypothesis is retained when moving the boundary problem to the central completed localization.

*Needs:* §6.26a; [6.27](#ne6-rw-logarithmic-pseudomeasure) (Ritter–Weiss logarithmic pseudomeasure); [6.28](#ne6-rw-mobius-congruences) (The algebraic Möbius–Wall congruence); [6.1](#ne6-abelian-case) (Wiles's normalized abelian theorem, step 0`(f)`); [3.11](#ne3-k1-prime) (finite Whitehead inputs).

<a id="ne6-rw-main-theorem"></a>
### 6.30 Ritter–Weiss main theorem with `μ = 0`

**Theorem.** Let `p` be odd and `K/k` a totally real Galois extension with `k/Q` finite, `K` containing `k_cyc` and `[K:k_cyc]<∞`. Let `S` contain all archimedean and ramified places and suppose `μ_(K/k)=0`. There exists `Θ∈K₁(QG)` with `Det Θ=L_(K/k,S)` and `∂Θ=℧_(K/k,S)`. The theorem proves existence; uniqueness in `K₁(QG)` is not part of its conclusion. Its comparison with the canonical-localization version requires both the localization maps and the refined-module/`dual`-complex sign comparison. Equivalently, in the source’s `μ=0` criterion, `L_(K/k,S)` lies in `Det K₁(B_G)`, where `B_G=Λ∧G` is the completed central-regular localization. This completed preimage, rather than the class `℧`, is the input of §6.31.

See Ritter–Weiss 2011, Theorem, p. 1; Theorem 7, p. 4; §5, Lemmas `g`–`h` and Claims 1–3, pp. 17–22: The final support-reduction proof proves the stated existence theorem and explicitly leaves uniqueness out.

The hypotheses are as follows. Exactly the odd-prime, finite-over-cyclotomic, totally real and `μ=0` hypotheses in the statement.

*Proof.*

1. Apply the logarithmic integrality criterion and the `p`-elementary reduction.
2. Use the Möbius congruences and Theorem 7 to lift integral logarithmic pseudomeasures through a central subgroup of exponent `p`.
3. Induct on the order of the commutator subgroup and the index of the center. Lemma `h` detects additive classes by all abelianized restrictions.
4. Choose a lift with support of minimal size. For its minimal `U`, restriction to all maximal proper `V` forces the coefficients to vanish unless `U/A` is cyclic and the supported coset generates `U/A`. Lemma `g` expresses the remaining trace coefficients in a basis; Claim 3 lifts them to `τ_G(y(c−1))`. This correction preserves deflation modulo `C` and restriction to `A`, removes `U`, and only affects groups containing a conjugate of `U`, which were already in the support by Claim 1. This contradicts minimal support. Lemmas `i`–`k` extend integrality, the relative logarithm and torsion correction componentwise to the prime-to-`p` factor. The trace, logarithm, detection and torsion inputs are the targets of §6.26a; Proposition 6 is §6.25.

**Checks.**

- The abelian case reduces to the normalized abelian pseudomeasure theorem with the same `S`.
- No `p=2` or arbitrary higher-dimensional statement follows from this theorem.
- The completed preimage `b` has `θ̂_P(b)=ζ_P: Det` commutes with abelianized restriction, and `Det` is injective for the commutative semilocal `B(U_P^ab)`. This identifies its normalized components without using a comparison of `℧` with the arithmetic complex.

*Needs:* §6.26a; [6.29](#ne6-rw-logarithmic-integrality) (Ritter–Weiss logarithmic integrality criterion); [6.28](#ne6-rw-mobius-congruences) (The algebraic Möbius–Wall congruence); [3.13](#ne3-reduced-norm-sk1-comparison) (Reduced norms and the surviving `SK₁` ambiguity); [6.1](#ne6-abelian-case) (abelian pseudomeasures and their functoriality); TauCetiRoadmap PadicMeasuresIwasawaAlgebras Layer 3.

<a id="ne6-completed-zeta-canonical-descent"></a>
### 6.31 Descent of a completed zeta element to the canonical localization

**Comparison.** Let `A_G=Λ_O(G)`, with `G` one-dimensional pro-`p`, finite kernel over `Γ`, central open `Z≅ℤ_p` and `O` an unramified coefficient domain. Let `B_G` be the `p`-adic completion of the central-regular localization of `A_G`. If `b∈K₁(B_G)` has abelianized norms equal to the normalized abelian zeta functions `ζ_P`, then there is `ζ∈K′₁((A_G)_S)` with `θ_S(ζ)=(ζ_P)` and `∂ζ=−[C]`. In particular that tuple satisfies `M1`–`M4`. The result uses abelian main conjectures and arithmetic base change to impose its boundary; it does not identify the Ritter–Weiss refined class with `[C]`.

See Kakde, Lemma 85, pp.58–60; Theorems 52–53, p.36, proved pp.64–65; Proposition 93, pp.66–67 (arXiv v3): Completed image inclusion and integral `θ` lifting; the contraction/boundary patching above supplies the comparison. Ritter–Weiss 2011, §4, Lemma `e`, pp.13–14: The same equivariant permutation-basis argument over a central procyclic subgroup. Venjakob (comparison), §§1–2, pp.1–5; §6, Theorems 6.2–6.6, pp.18–22: Comparison of `A(G), B(G)` and the additive/multiplicative images; no unstated inverse completion map.

The hypotheses are as follows. `p` odd; finite-over-cyclotomic totally real `μ=0` setting; `A_G` and `C` as in the canonical main-conjecture criterion. The integral `θ`-isomorphism `K′₁(A_G)≅Φ`, the inclusion `θ̂(K₁(B_G))⊆Φ̂`, the surjective canonical localization boundary, and the abelian main conjectures with base change of `C` are available. All denominator sets and coefficient products are componentwise. For `Δ×G`, apply the argument to the unramified domains `O` in `ℤ_p[Δ]`.

*Proof.*

1. Choose `f∈K′₁((A_G)_S)` with `∂f=−[C]`, and representatives in `K₁` when mapping to `B_G`. The base-change boundary square and the abelian main conjecture give `u_P=ζ_P/θ_S(f)_P∈Λ_O(U_P^ab)^×`. Abelian semilocal `K₁` is its unit group, so this asserts integrality of the element and its inverse.
2. The ratio `b/f_B` has completed `θ`-image `u`, so `u∈Φ̂`. Prove the contraction `Φ̂∩∏_P Λ_O(U_P^ab)^×=Φ`. Put `R=O[[Z]]`, and `R̂` the `p`-completed localization of `R` at `R∖pR`. The map `R/p^n→R̂/p^n` is injective: a denominator nonzero modulo `p` is a non-zero-divisor successively on `p^i/p^{i+1}`. All rings in the `θ`-diagram are finite free over `R`.
3. For a trace condition let `W` act on `U_P^ab`, with `Z` embedded centrally. Its finite coset set `U_P^ab/Z` admits `W`-equivariant lifts: a coset stabilizer acts on a lift by a homomorphism to the torsion-free group `Z`, and its finite image must be zero. Choose lifts orbit by orbit. In this permutation `R`-basis the trace image on an orbit is generated by `|St_W(v)|` times the orbit sum. Thus trace membership is exactly coefficient divisibility by a power of `p`, which contracts under `R→R̂`; the same holds for `p` times the trace ideal. The embedding of `Z` is valid because `[U_P,U_P]` lies in the finite cyclotomic kernel.
4. `M1` and `M2` contract by injectivity. `M3` contracts by the preceding trace computation. `M4` contracts by that computation for `pT`, since the `α` and Frobenius products of integral units are integral. This proves the intersection, without inventing a map `B_G→(A_G)_S` or calling completed group units torsion.
5. Lift `u` to `z∈K′₁(A_G)` by the integral `θ`-isomorphism. Then `ζ=zf` has `θ`-image `ζ_P` and boundary `−[C]`. Its image under `θ_S` lies in `Φ_S` by the algebraic image theorem. Uniqueness is the separate main-conjecture criterion.

**Checks.**

- If `W` acts trivially with `|W|=p^a`, the trace ideal is exactly `p^a` times the ring; completion cannot weaken this modulus.
- For a free `W`-orbit the trace generator is its orbit sum with coefficient 1. No false divisibility by `|W|` is imposed.
- The lift `f` is generally not integral and `b` need not come from a canonical localized element by an inverse completion map. The correction `z` is integral because its entire tuple `u`, including inverses, is integral.

*Needs:* [6.15](#ne6-main-algebraic-theorems) (Kakde's congruence description of `K′₁`); [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`); [6.1](#ne6-abelian-case) (The main conjecture for abelian `×` prime-to-`p` Galois groups); [2.15](#ne2-boundary-surjective-p-torsion) (Surjectivity of `∂` for every compact `p`-adic Lie group); [4.5](#ne4-totally-real-iwasawa-complex) (The complex `C(F_∞/F)`); [4.7](#ne4-equivariant-perfect-base-change) (Perfection, torsion and derived arithmetic base change).

<a id="ne6-m4-from-basic-congruences"></a>
### 6.32 `M4` from Möbius congruences and canonical descent

**Lemma.** In the one-dimensional `Δ×`pro-`p`, odd-`p`, totally real `μ=0` setting, the normalized abelian zeta tuple satisfies `M4` in the canonical localization. This is proved through the full Möbius congruences, the independent Ritter–Weiss completed construction and §6.31. The branch through Kakde v3 Proposition 98 and Lemma 119 is replaced; it is not an assumption of this result.

See Ritter–Weiss 2011, Propositions 3, 5–6, pp.2–3; Theorem 7, p.4; §§4–6, pp.13–25: Independent completed multiplicative construction from full Möbius congruences, including torsion information. Kakde, Lemma 85, pp.58–60; Theorems 52–53, p.36 (arXiv v3): Algebraic image inclusion supplies `M4` after descent, independently of the rejected analytic (12).

The hypotheses are as follows. `p` odd; totally real extension finite over the cyclotomic tower; `S` contains `p` and all ramified primes. `μ=0`; abelian main conjectures, arithmetic base change and the corrected algebraic `θ`-image theorem; unramified coefficient factors treated separately.

*Proof.*

1. The analytic and algebraic full Möbius congruences feed the Ritter–Weiss logarithmic integrality/support-reduction proof. Its torsion correction yields `b∈K₁(B_G)` with `Det b=L`, without assuming any Kakde `M4` theorem for zeta functions.
2. Normalized abelian restriction identifies `θ̂_P(b)=ζ_P` for every `P`. Apply §6.31 to obtain `ζ∈K′₁(Λ_O(G)_S)` with that tuple and the required boundary.
3. The algebraic inclusion `θ_S(K′₁(Λ_O(G)_S))⊆Φ_S`, already proved independently of arithmetic congruences, gives `M4`. At nontrivial cyclic `P` it reads `α_P(ζ_P)/∏_{P′^p=P, P′≠P} φ(α_{P′}(ζ_{P′}))∈1+pT_{P,S}`. At `P=1` the numerator is `ζ_1^p/φ(ζ_1)`, rather than the nontrivial-character definition of `α_1`.
4. There is no dependency on §6.33 or §6.34 in the completed construction or descent comparison, so this route does not use the desired arithmetic `M4` to prove itself. No auxiliary-extension trace denominator is needed for this replacement.

**Checks.**

- The `C_{p²}×C_p` test in §6.25 excludes the old cyclic-overgroup sum. `M4` here follows from an actual completed multiplicative preimage and contraction of integral trace conditions.
- The special central `P=1` factor is retained, while scalar torsion is embedded with norm powers `[G:U_P]`.

*Needs:* [6.30](#ne6-rw-main-theorem) (Ritter–Weiss main theorem with `μ = 0`); [6.31](#ne6-completed-zeta-canonical-descent) (Descent of a completed zeta element to the canonical localization); [6.8](#ne6-congruence-group-phi) (The maps `θ^G` and the congruence subgroups `Φ^G, Φ^G_S`).

<a id="ne6-zeta-tuple-in-phi"></a>
### 6.33 The abelian zeta functions satisfy `M1`–`M4`

**Theorem.** For the original one-dimensional `Δ×`pro-`p` extension, the tuple `(ζ_P)` lies in `Φ_S: M1`–`M2` follow from interpolation and conjugation, `M3` from the index-`p` Möbius congruence, and `M4` from the completed construction and canonical descent. The same statement applies to the separate enlarged extension. The main conjecture for the canonical localization follows from the congruence criterion.

See Kakde, §6.1, Theorem 94, p. 67, with §6.13, pp. 86–90 (arXiv v3): Theorem 94 (`M1`–`M4`, whose `M4` display is a quotient, as the page image shows) and its proof assembled in §§6.2–6.13. Ritter–Weiss 2011, Theorem, p.1; Proposition 3, p.2; §§4–5, pp.13–22: Independent completed construction used in the replacement proof.

The hypotheses are as follows. The standing hypotheses `(B)` of this layer.

*Proof.*

1. Use §6.18 and §6.25 for `M1`–`M3`.
2. Use §6.32, with the replacement proof through §6.31, for `M4`.
3. Apply the independent algebraic §6.17. The separate §6.26 descent remains valid but is unnecessary for this Möbius-based argument.

**Checks.**

- This proves the statement of Kakde Theorem 94 by a different analytic branch; it does not validate Kakde's Proposition 98 or its fixed-pair cancellation (correction `E33`).

*Needs:* [6.18](#ne6-zeta-tuple-m1-m2) (The abelian zeta functions satisfy `M1` and `M2`); [6.25](#ne6-basic-congruences) (Analytic Möbius and index-`p` transfer congruences); [6.32](#ne6-m4-from-basic-congruences) (`M4` from Möbius congruences and canonical descent); [6.17](#ne6-main-conjecture-congruence-criterion) (The main conjecture as congruences between abelian zeta functions).

<a id="ne6-kakde-main-theorem"></a>
### 6.34 The main conjecture for totally real fields (Kakde)

**Theorem.** Let `p` be odd and `F_∞/F` an admissible `p`-adic Lie extension satisfying `μ = 0`, with `G = Gal(F_∞/F)`. There is a unique `ζ(F_∞/F) ∈ K′₁(Λ(G)_S)` with `∂(ζ(F_∞/F)) = −[C(F_∞/F)]` and `ζ(F_∞/F)(ρκ^r_F) = L_Σ(ρ, 1 − r)` for every Artin character `ρ` of `G` and every `r ≥ 1` divisible by `[F_∞(μ_p) : F_∞]` (Theorem 11). That is, `MC(F_∞/F)` of §5.5 holds.

See Kakde, §2.5, Theorem 11, p. 13 (arXiv v3); proof completed on p. 90: Theorem 11 is the statement; the proof here replaces the cyclic-overgroup analytic branch of Kakde's proof. Ritter–Weiss 2011, Propositions 3 and 6, pp.2–3; §§4–5, pp.13–22: Replacement analytic/completed proof in the dimension-one `p`-elementary case.

The hypotheses are as follows. `p` odd; `F_∞/F` admissible; `μ = 0` (Definition 8, known when `F_∞` is abelian over `ℚ` by Ferrero–Washington).

*Proof.*

1. Reduce to dimension one (§6.3), then to `ℚ_p`-elementary groups (§6.4).
2. The `l-ℚ_p`-elementary case for `l ≠ p` is §6.5; the `p-ℚ_p`-elementary case reduces to `Δ × G_p` with `G_p` one-dimensional pro-`p` (§6.6).
3. For `Δ×G_p` use the corrected algebraic `θ` theorem and the replacement full-Möbius/completed-descent proof of §6.33, directly for the original extension. The `K′₁`-injectivity hypotheses of the elementary reductions are §6.16; handle `ℤ_p[Δ]` in its unramified domain factors.
4. Uniqueness: two solutions differ by an element of `K′₁(Λ(G))` (`∂ = 0` and Corollary 90) with trivial evaluations, which is 1 by the diagram chases of the reductions.

**Checks.**

- The statement is that of Kakde Theorem 11, with `K′₁` as in §3.11; it is Kakde's `K′₁` when the explicit bijectivity hypothesis of §3.11, step 7 holds (§5.5, `kprime_normalization`). The analytic branch through Kakde's (12) is replaced by the Ritter–Weiss full Möbius construction (with the uniform smoothing lemma of §6.25) and the canonical-descent comparison of §6.31.
- The finite Whitehead inputs of §3.11 (proved there without Oliver's induction theorems; the explicit bijectivity hypothesis of §3.11, step 7 is not used on this route), the perfection of `C` (§4.5) and the earlier Ritter–Weiss logarithmic inputs (§6.29) enter as stated in those subsections.
- For `F_∞ = F_cyc` the theorem is Wiles's theorem (§6.1).

*Needs:* [6.33](#ne6-zeta-tuple-in-phi) (The abelian zeta functions satisfy `M1`–`M4`); [6.26](#ne6-enlarged-extension) (The auxiliary extension `F̃_∞` and the trace-ideal bound); [6.3](#ne6-reduction-to-dimension-one) (Burns's reduction to one-dimensional extensions); [6.4](#ne6-reduction-to-qp-elementary) (Reduction to `ℚ_p`-elementary Galois groups); [6.5](#ne6-l-elementary-case) (The `l-ℚ_p`-elementary case, `l ≠ p`); [6.6](#ne6-reduction-to-p-elementary) (Reduction of the `p-ℚ_p`-elementary case to `Δ ×` pro-`p`); [6.16](#ne6-k1-injects-localisation) (`K′₁(Λ_𝒪(G))` injects into `K′₁(Λ_𝒪(G)_S)`); [6.15](#ne6-main-algebraic-theorems) (Kakde's congruence description of `K′₁`); [6.1](#ne6-abelian-case) (The main conjecture for abelian `×` prime-to-`p` Galois groups); [5.5](#ne5-totally-real-main-conjecture) (The main conjecture for totally real fields).

<a id="ne6-rw2026-conditional-sk1-reduction"></a>
### 6.35 Conditional Ritter–Weiss `SK₁` reduction

**Theorem.** For odd `p`, the universal vanishing `SK₁(QG)=0` for the one-dimensional totally real Galois groups in Ritter–Weiss would follow if `SK₁(D_(r,s,F))=0` for every finite unramified `F/ℚ_p` and positive `r,s`. Here `O_m` is the integer ring of `F(ζ_(p^m)), A=O_r[[T]], B=O_(r+s)[[T]]`, and `D_(r,s,F)=(Frac(B)/Frac(A),g,1+T)`, with `g(ζ_(p^(r+s)))=ζ_(p^(r+s))^{1+p^r}`. Thus an element `u` satisfies `ub=g(b)u` and `u^{p^s}=1+T`. The source’s Theorem 1`A` is this reduction; it is not a proof of all the required `SK₁` vanishings. No unconditional uniqueness upgrade is exported.

See Ritter–Weiss 2026, Introduction, pp. 1–5; Theorem 1`A`, pp. 6–8: Gives the cyclic-algebra classification/reduction and explains that the vanishing argument is unfinished.

The hypotheses are as follows. `p` odd; `F/ℚ_p` finite unramified; `r,s≥1`; compatible `p`-power roots of unity. The vanishing for every displayed cyclic division algebra is a premise of the theorem.

*Proof.*

1. Use the Wedderburn-component classification of Ritter–Weiss 2026 (after Lau) to reduce to a matrix algebra over one of the listed cyclic division algebras.
2. Use Morita invariance of `K₁` and `SK₁` and product compatibility.
3. Normalize a unit exponent `m` prime to `p` by the automorphism `T↦(1+T)^m−1`. Do not replace the unresolved norm-one commutator problem by an asserted surjectivity claim.

**Checks.**

- The hypothesis is a family of `SK₁` vanishing assertions, not merely a single split-matrix calculation.
- The parameter change with `m=1` is the identity; a prime-to-`p m` has the inverse exponent `1/m` in `ℤ_p`.
- The statement supplies no result at `p=2`.

*Needs:* [3.13](#ne3-reduced-norm-sk1-comparison) (Reduced norms and the surviving `SK₁` ambiguity); [3.11](#ne3-k1-prime) (`sk1_semisimple_padic`); §F.0; GeneralAlgebraicKTheory §8.1.

<a id="ne6-unconditional-abelian-minus-main-theorem"></a>
### 6.36 Unconditional abelian minus main theorem

**Theorem.** Let `H/F` be finite abelian CM with `F` totally real, `p` odd, `H∞/H` cyclotomic and `G=Gal(H∞/F)`. Let `S,T` be disjoint finite sets with `S∞∪S_p⊆S, S_ram⊆S∪T` and `Hyp_p^T: T` is not contained in `S_ram` and `H` has no nontrivial `p`-power root of unity congruent to 1 above every place of `T∖S_ram`. Then over `R=ℤ_p[[G]]^−` the source’s covariantly dualized smoothed Selmer module `M=Sel_S^T(H∞)_p^−` has `Fitt_R(M)=(Θ_S^T)`, and admits an injective square finite-free presentation (hence projective dimension at most one). No `μ=0` premise is used. Its comparison with the abstract Picard module’s Pontryagin dual is unconditional; identifying that dual with the `ℤ_p`-dual of the Tate module uses `μ=0`.

See Gambheera–Popescu, Theorems 6.28 and 6.30, pp. 33–34; Proposition 7.10, p. 37 (arXiv v1); published Theorem 1.12: The actual unconditional result is a smoothed abelian minus Fitting theorem; the Tate-module comparison retains a separate `μ=0` hypothesis.

The hypotheses are as follows. Exactly the field, parity and `S,T` conditions in the statement; complex conjugation defines the minus idempotent `(1−j)/2`. The source uses the covariant action `(g f)(x)=f(gx)` on duals, not an unrecorded contragredient convention.

*Proof.*

1. The finite-level smoothed Selmer modules, their presentations and compatible restriction maps (Gambheera–Popescu §§2–5) are part of this target; the covariant dual action and the `S, T` conditions are those of the statement. The Iwasawa cohomology and duality they use are §F.4.
2. Apply Theorem 6.28 at every finite layer; Proposition 3.16 and Lemma 4.7 pass the Fitting ideals and the specified `Θ` elements to the inverse limit.
3. Use Proposition 4.6’s nonzero-divisor `Θ` and Proposition 4.9 over the semilocal Iwasawa ring to obtain an injective square presentation.
4. Use Proposition 7.10’s diagram to identify the Pontryagin dual; invoke `μ=0` only for the further Tate-module comparison.

**Checks.**

- The idempotent `(1−j)/2` requires odd `p`; it is not an integral two-primary construction.
- A finite-level theorem allowing fewer `p`-adic places in `S` does not remove `S_p⊆S` from the Iwasawa theorem.
- The theorem cannot remove `μ=0` from the nonabelian Kakde or Ritter–Weiss statements.

*Needs:* §F.4; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §§4.2, 5.1; Tau Ceti `fittingIdeal`; [5.8](#ne5-abelian-normalization-comparison) (Normalized abelian determinant comparison).

### Examples

- Carry inverses in the twisted group ring (Worked examples, example 4).
- Cyclic overgroups retain multiplicities, and the full stabilizer Möbius sum for `C₃²` at `r = 2` is 486, divisible by 9 (Worked examples, examples 7 and 8).
- For `Ḡ = C_p, ψ^G_R = pR × {b : b has no identity coefficient}` and `β` is a bijection onto it (§6.9).

### Dependencies

Layers 0–5 of this roadmap; the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; §F.0; GeneralAlgebraicKTheory §8.1; TauCetiRoadmap ClassicalArithmeticCompletion Layer 7; RepresentationTheory`/`InductionRestriction Layers 5–6; Tau Ceti `twistedMonoidAlgebra`; §F.5; the finite-Hecke/Artin and Dedekind comparisons in Exact supplier contracts; §F.4; Mathlib `MonoidHom.transfer`, `ConjClasses`, `Algebra.norm`, `Algebra.trace`, `Abelianization`.

## Layer 7: Descent, leading terms and Fitting invariants

The construction starts from the Bockstein complex and its acyclicity after rationalization, defines the Bockstein trivialization and the leading term, states the conditional arithmetic interpolation formulas on correctly shifted complexes, and develops noncommutative Fitting invariants over admitted orders. Local exceptional factors and global semisimplicity are separate inputs. Modules `TauCeti/NumberTheory/NoncommIwasawa/LeadingTerms`, `.../TateMotive`, `.../CriticalMotives` and `.../Layer7`.

<a id="ne7-bockstein-homomorphism"></a>
### 7.1 Bockstein homomorphisms

**Construction.** Let `θ ∈ H^1(G, ℤ_p) = Hom_cont(G, ℤ_p)` be `G ↠ Γ → ℤ_p` with `γ ↦ 1`; it corresponds to the extension `0 → ℤ_p → E_θ → ℤ_p → 0` with `E_θ = ℤ_p²` and `G` acting by (`1 θ`; 0 1), which gives `θ : A· → A·[1]` in `D^b(Λ(G))`. The Bockstein morphism in degree `i` is `B_i = H^{−i}(θ_*) : Tor_i^{Λ(G)}(T_ρ, A·) → Tor_{i−1}^{Λ(G)}(T_ρ, A·)`, with `T_ρ = 𝒪^n` a right module through `ρ^t`. For `G = Γ`, the triangle `A· --T--> A· → ℤ_p ⊗^L A·` gives `0 → H^i(A·)_Γ …` exact sequences (3), and `B_i` is the composite `H_i(Γ, A·) → H^{−i+1}(A·)^Γ --κ--> H^{−i+1}(A·)_Γ → H_{i−1}(Γ, A·)`, with `κ` induced by the identity (Lemma 3.1); so `(H_·(Γ, A·), B_·)` is a complex (4).

See Burns–Venjakob, §§3.1–3.2, Lemma 3.1, pp. 7–9 (arXiv v2): §3.1, the definition of `θ` and `B_i`; §3.2, the `cone`, the sequences (3) and Lemma 3.1.

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite.

*Construction.*

1. `E_θ ∈ Ext^1_{Λ(G)}(ℤ_p, ℤ_p) ≅ H^1(G, ℤ_p)` (NSW 5.2.14); tensoring `A·` with it gives the triangle defining `θ`. Construct `cupTheta` from this continuous extension by the derived tensor action, and prove functoriality and compatibility with coefficient extension before computing connecting maps on a projective model; specifying an arbitrary degree-one map would not fix its sign.
2. Lemma 3.1: with `cone(A·) = cone(T)` and the quasi-isomorphism `π : cone(A·) → A·_0, θ` is `(a, b) ↦ (b, 0)` (Schneider); for a cycle `ā` lift to `(a, b)` with `b = −T^{−1}d(a)`, and the class maps to `−T^{−1}d(a)`, which is the stated composite.

API: `thetaClass` (`θ ∈ Hom_cont(G, ℤ_p)` from the generator `γ`); `cupTheta` (`θ : A· → A·[1]` in `D^b(Λ(G))`); `bockstein` `(B_i : Tor_i(T_ρ, A·) → Tor_{i−1}(T_ρ, A·))`; `bockstein_eq_kappa` (Lemma 3.1: for `G = Γ, B_i` factors through `κ : H^{−i+1}(A·)^Γ → H^{−i+1}(A·)_Γ`); `bockstein_sq` (`B_{i−1} ∘ B_i = 0`, so `(H_·, B_·)` is a complex).

**Checks.**

- `two_term_T`: `A· = [Λ(Γ) --T--> Λ(Γ)]` in degrees `−1, 0: H_1 = H_0 = ℤ_p` and `B_1 = −1` (proof of Proposition 3.8).
- `acyclic_after_T`: If `T` acts invertibly on `H^·(A·)` the Bockstein complex is 0.
- `square_zero_extension`: `A· = [Λ² --((T,1),(0,T))--> Λ²]` has `H^0 = Λ/T²` and `κ = 0`, so `B_1 = 0` on `H_1 = H_0 = ℤ_p` (correction `E11`).
- The mapping-`cone` sign convention is BV's: `d_cone =` (`d_B f`; `0 −d_A`).

*Needs:* [0.15](#ne0-iwasawa-group-homology) (compact group homology); [3.1](#ne3-twist-homomorphism) (the twist `Φ_ρ`); TauCetiRoadmap ProfiniteCohomology (continuous cochains and cup products); §F.2; [1.1](#ne1-canonical-ore-set) (The canonical Ore set `S`).

<a id="ne7-semisimple-complexes"></a>
### 7.2 Semisimple complexes and the order `r(ρ)`

**Definition.** `A· ∈ C^p(Λ(Γ))` is semisimple if the Bockstein complex `(H_·(Γ, A·), B_·)` has `ℤ_p`-torsion (hence finite) cohomology; `Σ^{ss}` is the full subcategory of such complexes, and `r_Γ(A·) = Σ_i (−1)^{i+1} dim_{ℚ_p}(H^i(A·)^Γ ⊗ ℚ_p)` (Definition 3.2). Semisimple complexes have `Λ(Γ)`-torsion cohomology, and `A· ∈ Σ^{ss}` iff `κ_i ⊗ ℚ_p` is bijective in every degree, in which case `r_Γ(A·) = Σ(−1)^{i+1} dim H^i(A·)_Γ ⊗ ℚ_p` (Remark 3.3). For general `G: A·` is semisimple at `ρ` if `(H_·(G, A·(ρ^*)), B_·)` has `ℤ_p`-torsion cohomology (Definition 3.11), finite at `ρ` if `H_·(G, A·(ρ^*))` is `ℤ_p`-torsion (Definition 3.12, so `Σ^{fin−ρ} ⊆ Σ^{ss−ρ}`), and `r_G(A·)(ρ) = Σ(−1)^{i+1} dim_L(H_i(H, A·(ρ^*))^Γ ⊗_𝒪 L)`. Here `H_i(H,B)=H^{−i}(𝒪⊗^L_{𝒪[[H]]}B)` is hyperhomology. `A·` is semisimple at `ρ` iff `A·_ρ = (Λ_𝒪(Γ) ⊗ 𝒪^n) ⊗^L A·` is semisimple, with the same Bockstein maps and `r_G(A·)(ρ) = r_Γ(A·_ρ)` (Lemma 3.13). Over a discrete valuation ring `R` with uniformizer `T`, a semisimple bounded perfect complex is isomorphic in the derived category to a finite direct sum of `[R --1--> R]` and `[R --T--> R]`, placed in arbitrary adjacent degrees (Lemma 3.9).

See Burns–Venjakob, §3.2, Definition 3.2 and Remark 3.3, p. 9; §3.3, Definitions 3.11–3.12, Lemma 3.13; Lemma 3.9 (arXiv v2): Definitions 3.2, 3.11, 3.12, Remark 3.3, Lemmas 3.9 and 3.13.

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite.

*Construction.*

1. Remark 3.3(ii): Lemma 3.1 gives `0 → cok(κ_{−i}) → ker B_i/im B_{i+1} → ker(κ_{−i+1}) → 0`.
2. Lemma 3.9: `T` kills `H^·(A·)`; split off `[R^d --H--> R^d]` with `H` diagonal in `{1, T}` from the top degree and induct on length.
3. Lemma 3.13: `𝒪^n ⊗^L_{Λ(G)} A· ≅ 𝒪 ⊗^L_{Λ_𝒪(Γ)} A·_ρ`, and `Λ_𝒪(Γ) ⊗^L_{Λ(G)} A· ≅ 𝒪 ⊗^L_{Λ(H)} A·`; the Bockstein map is functorial.

API: `IsSemisimple` (The Bockstein complex has `ℤ_p`-torsion cohomology); `IsSemisimpleAt` (Semisimple at `ρ` (Definition 3.11)); `IsFiniteAt` (Finite at `ρ` (Definition 3.12)); `orderAt` `(r_G(A·)(ρ) ∈ ℤ)`; `isSemisimple_iff_kappa` (`κ_i ⊗ ℚ_p` bijective in every degree); `IsFiniteAt.isSemisimpleAt` (`Σ^{fin−ρ} ⊆ Σ^{ss−ρ}`); `isSemisimpleAt_iff_twist` (Lemma 3.13: reduction to `Λ_𝒪(Γ)` and `A·_ρ`); `semisimple_dvr_decomposition` (Lemma 3.9 over a discrete valuation ring).

**Checks.**

- `two_term_T`: `[Λ --T--> Λ]` in degrees `−1,0` is semisimple with `r_Γ = −1`; shifting once changes `r_Γ` to `+1`.
- For `G=H×Γ=ℤ_p²`, `A=Λ(G)/(γ−1)` in degree zero and `ρ=1`, derived `H`-coinvariants are `ℤ_p` in degree zero, so `r_G=−1`. Continuous `H`-cohomology instead lies in degree one and would give the wrong sign `+1`.
- `finite_at_trivial`: `[Λ --f--> Λ]` with `f(0) ≠ 0` is finite at `ρ_triv`, with `r = 0`.
- `square_zero_extension`: `[Λ² --((T,1),(0,T))--> Λ²]` is an extension of two copies of `[Λ --T--> Λ]` but is not semisimple (correction `E11`).
- `acyclic`: An acyclic complex is finite at every `ρ`, with `r = 0`.
- `Σ^{ss}` and `Σ^{ss−ρ}` satisfy (i)–(iii) and (iv′) but not (iv): they are not closed under extensions (correction `E11`).

*Needs:* [7.1](#ne7-bockstein-homomorphism) (Bockstein homomorphisms); [2.7](#ne2-localized-k1) (The localized `K₁` of Fukaya and Kato).

<a id="ne7-canonical-trivialization"></a>
### 7.3 The Bockstein trivialisation `t(A·)`

**Construction.** For `A· ∈ Σ^{ss}, t(A·) : d_{ℤ_p}(ℤ_p ⊗^L_{Λ(Γ)} A·)_{ℚ_p} ≅ d((H_·(Γ, A·), 0))_{ℚ_p} = d((H_·(Γ, A·), B_·))_{ℚ_p} ≅ 1_{ℚ_p}`, using property `h`) and then `e`) for the acyclic rational Bockstein complex (Definition 3.4, (5)). If `ℚ_p ⊗^L A·` is already acyclic, `t(A·)` is the acyclicity trivialisation (Remark 3.5). For an exact triangle `A· → B· → C·` of semisimple complexes, `r_Γ(B·) = r_Γ(A·) + r_Γ(C·)` and `t(B·) = t(A·)t(C·)` (Lemma 3.6). For general `G, t(A·(ρ^*))` is the same composite (7) for `𝒪 ⊗^L_{Λ_𝒪(G)} A·(ρ^*)`, equal to `t(A·_ρ)` (Lemma 3.13).

See Burns–Venjakob, §3.2, Definition 3.4, Remark 3.5 and Lemma 3.6, pp. 9–10; (7) in §3.3 (arXiv v2): Definition 3.4 with (5), Remark 3.5, Lemma 3.6, and (7).

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite.

*Construction.*

1. Definition: the rational Bockstein complex is acyclic by semisimplicity, so `e`) trivialises it; `h`) identifies `ℤ_p ⊗^L A·` with its cohomology complex.
2. Lemma 3.6, stated without proof in the source: the long exact sequence of the triangle is compatible with the Bockstein maps, so the alternating determinants multiply; ranks add.
3. Lemma 3.13(iii) transports Lemma 3.6 along `A· ↦ A·_ρ`.

API: `bocksteinTrivialization` `(t(A·) : d(ℤ_p ⊗^L A·)_{ℚ_p} ≅ 1)`; `bocksteinTrivialization_of_acyclic` (Remark 3.5: the acyclicity trivialisation when `ℚ_p ⊗^L A·` is acyclic); `bocksteinTrivialization_triangle` (Lemma 3.6: `t(B·) = t(A·)t(C·)` and `r` adds); `bocksteinTrivialization_twist` `(t(A·(ρ^*)) = t(A·_ρ))`.

**Checks.**

- `acyclic`: `ℚ_p ⊗^L A·` acyclic: `t(A·)` is the acyclicity isomorphism.
- `two_term_T`: `[Λ --T--> Λ]: t` is the inverse of the Bockstein `B_1 = −1` on `ℚ_p` (proof of Proposition 3.8).
- For `[Λ --pT→Λ]` in degrees `−1,0` with the identity determinant trivialization, `B₁=−p`, `t=−p⁻¹`, and the leading term is `p⁻¹`. Its shift has reciprocal trivialization.
- `triangle_additivity`: For `[Λ --T--> Λ] ⊕ [Λ --T--> Λ], t` is the product of the two trivialisations and `r = −2`.
- Lemma 3.6 is stated without proof in the source; its proof is part of this target.

*Needs:* [7.2](#ne7-semisimple-complexes) (Semisimple complexes and the order `r(ρ)`); [7.1](#ne7-bockstein-homomorphism) (Bockstein homomorphisms); GeneralAlgebraicKTheory §§5.7, 6.3, 6.19.

<a id="ne7-leading-term"></a>
### 7.4 The leading term at a representation

**Definition.** For `A· ∈ Σ^{ss−ρ}` and `a : 1_{Λ(G)} → d_{Λ(G)}(A·)`, the leading term `(A·, a)^*(ρ) ∈ L^×` is `(−1)^{r_G(A·)(ρ)}` times the element of `L^× ≅ K_1(L) ≅ Aut(1_L)` given by `1_L --L^n ⊗ a--> d_L(L^n ⊗^L_{Λ(G)} A·) --t(A·(ρ^*))--> 1_L` (Definition 3.14; for `G = Γ` and `ρ = ρ_triv`, Definition 3.7). It gives a homomorphism `(−)^*(ρ) : K_1(Λ(G), Σ) → L^×` on subcategories `Σ ⊆ Σ^{ss−ρ}` with (i)–(iii), (iv′). If `A· ∈ Σ^{fin−ρ}`, the leading term is the value `[A·, a](ρ)` in the sense of Fukaya–Kato 4.1.5 (Remark 3.15).

See Burns–Venjakob, §3.3, Definition 3.14 and Remark 3.15, pp. 14–15; Definition 3.7, p. 10 (arXiv v2): Definitions 3.7 and 3.14 and Remark 3.15.

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite.

*Construction.*

1. Well defined on `K_1(Λ(G), Σ)`: relations (1) and (2) are respected by Lemma 3.13(iii) and Lemma 3.6, relation (0) trivially.
2. Compatibility of Definitions 3.7 and 3.14 for `G = Γ, ρ = ρ_triv` is immediate.

API: `leadingTerm` `((A·, a)^*(ρ) ∈ L^×)`; `leadingTermHom` (`(−)^*(ρ) : K_1(Λ(G), Σ) → L^×` for `Σ ⊆ Σ^{ss−ρ}`); `leadingTerm_mul` (Multiplicative on the relations of `K_1(Λ(G), Σ)`); `leadingTerm_eq_value` (Remark 3.15: the Fukaya–Kato value when `A·` is finite at `ρ`); `leadingTerm_shift` (For `a:1→d(A)`, transport its monoidal inverse `a^⊗⁻¹:1→d(A)⁻¹` to `d(A[1])`. The resulting pair has `r` negated, inverse characteristic function and inverse leading term. This is not the composition inverse `a⁻¹:d(A)→1`).

**Checks.**

- `pole_case`: `A· = [Λ --T--> Λ]`, trivialisation `a_ε`: leading term `ε(0), r = −1` (Proposition 3.8).
- `zero_case`: Its shift has `r = +1` and leading term `ε(0)^{−1}`: a vanishing case with its Bockstein determinant.
- `finite_case`: For `C=[Λ --f→Λ]` in degrees `−1,0, f(0)≠0` and the identity determinant trivialization, `r=0` and the leading term is exactly `f(0)⁻¹`. A different trivialization must be specified to introduce a unit factor.
- `not_semisimple`: The square-zero extension of correction `E11` is not semisimple, so no leading term is defined for it.
- BV define `(−)^*(ρ)` on `K_1(Λ(G), Σ_{A·})` and claim `Σ_{A·} ⊆ Σ^{ss−ρ}`; that inclusion fails for the extension-closed `Σ_{A·}` (correction `E11`), so the domain is taken with (iv′).

*Needs:* [7.3](#ne7-canonical-trivialization) (The Bockstein trivialisation `t(A·)`); [7.2](#ne7-semisimple-complexes) (Semisimple complexes and the order `r(ρ)`); [2.7](#ne2-localized-k1) (The localized `K₁` of Fukaya and Kato).

<a id="ne7-leading-term-characteristic-series"></a>
### 7.5 Leading terms as leading coefficients of characteristic series

**Theorem.** Let `L = [A·, a]` with `A· ∈ Σ^{ss}` for `G = Γ`, and `ch_Γ : K_1(Λ(Γ), Σ^{ss}) → K_1(Q(Γ)) = Q(Γ)^×`. Writing `F = T^rG(T)` with `G(0) ∈ L^×` (6), (i) `r(ch_Γ(L)) = r_Γ(A·)`, and (ii) `(−)^*(ρ_triv) = (−)^*(0) ∘ ch_Γ`, where `F^*(0) = G(0)` (Proposition 3.8). The same holds with `𝒪, L, Λ_𝒪(Γ)` and `Q_𝒪(Γ)` (Remark 3.10).

See Burns–Venjakob, §3.2, Proposition 3.8 and Remark 3.10, pp. 11–12 (arXiv v2): Proposition 3.8 with its proof via Lemma 3.9, and Remark 3.10.

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite.

*Proof.*

1. Both maps factor through the localisation `R = Λ(Γ)_𝔭` at the augmentation ideal, a discrete valuation ring with uniformizer `T` and residue field `ℚ_p`, and `K_1(R, Ξ)` for the semisimple complexes `Ξ` over `R`.
2. Lemma 3.9 reduces to `A· = [R --a--> R]` with `a = 1` or `T`; the acyclic case is trivial.
3. For `a = T` and the trivialisation `a_ε (ε ∈ R^×): ch_Γ(L_ε) = T^{−1}ε`, so `ch_Γ(L_ε)^*(0) = ε(0)`. The Bockstein `B_1` is `ℤ_p --(−1)--> ℤ_p`, so the composite in the definition is `ℚ_p --ε(0)--> ℚ_p --(B_1)^{−1} = −1--> ℚ_p`, of determinant `−ε(0)`; with `r_Γ(A·) = −1 = r(ch_Γ(L_ε))` the sign `(−1)^{−1}` gives `L_ε^*(ρ_triv) = ε(0)`.

**Checks.**

- `laurentOrder`, `laurentLeadingCoefficient`: `Q_O(Γ)` embeds in `L((T))`; for nonzero `F` write `F = T^r u` with `u` regular and nonzero at 0, and put `ord_T F = r, F^*(0) = u(0)`. For `F = 3T⁻²(1+T), ord_T F = −2` and `F^*(0) = 3`; for `F = 1` the order is 0 and `F^*(0) = 1`; for `F = T` and `T⁻¹` the orders are 1 and `−1` and both leading coefficients are 1; `F = 0` is outside the domain.
- For `A· = [Λ --T→ Λ]` with trivialization `a_ε` the order is `−1` and the leading term is `ε(0)` (§7.4, `pole_case`); `ch_Γ = T⁻¹ε` has the same order and leading coefficient.

*Needs:* [7.4](#ne7-leading-term) (The leading term at a representation); [7.2](#ne7-semisimple-complexes) (Semisimple complexes and the order `r(ρ)`); [2.7](#ne2-localized-k1) (The localized `K₁` of Fukaya and Kato); [2.14](#ne2-commutative-cyclic-comparison) (The commutative one-variable case).

<a id="ne7-leading-term-canonical-localization"></a>
### 7.6 Leading terms on the canonical localisation

**Theorem.** For `A· ∈ Σ_{S*} ∩ Σ^{ss−ρ}` and `ch_{G,A·} : K_1(Λ(G), Σ_{A·}) → K_1(Λ(G)_{S*})`, let `ρ_* : K_1(Λ(G)_{S*}) → K_1(M_n(Q_𝒪(Γ))) ≅ Q_𝒪(Γ)^×` be induced by `g ↦ ρ(g)ḡ`. Then (i) `r_G(A·)(ρ) = r_Γ(A·_ρ) = r(ρ_*(ch_{G,A·}(A·)))`, and (ii) `(−)^*(ρ) = (ρ_*(−))^*(0) ∘ ch_{G,A·}` (Proposition 3.16). Accordingly `F^*(ρ) := ρ_*(F)^*(0)` for `F ∈ K_1(Λ(G)_{S*})`, and `F(ρ) := F^*(ρ)` when `r(ρ_*(F)) = 0`.

See Burns–Venjakob, §§3.4.1–3.4.2, Proposition 3.16, pp. 15–16 (arXiv v2): The canonical Ore sets, `ch_{G,A·}, ρ_*` and Proposition 3.16 with its proof.

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite. `S, S*` the canonical Ore sets of CFKSV.

*Proof.*

1. (i) from Lemma 3.13(i), `H_i(H, A·(ρ^*)) = H^{−i}(A·_ρ)`, and Proposition 3.8.
2. (ii) by composing the square `(Λ_𝒪(Γ) ⊗ 𝒪^n) ⊗ −` over `ch` with the square of Proposition 3.8, as in Fukaya–Kato Lemma 4.3.10.

**Checks.**

- `F(ρ)` agrees with CFKSV's evaluation at `ρ` (§3.3) when `r = 0`.
- The domain `K_1(Λ(G), Σ_{A·})` is taken with (iv′), as in §7.4 (correction `E11`).

*Needs:* [7.5](#ne7-leading-term-characteristic-series) (Leading terms as leading coefficients of characteristic series); [7.4](#ne7-leading-term) (The leading term at a representation); [1.10](#ne1-saturated-ore-set) (The saturated Ore set `S*`); [3.3](#ne3-artin-evaluation) (Evaluation of `K₁`-elements at representations); [2.7](#ne2-localized-k1) (The localized `K₁` of Fukaya and Kato).

<a id="ne7-partial-derivative-interpretation"></a>
### 7.7 Leading terms as derivatives in the cyclotomic direction

**Lemma.** Fix `χ : G ↠ Γ → ℤ_p^×` of infinite order, `c_{χ,γ} = log_p(χ(γ)) ∈ ℚ_p^×, L = [A·, a]` with `A· ∈ Σ_{S*}, f_ρ(T) = ρ_*(ch_{G,A·}(L)) ∈ Q_𝒪(Γ)^×`, and `f_L(ρχ^s) = f_ρ(χ(γ)^s − 1)`, a `p`-adic meromorphic function of `s ∈ ℤ_p`. With `r = r_G(A·)(ρ)`: (i) near `0, L^*(ρχ^s) = L(ρχ^s) = f_L(ρχ^s)` for `s ≠ 0`; (ii) `c_{χ,γ}^r L^*(ρ)` is the leading coefficient at `s = 0` of `f_L(ρχ^s)`; (iii) if `r ≥ 0, c_{χ,γ}^r L^*(ρ) = (1/r!)(d^r/ds^r) f_L(ρχ^s)|_{s=0}` (Lemma 3.17). For `χ = κ_Γ` this is partial derivation in the cyclotomic direction (Remark 3.18).

See Burns–Venjakob, §3.4.3, Lemma 3.17 and Remark 3.18, pp. 16–17 (arXiv v2): Lemma 3.17 with its proof and Remark 3.18.

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite. The perfect complex A underlying `𝓛` lies in `Σ_(ss−ρ)`, so `r=r_G(A)(ρ)` is the Laurent order and the Bockstein leading term exists. For a bare scalar `f` the substitution argument instead uses `r=ord_T(f)`, without asserting an arithmetic determinant comparison.

*Proof.*

1. Near `0, f_{ρχ^s}(0) ∈ L^×` for `s ≠ 0` and `f_{ρχ^s}(T) = f_ρ(χ(γ)^s(T + 1) − 1)`, so Proposition 3.16 gives (i).
2. Factor `f_ρ = T^rG_ρ` with `G_ρ(0) = f_ρ^*(0)`; then `f_ρ(χ(γ)^s − 1)/s^r = ((χ(γ)^s − 1)/s)^rG_ρ(χ(γ)^s − 1) → log_p(χ(γ))^rG_ρ(0)`.

**Checks.**

- For `f(T)=T`, substitution by `κ_Γ(γ)^s−1` gives derivative `c_γ`. Its reciprocal has a pole with leading coefficient `c_γ⁻¹`.
- Replacing `γ` by `γ^a`, with `a∈ℤ_pˣ`, multiplies `c_γ` by `a`; the Laurent leading coefficient scales by `a^r`, also when `r<0`.

- For `r < 0` only the leading-coefficient statement (ii) holds.

*Needs:* [7.6](#ne7-leading-term-canonical-localization) (Leading terms on the canonical localisation).

<a id="ne7-generalized-euler-characteristic"></a>
### 7.8 Generalized Euler–Poincaré characteristics

**Theorem.** For `A· ∈ Σ^{ss−ρ}`, put `H^i_B(G, −) = H^i((H_{−·}(G, −), B_{−·})), χ_add(G, A·(ρ^*)) = Σ_i (−1)^i length_𝒪 H^i_B(G, A·(ρ^*))` and `χ_mult =` (#`κ_L`)`^{χ_add}`. For any trivialisation a and `L = [A·, a]: χ_add(G, A·(ρ^*)) = ord_L(L^*(ρ))` and `χ_mult(G, A·(ρ^*)) = |L^*(ρ)|_p^{−[L:ℚ_p]}` (Proposition 3.19). The Pontryagin dual of the Hochschild–Serre differentials used by Coates–Schneider–Sujatha and others is the Bockstein map, and when `A·(ρ^*) ⊗ ℚ_p` is acyclic this recovers CFKSV Theorem 3.6, Venjakob Proposition 6.3 and Fukaya–Kato Remark 4.1.13 (Remark 3.20).

See Burns–Venjakob, §3.5, Proposition 3.19 and Remark 3.20, pp. 17–18 (arXiv v2): The definitions of `χ_add, χ_mult`, Proposition 3.19 and Remark 3.20.

The hypotheses are as follows. `G` is a compact `p`-adic Lie group with a closed normal `H` and `Γ = G/H ≅ ℤ_p`, with a fixed generator `γ` and `T = γ − 1`; `ρ : G → GL_n(𝒪)` is continuous, `𝒪 = 𝒪_L` for `L/ℚ_p` finite.

*Proof.*

1. Lemma 3.13, property `h`) and regularity of `𝒪` give `1_𝒪 → d_𝒪(𝒪^n ⊗^L A·) ≅ ∏_i d_𝒪(H^i_B(G, A·(ρ^*)))^{(−1)^i}`.
2. After `⊗L` and acyclicity, the leading term is, modulo `𝒪^×`, the product of the elements attached to the finite modules `H^i_B`, whose valuations are their lengths (Remark 2.4).

**Checks.**

- When `A·` is finite at `ρ` the valuation of the value is the Euler characteristic, recovering CFKSV Theorem 3.6 (§3.6).
- For `A· = [Λ --T→ Λ]` at `ρ = 1`, the Bockstein `B_1 = −1` is an isomorphism, so all Bockstein cohomology vanishes and `χ_add = 0 = ord(ε(0))` for a trivialization `a_ε` with `ε ∈ Λ(Γ)^×`.

*Needs:* [7.4](#ne7-leading-term) (The leading term at a representation); GeneralAlgebraicKTheory §§5.7, 6.3, 6.19; [3.6](#ne3-euler-characteristic-evaluation) (Characteristic elements compute twisted Euler characteristics).

<a id="ne7-fukaya-kato-zeta-isomorphism"></a>
### 7.9 The Fukaya–Kato global zeta isomorphism (as a proposition)

**Definition.** For `p` odd, `U = Spec ℤ[1/S]` with `S` finite containing `p`, infinity and every prime ramified in `F_∞/ℚ` or in `T_p`, a motive `M` over `ℚ` with a `G_ℚ`-stable lattice `T_p` of `M_p, F_∞/ℚ` a finitely ramified Galois `p`-adic Lie extension with `G = Gal(F_∞/ℚ)`, and `𝕋 = Λ(G) ⊗ T_p` with the diagonal action `g(x ⊗ y) = xḡ^{−1} ⊗ gy`: the conjecture (Fukaya–Kato 2.3.2) asserts a unique isomorphism `ζ_Λ(M) : 1_Λ → d_Λ(RΓ_c(U, 𝕋))^{−1}` in `𝒞_Λ` whose base change along every motivic `ρ : G → GL_n(𝒪_λ)` is the composite of `ζ_K(M(ρ^*))_{K_λ} : 1 → Δ_K(M(ρ^*))_{K_λ}` with the `p`-adic period-regulator `ϑ_λ`, where `ζ_K(M(ρ^*))` is the isomorphism matching `L^*_K(M(ρ^*))` through the period-regulator `ϑ_∞` on the fundamental line `Δ_K(M) = d(H^0_f(M))^{−1}d(H^1_f(M))d(H^0_f(M^*(1))^*)d(H^1_f(M^*(1))^*)^{−1}d(M_B^+)d(t_M)^{−1}` (Conjecture 4.1). It implies the equivariant Tamagawa number conjecture of Burns–Flach. This is a conjectural proposition. The conditional Tate/critical-motive targets explicitly assume its existence and use the typed shift construction below before taking a leading term. Put `C=RΓ_c(U,𝕋)` and `D=C[1]`. The determinant shift isomorphism `s_C:d(D)≅d(C)⁻¹` defines `ζ_D=s_C⁻¹∘ζ:1→d(D)`. If `C` is semisimple at `ρ`, the global leading term means `[D,ζ_D]^*(ρ)`; it is not `[C,ζ]`. Its order is `r(D)=−r(C)`, its boundary is `∂ch[D,ζ_D]=−[D]=[C]`, and `t(D)` is the monoidal inverse of `t(C)` under `s_C`. Monoidal inversion sends `d(C)→1` to `d(C)⁻¹→1`; it is distinct from reversing the arrow of a morphism.

See Burns–Venjakob, §4, (8)–(14) and Conjecture 4.1, pp. 18–21 (arXiv v2): §§4.1–4.3: compactly supported cohomology, the fundamental line, the period-regulators, and Conjecture 4.1 (Fukaya–Kato 2.3.2). Burns–Venjakob, §2.1 determinant shift/triangle properties, pp. 4–5; Lemma 3.6, p. 10; Conjecture 4.1, pp. 20–21: The shift comparison follows from the determinant axioms; it corrects the typing in Remark 5.6 (correction `E28`), not the statement of Conjecture 4.1.

The hypotheses are as follows. `p` odd; the finiteness of motivic cohomology, `ϑ_∞` and `ϑ_λ` are themselves conjectural inputs (standard conjectures).

*Construction.*

1. Definitions only: `RΓ_c(U, 𝕋)` is perfect over `Λ(G)` (Fukaya–Kato; Layer 4), and the base change is property `i`) of the determinant functor.
2. Use the exact triangle `C→0→C[1]` and determinant multiplicativity to construct `s_C`. Shift preserves semisimplicity and negates `r`. The same triangle and BV Lemma 3.6 identify `t(D)` with the monoidal inverse of `t(C)`. This gives a typed composite `1→d(C)⁻¹→1` without replacing `ζ` by its monoidal inverse. The boundary follows from `∂ch[A,a]=−[A]`.
3. For a trivialization `a:1→d(C)`, let `a^⊗⁻¹:1→d(C)⁻¹` denote its monoidal inverse. This notation differs from the composition inverse `a⁻¹:d(C)→1`. The pair `[C[1],s_C⁻¹a^⊗⁻¹]` is the negative of `[C,a]`, and has inverse characteristic function. For a given global `ζ:1→d(C)⁻¹` the corresponding `a` is `ζ^⊗⁻¹`, so this identity preserves the given `ζ` rather than silently inverting its arithmetic values.

API: `fundamentalLine` (`Δ_K(M)`, the fundamental line); `PeriodRegulatorData` (`ϑ_∞` and `ϑ_λ`, recorded as data); `FukayaKatoZetaConjecture` (The proposition of Conjecture 4.1 for `(M,F_∞/ℚ,S)`, with finite ramification and all ramified primes in `S`, so the action on `𝕋` factors through `G_{ℚ,S}`); `fukayaKato_implies_etnc` (Conjecture 4.1 implies the equivariant Tamagawa number conjecture at finite level (cited)); `globalZetaLeadingTerm` (For `C=RΓ_c` and `ζ:1→d(C)⁻¹`, use `D=C[1]` and `ζ_D=s_C⁻¹ζ`. When semisimple, the leading term is `(−1)^{−r(C)}t(D)ζ_D`; `∂ch[D,ζ_D]=[C]`).

**Checks.**

- For `p=5`, trivial `T_p` and `F_∞=ℚ(√2)ℚ_cyc`, the set `{5,∞}` is insufficient: the induced coefficient ramifies at `2`, which must be added to `S`.

- `abelian_tate_motive`: For the Tate motive and the cyclotomic abelian tower, the conjectural determinant isomorphism specializes to the normalized Iwasawa zeta contract; its existence is still stated as a conjecture here.
- `trivial_group`: The finite-level determinant conjecture obtained by derived specialization recovers the Bloch–Kato Tamagawa-number formulation with its period maps; a trivial group is used only in that finite-level formulation.
- `inverse_line_pole`: If `C` specializes in degrees 2,3 with a rank-one Bockstein `B²=b`, then `d(C[1])=d(H²)⁻¹d(H³)` and its canonical Bockstein trivialization has scalar `b⁻¹`. The leading-term sign is `−1` and the order is `−1`. This distinguishes a pole from a zero without choosing incompatible determinant bases across the shift.
- `global_boundary`: The global pair `[RΓ_c[1],ζ_D]` has boundary `+[RΓ_c]`. It is different from the totally real dual Galois-cochain convention `∂ζ=−[C(F∞/F)]`. No identification of these two arithmetic complexes is implicit.
- This is a proposition with named conjectural inputs. The Tate-motive and critical-motive targets state the conditional leading-term formulas of Burns–Venjakob §§5–6.

*Needs:* GeneralAlgebraicKTheory §§5.7, 6.3, 6.19; [7.4](#ne7-leading-term) (The leading term at a representation); [4.5](#ne4-totally-real-iwasawa-complex) (The complex `C(F_∞/F)`); §F.3.

<a id="ne7-leopoldt-tate-motive-descent"></a>
### 7.10 Descent for the Tate motive at `ρ` under Leopoldt (BV Lemma 5.1)

The Tate coefficient uses the full character on `G_ℚ`. The factorization through `Γ` displayed in BV §5 omits the finite Teichmüller factor; projection to principal units defines the cyclotomic coordinate, not the Tate twist.

**Lemma.** Fix `ρ ∈ R_{ℂ_p}(Ḡ)` with Leopoldt's conjecture valid at `ρ, i`.`e`. `(ℚ_p ⊗ ker λ_p)^ρ = 0` for `λ_p : O_E[1/p]^× ⊗ ℤ_p → ∏_{w|p}E_w^× ⊗̂ ℤ_p`. (i) `(H^i_c(U, 𝕋_E) ⊗ ℚ_p)^ρ` is `(cok λ_p ⊗ ℚ_p)^ρ` for `i = 2, (ℚ_p)^ρ` for `i = 3`, and 0 otherwise. (ii) `RΓ_c(U, 𝕋) ∈ Σ_{ss−ρ}` and `r_G(RΓ_c(U, 𝕋))(ρ) = ⟨ρ, 1⟩ = dim_{ℂ_p}(ℚ_p)^ρ`. (iii) Under (i), the Bockstein morphism `(B²)^ρ : H²_c → H³_c` is induced by `log_{p,γ,E} : ∏_{w|p}E_w^× ⊗̂ ℤ_p → ℤ_p, (e_w) ↦ −Σ_w c_γ^{−1}log_p(N_{E_w/ℚ_p}(e_w))`.

See Burns–Venjakob, §5.1, Lemma 5.1 and proof, pp. 22–24 (arXiv v2): Leopoldt's conjecture as injectivity of `λ_p`, and Lemma 5.1.

The hypotheses are as follows. `p` odd; `F_∞/ℚ` totally real Galois, containing `ℚ_cyc`, unramified outside a finite set `S ∋ p`, with `G = Gal(F_∞/ℚ)` a compact `p`-adic Lie group, `H = Gal(F_∞/ℚ_cyc), Γ = G/H`; `E ⊆ F_∞` a finite Galois extension of `ℚ` with `E ∩ ℚ_cyc = ℚ` and `E_w ∩ ℚ_{p,cyc} = ℚ_p` for `w | p` (condition (15)); `Ḡ = Gal(E/ℚ)`; `𝕋 = Λ(G)⊗_{ℤ_p}ℤ_p(1)` with `σ∈G_ℚ` acting by `σ(x⊗e)=xσ̄^{−1}⊗χ_cyc(σ)e`, where `χ_cyc` is the full cyclotomic character; `U = Spec ℤ[1/S]`; `κ_Γ` the principal-unit projection of the cyclotomic character on `Γ`, and `c_γ = log_p κ_Γ(γ)`.

*Proof.*

1. (i): the triangle `RΓ_c(U, 𝕋_E) → RΓ(U, 𝕋_E) → ⊕_{ℓ∈S}RΓ(ℚ_ℓ, 𝕋_E)` with `H^i(O_E[1/S], ℤ_p(1))` and `H^i(E_w, ℤ_p(1))`; `H²_c ⊗ ℚ_p ≅ cok λ_p ⊗ ℚ_p` always, and `(H¹_c ⊗ ℚ_p)^ρ = 0` iff `(ker λ_p ⊗ ℚ_p)^ρ = 0` since `E` is totally real.
2. (ii): (15) gives `Gal(E_cyc/ℚ) ≅ Γ × Ḡ`; `RΓ_c(U, 𝕋)_ρ ≅ O^n ⊗ RΓ_c(U, 𝕋_{E_cyc})` (18), and Lemma 3.13 with the semisimplicity criterion of Remark 3.3(ii).
3. (iii): compare the global Bockstein with the local ones `B¹_w` through the triangle, then with `B¹_p` on `RΓ(ℚ_{p,cyc}, ℤ_p(1))`, which is `c_γ^{−1}·log_p`.

**Checks.**

- At `p=5`, the field generated by a root of `x³−4x+1` is totally real, non-Galois of discriminant `229`, and has the two disjointness properties inside its normal closure times `ℚ_cyc`. It is excluded: a finite quotient `Gal(E/ℚ)` requires the stated Galois hypothesis.

- For `p=5`, `E=ℚ` and `F_∞=ℚ_cyc`, augmentation gives `ℤ₅(1)` and complex conjugation acts by `−1`. The principal-unit character alone is even and would incorrectly kill `H³_c⊗ℚ₅≅ℚ₅`.

- The trivial character `ρ = 1` with `E = ℚ`: ⟨1, 1⟩ `= 1, cok λ_p = (ℚ_p^× ⊗̂ ℤ_p)/⟨p⟩ ≅ 1 + pℤ_p`, so `cok λ_p ⊗ ℚ_p ≅ ℚ_p` via `log_p`, and the Bockstein is `−c_γ^{−1}log_p`.

*Needs:* [7.1](#ne7-bockstein-homomorphism) (Bockstein homomorphisms); [7.2](#ne7-semisimple-complexes) (Semisimple complexes and the order `r(ρ)`); §F.4 (the Leopoldt conjecture as a statement); Mathlib `Padic`.

<a id="ne7-padic-stark-conjecture"></a>
### 7.11 The `p`-adic Stark conjecture at `s = 1` (Serre; BV Conjecture 5.2)

**Definition.** For `ρ ∈ R_{ℂ_p}(Ḡ)`, let `L_{p,S}(s, ρ)` be Greenberg's `S`-truncated `p`-adic Artin `L`-function (`L_{p,S}(n, ρ) = L_S(n, ρω^{n−1})` for `n < 0`) and `L^*_{p,S}(1, ρ) := lim_{s→1}(s − 1)^{⟨ρ,1⟩}L_{p,S}(s, ρ)`. Let `μ_∞ : ℂ ⊗ log_∞(O_E^×) ≅ ℂ ⊗ E₀` (`E₀` the trace-zero part of `E`) and `μ_p : ℚ_p ⊗ log_∞(O_E^×) → ℚ_p ⊗ E₀` the maps induced by `exp_∞` followed by `λ_p` and `log_p` (19). Require `det μ_p` on the `ρ`-part to be nonzero as part of `P-Stark(ρ)`, equivalently use the corresponding Leopoldt input for that part. The conjecture then asserts that `L^*_{p,S}(1, ρ)` is the leading term of `L_{p,S}(s, ρ)` at `s = 1` and, for every `ℚ[Ḡ]`-isomorphism `g : E₀ → O_E^× ⊗ ℚ, L^*_{p,S}(1, ρ)/det_{ℂ_p}((ℂ_p ⊗ μ_p) ∘ (ℂ_p ⊗ g))^ρ = L^*_S(1, ρ)/det_ℂ(μ_∞ ∘ (ℂ ⊗ g))^ρ`, the two sides compared through a fixed `j : ℂ_p ≅ ℂ`.

See Burns–Venjakob, §5.2, Conjecture 5.2 and Remark 5.3, pp. 24–25 (arXiv v2): Greenberg's `L_{p,S}`, the maps `μ_∞, μ_p` and Conjecture 5.2.

The hypotheses are as follows. `p` odd; `F_∞/ℚ` totally real Galois, containing `ℚ_cyc`, unramified outside a finite set `S ∋ p`, with `G = Gal(F_∞/ℚ)` a compact `p`-adic Lie group, `H = Gal(F_∞/ℚ_cyc), Γ = G/H`; `E ⊆ F_∞` a finite Galois extension of `ℚ` with `E ∩ ℚ_cyc = ℚ` and `E_w ∩ ℚ_{p,cyc} = ℚ_p` for `w | p` (condition (15)); `Ḡ = Gal(E/ℚ)`; `𝕋 = Λ(G)⊗_{ℤ_p}ℤ_p(1)` with `σ∈G_ℚ` acting by `σ(x⊗e)=xσ̄^{−1}⊗χ_cyc(σ)e`, where `χ_cyc` is the full cyclotomic character; `U = Spec ℤ[1/S]`; `κ_Γ` the principal-unit projection of the cyclotomic character on `Γ`, and `c_γ = log_p κ_Γ(γ)`. A fixed isomorphism `j : ℂ_p ≅ ℂ`. The quotient formulation includes nonvanishing of its `p`-adic regulator determinant; without it only a cross-multiplied identity is meaningful and does not itself imply nonvanishing.

*Construction.*

1. Target `padicArtinL`: Greenberg's `S`-truncated `p`-adic Artin `L`-function of a totally real `E`, built from the Deligne–Ribet functions of §6.1 for one-dimensional characters by Brauer induction, with the displayed Teichmüller twist; prove independence of the induction expression and compatibility with induction by interpolation at the negative integers before defining the regulator quotient.
2. Well-definedness: `log_∞(O_E^×)` is a lattice in `ℝ ⊗ E₀` (Dirichlet), so `μ_∞` is an isomorphism; (19) factors through `ℚ_p ⊗ E₀`, so `μ_p` is an isomorphism under Leopoldt.
3. Independence of `g`: changing `g` multiplies both determinants by the same algebraic number `det(ℚ ⊗ h)^ρ`.

API: `PadicStarkAtOne` (The proposition `P-Stark(ρ)` for `ρ ∈ R_{ℂ_p}(Ḡ)`); `padicStark_indep_g` (The identity does not depend on the choice of `g`); `padicStark_add` (`P`-Stark is additive in `ρ` (both sides are multiplicative in `ρ`)); `padicStark_induction` (`P`-Stark is inductive: `P-Stark(Ind ρ) ⇔ P-Stark(ρ)` for subfields); `padicStark_permutation` (`P-Stark(Ind_J^{Ḡ}1_J) ⇔` the `p`-adic class number formula for `E^J` (§7.12)).

**Checks.**

- `padicStark_trivial`: `ρ = 1, E = ℚ`: ⟨1, 1⟩ `= 1` and `P-Stark`(1) is `Res_{s=1}ζ_{p,S}(s) = (1 − p^{−1})·∏_{ℓ∈S∖{p}}(1 − ℓ^{−1})`, the `S`-truncated Kubota–Leopoldt residue.
- `padicStark_quadratic`: `E` real quadratic, `ρ` the quadratic character: both sides involve `log_p ε` resp. `log|ε|` of a fundamental unit (Leopoldt's `p`-adic class number formula).
- `padicStark_no_zero`: `ρ` with `⟨ρ, 1⟩ = 0` (nontrivial irreducible): the leading term is the value `L_{p,S}(1, ρ)`.
- `padicStark_needs_leopoldt`: The displayed quotient formula requires `μ_p` to be invertible on the `ρ`-part. If Leopoldt fails there, its determinant is zero and this quotient is undefined; use the cross-multiplied conjectural formulation instead of inferring a higher-order zero from this test.
- Burns–Venjakob Remark 5.3 makes Tate's formulation (Tate, *Les conjectures de Stark*, Chapter VI §5) precise about the unit lattice and `μ_p`; the statement here follows Burns–Venjakob.

*Needs:* [6.1](#ne6-abelian-case) (Deligne–Ribet functions, Brauer induction); §F.4.

<a id="ne7-padic-stark-permutation-case"></a>
### 7.12 The `p`-adic Stark conjecture for permutation characters (BV Remark 5.4, after Colmez)

**Theorem.** For a subgroup `J ⊆ Ḡ` and `ρ = Ind_J^{Ḡ}1_J, P-Stark(ρ)` holds iff the residue at `s = 1` of the minimally `p`-truncated `p`-adic zeta function of `E^J` is nonzero and equal to `2^{[E^J:ℚ]−1}hR_p e_p/√|d|`, with `e_p = ∏_{v|p}(1 − Nv^{−1})`; by Colmez this holds iff Leopoldt's conjecture holds for `E^J`. Leopoldt for `E` implies it for every `E^J`. For the general `S`-truncated function multiply this displayed residue by `∏_(v∈S_f(E^J),v∤p)(1−Nv⁻¹)`. Keep the same factors on the complex side in the induction comparison.

See Burns–Venjakob, §5.2, Remark 5.4, p. 25 (arXiv v2): Remark 5.4 (with Tate's remark p. 138 and Colmez).

The hypotheses are as follows. `p` odd; `F_∞/ℚ` totally real Galois, containing `ℚ_cyc`, unramified outside a finite set `S ∋ p`, with `G = Gal(F_∞/ℚ)` a compact `p`-adic Lie group, `H = Gal(F_∞/ℚ_cyc), Γ = G/H`; `E ⊆ F_∞` a finite Galois extension of `ℚ` with `E ∩ ℚ_cyc = ℚ` and `E_w ∩ ℚ_{p,cyc} = ℚ_p` for `w | p` (condition (15)); `Ḡ = Gal(E/ℚ)`; `𝕋 = Λ(G)⊗_{ℤ_p}ℤ_p(1)` with `σ∈G_ℚ` acting by `σ(x⊗e)=xσ̄^{−1}⊗χ_cyc(σ)e`, where `χ_cyc` is the full cyclotomic character; `U = Spec ℤ[1/S]`; `κ_Γ` the principal-unit projection of the cyclotomic character on `Γ`, and `c_γ = log_p κ_Γ(γ)`.

*Proof.*

1. Inductivity of `L`-functions (§6.1, step 0`(a)`, and its `p`-adic analogue from §7.11) reduces `ρ = Ind 1_J` to the Dedekind and `p`-adic zeta functions of `E^J`; the complex side is the analytic class number formula, the residue of the Dedekind zeta function (the Dedekind complex-germ comparison in Exact supplier contracts).
2. Target `padicZeta_residue`: for every totally real field the residue at `s = 1` of the minimally `p`-truncated `p`-adic zeta function equals `2^{[E^J:ℚ]−1}hR_p e_p/√d` (Colmez, *Résidu en `s = 1` des fonctions zêta `p`-adiques*, Invent. Math. 91 (1988), §5, Lemmas 5.2–5.5 and the final Theorem, pp. 386–388). The formula does not assume Leopoldt and its right side may vanish; nonvanishing is equivalent to `R_p ≠ 0`, that is to Leopoldt for `E^J`. Fix the signs of the regulator and of `√d` together by the real embeddings, as Colmez does.

**Checks.**

- The permutation representation is formed from a subgroup of the genuine finite quotient `Gal(E/ℚ)`; a non-Galois cubic subfield is represented by its stabilizer in the normal closure, not by its own automorphism group.

- `E^J = ℚ`: the formula reduces to `Res_{s=1}ζ_p(s) = 1 − 1/p` (Kubota–Leopoldt).
- For `E^J=Q` and `S_f={p,ℓ}`, the residue is `(1−p⁻¹)(1−ℓ⁻¹)`, whereas the minimally `p`-truncated residue has only the first factor.

*Needs:* [7.11](#ne7-padic-stark-conjecture) (The `p`-adic Stark conjecture at `s = 1` (Serre; BV Conjecture 5.2)); [6.1](#ne6-abelian-case) (step 0); the Dedekind complex-germ comparison in Exact supplier contracts.

<a id="ne7-tate-motive-interpolation"></a>
### 7.13 Tate-motive interpolation with the global determinant shift

**Theorem.** Assume `P-Stark(ρ)` for all characters of `Ḡ` and existence of the Fukaya–Kato zeta isomorphism. Put `C=RΓ_c(U,𝕋), D=C[1], m=⟨ρ,1⟩` and `ζ_D=s_C⁻¹ζ_Λ(𝕋):1→d(D)`. Then `C` and `D` are semisimple at `ρ, r_G(C)(ρ)=m, r_G(D)(ρ)=−m`, and `c_γ^{−m}·[D,ζ_D]^*(ρ)=L^*_(p,S)(1,ρ)`. The associated meromorphic function in the cyclotomic variable has order `−m` at zero, and its leading coefficient is `c_γ^{−m}[D,ζ_D]^*(ρ)`. This is the formula in the shifted convention of §7.9; it corrects the exponent printed in Burns–Venjakob (20) (corrections `E28, E36`).

See Burns–Venjakob, §5.3, Theorem 5.5 and proof, pp. 25–27 (arXiv v2): Theorem 5.5, Remark 5.6 and the proof. Burns–Venjakob, Definition 3.14, p. 14; Lemma 3.17, pp. 16–17; Lemma 5.1, pp. 22–24; (21)–(26), pp. 26–27: The given determinant map and Bockstein, combined by the shift of §7.9, force the negative `c_γ` exponent. Burns–Venjakob, Definitions 3.`2/3`.14 and Lemma 3.17, pp.9,14,16; (21)–(26), pp.26–27 (arXiv v2); published Theorem 5.5`/proof`, pp.193–196: The determinant shift and its normalization are derived here (corrections `E28, E36`).

The hypotheses are as follows. `p` odd; `F_∞/ℚ` totally real Galois, containing `ℚ_cyc`, unramified outside a finite set `S ∋ p`, with `G = Gal(F_∞/ℚ)` a compact `p`-adic Lie group, `H = Gal(F_∞/ℚ_cyc), Γ = G/H`; `E ⊆ F_∞` a finite Galois extension of `ℚ` with `E ∩ ℚ_cyc = ℚ` and `E_w ∩ ℚ_{p,cyc} = ℚ_p` for `w | p` (condition (15)); `Ḡ = Gal(E/ℚ)`; `𝕋 = Λ(G)⊗_{ℤ_p}ℤ_p(1)` with `σ∈G_ℚ` acting by `σ(x⊗e)=xσ̄^{−1}⊗χ_cyc(σ)e`, where `χ_cyc` is the full cyclotomic character; `U = Spec ℤ[1/S]`; `κ_Γ` the principal-unit projection of the cyclotomic character on `Γ`, and `c_γ = log_p κ_Γ(γ)`. The Fukaya–Kato isomorphism `ζ_{Λ(G)}(𝕋)` (Conjecture 4.1) is assumed to exist.

*Proof.*

1. Use the shift/trivialization interface of §7.9: the given global `ζ` is transported to `D=C[1]`, never inverted. The localization boundary is `+[C]`; the dual Galois complex of Layer 4 is a different complex.
2. `P`-Stark implies Leopoldt for `E` by §7.12. Lemma 5.1 gives semisimplicity, `r(C)=m` and `B²=−c_γ⁻¹·`trace`∘log_p` on the surviving `H²_c,H³_c`. Hence `D` has `r=−m`.
3. Write `Δ=d(H²_c)⁻¹d(H³_c)=d(D)` after the cohomology comparison. The canonical trivialization of this inverse line uses the inverse determinant of `B²`. It therefore contributes `(−c_γ)^m`, rather than `(−c_γ⁻¹)^m`. The sign `(−1)^{r(D)}=(−1)^m` cancels that minus sign.
4. The given global `ζ` specializes, by Conjecture 4.1 and BV (21)–(23), to `L^*_S(1,ρ)` times the complex-to-`p`-adic regulator comparison in `Δ`. Composing with `t(D)` gives `[D,ζ_D]^*=c_γ^m·L^*_S(1,ρ)·ξ`, where `ξ=det(μ_p∘g)^ρ`/`det(μ_∞∘g)^ρ`. `P`-Stark identifies `L^*_S·ξ=L^*_(p,S)(1,ρ)`. Thus the normalized result has `c_γ` exponent `−m`.
5. Apply Lemma 3.17 to the correctly typed pair `[D,ζ_D]`. Since `r(D)=−m`, cyclotomic substitution `T=κ_Γ(γ)^s−1` multiplies its Laurent leading coefficient by `c_γ^{−m}`. For `m>0` this is a pole/residue calculation, not an ordinary derivative of nonnegative order.

**Checks.**

- For `E=Q` and `ρ=1` choose a basis `u` of `H²_c` with `log_p u=ℓ` and the usual basis of `H³_c`. Then `ζ=L^*_S(1,1)·ℓ` in `d(H²_c)⁻¹d(H³_c), B²=−ℓ/c_γ, t(D)=−c_γ/ℓ` and the leading sign is `−1`. Their product is `c_γ L^*_S(1,1)`; multiplying by `c_γ⁻¹` gives the `p`-adic residue. An exponent `+1` fails this scalar test.
- If `γ` is replaced by `γ^a` for `a∈ℤ_p^×`, then `c_(γ^a)=a c_γ` and `B²` scales by `a⁻¹`. The pole coefficient `[D,ζ_D]^*` scales by `a^m`, so `c_γ^{−m}[D,ζ_D]^*` is invariant.
- For `m=0` the shift still types the inverse determinant line; no cyclotomic correction factor occurs. The regulator and zeta existence assumptions remain substantive.

*Needs:* [7.10](#ne7-leopoldt-tate-motive-descent) (Descent for the Tate motive at `ρ` under Leopoldt (BV Lemma 5.1)); [7.11](#ne7-padic-stark-conjecture) (The `p`-adic Stark conjecture at `s = 1` (Serre; BV Conjecture 5.2)); [7.12](#ne7-padic-stark-permutation-case) (The `p`-adic Stark conjecture for permutation characters (BV Remark 5.4, after Colmez)); [7.9](#ne7-fukaya-kato-zeta-isomorphism) (The Fukaya–Kato global zeta isomorphism (as a proposition)); [7.4](#ne7-leading-term) (The leading term at a representation); [7.7](#ne7-partial-derivative-interpretation) (Leading terms as derivatives in the cyclotomic direction).

<a id="ne7-tate-motive-interpolation-rational"></a>
### 7.14 The interpolation formula for `ℚ`-rational characters under Leopoldt (BV Corollary 5.7, corrected scope)

**Theorem.** If Leopoldt's conjecture holds for `E` at `p`, then for every `ℚ`-valued character `ρ` of `Ḡ` there is `n_ρ ≥ 1` with `(c_γ^{−⟨ρ,1⟩}·[RΓ_c(U,𝕋)[1],ζ_D]^*(ρ))^{n_ρ} = L^*_{p,S}(1, ρ)^{n_ρ}`; for a permutation character one can take `n_ρ = 1`. (The preprint of Burns–Venjakob states this for `ℚ_p`-rational characters; the proof covers `ℚ`-valued ones, correction `E12`.) Here `ζ_D` is the unchanged global map transported along `d(RΓ_c[1])≅d(RΓ_c)⁻¹`, as in §7.13.

See Burns–Venjakob, §5.3, Corollary 5.7 and proof, p. 27 (arXiv v2): Corollary 5.7 and its proof by Artin induction. Burns–Venjakob, Definitions 3.`2/3`.14 and Lemma 3.17, pp.9,14,16; (21)–(26), pp.26–27 (arXiv v2); published Theorem 5.5`/proof`, pp.193–196: The determinant shift and its normalization are derived here (corrections `E28, E36`).

The hypotheses are as follows. `p` odd; `F_∞/ℚ` totally real Galois, containing `ℚ_cyc`, unramified outside a finite set `S ∋ p`, with `G = Gal(F_∞/ℚ)` a compact `p`-adic Lie group, `H = Gal(F_∞/ℚ_cyc), Γ = G/H`; `E ⊆ F_∞` a finite Galois extension of `ℚ` with `E ∩ ℚ_cyc = ℚ` and `E_w ∩ ℚ_{p,cyc} = ℚ_p` for `w | p` (condition (15)); `Ḡ = Gal(E/ℚ)`; `𝕋 = Λ(G)⊗_{ℤ_p}ℤ_p(1)` with `σ∈G_ℚ` acting by `σ(x⊗e)=xσ̄^{−1}⊗χ_cyc(σ)e`, where `χ_cyc` is the full cyclotomic character; `U = Spec ℤ[1/S]`; `κ_Γ` the principal-unit projection of the cyclotomic character on `Γ`, and `c_γ = log_p κ_Γ(γ)`. Leopoldt's conjecture for `E` at `p`; the Fukaya–Kato isomorphism exists.

*Proof.*

1. Artin's induction theorem: for `ℚ`-valued `ρ, n_ρ·ρ = Σ_H n_H·Ind_H^{Ḡ}1_H` with integers `n_H` (Tate, Chapitre II, Théorème 1.2).
2. Both sides of (20) are additive and inductive in `ρ`; §7.12 (via Colmez) gives (20) for each `Ind_H 1_H` under Leopoldt.
3. Use the corrected, shifted formula with exponent `−⟨ρ,1⟩` for each permutation character. Multiplicativity of the normalized leading terms then gives the `n_ρ`-th-power identity. Artin induction does not require `P`-Stark for non-permutation irreducibles individually.

**Checks.**

- For a subgroup `J` of the finite Galois group `Ḡ`, the multiplicity of the trivial character in `Ind_J^{Ḡ}1` is `1`; hence its cyclotomic normalization contains exactly `c_γ⁻¹`, regardless of `[Ḡ:J]`.

- Scope: the permutation characters `Ind_H 1_H` are `ℚ`-valued, so only `ℚ`-valued `n_ρ·ρ` are `ℤ`-combinations of them; a `ℚ_p`-valued cubic character `(p ≡ 1 mod 3)` is not.
- For the trivial character `n_ρ=1` and the residue normalization is `c_γ⁻¹[D,ζ_D]^*`. This agrees with the rank-one Bockstein test, not the source’s untyped `c_γ` formula.

*Needs:* [7.13](#ne7-tate-motive-interpolation) (Tate-motive interpolation with the global determinant shift); [7.12](#ne7-padic-stark-permutation-case) (The `p`-adic Stark conjecture for permutation characters (BV Remark 5.4, after Colmez)).

<a id="ne-foundations-period-comparison"></a>
### `F`.6 De Rham cohomology comparison and Weil–Deligne realization

**Construction.** Use the period rings, invariant functors, comparison maps and fundamental exact sequence of PadicPeriodRings §§1.5, 4.1–4.3, with the scalar and filtration conventions of its covariant functors. For finite `K/ℚ_p`, a finite coefficient field `L/ℚ_p` and a de Rham `L`-representation `V` of `G_K`, construct the continuous-cohomology connecting maps for that fundamental sequence, with the continuous nonequivariant sections needed for the cochain comparison. Define `blochKatoFiniteComplex V = [D_cris(V) → D_cris(V) ⊕ t_V]` in degrees zero and one, where `t_V=D_dR(V)/Fil⁰` and the map is `x↦((1−φ)x,x mod Fil⁰)`. At general `K` take the scalar-restricted Frobenius complex on `D_cris`, keeping its `K₀`-structure and the map to the `K`-space `t_V`; at `K=ℚ_p` these are the displayed `L`-linear terms. Construct the map to `RΓ(K,V)`, prove `H⁰_f=H⁰` and identify `H¹_f` with the kernel of `H¹(K,V)→H¹(K,B_cris⊗V)`. Define the exponential and dual exponential through the connecting maps and local trace. Prove functoriality, scalar change and compatibility with duality; the finite subspaces for `V` and `V*(1)` are exact annihilators. The API includes `blochKatoFiniteComplex.toCochains`, its degree-zero and degree-one comparisons, `blochKatoFiniteComplex.duality`, and the exponential/`dual`-exponential adjunction. (Bloch–Kato, §3; Nekovář, 12.5.6.1–12.5.6.5, p. 447; Brinon–Conrad, §9.3, (9.3.1), for the fundamental period identity.)

**Checks for the finite complex.**

- For the zero representation every period space and term is zero, and the finite-cohomology map is the zero-complex map.
- For `K=ℚ_p` and `V=ℚ_p`, `φ=1` and `t_V=0`; the complex is `[ℚ_p →⁰ ℚ_p]`, with a nonzero degree-one unramified class. Replacing `H¹_f` by zero fails this case.
- For `V=ℚ_p(1)`, `φ=p⁻¹` and `t_V` has dimension one; `H⁰_f=0` and `H¹_f` has dimension one, matching the local-unit Kummer direction. The uniformizer direction lies in the complementary local cohomology.
- Cancelling the two determinant copies of `D_cris` is independent of whether `1−φ` is invertible. For the trivial representation it is zero, so a construction requiring its inverse is invalid.

Prove `deRham_iff_potentiallySemistable` for every finite-dimensional continuous representation over every finite `K/ℚ_p`, including `p=2` and arbitrary Hodge–Tate weights. Construct the differential equation attached to a de Rham representation on the Robba ring: build the arbitrary-radius annuli and their restriction maps from the supplied valued-field and Laurent-series carriers, the Frobenius and cyclotomic actions, the étale realization of a continuous representation and its overconvergence, and the unique differential lattice defined by its cyclotomic de Rham localizations. Its API includes rank, exactness, tensor/`dual` compatibility, twists, localization and uniqueness. Prove the local monodromy theorem for finite free differential modules with Frobenius on that Robba ring and apply it to this lattice; descent of the logarithmic horizontal basis gives a finite extension on which `V` is semistable. These are mathematical construction targets; neither an assumed period realization nor an ordinary special case replaces them. (Berger, *Représentations `p`-adiques et équations différentielles*, Theorems 5.10, 5.19 and Proposition 5.18, pp. 51–58; the local monodromy theorem as used in Theorem 5.19.)

Define `deRhamWeilDeligne V` on the shared raw Weil–Deligne carrier of SmoothRepresentationsOfLocalGroups SR.5.2, using `D_pst(V)=colim_E D_st,E(V)` and its semilinear descent, with the Frobenius-to-Weil conversion matching arithmetic Frobenius. Prove independence of a sufficiently large semistable extension and of the chosen compatible logarithm, identity/composition on maps, exactness, coefficient change, direct sums, tensor products, duals, twists, determinant compatibility and the inertia descent comparison. Keep the full monodromy operator before the supplied Frobenius semisimplification; a semisimple Weil representation alone is not this parameter. This constructs the de Rham-to-parameter comparison; the underlying raw parameter, period rings and Deligne–Langlands constants retain their suppliers’ carriers. (Berger, Theorem 5.19; Fontaine’s potentially semistable construction and the arithmetic normalization in Deligne, §8.4.1 and §§8.5–8.6.)

**Checks for the differential lattice and realization.**

- The trivial representation gives the coefficient differential module with scalar derivative and the trivial rank-one Weil–Deligne parameter; the zero representation gives rank zero throughout.
- For `ℚ_p(r)` the differential lattice is generated by the horizontal period `t^(−r)e_r`. Its crystalline Frobenius is `p^(−r)`, its arithmetic Weil Frobenius is `p^r`, and its filtration jump is `−r`; positive `r` requires localization by `t`. Twisting only in the nonpositive-weight range fails this comparison.
- A nontrivial finite ramified character is potentially crystalline with its actual finite inertia action, while it need not be crystalline over `K`. Forgetting descent data would falsely make its inertia trivial.
- The Tate-curve extension has nonzero monodromy, whereas the direct sum `ℚ_p⊕ℚ_p(1)` has zero monodromy with the same semisimplified representation. The raw parameter and its determinant must distinguish these two cases as appropriate.
- Enlargement of the semistable extension gives the same parameter by descent; replacing it by the original field’s `D_st` can have too small a dimension and fails the ramified-character check.

*Needs:* PadicPeriodRings §§1.5, 4.1–4.3; PerfectoidSpaces §§P1.`10, P1`.16–`P1`.18 for the supplied period carriers; SmoothRepresentationsOfLocalGroups SR.5.2; ClassFieldTheory Layer 9; §F.3 for continuous cochains and local duality; the annulus, étale-realization and differential-module constructions specified in this subsection.

<a id="ne7-local-epsilon-isomorphism"></a>
### 7.15 The local `ε`-isomorphism `ε_{p,L}(V)` and Fukaya–Kato's local conjecture (BV §6.1, Conjecture 6.1)

**Definition.** Fix `t = (t_n)` a generator of `ℤ_p(1)` and `ψ_p : ℚ_p → Q̄_p^×` with kernel `ℤ_p, 1/p^n ↦ t_n`. For a de Rham `L`-representation `V` of `G_{ℚ_p}`, with `L̃ = Q̂_p^nr ⊗ L, Γ^*(j) = Γ(j) = (j − 1)!` for `j > 0` and `Res_{s=j}Γ(s) = (−1)^j((−j)!)^{−1}` for `j ≤ 0, h(j) = dim_L gr^jD_dR(V)` and `Γ_L(V) = ∏_j Γ^*(j)^{−h(−j)}, ε_{p,L}(V) : 1_{L̃} → (d_L(RΓ(ℚ_p, V))d_L(V))_{L̃}` is the product of `Γ_L(V), η_l(V)·η_l(V^*(1))^*` and Fukaya–Kato's `ε_dR(V) : 1 → d(V)d(D_dR(V))^{−1}` (which involves Deligne's `ε(D_pst(V))`). Conjecture 6.1 (Fukaya–Kato 3.4.3): for `𝕋 = Λ ⊗ T` there is a unique `ε_{p,Λ}(𝕋) : 1_{Λ̃} → (d_Λ(RΓ(ℚ_p, 𝕋))d_Λ(𝕋))_{Λ̃} (Λ̃ = W(F̄_p)⟦G⟧)` whose derived base change along each continuous `ρ : G → GL_n(O)` for which `(T⊗_{ℤ_p}O(ρ^*))[1/p]` is de Rham is `ε_{p,L}(T(ρ^*)[1/p])`.

See Burns–Venjakob, §6.1, pp. 28–29, and Conjecture 6.1 (arXiv v2): The local `ε`-isomorphism and Conjecture 6.1 (correction `E13` to the `Γ^*` display). Burns–Venjakob (9), §4.1, p. 19: the finite-cohomology trivializations `η_ℓ(V)`. Nekovář, *Selmer complexes*, Astérisque 310 (Numdam), 12.5.6.1–12.5.6.5, p. 447: Bloch–Kato's local subspaces `H¹_e ⊆ H¹_f ⊆ H¹_g` and their annihilator and quotient properties. Deligne, *Les constantes des équations fonctionnelles des fonctions `L*`, §5, (5.2)–(5.4), p. 548: additivity and the change of additive character.

The hypotheses are as follows. `L/ℚ_p` finite; `V` de Rham; the Haar measure and `t` are fixed and suppressed.

*Construction.*

1. `localEpsilon_finiteTrivialization`, the map `η_p(V) : 1 → d(RΓ_f(ℚ_p,V))·d(t_V)` of BV (9). Define `RΓ_f(ℚ_p,V)` as the two-term complex `[D_cris(V) → D_cris(V) ⊕ t_V], x ↦ ((1−φ)x, x mod Fil⁰)`, in degrees 0 and 1, with `t_V=D_dR(V)/Fil⁰`. Its map to `RΓ(ℚ_p,V)` comes from the fundamental exact sequence of `p`-adic Hodge theory (§F.6). Both terms contain `D_cris(V)`, so cancelling the two copies of `d(D_cris(V))` by the identity gives `η_p(V)`; it is canonical and does not depend on `φ`. For `ℓ≠p, RΓ_f(ℚ_ℓ,V)` is `[V^(I_ℓ) --1−φ→ V^(I_ℓ)]` with `t_ℓ=0`, and `η_ℓ` is the same cancellation. On cohomology, `H⁰=H⁰(ℚ_p,V)` and `H¹=H¹_f(ℚ_p,V)`, in Bloch–Kato's sense as restated in Nekovář, *Selmer complexes*, 12.5.6, p. 447.
2. The duality comparison `d(RΓ(ℚ_p,V)) ≅ d(RΓ_f(ℚ_p,V))·d(RΓ_f(ℚ_p,V^*(1)))^*`. All terms are complexes of finite-dimensional `L`-vector spaces, so define it through cohomology with `detPerfect_cohomology` of §2.7. In degree `0, H⁰_f=H⁰`. In degree `2, H²(ℚ_p,V)≅H⁰(ℚ_p,V^*(1))^*` by local duality (§F.3). In degree 1 use the exact sequence `0 → H¹_f(V) → H¹(V) → H¹_f(V^*(1))^* → 0`, which is exact because `H¹_f(V)` and `H¹_f(V^*(1))` are exact annihilators under local Tate duality (Nekovář 12.5.6.2, restating Bloch–Kato §3), with additivity of `d`. The dual of `η_p(V^*(1))` trivializes the second factor, and `t_(V^*(1))^* ≅ Fil⁰D_dR(V)` recombines `d(t_V)·d(Fil⁰D_dR(V))` into `d(D_dR(V))`. Defining the comparison on cohomology fixes it without a choice of null-homotopy. Its agreement with the complex-level construction that Fukaya–Kato use (§2.4.4) is the standard Knudsen–Mumford sign convention for determinants of cohomology, and it is not needed for any statement of this roadmap.
3. `localEpsilon_deRham`, `ε_dR(V):1→d(V)d(D_dR(V))⁻¹`, is the oriented determinant comparison `det D_dR(V)→det V` multiplied by `t^{−t_H(V)} ε_L(D_pst(V),ψ_p,dx)`, where `t_H(V)=Σ_j j h(j)` and `dx(ℤ_p)=1`. Use arithmetic Weil Frobenius on `D_pst(V)` (inverse crystalline Frobenius), and Deligne’s geometric reciprocity `rec_geo(p)=Frob_geom` when converting this Weil representation to a multiplicative character for the epsilon factor; equivalently use the inverse of ClassFieldTheory’s arithmetic reciprocity. The epsilon factor multiplies the comparison, with the displayed `ψ_p`, rather than its inverse or the character `−ψ_p`. Explicitly, if `η` is the finite-inertia character of `det V⊗ℚ_p(t_H(V))`, then `σ(ε_L)=η(σ)ε_L` for a lift fixing the maximal unramified field. The normalized period coefficient transforms by `η(σ)⁻¹`; their product is inertia invariant and descends to `L̃`. These formulas fix both the power of `t` and the orientation. Use the shared local-constant contract of ClassicalArithmeticCompletion, with the raw parameter of §F.6. Source: Loeffler–Venjakob–Zerbes, *Local epsilon isomorphisms*, §2.3, Proposition 2.3.2 and the Gauss-sum formula of Proposition 2.3.3, pp. 3–5, and §2.4, pp. 5–6: its weight `w` is `−t_H(V)` and its comparison is multiplication by `t^w ε_L`.
4. `localEpsilon` is the product of `Γ_L(V), η_p(V)·η_p(V^*(1))^*` and `ε_dR(V)`, as in BV §6.1. The interpolating integral `ε`-isomorphism `ε_(p,Λ)(𝕋)` remains Fukaya–Kato's Conjecture 3.4.3 (BV Conjecture 6.1), a conjectural proposition, not a theorem of this roadmap.

API: `localEpsilon_deRham` and `localEpsilon_finiteTrivialization` (the determinant comparisons of steps 1–2); `localEpsilon` `(ε_{p,L}(V) = Γ_L(V)·η_l(V)η_l(V^*(1))^*·ε_dR(V))`; `gammaStar` (`Γ^*(j): Γ(j)` for `j > 0`, the residue of `Γ` at `j` for `j ≤ 0`); `gammaStar_eq_Gamma` (agreement with Mathlib's `Complex.Gamma` for `j > 0`); `gammaStar_eq_residue` (`(s + n)Γ(s) → Γ^*(−n)` as `s → −n`); `gammaL` `(Γ_L(V) = ∏_j Γ^*(j)^{−h(−j)})`; `LocalEpsilonConjecture` (Conjecture 6.`1: ε_{p,Λ}(𝕋)` interpolating `ε_{p,L}(T(ρ^*))`); `localEpsilon_baseChange` (`L_n ⊗^L_Λ ε_{p,Λ}(𝕋) = ε_{p,L}(T(ρ^*)[1/p])` when `(T⊗_{ℤ_p}O(ρ^*))[1/p]` is de Rham, the defining property).

**Checks.**

- For `V=ℚ_p(1)`, the period basis is `t⁻¹e`, `t_H=−1` and the unramified epsilon factor is `1`. Multiplying the comparison by `t` sends this basis to `e`; using `t⁻¹` would leave `t⁻²e`.

- For `p=5`, `T=ℤ₅` and `ρ=⟨χ_cyc⟩^{1/2}`, the specialization has nonintegral Hodge–Tate weight and is not de Rham; the de Rham interpolation clause does not apply.

- `Γ^*(3) = 2! = 2`.
- `Γ^*(−1)=−1` and `Γ^*(−2)=1/2`. Both are residues at poles of `Γ`; the odd negative argument detects a lost alternating sign.
- `Γ_L(ℚ_p(−2))=2`, `Γ_L(ℚ_p(3))=1/2`, and the factor on their direct sum is their product `1`.
- `gammaL_trivial`: `V = ℚ_p: h(0) = 1`, so `Γ_L(V) = Γ^*(0)^{−1} = 1`.
- `Γ^*` is not `Γ` at `j ≤ 0`, where `Γ` has poles; the residue is used instead.
- `Γ`-factor convention on `V = ℚ_p(1): D_dR` has one jump at `j = −1`, so `Γ_L(V) = Γ^*(1)^{−1} = 1`; on `V = ℚ_p` it is `Γ^*(0)^{−1} = 1`.

*Needs:* [2.7](#ne2-localized-k1) (the determinant functor); §F.6 (the fundamental-sequence cohomology comparison, `D_pst`, Weil–Deligne realization and the de Rham comparison); ClassicalArithmeticCompletion’s local-constant contract; §F.3 (local duality); Mathlib `Complex.Gamma`. The determinant-line constructions of steps 1–3 are owned here, not supplied by the Weil–Deligne parameter.

<a id="ne7-dabrowski-panchishkin-selmer-complexes"></a>
### 7.16 Dabrowski–Panchishkin representations and their Selmer complexes (BV §6.2, Lemma 6.2)

**Definition.** A representation `W` of `G_ℚ` satisfies `(DP)` if it is de Rham and has a `G_{ℚ_p}`-subrepresentation `Ŵ` with the natural map `D_dR(Ŵ)→t_p(W):=D_dR(W)/Fil⁰D_dR(W)` is an isomorphism; then `0 → Ŵ → W → W̃ → 0` with `D⁰_dR(Ŵ) = t_p(W̃) = 0`, and `Z = W^*(1)` satisfies `(DP)` with `Ẑ = W̃^*(1)`. The Selmer complexes `SC_U(Ŵ, W)` and `SC(Ŵ, W)` are the mapping fibres of `RΓ(U, W) → RΓ(ℚ_p, W/Ŵ) ⊕ ⊕_{ℓ∈S_f∖S_p}RΓ(ℚ_ℓ, W)` (resp. `RΓ_{/f}(ℚ_ℓ, W)` with `RΓ_{/f} = cone(RΓ_f → RΓ)`). Conditions: `(A1) P_ℓ(W, 1)P_ℓ(Z, 1) ≠ 0` for `ℓ ∈ S_f ∖ S_p`; `(B1) P_p(W, 1)P_p(Z, 1) ≠ 0`; `(C1) P_p(W̃, 1)P_p(Z̃, 1) ≠ 0` (each with equivalent forms). Lemma 6.2: under `(A1)` the complexes at `ℓ ≠ p` are acyclic; under `(C1), RΓ_{/f}(ℚ_p, X) ≅ RΓ(ℚ_p, X̃)` and `RΓ_f(ℚ_p, X) ≅ RΓ(ℚ_p, X̂)`; under both, `SC_U(Ŵ, W) ≅ RΓ_f(ℚ, W)`.

See Burns–Venjakob, §6.2, conditions `(DP), (A1)`–`(C3)`, (27)–(29), Lemma 6.2, pp. 29–30 (arXiv v2): The `(DP)` condition, the Selmer complexes and Lemma 6.2. Nekovář, *Selmer complexes*, 12.5.6.2–12.5.6.4, p. 447, and Lemma 12.5.7, p. 448: Bloch–Kato's orthogonality and quotient properties, and the Greenberg`/Bloch`–Kato comparison pattern used in step 2. Berger, §I`I`.3.3 p.15 and §§I`I`.4.2–II.4.4 pp.17–19, author PDF: Explicit Tate-module extension, semistable periods and Frobenius; `N=−d/dY` yields the crystalline kernel and distinguishes `B1` from `C1`.

The hypotheses are as follows. `W` a finite-dimensional `L`-representation of `G_{ℚ,S}`; `P_ℓ(V, u) = det(1 − φ_ℓu | V^{I_ℓ}) (ℓ ≠ p), det(1 − φ_pu | D_cris(V)) (ℓ = p), φ` geometric Frobenius.

*Construction.*

1. `(A1)`: local duality and the Euler characteristic formula make `RΓ(ℚ_ℓ, X)` acyclic.
2. `(C1)`: `panchishkin_finiteCohomologyComparison`. For `X=W` or `Z`, with `0→X̂→X→X̃→0` as in `(DP)`, show: `H⁰(ℚ_p,X̃)=0`; `H¹(ℚ_p,X̂)→H¹(ℚ_p,X)` is injective with image `H¹_f(ℚ_p,X)`; and `H¹_f(ℚ_p,X̂)=H¹(ℚ_p,X̂), H¹_f(ℚ_p,X̃)=0`. Proof from Bloch–Kato's local properties as restated in Nekovář 12.5.6.2–12.5.6.4, p. 447, following the pattern of his Lemma 12.5.7, p. 448. Since `Z̃=Ŵ^*(1)` and `Ẑ^*(1)=W̃, (C1)` says that 1 is not an eigenvalue of `φ` on `D_cris(X̃)` or on `D_cris(X̂^*(1))`, for `X=W` and for `X=Z` (the two conditions are exchanged). Since `H⁰(V)` embeds in `D_cris(V)^(φ=1), H⁰(X̃)=0` and `H²(X̂)=H⁰(X̂^*(1))^*=0`, and `H¹_f=H¹_e` for `X̃` and for `X̂^*(1)` by 12.5.6.4. By `(DP), t_(X̃)=0`, and `Fil⁰D_dR(X̂^*(1))=D_dR(X̂^*(1))` since `Fil⁰D_dR(X̂)=0`. By 12.5.6.`3, H¹_e` is a quotient of `D_dR/Fil⁰`, so `H¹_f(X̃)=0` and `H¹_f(X̂^*(1))=0`. Orthogonality (12.5.6.2) then gives `H¹_f(X̂)=H¹(X̂)`. Functoriality of `H¹_f` along `X̂→X→X̃` gives `im(H¹(X̂)) ⊆ H¹_f(X) ⊆ ker(H¹(X)→H¹(X̃))=im(H¹(X̂))`, and injectivity follows from `H⁰(X̃)=0`. Thus the Greenberg local condition `RΓ(ℚ_p,X̂)` and the Bloch–Kato condition `RΓ_f(ℚ_p,X)` of §7.15 have the same cohomology inside `RΓ(ℚ_p,X)`, and they are identified by the natural map `RΓ(ℚ_p,X̂)→RΓ(ℚ_p,X)`, whose image in degree 1 is `H¹_f`. In particular `H¹(SC_U(Ŵ,W))=H¹_f(ℚ,W)` under `(A1)` and `(C1)`, and `H²(SC_U)` is dual to `H¹_f(ℚ,Z)` by the duality of Selmer complexes. Burns–Venjakob cite Fukaya–Kato 4.1.7 for these comparisons; the argument above does not use it.
3. (iii) from (i), (ii) and the definitions.

API: `IsDabrowskiPanchishkin` (`W` is de Rham with a `G_(ℚ_p)`-subrepresentation `Ŵ` such that the natural `D_dR(Ŵ)→t_p(W)` is an isomorphism. Thus `Fil⁰D_dR(Ŵ)=0` and `t_p(W̃)=0`); `selmerComplexU` (`SC_U(Ŵ, W)` as a mapping fibre); `selmerComplex` (`SC(Ŵ, W)` with the `RΓ_{/f}` conditions at `ℓ ≠ p`); `panchishkin_finiteCohomologyComparison` (The natural local finite-cohomology comparisons in step 2 under `(DP)` and `(C1)`); `selmerComplexU_iso_f` (Under `(A1)` and `(C1), SC_U(Ŵ, W) ≅ RΓ_f(ℚ, W)`); `isDabrowskiPanchishkin_dual` (`W (DP) ⇒ W^*(1) (DP)` with `Ẑ = W̃^*(1)`).

**Checks.**

- `dp_ordinary_abelian`: For A with good ordinary reduction, use `W=h¹(A)(1)_p≅V_p(A)` after polarization, and its ordinary Kummer subrepresentation `Ŵ`. Do not add a second Tate twist to `V_p(A)`.
- `dp_multiplicative_fails_C1`: For a split Tate elliptic curve over `ℚ_p, W=V_p(E), Ŵ=ℚ_p(1), W̃=ℚ_p` and `Z=W*(1)≅W`. In Berger’s covariant convention `D_st(W)` has basis `x,y` with `φx=p⁻¹x, φy=y, Nx=0` and `Ny=v_p(q)x≠0`. Thus `D_cris(W)=ℚ_p x`, so `P_p(W,1)=P_p(Z,1)=1−p⁻¹≠0` and `(B1)` holds; `W̃=Z̃=ℚ_p` gives `P_p(W̃,1)=P_p(Z̃,1)=0`, so `(C1)` fails. The reciprocal Frobenius convention has the same zero/nonzero verdict.
- `dp_trivial`: `W = ℚ_p(1): Ŵ = W, W̃ = 0`.
- `c1_needed`: for `W=ℚ_p(1)` and `Ŵ=W`, the Greenberg condition is all of `H¹(ℚ_p,ℚ_p(1))` (dimension 2), while `H¹_f` is the unit part (dimension 1). `(C1)` fails here because `Z̃=Ŵ^*(1)=ℚ_p` has `P_p(Z̃,1)=0`, so step 2 correctly does not apply.
- `dp_not_de_rham`: A non-de Rham `W` does not satisfy `(DP)`.
- For an abelian variety with good ordinary reduction, use the ordinary representation in BV Example 6.3. For a split Tate elliptic curve and trivial `ρ`, check that `(B1)` holds but `(C1)` fails: do not retain Example 6.3’s contrary `B1` assertion (correction `E31`).
- `W=ℚ_p(1)` has `Fil⁰D_dR(W)=0` but `t_p(W)` one-dimensional. The printed condition `Fil⁰D_dR(Ŵ)=t_p(W)` would incorrectly reject this example (correction `E25`).

*Needs:* §F.4; §F.6 (`D_pst` and Weil–Deligne realization).

<a id="ne7-height-pairing-bockstein"></a>
### 7.17 Nekovář's `p`-adic height as a Bockstein map; semisimplicity iff non-degenerate (BV §6.2, Propositions 6.4, 6.6)

**Theorem.** Nekovář's height `h_p(W) : H¹_f(ℚ, W) × H¹_f(ℚ, Z) → L` (his `h̃_{π,1,1}`, agreeing up to sign with Schneider, Perrin-Riou, Mazur–Tate and Zarhin) has adjoint equal to `H¹_f(ℚ, W) ≅ H¹(SC_U) →^B H²(SC_U) ≅ H²_f(ℚ, W) ≅ H¹_f(ℚ, Z)^*` with `B` the Bockstein of `SC_U(𝕋̂_{cyc,ρ}, 𝕋_{cyc,ρ})` (32)–(33). Descent (Proposition 6.4, Fukaya–Kato 1.6.5): `L_n ⊗_{Λ,ρ}` commutes with `RΓ(U, ·), RΓ_c(U, ·), RΓ(ℚ_ℓ, ·)` and `SC_U`, and with `RΓ_f(ℚ_ℓ, ·)` for `ℓ ∉ Υ ∪ S_p`, while `SC` descends only up to the triangle (34) over `ℓ ∈ Υ`. Proposition 6.6: under `(A1), (C1)` and `(D2), SC_U(𝕋̂_{cyc,ρ}, 𝕋_{cyc,ρ}) ∈ Σ_ss` iff `h_p(W)` is non-degenerate `(F)`, and then `r_Γ(SC_U)=−h` and `r_Γ(SC_U[1])=h` for `h=dim_L H¹_f(ℚ,W)`. The sign for the unshifted `SC_U` corrects the rank assertion in the printed Proposition 6.6.

See Burns–Venjakob, §6.2, (32)–(34), Propositions 6.4 and 6.6, pp. 31–33 (arXiv v2): The Bockstein description of the height, descent, and Proposition 6.6. Nekovář, *Selmer complexes*, Astérisque 310 (2006), 11.1.3–11.1.4, pp. 354–355 (definition of the height by the Bockstein), 11.2.8–11.2.9, p. 363 (sign conventions), Theorem 11.3.9, p. 370 (comparison with classical `p`-adic heights), Proposition 8.10.1, p. 249 (control theorem). Burns–Venjakob, Definition 3.2 and Lemma 3.9, pp.9,11–12; Proposition 6.6, p.32 (arXiv v2); published Lemma 6.7 pp.202–203: The negative order for the unshifted Selmer complex is recalculated from its DVR blocks; the source prints the opposite sign (correction `E35`).

The hypotheses are as follows. `W = N_λ = V ⊗ [ρ]^*_λ` for a motive `M` satisfying `(DP)` and a critical twist; `(D2): H⁰_f(ℚ, W) = H⁰_f(ℚ, Z) = 0`; `Υ` the primes `ℓ ≠ p` of infinite ramification in `F_∞`.

*Proof.*

1. (32)–(33). Construct `cyclotomicHeight` as Nekovář's height pairing for the cyclotomic `Γ`: Nekovář, *Selmer complexes*, 11.1.3–11.1.4, pp. 354–355. For Greenberg local conditions, tensoring the Iwasawa Selmer complex with `J/J² → R/J² → R/J` gives the exact triangle (11.1.3.2), and Nekovář defines the height as the composite of its Bockstein `β` with the duality isomorphism induced by the pairing `π`. For `W, Z` with the conditions `Ŵ, Ẑ` at `p` and the strict conditions at `ℓ∈S_f∖S_p`, this composite is literally the map of BV (32)–(33), `H¹(SC_U)→H²(SC_U)≅H¹_f(ℚ,Z)^*`, once `H¹(SC_U)=H¹_f(ℚ,W)` is identified (§7.16, step 2). So `cyclotomicHeight_eq_nekovar` is the definition of `h̃_(π,1,1)`. The sign is fixed by Nekovář 11.2.8–11.2.9, p. 363: letting `β` act on the second variable does not change `h`, while replacing the twist `⟨−1⟩` by ⟨1⟩ negates it. Agreement with the classical heights of Schneider and Perrin-Riou is Nekovář Theorem 11.3.9, p. 370, under his hypotheses 11.3.1.1–11.3.1.5. Descent, `selmerDescent_withRamificationErrors`, is Nekovář's control theorem, Proposition 8.10.1, p. 249, under his condition `(U)` of 8.8.1: every prime with unramified local conditions is unramified in the tower. `SC_U` uses the strict conditions at all `ℓ∈S_f∖S_p`, so `(U)` is vacuous and descent along `L_n⊗_(Λ,ρ)` is exact. `SC` uses `RΓ_f` at those `ℓ`, where `(U)` fails exactly for `ℓ∈Υ`; the difference is the local triangle (34). The `ρ`-twisted coefficients are induced modules, handled by Nekovář's Shapiro lemma (§8.1). Prove `height_nondegenerate_iff_semisimple` by steps 2–3.
2. Proposition 6.6: under `(D2), H^i(SC_U(Ŵ, W)) = 0` for `i ≠ 1, 2`, and semisimplicity is the invertibility of the Bockstein in degree 1, which is `(F)`.
3. For the rank, localize `O[[T]]` at `(T)`. A semisimple torsion perfect complex over this DVR is a direct sum, up to acyclic terms, of elementary blocks `[R --T→R]` in adjacent degrees. Specialization in degrees 1,2 with invertible degree-1 Bockstein leaves `h` such blocks in degrees 1,2. Each has ordinary cohomology `R/T` in degree 2, and contributes `(−1)³=−1` to the rank definition. Thus `r(SC_U)=−h`, while its shift contributes `+h`. Local finite Euler complexes assumed acyclic at `ρ` contribute rank zero.

**Sources of the comparisons.** Burns–Venjakob pp. 31–32 cite Nekovář (11.1.3.2) and Theorem 11.3.9 and Fukaya–Kato 1.6.5. The locators above in Nekovář's *Selmer complexes*, which is freely available (Numdam), supply the definition, the sign convention, the comparison with the classical heights and the control theorem. Step 1 therefore uses no unread source.

**Checks.**

- Example 6.5: for an abelian variety over `ℚ, (D1)` and `(D2)` hold, but non-degeneracy `(F)` is open except Bertrand's CM result.
- If the Bloch–Kato Selmer spaces are zero, the height determinant on rank zero is 1, semisimplicity holds and the order is 0. For a one-dimensional space with Bockstein 0 the height is degenerate and the rational Bockstein complex is not acyclic; perfectness alone gives no semisimplicity.
- For one block `[R --T→R]` in degrees 1,2, the only ordinary cohomology is `H²=R/T`; BV Definition 3.2 gives `r=−1`. Its derived special fiber has `H¹=H²=L`. Counting the dimension of `H¹` of that fiber as `+r` of the unshifted complex gives the wrong sign.

*Needs:* [7.16](#ne7-dabrowski-panchishkin-selmer-complexes) (Dabrowski–Panchishkin representations and their Selmer complexes (BV §6.2, Lemma 6.2)); [7.1](#ne7-bockstein-homomorphism) (Bockstein homomorphisms); [7.2](#ne7-semisimple-complexes) (Semisimple complexes and the order `r(ρ)`); §F.4; §F.3.

<a id="ne7-critical-motive-interpolation"></a>
### 7.18 Critical-motive interpolation on shifted Selmer complexes

**Theorem.** Assume `W` satisfies `(A1), (B1), (C1), (D1)` and `(F)`, and that `ζ_Λ(M)` (Conjecture 4.1) and `ε_{p,Λ}(𝕋̂)` (Conjecture 6.1) exist. Then `SC_U(𝕋̂, 𝕋)` and `SC(𝕋̂, 𝕋)` belong to `Σ_(ss−ρ), h=dim_L H¹_f(ℚ,W), r_G(SC_U)(ρ)=r_G(SC)(ρ)=−h`, and `r=r_G(SC_U[1])(ρ)=r_G(SC[1])(ρ)=h`, and the leading term `𝓛^*(ρ)` (resp. `𝓛_U^*(ρ)`) of the Fukaya–Kato `p`-adic `L`-function equals `(−1)^r·L^*_{K,B}(M(ρ^*))/(Ω_∞(M(ρ^*))R_∞(M(ρ^*)))·Ω_p(M(ρ^*))R_p(M(ρ^*))·Γ(V̂)^{−1}·P_{L,p}(Ŵ^*(1), 1)/P_{L,p}(Ŵ, 1)` (38), with `L^*_{K,B}` truncated at `B = Υ ∪ S_p` (resp. `B = S ∖ S_∞`), `Ω_∞, R_∞` the archimedean period and regulator (42)–(43), `Ω_p` the `p`-adic period (46) and `R_p = det h_p(W)` (50). In this formula `𝓛_U:1→d(SC_U)⁻¹` is the zeta/epsilon composite of the proof, transported to `d(SC_U[1])`; likewise for `𝓛` and `SC[1]`. The symbols `𝓛_U^*,𝓛^*` mean these shifted pairs, with boundary `+[SC_U],+[SC]`. The scalar expression (38) is retained, with its `r` attached to the shifted complexes.

See Burns–Venjakob, §6.3, Theorem 6.7, Remark 6.8, proof and Example 6.9, pp. 33–36 (arXiv v2): Theorem 6.7 with its proof and Remark 6.8. Burns–Venjakob, (36)–(38), p.33 and proof (44)–(50), pp.34–36 (arXiv v2); published Theorem 6.5 and proof, pp.201–207: The proof’s inverse Selmer determinant is typed by shifting. Its regulator and scalar expression are retained with `r` attached to `SC[1]`, (corrections `E28, E35`).

The hypotheses are as follows. The hypotheses of §7.17 and of Fukaya–Kato's Conjectures 4.1 and 6.1. Include `(D2)`, the motivic-to-Bloch–Kato Selmer comparison, or supply the named regulator/period comparison proving its equivalence to `(D1)`. Nondegeneracy alone is not that comparison.

*Proof.*

1. Type the zeta/epsilon composite on the inverse line: `1 --ζ→d(RΓ_c)⁻¹ --β·ε⁻¹→d(SC_U)⁻¹ ≅d(SC_U[1])`. Use this map as `a_U` in `[SC_U[1],a_U]`. The analogous Euler-factor adjustment gives a in `[SC[1],a]`. There is no inversion of `ζ` or of its normalized arithmetic factors. The characteristic boundaries are `+[SC_U]` and `+[SC]`. The positive determinant targets (36)–(37) cannot be used literally for these composites.
2. Model: Fukaya–Kato Theorem 4.2.26 (as amplified by Venjakob, proof of Theorem 6.4). Choose good bases `γ, δ` of `M_B^+` and `t_M` and bases `P^∨, P` of `H¹_f(N), H¹_f(N^*(1))`; can `= can_{γ′,δ′}·can_{P^∨,P}` identifies `ζ_K(N)` with `L^*_K(M)/(Ω_∞R_∞)·`can. Define `archimedeanPeriod` as `det(α_N : N_B^+ ⊗ ℂ → t_N ⊗ ℂ)`, `archimedeanRegulator` as the determinant of the inverse archimedean height relative to compatible motivic bases, `padicPeriod` through the cycle `d(Ŵ) → d(D_dR(Ŵ)) → d(t_N) → d(N_B^+) → d(W^+) → d(Ŵ)` (`ε_dR⁻¹`, the de Rham comparison, the chosen bases, the `p`-adic Betti comparison and `β(ρ)`), and `padicRegulator` as `det(ad h_p(W))` after the motivic-to-Bloch–Kato comparison; prove `regulatorPeriodComparison` under `(D1), (D2)` and those comparison hypotheses. A simultaneous change of basis cancels between the four scalar factors.
3. `𝓛_U^*(ρ)` is the product of the factors (44)–(50): the complex leading term over `Ω_∞R_∞`; `Γ_L(Ŵ)^{−1}`; the `p`-adic period `Ω_p`; the Euler factors at `ℓ ≠ p`; `{P_{L,p}(W, u)P_{L,p}(Ŵ, u)^{−1}}_{u=1}`; `P_{L,p}(Ŵ^*(1), 1)`; and the `p`-adic regulator `R_p = det h_p(W)`, which is `t(SC_U[1](ρ^*))` under the coherent determinant shift identification: with `H¹=V, H²=V′` and `B¹=b`, the inverse line is `d(V)d(V′)⁻¹` and its trivialization has scalar `det b`. The leading-term definition contributes the separate sign `(−1)^h`. Thus the inverse line gives `R_p`, not its reciprocal.
4. For `𝓛^*(ρ)` use the triangle `SC_U(Ŵ, W) → L_n ⊗ SC(𝕋̂, 𝕋) → ⊕_{S_f∖(S_p∪Υ)}RΓ_f(ℚ_ℓ, W)` and `L^*_{K,Υ′} = L^*_{K,B′}∏_{B∖Υ}P_{L,ℓ}(W, 1)^{−1}`.

**Checks.**

- Remark 6.8: without `(B1)`, replace `P_{L,p}(Ŵ, 1)` by the leading coefficient of `P_{L,p}(Ŵ, p^s)` at `s = 0` (the exceptional-zero situation).
- Example 6.9: for an elliptic curve and `F_∞ = ℚ(E[p^∞])`, (38) predicts the leading terms of the CFKSV `p`-adic `L`-function `𝓛_E` at Artin characters with non-degenerate heights.
- For one Selmer block with special-fiber `B¹=b, t(SC_U)=b⁻¹, t(SC_U[1])=b, r(SC_U)=−1` and `r(SC_U[1])=1`. With global factor A into the inverse line, the shifted leading term is `−Ab`. Replacing `ζ` by its inverse would give a different scalar.

*Needs:* [7.17](#ne7-height-pairing-bockstein) (Nekovář's `p`-adic height as a Bockstein map; semisimplicity iff non-degenerate (BV §6.2, Propositions 6.4, 6.6)); [7.15](#ne7-local-epsilon-isomorphism) (The local `ε`-isomorphism `ε_{p,L}(V)` and Fukaya–Kato's local conjecture (BV §6.1, Conjecture 6.1)); [7.16](#ne7-dabrowski-panchishkin-selmer-complexes) (Dabrowski–Panchishkin representations and their Selmer complexes (BV §6.2, Lemma 6.2)); [7.9](#ne7-fukaya-kato-zeta-isomorphism) (The Fukaya–Kato global zeta isomorphism (as a proposition)); [7.4](#ne7-leading-term) (The leading term at a representation).

<a id="ne7-fitting-order"></a>
### 7.19 Orders admitted for noncommutative Fitting invariants

**Definition.** `A` Fitting order is an `o`-order `Λ` in a finite-dimensional separable semisimple algebra A over `F=Frac(o)`, where `o` is an integrally closed commutative noetherian complete local domain. Thus `Λ` is a finite torsion-free `o`-subalgebra with `FΛ=A`. Fix a containing maximal order `Λ′` for computations, retaining its center `ζ(Λ′)`, and the componentwise reduced norm on every matrix algebra over `A`. A one-dimensional Iwasawa algebra with an open central `Γ₀≅ℤ_p` is such an order over `o=ℤ_p[[Γ₀]]`. This is the admitted order data for Layer 7, not a definition of arbitrary noncommutative fraction rings.

See Nickel, Definition 2.1 and Examples 2.3–2.7, pp. 7–8: Specifies the coefficient domain and semisimple ambient algebra; Example 2.7 covers dimension-one Iwasawa algebras.

The hypotheses are as follows. `o` integrally closed, commutative, noetherian, complete and local; `Λ` finite torsion-free over `o`; `A=F⊗Λ` finite-dimensional separable semisimple.

*Construction.*

1. Import the ambient finite-dimensional algebra, orders and reduced norms; package exactly the hypotheses Nickel Definition 2.1 needs.
2. For the Iwasawa example use the finite central crossed-product presentation and semisimple total quotient.
3. Separate `ζ(Λ), ζ(Λ′)` and `ζ(A)` throughout; reduced norms of integral matrices need not lie in `ζ(Λ)`.
4. The construction extends to any commutative noetherian complete local domain `o` by its finite integral closure and the same separable semisimple total quotient (Nickel, Remark 2.16, p. 10), target `FittingOrder.integralClosure`; the matrix-size-zero reduced norm is 1, fixing the zero-module normalization, and the constructions are independent of the containing maximal order.

API: `FittingOrder.ambient` (The embedding `Λ⊆`A and an identified scalar extension `F⊗Λ≅A`); `FittingOrder.maximalOrder` (A chosen containing maximal order with the same total quotient; results are independent of this computational choice); `FittingOrder.reducedNorm` (For `M_n(Λ)` use the norm inherited from `M_n(A)`, valued in `ζ(A)`); `FittingOrder.iwasawa` (An open central `Γ₀` supplies the Iwasawa example over `ℤ_p[[Γ₀]]`).

**Checks.**

- `fitting_order_1`: For `Λ=M₂(Z₃)`, take `o=Z₃` and `A=M₂(Q₃)`; the reduced norm is the `2×2` determinant.
- `fitting_order_2`: For `Λ=ℤ_p[C_p], A=ℚ_p[C_p]` is semisimple despite `p` dividing the group order; semisimplicity is required over `F`, not over the residue field.
- `fitting_order_3`: For `Λ=ℤ_p[[ℤ_p]]`, use `o=Λ` and `A=Frac(Λ)`; the coefficient domain need not be a DVR.
- `fitting_order_4`: An arbitrary higher-dimensional nonabelian Iwasawa algebra is not admitted by the central dimension-one construction.

*Needs:* [3.12](#ne3-semisimple-total-quotient) (Semisimple total quotient in dimension one); [3.13](#ne3-reduced-norm-sk1-comparison) (Reduced norms and the surviving `SK₁` ambiguity); IntegralHeckeAndGaloisDeterminants Layer 0.

<a id="ne7-fitting-integrality-denominators"></a>
### 7.20 Integrality ring and denominator ideal

**Construction.** For a Fitting order `Λ⊆Λ′⊆A`, define `I(Λ)` as the `ζ(Λ)`-module generated by `nr(H)` for square matrices `H` over `Λ` of all sizes; it is a commutative order between `ζ(Λ)` and `ζ(Λ′)`. Let `H*` be the generalized adjoint computed from the reduced characteristic polynomials of the simple factors, so `H*H=HH*=nr(H)I`. Define `H(Λ)={x∈ζ(Λ): xH* has entries in Λ for every square H over Λ}`. It is a central ideal satisfying `H(Λ)I(Λ)=H(Λ)⊆ζ(Λ)`. The central conductor `F(Λ)={x∈ζ(Λ′):xΛ′⊆Λ}` lies in `H(Λ)`.

See Nickel, §2.2 and Example 2.8, pp. 8–9; §3.1, pp. 11–12; Proposition 3.8, p. 13: Defines the norm integrality ring and adjoint denominator ideal and explains the conductor relation.

The hypotheses are as follows. The Fitting order hypotheses and its reduced norms; all matrix sizes enter the definitions.

*Construction.*

1. Use reduced Cayley–Hamilton in each simple factor to form the generalized adjoint.
2. Block sums and matrix products show that the norm-generated module is a ring and is finite over `ζ(Λ)`.
3. Use the integral adjoint condition to prove the ideal and conductor inclusions, retaining the actual integral order.

API: `FittingIntegralityRing.mem` (`I(Λ)` is generated over `ζ(Λ)` by all square-matrix reduced norms); `GeneralizedAdjoint.mul` (`H*H=HH*=nr(H)I` over the ambient semisimple algebra); `FittingDenominatorIdeal.mem` (`x∈H(Λ)` iff `x∈ζ(Λ)` clears every generalized-adjoint denominator); `FittingDenominatorIdeal.integrality` (`H(Λ)I(Λ)=H(Λ)` and `F(Λ)⊆H(Λ)`); `FittingDenominatorIdeal.maximal` (For a maximal order, `H(Λ)=I(Λ)=ζ(Λ)`).

**Checks.**

- `fitting_integrality_denominators_1`: For a commutative order, generalized adjoints are ordinary adjugates, so `H(Λ)=I(Λ)=Λ`.
- `fitting_integrality_denominators_2`: For `Λ=M₂(Z₃)`, the center and both auxiliary ideals identify with `Z₃`.
- `fitting_integrality_denominators_3`: For `Λ=ℤ_p[D_(2p)]` with `p` odd, `nr(σ+τ)=(1/p)Σ_g g` lies in `I(Λ)` but not `ζ(Λ)`; forcing all norms into the integral center is false.
- `fitting_integrality_denominators_4`: For finite `ℤ_p[G], H(Λ)=ζ(Λ)` iff `p` does not divide `|G′|`, as in Proposition 3.8; this is not the condition `p∤|G|`.

*Needs:* [7.19](#ne7-fitting-order) (Orders admitted for noncommutative Fitting invariants); IntegralHeckeAndGaloisDeterminants Layer 0.

<a id="ne7-maximal-noncommutative-fitting"></a>
### 7.21 Maximal noncommutative Fitting invariant

**Construction.** For a finite presentation `Λ^a --h→ Λ^b→M→0` of a left module (row vectors, `h` acts on the right), put `Fitt_Λ(h)=0` if `a<b` and otherwise take the `I(Λ)`-ideal generated by reduced norms of all `b×b` row submatrices. This invariant can depend on the presentation. Define `Fitt_Λ^max(M)` as the largest such ideal among all finite presentations; it exists by noetherianity and the ability to enlarge presentations. It is an `I(Λ)`-ideal in `ζ(A)`, not in general an ideal of `ζ(Λ)`. An epimorphism `M→N` gives `Fitt^max(M)⊆Fitt^max(N)`.

See Nickel, §2.3, Example 2.11, Theorem 2.13, Definition 2.14 and Lemma 2.17, pp. 9–11: Defines the presentation invariant, demonstrates dependence and constructs its maximal version.

The hypotheses are as follows. `Λ` a Fitting order; `M` finitely presented; matrix convention for left modules as stated.

*Construction.*

1. Take norms of all maximal square submatrices and generate an ideal in the integrality ring.
2. Compare enlarged presentations and use noetherianity to obtain a maximal invariant independent of a chosen presentation.
3. For a surjection adjoin its kernel’s generators to compare presentations. Do not assert general direct-sum multiplicativity without the extra hypotheses in Nickel’s later sections.

The commutative comparison `NoncommFitting.commutative` is with Tau Ceti's `TauCeti.fittingIdeal R M 0` (`TauCeti/RingTheory/FittingIdeal/Basic.lean`, at the pin).

API: `NoncommFitting.ofPresentation` (Generate the `I(Λ)`-ideal of maximal-square reduced norms, using zero for `a<b`); `NoncommFitting.maximal` (`Fitt(h)⊆Fitt^max(M)` for every presentation, and equality for at least one presentation); `NoncommFitting.iso` (An isomorphism of `Λ`-modules preserves the maximal invariant); `NoncommFitting.epimorphism` (For a surjection `M→N, Fitt^max(M)⊆Fitt^max(N)`); `NoncommFitting.commutative` (For commutative `Λ`, this is the usual zeroth Fitting ideal).

**Checks.**

- `maximal_noncommutative_fitting_1`: For `Λ=Z₃` and `M=Z₃/9`, the maximal invariant is (9); for a free nonzero module it is 0.
- `maximal_noncommutative_fitting_2`: For `Λ=M₂(Z₃)` and `M=0`, the identity presentation gives `I(Λ)=Z₃`. The surjective two-block presentation with blocks [[4,1],[1,4]] and [[5,1],[1,5]] has norms 15,24, giving the smaller presentation invariant `3Z₃`.
- `maximal_noncommutative_fitting_3`: For `M=0, Fitt^max(M)=I(Λ)`; maximizing is essential in the preceding matrix example.
- `maximal_noncommutative_fitting_4`: The exact-sequence product inclusion holds, but a general equality for direct sums is not part of this API.

*Needs:* [7.20](#ne7-fitting-integrality-denominators) (Integrality ring and denominator ideal); [7.19](#ne7-fitting-order) (Orders admitted for noncommutative Fitting invariants); Mathlib `Matrix`; Mathlib `IsNoetherianRing`; Tau Ceti `TauCeti.fittingIdeal`.

<a id="ne7-fitting-characteristic-class"></a>
### 7.22 Fitting invariant of a characteristic class

**Theorem.** Let `Λ` be a Fitting order with total quotient A and suppose `0→Λ^b --h→Λ^b→M→0` is exact. Then `h` is invertible over `A, ∂[h]=[M]` for the positive boundary of Layer 2, and `Fitt_Λ^max(M)=nr(h)I(Λ)`. More generally any `x∈K₁(A)` with `∂x=[M]` gives `Fitt_Λ^max(M)=nr(x)I(Λ)`, since changing `x` by `K₁(Λ)` changes its reduced norm by an `I(Λ)`-unit. If a zeta element has `∂ζ=−[M]`, use `nr(ζ⁻¹)`. Equality of the resulting Fitting ideals does not imply equality of boundary classes or zeta elements.

See Nickel, Proposition 2.18 and Remark 2.19, p. 11: The square-presentation formula and the one-way `K`-theory implication are explicit; the converse fails in general.

The hypotheses are as follows. `Λ` a Fitting order; `M` has an injective square finite-free presentation. For an arbitrary perfect complex with cohomology in several degrees, first specify the virtual/determinant invariant; this theorem concerns the module `M`.

*Proof.*

1. Apply Nickel Proposition 2.18 to the square presentation.
2. Use the localization relative triple to compute the boundary sign.
3. Use exactness of the `K₁/`relative-`K₀` sequence and `nr(K₁(Λ))⊆I(Λ)^×` to prove independence of the characteristic lift.

**Checks.**

- For `Λ=ℤ_p[[T]], h=(T)`, obtain `Fitt(Λ/T)=(T)`, not `(T⁻¹)`.
- Multiplying `h` by a `Λ`-invertible matrix changes its norm by an `I(Λ)`-unit and leaves the Fitting ideal unchanged.
- Equality of fractional ideals permits units of `I(Λ)` that need not arise from `nr K₁(Λ)`; it is insufficient for equality of relative classes.

*Needs:* [7.21](#ne7-maximal-noncommutative-fitting) (Maximal noncommutative Fitting invariant); [2.8](#ne2-relative-perfect-class) (Relative classes of torsion perfect complexes); [3.13](#ne3-reduced-norm-sk1-comparison) (Reduced norms and the surviving `SK₁` ambiguity).

<a id="ne7-fitting-annihilation"></a>
### 7.23 Denominator-corrected Fitting annihilation

**Theorem.** For every finitely presented module `M` over a Fitting order `Λ, H(Λ)Fitt_Λ^max(M)⊆Ann_(ζ(Λ))(M)`. Thus a characteristic-element`/`Fitting formula yields an integral central annihilator only after the stated denominator ideal is applied. For a commutative order `H(Λ)=Λ` and this reduces to the usual Fitting annihilator inclusion. For noncommutative orders no assertion that the raw reduced norm annihilates `M` integrally is made.

See Nickel, Theorem 3.16, p. 14; Examples 3.9 and 3.18, pp. 13–15: Proves denominator-corrected annihilation and shows why the integrality factor is necessary.

The hypotheses are as follows. `Λ` a Fitting order; `M` finitely presented; the actual `Λ, I(Λ)` and `H(Λ)` are used.

*Proof.*

1. For a chosen presentation use the generalized-adjoint identity to show `nr(H)` kills the relevant generators after denominator clearing.
2. Multiply by `x∈H(Λ)` to make the adjoint entries integral; sum over maximal submatrices and extend to the maximal invariant.
3. Use `H(Λ)I(Λ)=H(Λ)` to keep the resulting elements in `ζ(Λ)`.

**Checks.**

- For `ℤ_p/ p^n`, the formula gives `(p^n)⊆Ann(M)`, with equality.
- For `Λ=ℤ_p[G]` and augmentation ideal `Δ_pG`, the source computes `Fitt^max(Δ_pG)=(1/|G′|)N_G ℤ_p`, while the denominator-corrected product is `N_G ℤ_p=Ann_(ζΛ)(Δ_pG)`.
- For `G=S₃` and `p=3` the raw generator `(1/3)N_G` is not integral, so an annihilator claim in `ζΛ` before clearing denominators fails.

*Needs:* [7.20](#ne7-fitting-integrality-denominators) (Integrality ring and denominator ideal); [7.21](#ne7-maximal-noncommutative-fitting) (Maximal noncommutative Fitting invariant); [7.22](#ne7-fitting-characteristic-class) (Fitting invariant of a characteristic class).

<a id="ne7-exceptional-euler-leading-term"></a>
### 7.24 Exceptional Euler factors and Bockstein leading terms

**Comparison.** Suppose a representation-specialized characteristic function has a proved Laurent factorization `f(T)=E(T)g(T)`, with `E` a specified product of local Euler factors and `g(T)=T^m u(T), u(0)≠0`. Write `E(T)=T^e v(T), v(0)≠0`. Then `ord_T f=e+m` and the leading coefficient is `v(0)u(0)`. When the specialized perfect complex is semisimple in the Burns–Venjakob sense, identify this coefficient with its Bockstein determinant, retaining the boundary sign and the `Γ`-generator logarithmic conversion to an `s`-derivative. This conditional comparison separates an explicit local zero from any further zero in `g`; interpolation away from zeros alone supplies neither semisimplicity nor a regulator.

See Burns–Venjakob, Proposition 3.8, pp. 10–11; Remark 3.15 and Proposition 3.16, pp. 13–15; Theorem 6.7, pp. 33–36: Relates scalar order, Bockstein determinant, cyclotomic derivative and the additional height hypotheses.

The hypotheses are as follows. A proved local factorization and orders `e,m`; leading coefficients nonzero. For the determinant assertion, the source’s semisimplicity, rational acyclicity and chosen Bockstein trivialization hypotheses.

*Proof.*

1. Factor the scalar Laurent series and multiply the first nonzero coefficients.
2. Apply the existing leading-term/characteristic-series and partial-derivative comparisons with the same `Γ`-coordinate.
3. For arithmetic exceptional zeros the local cohomology factorization and the nondegenerate height or regulator are hypotheses; they are not inferred from a main-conjecture ideal equality.

**Checks.**

- `E(T)=1−(1+T)=−T` and `g(0)=a≠0` give a simple zero with leading coefficient `−a`; losing the local sign fails.
- For `C=[Λ --T→Λ]` in degrees `−1,0`, BV’s characteristic function `T⁻¹` has order `−1`; its shift has order 1 and the inverse leading coefficient, according to the determinant convention.
- If `E(T)=−T` and `g(T)=T u(T)`, the total order is 2; a single local exceptional factor does not prove the global order is 1.

*Needs:* [7.5](#ne7-leading-term-characteristic-series) (Leading terms as leading coefficients of characteristic series); [7.7](#ne7-partial-derivative-interpretation) (Leading terms as derivatives in the cyclotomic direction); [7.17](#ne7-height-pairing-bockstein) (Nekovář's `p`-adic height as a Bockstein map; semisimplicity iff non-degenerate (BV §6.2, Propositions 6.4, 6.6)); [5.6](#ne5-zeta-interpolation-contract) (Localized zeta interpolation contract).

### Examples

- A pole, a zero and a failed semisimplicity test for two-term complexes (Worked examples, example 5).
- Maximizing Fitting presentations over `M₂(ℤ₃)` (Worked examples, example 6).
- The rank-one Tate computation fixing the normalization `c_γ^(−m)` (Worked examples, example 9).

### Dependencies

Layers 1–6 of this roadmap; the completed group algebra of Tau Ceti and TauCetiRoadmap ProfiniteProPGroups Layer 9; TauCetiRoadmap ProfiniteCohomology; §F.2; §F.3; GeneralAlgebraicKTheory §§5.7, 5.10, 6.19; IntegralHeckeAndGaloisDeterminants Layer 0; RepresentationTheory`/`SemisimpleAlgebras; §F.6; §F.4; ClassicalArithmeticCompletion’s local-constant contract; the Dedekind complex-germ comparison in Exact supplier contracts (Dedekind residue); Tau Ceti `TauCeti.fittingIdeal`; Mathlib `Complex.Gamma`, `IsNoetherianRing`, `Matrix`, `Padic`.

## Main theorems compared

| Source | Setting | Output and `μ` hypothesis | Uniqueness | Prime 2 |
|---|---|---|---|---|
| Kakde, Theorem 11; §§4–6, pp. 19–90 | Admissible `p`-adic Lie extension of a totally real field, containing the cyclotomic tower; `μ = 0` | A zeta element in `K′₁` of the canonical localization, through the elementary reductions and `M1`–`M4`; the analytic congruences come from the full Möbius congruences of Ritter–Weiss and the descent of §6.31 (§6.34) | In `K′₁`, the integral `SK₁` quotiented out | Not covered |
| Ritter–Weiss 2011, theorem p. 1; Theorem 7, p. 4 | Totally real `K/k`, finite over `k_cyc`; odd `p`; `μ = 0` | `Θ ∈ K₁(QG)` with prescribed `Det` and relative boundary (§6.30) | Existence only | Not covered |
| Ritter–Weiss 2026, Theorem 1`A`, pp. 6–8 | Dimension-one total quotients and the cyclic algebras `D_(r,s,F)` | Vanishing of `SK₁(QG)` reduced to vanishing for the `D_(r,s,F)` (§6.35) | Conditional on that vanishing | Not covered |
| Gambheera–Popescu, Theorem 6.30, pp. 33–34 | Finite abelian CM `H/F`, cyclotomic tower, odd `p`, the `S, T` conditions | Fitting ideal of the minus smoothed Selmer module and an injective square presentation, without `μ = 0` (§6.36) | Equality of Fitting ideals only | Not covered |
| Burns–Venjakob, Theorems 5.5 and 6.7 | Tate motive, or critical motives, with the named zeta, local and height hypotheses | Leading-term interpolation on shifted complexes (§§7.13, 7.14, 7.18) | No unconditional existence | `p` odd |

Kakde's route to §6.34 keeps his elementary reductions, the additive theorem and the multiplicative logarithm. Its analytic branch uses full subgroup Möbius congruences at a unit-idele cusp, with one smoothing element for every conductor (§§6.22, 6.24), the Ritter–Weiss completed construction (§6.30) and the completed-to-canonical comparison (§6.31). The unweighted cyclic-overgroup congruence of Kakde's (12) fails the finite test of example 7 below (correction `E33`), so that branch and the omitted argument for (29) are replaced. The enlarged extension of §6.26 remains valid but is not needed on this route. The unconditional abelian minus theorem uses its own smoothed Selmer module; its comparison with the Tate-module dual needs `μ = 0` and cannot remove that hypothesis from a different theorem.

## Corrections to the sources

Each entry names the version read; confirming an entry does not assert that the paper's main theorem is false. Statements are paraphrased.

- **E1** (Kakde, Definition 49, p. 34 (arXiv v3); misprint). The abbreviation for the completed trace ideal refers to an unrelated second subgroup. *Correction:* Use the completed trace from `P` to its normalizer `N_G P`, consistently with the two uncompleted abbreviations. *Reason:* `T_P` is the `N_GP`-trace image in all three settings, as the first two entries and the uses of `pT̂_P` in Definition 51 `(M4)` and Lemma 118 show; `P′` is not bound in that sentence. Affects nothing downstream.
- **E2** (Kakde, §5.3.1, p. 36; also Remark 59 (p. 38), the proof of Lemma 63 (p. 41), and pp. 47–51 (arXiv v3); misprint). Several domains of the additive maps use an undefined conjugacy-class label. *Correction:* Use the free module on `Conj(G)`, as in Definition 55 and Theorem 58. *Reason:* Only `Conj(G)` is defined (Remark 42, Lemma 43); the same map is written with `Conj(G)` in Definition 55 and Theorem 58. Affects nothing downstream.
- **E3** (Kakde, Proof of Proposition 74, p. 50 (arXiv v3); misprint). The Frobenius terms in the expanded logarithm do not carry the successive powers of `v`. *Correction:* The degree-`k` term of the second sum is `ϕ(v^k)/(pk)`, because `ϕ` is applied to the logarithm series. *Reason:* `L = log − (ϕ/p)log` and `log(1 − v) = −Σ_k v^k/k`, so the second sum is `(1/p)Σ_k ϕ(v^k)/k`; the next line of the proof, `Σ_k (v^{pk} − ϕ(v^k))/(pk)`, uses this corrected form. Affects nothing downstream.
- **E4** (Kakde, Corollary 90, p. 65 (arXiv v3); gap in the proof). Corollary 90 states injection of integral `K′₁` into localized `K′₁` for general compact analytic `G`. *Correction:* Prove it by Theorems 52–53 in the pro-`p` dimension-one case, the three elementary reductions, and Corollary 20 for the inverse limit. The unramified coefficient extension needs the reductions over `O`, not only their printed `ℤ_p` case. *Reason:* For `G` that is not pro-`p` of dimension one, the statement needs the §4 reductions and a limit argument, which the text does not spell out; §6.16 gives the proof. Affects the proof, not the statement.
- **E5** (Kakde, Proof of Proposition 104, display (21) and the next line, p. 74 (arXiv v3); misprint). The transfer pullback is attached to the wrong smoothed partial-zeta term in display (21). *Correction:* Evaluate the `P`-term on `δ(y)` and the `P′`-term on `δ(y)` composed with transfer, preserving the arguments `1−k` and `1−pk` respectively. *Reason:* (19) has `Δ^{u^p}_P(δ(y), 1 − k)` and (20) has `Δ^u_{P′}(δ(y)∘ver^{P′}_P, 1 − pk)`; `δ(y)∘ver^{P′}_P` is a function on `U_{P′}^ab`, so it cannot be the argument of `Δ_P`. The orbit computation two lines later uses the corrected form. Affects nothing downstream.
- **E6** (Kakde, Proof of Proposition 106, the `W_GP`-orbit sum, p. 75 (arXiv v3); misprint). An orbit-sum `L`-value is evaluated with the prime `p` in place of the varying weight. *Correction:* Use the argument `1−k`, consistently with display (23) and the next application of Lemma 103. *Reason:* The terms come from (23), where the value is at `1 − k`; the next line of the proof, after Lemma 103, has `Δ^v_P(δ(y), 1 − k)`. Affects nothing downstream.
- **E7** (Kakde, Proofs of Propositions 116 (p. 84) and 117 (p. 85) (arXiv v3); error). The proof uses a congruence modulo the full integer `r_P` and then only a size comparison with a stabilizer. *Correction:* Use the congruence modulo `p^v_p(r_P)`; the stabilizer order divides this `p`-part. The exponent difference `(r_P/p)(p−1)` is divisible by the corresponding Euler totient. The full modulus is false, for `p=3` and `r_P=15`, since `2^10=4` modulo 15. *Reason:* The congruence modulo `r_P` fails when `r_P` has a prime factor other than `p`: for `[F : ℚ] = 5, p = 3` and `d_P = 3, r_P = 15` and `2^{−15} ≡ 2^{−5} (mod 15)` would need `2^{10} ≡ 1 (mod 15)`, but `2^{10} ≡ 4`. An inequality `r_P ≥ |(W_GP)_y|` does not give a congruence modulo `|(W_GP)_y|` in any case. The `p`-part version suffices for the conclusion. Affects the proof, not the statement.
- **E8** (Kakde, Proof of Proposition 117, the constant-term identity, p. 85 (arXiv v3); misprint). The constant-term comparison omits the weight from a norm exponent and omits the pullback in the second partial-zeta term. *Correction:* The norm exponent contains `pd_(P′)k`, and the `P′`-term is evaluated on `δ(y)` composed with `ϕ`, matching the second Eisenstein series. *Reason:* `E` has weight `pd_{P′}k`, and the second Eisenstein series in `E` is `G_{pk,δ(y)∘ϕ}`, as in the definition of `E` and in (28). Affects nothing downstream.
- **E9** (Kakde, §6.13.3, second congruence of the logarithm computation, p. 89 (arXiv v3); misprint). The second congruence in the logarithm calculation loses Frobenius inside the character operator. *Correction:* Each term has `ω_P^k` applied to `ϕ(ζ_(P′))`; the following summation starts at `k=0`. *Reason:* The step replaces `pζ_P − Σ_kω^k_P(ζ_P)` using (34), whose right side involves `ω^k_P(ϕ(ζ_{P′}))`; the third line combines the two fractions with numerator `pϕ(ζ_{P′}) − Σ_kω^k_P(ϕ(ζ_{P′}))`. Affects nothing downstream.
- **E10** (Kakde, §6.13, the construction of `F̃_∞` (pp. 86–87, arXiv v3); gap in the proof). The auxiliary enlarged extension is used under admissibility and `μ=0` without justifying those hypotheses. *Correction:* Check total reality using the odd degree of the cyclotomic subfield, enlarge `Σ` by the auxiliary prime, and use the transfer of `μ=0` to finite `p`-extensions before applying Proposition 93. *Reason:* §6.13.1 defines `F̃ = KF` and `F̃_∞ = F̃F_∞` and states the Galois group, but gives no argument for admissibility (total reality of `F̃`) or for the `μ = 0` hypothesis (Definition 8) for `F̃_∞/F`, both of which Proposition 93 needs. Affects the proof, not the statement.
- **E11** (Burns–Venjakob, §2.2, p. 6, and Definition 3.14, p. 14 (arXiv v2); published §2.2 pp.170–171, Remark3.5 p.175 and Definition3.14 p.181; error). The category generated by a semisimple complex is taken closed under extensions, and then asserted to remain semisimple. *Correction:* Generate it using quasi-isomorphisms, shifts and direct sums. Semisimple complexes are not extension closed: the upper triangular matrix with diagonal `T` and upper entry 1 has cokernel `Λ/T²`, whose Bockstein differential vanishes, although its two diagonal pieces are semisimple. *Reason:* `Σ^{ss}` is not closed under extensions (the source itself notes it fails (iv), Remark 3.5). For `R = Λ(Γ)` and `A· = [R --T--> R]` (semisimple, the example in the proof of Proposition 3.8), `B· = [R² --M--> R²]` with `M = ((T, 1), (0, T))` is an extension `0 → A· → B· → A· → 0`, so `B· ∈ Σ_{A·}`; but `H^0(B·) ≅ R/T², κ_0 : (R/T²)^Γ → (R/T²)_Γ` is zero, and the Bockstein complex of `B·` is `ℤ_p` in degrees 0 and 1 with zero differential, so `B· ∉ Σ^{ss}`. Affects a stated result.
- **E12** (Burns–Venjakob, arXiv v2 and the authors' final version, §5.3, Corollary 5.7 and proof, p. 27; published Corollary5.7 and proof p.196; error). Corollary 5.7 applies permutation-character induction to every `ℚ_p`-valued character. *Correction:* Restrict this proof to `Q`-valued characters. For `C₃` and `p≡1` modulo 3, a nonrational character takes values in `ℚ_p` but no positive multiple is an integer combination of rational-valued permutation characters. *Reason:* Every permutation character `Ind_H 1_H` is `ℚ`-valued, so an integer combination of them is `ℚ`-valued; a character of `ℤ/3` with values in `ℚ(ζ₃) ⊂ ℚ_p (p ≡ 1 mod 3)` is `ℚ_p`-rational but `n·ρ` is never `ℚ`-valued. Artin's theorem as cited (Tate, Chapitre II, Théorème 1.2) concerns `ℚ`-rational characters. Affects a stated result.
- **E13** (Burns–Venjakob, arXiv v2 and the authors' final version, §6.1, definition of `Γ^*`, p. 28; published §6.1 pp.196–197; misprint). The Gamma-star definition puts the negated integer on the left but evaluates the Gamma function or residue at the unnegated integer on the right. *Correction:* Index `Γ*(j)` at `j`: it is `(j−1)!` for `j>0` and `(−1)^j/((−j)!)` for `j≤0`. This agrees with the subsequent Hodge-factor product. *Reason:* The right-hand sides are functions of `j` (and the residue formula is the residue of `Γ` at `s = j ≤ 0`), and the next line uses `Γ^*(j)` in `Γ_L(V) = ∏Γ^*(j)^{−h(−j)}`; with the printed left-hand side, `Γ^*(−j)` for `j > 0` would be `(j − 1)!`, contradicting the residue at negative arguments. Affects nothing downstream.
- **E14** (Burns–Venjakob, arXiv v2 and the authors' final version, §6.3, Proposition 6.6, p. 32; published Lemma6.7 pp.202–203; misprint). Both parts of Proposition 6.6 have the same enumeration label. *Correction:* Number the second assertion (ii). *Reason:* Two consecutive items are numbered (i). Affects nothing downstream.
- **E15** (Kakde, §5.1.2, p. 31 (arXiv v3), carry cocycle assertions; error). The cocycle assertions include inverse-pair normalization and literal independence from the selected generator. *Correction:* For the displayed fixed section, `τ(γ̄,γ̄⁻¹)=γ^(p^e)` when `p^e>1`. Retain normalization at the identity, compute basis inverses with this carry factor, and express a changed section by the induced cohomologous presentation. *Reason:* Take `G=Γ` and `Z=Γ^(p^e)`. The representatives of `γ̄` and `γ̄⁻¹` have exponents 1 and `p^e−1`; their sum crosses exactly one central period. Affects a stated result.
- **E16** (CFKSV, Published Numdam version, §4, equation (94) and its use, pp. 196–197; misprint). The displayed character-twist substitution uses the inverse of `η(γ)`, under the ring-map convention `Φ_ρ(g)=ρ(g)ḡ`. *Correction:* For `a=η(γ)`, use `Φ′_(ρη)(ξ)(T)=Φ′_ρ(ξ)(a(1+T)−1)`. A pole at `α` is detected by `a=1+α`. *Reason:* For `ξ=[γ]` and trivial `ρ`, the defining ring map gives `Φ′_η(ξ)=a(1+T)`. The inverse substitution gives `a⁻¹(1+T)`, so it fails whenever `a²≠1`. This exact matrix identity must be checked before passing to any quotient by units. Affects nothing downstream.
- **E17** (Kakde, arXiv v3, Definition 57 `(A1)`, p. 37; misprint). The cyclic-upper-subgroup branch of `A1` asserts trace zero without excluding `P=P′`. *Correction:* Impose that zero condition only for the strict inclusion `P<P′` when `P′` is cyclic; equality imposes no vanishing. *Reason:* For `Ḡ=P=P′=1, β` is the identity on `R` and the trace is the identity. The unrestricted zero condition would force every image coefficient to vanish, contradicting Lemma 60. Affects nothing downstream.
- **E18** (Kakde, arXiv v3, Definition 55, the character-averaging reformulation, p. 37; misprint). The reformulation by an order-`p` character is stated for cyclic `P` without separating the trivial group. *Correction:* Keep `η_P` defined by projection to generators; `η_1=id`. The order-`p` character averaging formula applies only to nontrivial cyclic `P`. *Reason:* The identity generates the trivial group. An averaging expression using a trivial character would instead give `η_1=0` and break `δβ=id` for `Ḡ=1`. Affects nothing downstream.
- **E19** (Kakde, arXiv v3, §5.1.2, Lemma 37 and coefficient convention, p. 31; error). The central denominator set is the complement of `pR` while the coefficient ring is also allowed to be a finite direct sum of unramified integer rings. *Correction:* For `R=∏_i R_i` use `T=∏_i(R_i∖pR_i)` and take the componentwise localizations. For a coefficient domain the original complement is correct. *Reason:* In a two-factor coefficient product (1,0) and (0,1) lie outside `pR`, but their product is zero. Thus the literal complement is neither multiplicative nor regular; reduction to each coefficient domain requires changing the denominator set. Affects a stated result.
- **E20** (Kakde, arXiv v3, proof of Lemma 72, p. 49; misprint). The `mod-p` quotient of the `p`-adically completed localization at `(p)` is identified with a formal power-series ring. *Correction:* The quotient is `F_q((T))`, the Laurent series field. Frobenius is still coefficient Frobenius together with `T↦T^p`. *Reason:* `T` is already inverted when localizing `O[[T]]` at `(p)`; reduction gives the fraction field of `F_q[[T]]`. Completion in `p` does not remove that inverse. Affects nothing downstream.
- **E21** (Kakde, arXiv v3, Lemma 86 and the embedding in Lemma 88, pp. 61–62; misprint). The scalar root-of-unity factor is embedded identically into every norm component. *Correction:* In the `P` component send `(ζ,g)` to `ζ^[G:U_P]·ver^G_(U_P)(g)`, as required by the `K₁` norm. *Reason:* The determinant of multiplication by a central scalar on a free module of rank `[G:U_P]` is that scalar to this rank. For `p=3` and `O` unramified of degree 2, a Teichmüller unit of order 8 has rank-3 norm `ζ³≠ζ`. Affects nothing downstream.
- **E22** (Kakde, arXiv v3, proof of Lemma 88, formula for `ω` on p. 64, compared with Lemma 87, p. 61; error). The map `ω` on additive tuples is recovered from the component `a_Ḡ` alone. *Correction:* Define `ω_ψ=ω_A∘δ`, as forced by the additive isomorphism and Lemma 87. Reprove the exactness calculation with the untruncated abelian trace in the cyclic case. *Reason:* For `G=Γ, Z=Γ^p, Ḡ=C_p` and `a=z=γ^p` in the central coefficient ring, `β_Ḡ(a)=0` because `η_Ḡ` deletes the identity-labelled basis term, whereas `ω_A(a)=z≠1`. The displayed formula is incompatible with `ω_ψβ=ω_A`. Affects the proof, not the statement.
- **E23** (Kakde, arXiv v3, proof of Lemma 114, p. 82; misprint). The coset-orbit length used in the transfer product is the order of `g` rather than its order modulo `P`. *Correction:* Use `m=ord(gP)` in `N/P`. Since `P` is normal in `N`, these are the lengths of the `g`-orbits on `N/P`. *Reason:* If `g∈P` is nontrivial, its action on `N/P` is trivial, so the orbit length is 1 even though `ord(g)>1`. The printed representative list therefore repeats cosets. Affects nothing downstream.
- **E24** (Kakde, arXiv v3, §6.13.3, first logarithm congruence, p. 88; misprint). The first-order logarithm of the ratio `r` is replaced by `1−r`. *Correction:* Use `log(r)≡r−1` modulo `(r−1)²`. Negate the subsequent first-order expressions consistently; the final ideal membership is unchanged. *Reason:* The formal series is `log(1+x)=x+O(x²)`. At odd `p` its first-order term cannot be `−x`. All later divisibility claims survive multiplying the expression by `−1`. Affects nothing downstream.
- **E25** (Burns–Venjakob, arXiv v2 and author final, §6.2, condition `(DP)`, p. 29; published `condition(DP)` pp.197–198; misprint). The indicated ordinary subrepresentation is required to identify its degree-zero Hodge filtration with the de Rham quotient of `W`. *Correction:* Require the natural map `D_dR(Ŵ)→t_p(W)` to be an isomorphism; then `Fil⁰D_dR(Ŵ)=0` and `t_p(W̃)=0`. The superscript zero on the first de Rham term is misplaced. *Reason:* The following sentence requires that very `Fil⁰` term to vanish. For `W=ℚ_p(1)`, the intended `Ŵ=W` has zero `Fil⁰` but a one-dimensional `t_p(W)`, so the literal condition contradicts the standard example. Affects nothing downstream.
- **E26** (Kakde, arXiv v3, proofs of Propositions 115–117, pp. 83–86; compare §6.7, p. 78; gap in the proof). The restriction to a normalizer fixed field is assigned weight using `d_P=[F_P:F]`, and its cusp is chosen with unchanged Artin symbol `u`. *Correction:* The weight factor is the relative degree `[N_ḠP:P]`. To obtain the stated smoothing exponents choose the cusp Artin symbol `u^(d_P/[N_ḠP:P])` (and the analogous `P′` version). These corrections are checked through the cusp`/Hecke` and orbit calculations. *Reason:* Section 6.7 multiplies the weight by the relative extension degree. If `N_ḠP` is proper in `Ḡ, [F_P:F_(N_ḠP)]` differs from `[F_P:F]`. For a noncentral order-3 subgroup in the order-27 Heisenberg group the factors are 3 and 9. The stated weight and cusp identity then do not follow from Lemma 109. The necessary proof repair remains explicit rather than asserting a counterexample to the final congruences. Affects the proof, not the statement.
- **E27** (Burns–Venjakob, arXiv v2 and author final, §5.2, map following (19), p. 24; published §5.2 p.193; gap in the proof). The `p`-adic logarithm map `μ_p` is declared an isomorphism immediately from its factorization through the trace-zero space. *Correction:* It is a linear map; isomorphism is precisely the appropriate Leopoldt nonvanishing input. A quotient by its determinant needs that nonvanishing as an explicit assumption or as part of the conjectural predicate. *Reason:* Factorization fixes the codomain but does not prove injectivity. The later permutation-character discussion on p. 25 explicitly makes the nonzero `p`-adic regulator equivalent to Leopoldt. This is a missing hypothesis/`proof`, not a known counterexample to Leopoldt. Affects the proof, not the statement.
- **E28** (Burns–Venjakob, arXiv v2 and author final, Remark 5.6 p. 25, (21)–(24) p. 26; (36)–(37) p. 33 and proof p. 35; published Conjecture4.1 p.188, Remark5.`6/proof` pp.194–195, (38)–(39) pp.201–202 and proof p.204; gap in the proof). The inverse global compact-support determinant is inserted into a leading-term pair for the unshifted complex; the Selmer construction also switches determinant orientation between its definition and the evaluation proof. *Correction:* Give the typed shifted/`dual` complex comparison, map into its determinant and Bockstein trivialization, recomputing order and boundary signs. *Reason:* Definition 2.5 requires `a:1→d(C)`, and Definition 3.4 gives `t(C):d(C)_Q→1`. The global `ζ` in Conjecture 4.1 and (21) has codomain `d(C)⁻¹`; (24) then treats `t(C)` as though it started from that inverse line. Likewise p. 33 uses `d(SC_U)`, while p. 35 uses its inverse. Composition inverse and monoidal inverse are distinguished by Remark 2.2 but no typed identification resolving this switch is given. Affects the proof, not the statement.
- **E29** (CFKSV, Published Numdam version, proof of Lemma 3.7, last displayed right action, p. 179; misprint). The row-vector right action multiplies by the transpose of `ρ(g)`. *Correction:* The Morita row module induced by `Φ_ρ(g)=ρ(g)ḡ` acts as `v·g=ḡ·vρ(g)`. Passing from right to left modules introduces the inverse transpose contragredient on the module twist. *Reason:* For rows, successive multiplication by `ρ(g)^t` and `ρ(h)^t` gives `ρ(g)^tρ(h)^t=(ρ(h)ρ(g))^t` rather than `ρ(gh)^t`. It is not a right group action for a noncommuting representation. Using `ρ(g)` is associative and agrees with the stated ring map. Affects nothing downstream.
- **E30** (Burns–Venjakob, Remark6.8, p.33, arXiv v2 and author final; published Remark6.6 p.202; misprint). The exceptional-zero discussion permits `P_(L,p)(W,0)=0` when `(B1)` fails. *Correction:* The possible zero is at `u=1`, the point corresponding to `s=0` under `u=p^s`; the constant term at `u=0` is always1. Failure of `(B1)` can arise from `W` or its dual `Z`, so retain that distinction. *Reason:* The definition is `P_(L,p)(W,u)=det(1−φ_p u|D_cris(W))`; substituting `u=0` gives `det(1)=1`. The continuation on p.34 evaluates the local factor at `u=1`. Affects nothing downstream.
- **E31** (Burns–Venjakob, Example6.3, p.31 arXiv v2 `/` author final; published Example6.3 p.200; error). A split multiplicative elliptic curve is presented as `failing(B1)`. *Correction:* For trivial `ρ` and `W=V_p(E), (B1)` holds and `(C1)` fails. Keep the Frobenius factor of the full representation distinct from that of its ordinary quotient. *Reason:* Berger §§I`I`.4.2–II.4.4 pp.17–19 gives `W` as `0→ℚ_p(1)→W→ℚ_p→0` and `φ`-eigenvalues `p⁻¹,1` on `D_st(W)`. Since `Ny=v_p(q)x≠0, D_cris(W)=`kerN has only the `p⁻¹` eigenvalue. The Weil pairing identifies `Z=W*(1)` with `W`. Thus the two `B1` factors equal1`−p⁻¹≠0`, whereas both `C1` quotients are `ℚ_p` and have factor0. Affects a stated result.
- **E32** (Burns–Venjakob, Corollary5.7 proof, p.27 arXiv v2 `/` author final; published Corollary5.7 proof p.196; error). The proof identifies permutation characters with characters admitting an integral linear combination of subgroup permutation characters. *Correction:* An integral combination is a virtual permutation character. A permutation representation gives such a combination, which is all this part of the proof requires; the converse is false. *Reason:* For `C₂` the sign character is `Ind_1^C₂(1)−1` and is the character of an actual one-dimensional representation. Its value at the nonidentity element is`−1`, while every permutation character counts fixed points and is nonnegative. Thus `n_ρ=1` in the displayed integer-combination formula does not characterize permutation characters. Affects nothing downstream.
- **E33** (Kakde, arXiv:1008.0142v3, Proposition 98, (12), p.69; Proposition 116, pp.84–85; error). The zeta function for a cyclic `P` is congruent modulo its Weyl trace ideal to the unweighted sum of `φ(ζ_{P′})` over cyclic `P′` with `P′^p=P`. The proof cancels the fixed-pair contribution as if there were one such `P′`. *Correction:* Replace this analytic branch by full subgroup Möbius sums, with all multiplicities, rather than assuming (12). The main conjecture is unaffected. *Reason:* Take `G=C_{p²}×Γ, Z=Γ^p` and `P=pC_{p²}×0` in `G/Z`. The `p` distinct cyclic overgroups `P′=〈(1,t)〉, t∈C_p`, all satisfy `P′^p=P`. Since `G` is abelian, `T_P=p²Λ(U_P)_S`, and `M3` gives `φ(ζ_{P′})≡ζ_P` modulo `p` for each `P′`. Reducing (12) modulo `p` would give `ζ_P≡pζ_P=0`, impossible for a unit. This setting is realized by the compositum of the cyclotomic tower of `Q` and a disjoint cyclic degree-`p²` totally real abelian extension; its `μ` vanishes. In the proposed fixed-pair proof, the pair `(β, b)=(a,O_L)` at rational positive `a`, with identity Artin coset, is fixed by the whole group and contributes multiplicity `1−p` modulo `p` rather than 0. Affects a stated result.
- **E34** (Kakde, arXiv:1008.0142v3, Propositions 115–117, pp.83–86, especially the use of `E−E|g_u` and the final omitted (29) argument; gap in the proof). A cusp difference is asserted to have the required smoothed constant term after restriction and a `U`-operator, without comparing that operator at the chosen cusp. Proposition 117 then refers the last value congruence to a similar argument. *Correction:* For the replacement full Möbius theorem use a unit-idele cusp `(E41): D_γ` normalizes the adelic level, with both fractional-ideal lattices retained, and commutes with `t_β=diag(1,β)`. This proves the double-coset identity and hence the constant-term comparison in §6.22; it includes the special cusps of Ritter–Weiss. Retain the relative degree in the weight and its identical exponent in the cusp norm. No arbitrary-`g` or omitted-`(29)` proof is asserted. *Reason:* The `U`-operator formula at the standard cusp does not imply its constant-term formula at an arbitrary cusp. RW Congruences II, p.3 and Lemma 10 pp.10–11, identifies this issue in the method and proves a sufficient special-cusp comparison. Together with the false fixed-pair cancellation in `E33`, correcting only relative weights cannot verify the old analytic branch. Affects the proof, not the statement.
- **E35** (Burns–Venjakob, arXiv v2, Proposition 6.6 and Theorem 6.7, pp.32–33; published Lemma 6.7(ii), pp.202–203, and Theorem 6.5, p.201; error). The order `r` of the unshifted cyclotomic Selmer complex is identified with the positive dimension `h` of `H¹_f(Q,W)`. *Correction:* For the unshifted Selmer complex `r=−h`. For the shifted complex `SC[1]`, whose determinant is the target of the global composite, `r=h`. Keep the latter in the normalized interpolation formula. *Reason:* Under `(D2)` the special fiber is concentrated in degrees 1,2 and the height `B¹` is an isomorphism. Over the `T`-adic DVR, semisimplicity decomposes the torsion complex into `T`-blocks in degrees 1,2; each has ordinary cohomology only in degree 2 and contributes `(−1)^{2+1}=−1` to BV Definition 3.2. Thus `h` such blocks have `r=−h`. Equivalently `SC=[R --T→R]` in degrees 1,2 has characteristic `T⁻¹` with the identity trivialization, so its order is `−1`, not `+1`. Shifting negates it. Affects a stated result.
- **E36** (Burns–Venjakob, arXiv v2, Theorem 5.5 (20), Remark 5.6 and (21)–(25), pp.25–27; published Theorem 5.5 (24), p.193, Remark 5.6 and proof pp.194–196; error). The positive power `c_γ^m` multiplies the global leading term, while the map supplied by the conjecture has inverse compact-support determinant as its codomain. *Correction:* After the explicit determinant shift `D=RΓ_c[1]`, the given global map is `ζ_D:1→d(D), r(D)=−m` and `c_γ^(−m)[D,ζ_D]^*=L^*_{p,S}(1,ρ)`. The global map itself is transported, not inverted. *Reason:* For rank one let `B²=−ℓ/c_γ` in bases of `H²_c,H³_c`. In the inverse line the Bockstein trivialization is `−c_γ/ℓ`. Formula (21) gives `ζ=L^*_S(1,1)ℓ` in these same bases. The leading sign is `−1`, so the pair on `D` has coefficient `c_γ L^*_S(1,1)`; normalization needs `c_γ⁻¹`. More generally its value scales by `a^m` when `γ` changes to `γ^a`, while the normalized `p`-adic residue is generator independent. A factor `c_γ^m` would scale by `a^{2m}`. This is the consequence of repairing `E28` with the specified shift, not a claim about an already well-typed alternative convention. Affects a stated result.
- **E37** (Schneider–Venjakob (after Kakde), Author final congruences-final.pdf, Lemma 4.9, pp.28–29; compare the definition of `ℒ_V`, p.19, and Proposition 4.4, p.22; error). The noncyclic kernel calculation removes the central factor from the denominator, deduces `x_U^(p²|U/Z|)=1` and then concludes `x_U=1`. *Correction:* Keep `φ_Z(x_Z^p)` in the denominator. After the nontrivial cyclic `α` factors become 1, the equation is `x_U^(p²|U/Z|)=φ_Z(x_Z^p)`. It implies membership in `μ(O)×U^ab` using the torsion-free quotient of the abelian unit group, not that `x_U` is torsion or equals 1. *Reason:* Let `G=C_p×Γ` and `Z=Γ^p`, with `p` odd. The tuple `θ(γ)` is in `ker ℒ` because the integral logarithm kills group units. The top subgroup `G/Z=C_p²` is noncyclic and its component is `γ`, which has infinite order. The retained-factor equation reads `γ^(p⁴)=φ_Z((γ^(p²))^p)`, which holds; the printed conclusion does not. Affects the proof, not the statement.
- **E38** (Schneider–Venjakob (after Kakde), Author final congruences-final.pdf, §5, p.30, the reduction of `B(Z)` modulo `p`; misprint). The residue of the completed localization `B(Z)` is identified with `O/(p)[[Z]]`, without localizing the residue ring. *Correction:* For a generator `z` of `Z` and `T=z−1, B(Z)/pB(Z)=Frac(F_q[[T]])=F_q((T))`. The Frobenius statement remains true on this Laurent series field. *Reason:* The central denominator `T` is regular modulo `p` and is already inverted in `A(Z)`, hence in its `p`-adic completion `B(Z)`. Its inverse cannot lie in `F_q[[T]]`. This is the same missing localization as `E20`, now at a separate source locator. Affects the proof, not the statement.
- **E39** (Ardakov–Brown, arXiv:math`/0511345v1`, §3.1, Corollary proof, p.5; author IwasawaSurvey.pdf, §3.1, p.5; published Documenta Math. Extra Volume Coates (2006), §3.1, p.11; misprint). The geometric series `1+c+c²+⋯` is asserted to invert `1−c` when the constant coefficient `c_0` is nonzero. *Correction:* That geometric-series argument requires `c_0=0`. A general series with nonzero constant coefficient is a unit by first dividing by that coefficient and applying the corrected argument to its augmentation-zero part. *Reason:* Set `c=1`. Its constant coefficient is nonzero, but `1−c=0` is not invertible. If `c_0=0`, powers of `c` tend to zero in the complete augmentation filtration, giving the claimed inverse and the intended radical description. Affects nothing downstream.
- **E40** (Schneider–Venjakob (after Kakde), Author final congruences-final.pdf, Lemma 4.9 proof, p.29, trace decomposition after the representatives `R` are chosen; misprint). The difference `g−h` is equated to its own index-`p` trace before that trace is expanded using the coefficients `a_u` of a chosen preimage. *Correction:* Apply the trace to the chosen preimage `Σ_u a_u u`, as in the hypothesis of that paragraph and the expansion that follows. *Reason:* The invariant difference has trace `p(g−h)`, so the printed equality is not the consequence of invariance. The preceding choice says `g−h=σ(Σ_u a_u u)`, and the subsequent coefficient sum expands exactly this latter expression. The finite-quotient two-point support argument of §6.14 avoids the erroneous display. Affects nothing downstream.
- **E41** (Ritter–Weiss, *Congruences between abelian pseudomeasures, II*, arXiv:1001.2091v3, §2, p. 6, Proposition 5, pp. 6–7, Lemma 10, p. 10, and the conclusion, p. 11; gap in the proof). The Theorem on p. 2 asserts one `g` for which the smoothed Möbius sum lies in the trace ideal, and Proposition 4 needs the value congruence `(4⋆)` for that `g` and every `ε`. The proof chooses the conductor ideal `f` from `ε` (start of §2) and then the cusp `γ ≡ 1` modulo `f` (Proposition 5), so the element `g = j(γ)` depends on `ε`, and these elements tend to 1 as `f` grows; the authors note on p. 3 that the special cusps were introduced to avoid comparing constant terms of `F` and `F|U_β` at other cusps. *Correction:* Take `γ` a unit idele independent of `ε` (component `1 + p` at `p, 1` elsewhere). The adelic level `K` is normalized by `D_γ=diag(γ,γ⁻¹)`, and `D_γ` commutes with `t_β=diag(1,β)`, so `D_γ(Kt_βK)D_γ⁻¹=Kt_βK`. Transport through Deligne–Ribet (5.7)–(5.8), pp. 262–263, gives the constant-term comparison of Lemma 10 at this cusp for every `f`; this gives `(4⋆)` for one `g` and every `ε` (§§6.22, 6.24). The same comparison is the missing step in Kakde's proofs of Propositions 113 and 115–117, which use a cusp with prescribed Artin symbol without it `(E34)`.
- **E42** (Kakde, arXiv:1008.0142v3, §4.3, p. 26, finite-group logarithm-kernel calculation; error). The finite-`p`-group torsion formula is used for an arbitrary finite group. *Correction:* For finite `p`-groups retain `μ(ℤ_p) × P^ab × SK₁`, with the scalar roots of unity appropriate to `p`. For the `l`-elementary groups used here, §6.5 proves the injectivity of `θ` on `K′₁` by characters instead: every irreducible character is inflated from the quotient or induced from `G₁` (Kakde Lemma 31), and `K′₁` of each finite level embeds in `K₁` of its rational group algebra. `SK₁` vanishes at every finite level (`sk1_vanish_abelianSylow`), which gives the `K₁` form. No logarithm is needed. *Reason:* At `p=5` the idempotents (1±`g`)`/2` identify `ℤ₅[C₂]` with `ℤ₅×ℤ₅`, whose `K₁` torsion is `μ₄×μ₄` of order 16. The proposed `μ₄×C₂×SK₁` has order 8 because `SK₁=1`. This disproves that finite-group input, not Theorem 33. Affects the proof in the cited preprint version.

## Worked examples

1. **Canonical denominators.** For `Γ = ℤ_p` and `H = 1, S` consists of the series whose reduction modulo `p` is nonzero. `T ∈ S` because `Λ/ΛT = ℤ_p`, whereas `p ∉ S`. The `p`-saturation contains `p`; in this one-variable case `S*` is every nonzero element. The canonical localization `Λ(Γ)_S = Λ(Γ)_{(p)}` is distinct from the fraction field.
2. **A noncommutative finite quotient.** For `p = 5` and `G = S₃ × ℤ₅, Λ(G)` is free of rank 6 over `Λ(ℤ₅)`. Setting the `ℤ₅` coordinate to zero gives `ℤ₅[S₃]`, in which the products of (12) and (123) depend on their order. A commutative series algebra fails this comparison.
3. **The integral grading needs more.** At odd `p` the uniform semidirect product with `aba⁻¹ = b^{1+p}` has `[a, b] = b^p`. In the maximal-ideal grading of `ℤ_p[[G]]` the degree-two relation is `AB − BA = PB`, with `A, B, P` the symbols of `a − 1, b − 1, p`, so the integral graded ring is not commutative. Modulo `p` the corresponding term lies in higher degree and the augmentation grading is polynomial. The integral polynomial statement of §0.9 uses the extra commutator condition.
4. **Carry inverses.** For `G = Γ` and `Z = Γ^(p^e), e > 0`, the chosen representatives have exponents 0 through `p^e − 1`. The pair `γ̄, γ̄⁻¹` produces one carry, so `τ(γ̄, γ̄⁻¹) = γ^(p^e)`. A basis inverse needs the inverse carry factor although the cocycle is normalized at 1 (§6.7, correction `E15`).
5. **A pole, a zero and a failed semisimplicity test.** For `C = [Λ --T→ Λ]` in degrees `−1, 0` with trivialization `a_ε`, the characteristic function is `ε/T`, the order is `−1` and the leading term is `ε(0)`. Its shift has order 1 and leading term `ε(0)⁻¹`. The extension with matrix `[[T, 1], [0, T]]` has cokernel `Λ/T²` and zero Bockstein on its two surviving coinvariant groups, so it is not semisimple; this is why the category for leading terms is generated under direct sums rather than extensions (§§2.8, 7.2, 7.4, correction `E11`).
6. **Maximizing Fitting presentations.** Over `Λ = M₂(ℤ₃)` the two-block presentation of the zero module with blocks [[4, 1], [1, 4]] and [[5, 1], [1, 5]] has reduced norms 15 and 24, generating `3ℤ₃`, while the identity presentation gives `ℤ₃`. The maximal invariant of zero is `ℤ₃`, so a single presentation cannot define it; denominator ideals are applied before a reduced-norm formula yields an integral central annihilator (§§7.21, 7.23).
7. **Cyclic overgroups retain multiplicities.** In `C₉ × C₃` the subgroup `P =` ⟨(3, 0)⟩ has three cyclic overgroups `⟨(1, t)⟩, t ∈ C₃`, whose third-power subgroup is `P`. Its Weyl group has order 9 and acts trivially. An unweighted sum of their Frobenius zeta values would reduce to `3ζ_P = 0` modulo 3, contradicting that `ζ_P` is a unit. This is the `p = 3` instance of correction `E33`, not a failure of the full Möbius congruence.
8. **The full stabilizer sum.** For `C₃²` the subgroup Möbius coefficients are 1, four copies of `−1`, and 3. At the `p`-unit `r = 2` the complete sum is `2⁹ − 4·2³ + 3·2 = 486`, divisible by 9. A free stabilizer imposes divisibility modulo 1 only (§6.24).
9. **The inverse global determinant.** In rank one take `c_γ = 5`, logarithmic regulator `ℓ = 7` and complex leading factor `L = 11`. Then `B² = −7/5`, the trivialization on the shifted determinant is `−5/7`, and `ζ = 77`. With the leading sign `−1` this gives 55, and division by `c_γ` gives 11. Replacing `γ` by `γ²` doubles the unnormalized value and `c_γ`, preserving 11. For a Selmer block in degrees 1, 2 with height `b = 7` and global factor `A = 11`, the shifted trivialization is `b`, its order is `+1` and its leading term is `−77` (§§7.13, 7.18).

## Ownership comparisons

The analytic-algebra, compact tensor and homology, arithmetic duality, Selmer and de Rham realization interfaces of §§F.1–F.6 are targets here, on the stated earlier carriers and with their displayed hypotheses. They precede the noncommutative localization and determinant comparisons. PadicMeasuresIwasawaAlgebras supplies the commutative measure and module theory. IntegralIwasawaTheory §2.6 supplies cyclotomic weak Leopoldt, §§6.0–6.3 the Deligne–Ribet values, smoothing and pseudomeasures, and §12.1 the Wiles character-quotient theorem; §§4.4, 6.1 and 5.8 here construct the overfield and equivariant comparisons.

## References

- [Ardakov–Brown] `K`. Ardakov and `K`. `A`. Brown, *Ring-theoretic properties of Iwasawa algebras: a survey*, Documenta Math. Extra Volume Coates (2006), 7–33; arXiv:math`/0511345v1`, cited by the arXiv pagination.
- [Berger (differential equations)] `L`. Berger, *Représentations `p`-adiques et équations différentielles*, Invent. Math. 148 (2002), 219–284, Theorems 5.10, 5.19 and Proposition 5.18, author-preprint pp. 51–58.
- [Schneider–Teitelbaum] `P`. Schneider and `J`. Teitelbaum, *Banach space representations and Iwasawa theory*, Israel `J`. Math. 127 (2002), 359–380, Proposition 3.1 and Lemmas 3.2–3.4.
- [Dasgupta–Kakde–Ventullo] `S`. Dasgupta, `M`. Kakde and `K`. Ventullo, *On the Gross–Stark conjecture*, `Ann`. of Math. 186 (2017), 821–870, §3.1, (25)–(27), pp. 846–847.
- [Brinon–Conrad] `O`. Brinon and `B`. Conrad, *CMI Summer School Notes on `p`-adic Hodge Theory*, §§9.1–9.3.
- [Berger] `L`. Berger, *An introduction to the theory of `p`-adic representations*, in Geometric aspects of Dwork theory, de Gruyter (2004); author PDF at https://perso.ens-lyon.fr/laurent.berger/articles/article05.pdf.
- [Burns–Venjakob] `D`. Burns and `O`. Venjakob, *On the leading terms of zeta isomorphisms and `p`-adic `L`-functions in non-commutative Iwasawa theory*, Documenta Math. Extra Volume Coates (2006), 165–209; arXiv:math`/0511672v2`, cited by the arXiv pagination unless a published page is given.
- [Calegari–Dimitrov–Tang] `F`. Calegari, `V`. Dimitrov and `Y`. Tang, *The unbounded denominators conjecture*, `J`. Amer. Math. Soc. 38 (2025), 627–702.
- [Colmez] `P`. Colmez, *Résidu en `s = 1` des fonctions zêta `p`-adiques*, Invent. Math. 91 (1988), 371–389; author PDF, cited by the printed pages.
- [Deligne–Ribet] `P`. Deligne and `K`. `A`. Ribet, *Values of abelian `L`-functions at negative integers over totally real fields*, Invent. Math. 59 (1980), 227–286; cited by the printed pages.
- [CFKSV] `J`. Coates, `T`. Fukaya, `K`. Kato, `R`. Sujatha and `O`. Venjakob, *The `GL₂` main conjecture for elliptic curves without complex multiplication*, Publ. Math. IHÉS 101 (2005), 163–208; cited by the printed pages.
- [Fu] `W`. Fu, *Sharp bounds for multiplicities of Bianchi modular forms*, `Ann`. of Math. 200 (2024), 123–152; arXiv:2201.11190, cited by the arXiv pagination.
- [Gambheera–Popescu] `R`. Gambheera and `C`. `D`. Popescu, *An unconditional equivariant main conjecture in Iwasawa theory and applications*, `Res`. Math. Sci. 12 (2025), paper 95; arXiv:2303.13603v1, cited by its numbering (the published introduction numbers the main theorem 1.12).
- [Kakde] `M`. Kakde, *The main conjecture of Iwasawa theory for totally real fields*, Invent. Math. 193 (2013), 539–626; arXiv:1008.0142v3, cited by the arXiv numbering and pagination.
- [Lazard] `M`. Lazard, *Groupes analytiques `p`-adiques*, Publ. Math. IHÉS 26 (1965), 5–219; cited by the printed pages.
- [NSW] `J`. Neukirch, `A`. Schmidt and `K`. Wingberg, *Cohomology of Number Fields*, 2nd edition, Grundlehren 323, Springer (2008); electronic edition 2.3 (2020), cited by the printed pages.
- [Neeman–Ranicki] `A`. Neeman and `A`. Ranicki, *Noncommutative localisation in algebraic `K`-theory `I*`, Geometry & Topology 8 (2004), 1385–1425; [arXiv:math/0410620](https://arxiv.org/pdf/math/0410620), cited by the printed pagination.
- [Nickel] `A`. Nickel, *Notes on noncommutative Fitting invariants*, survey, author PDF.
- [Ribes–Zalesskii] `L`. Ribes and `P`. Zalesskii, *Profinite Groups*, 2nd edition, Ergebnisse der Mathematik (3) 40, Springer (2010).
- [Ritter–Weiss 2011] `J`. Ritter and `A`. Weiss, *On the "main conjecture" of equivariant Iwasawa theory*, `J`. Amer. Math. Soc. 24 (2011), 1015–1050; arXiv:1004.2578v2, cited by the preprint pages.
- [Ritter–Weiss, Congruences II] `J`. Ritter and `A`. Weiss, *Congruences between abelian pseudomeasures, II*, arXiv:1001.2091v3 (2010).
- [RW3] J. Ritter and A. Weiss, *Towards equivariant Iwasawa theory, III*, Math. Ann. 336 (2006), 27–49, Proposition 11 and Lemma 12; used through Ritter–Weiss 2011, Lemmas i and k.
- [RW4] J. Ritter and A. Weiss, *Towards equivariant Iwasawa theory, IV*, Homology Homotopy Appl. 7 (2005), 155–171, Proposition 9; used through Ritter–Weiss 2011, §5, p. 19.
- [RW5] J. Ritter and A. Weiss, *Non-abelian pseudomeasures and congruences between abelian Iwasawa L-functions*, Pure Appl. Math. Q. 4 (2008), 1085–1106, Propositions 2.2, 2.4, 3.2 and Theorem, p. 1096; used through Ritter–Weiss 2011, §1 and Lemma k.
- [RW8] J. Ritter and A. Weiss, *Equivariant Iwasawa theory: an example*, Documenta Math. 13 (2008), 117–129, §1, Lemma 1 and Proposition A; used through Ritter–Weiss 2011, Lemmas h and j.
- [Ritter–Weiss 2026] `J`. Ritter and `A`. Weiss, *On uniqueness in equivariant Iwasawa theory*, arXiv:2608.22601v1 (2026).
- [Schneider] `P`. Schneider, *`p`-Adic Lie Groups*, Grundlehren 344, Springer (2011).
- [Schneider–Teitelbaum] `P`. Schneider and `J`. Teitelbaum, *Algebras of `p`-adic distributions and admissible representations*, Invent. Math. 153 (2003), 145–196; [arXiv:math/0206056v1](https://arxiv.org/pdf/math/0206056v1), cited by the preprint pagination.
- [Schneider–Venjakob (splitting)] `P`. Schneider and `O`. Venjakob, *A splitting for `K₁` of completed group rings*, arXiv:1006.1493v1 (2010).
- [Schneider–Venjakob (after Kakde)] `P`. Schneider and `O`. Venjakob, *`K₁` of certain Iwasawa algebras, after Kakde*, author version of 15 June 2011, in Iwasawa theory 2012, Contrib. Math. Comput. Sci. 7, Springer (2014).
- [Wiles] `A`. Wiles, *The Iwasawa conjecture for totally real fields*, `Ann`. of Math. 131 (1990), 493–540; Theorems 1.3–1.4 cited through Kakde, §3, p. 14.
- [Venjakob 2002] `O`. Venjakob, *On the structure theory of the Iwasawa algebra of a `p`-adic Lie group*, `J`. Eur. Math. Soc. 4 (2002), 271–311; arXiv:math`/0106269`, cited by the arXiv pagination.
- [Venjakob (Iwasawa theory)] `O`. Venjakob, *On the Iwasawa theory of `p`-adic Lie extensions*, Compositio Math. 138 (2003), 1–54; [author PDF](https://www.mathi.uni-heidelberg.de/~venjakob/papervenjakob/iwasawa.pdf), cited by its preprint pagination (Remark 4.3, p. 26).
- [Wingberg] `K`. Wingberg, *Duality theorems for `Γ`-extensions of algebraic number fields*, Compositio Math. 55 (1985), 333–381; [Numdam](https://www.numdam.org/item/CM_1985__55_3_333_0.pdf), cited by the printed pagination.
- [Lim] M. F. Lim, *Notes on the fine Selmer groups*, Asian J. Math. 21 (2017), 337–362, Theorem 3.5 and proof, p. 343 (Iwasawa’s finite-`p`-extension μ-preservation theorem).
- [Loeffler–Venjakob–Zerbes] D. Loeffler, O. Venjakob and S. L. Zerbes, *Local epsilon isomorphisms*, Kyoto J. Math. 55 (2015), 63–127; [author preprint](https://www.mathi.uni-heidelberg.de/~otmar/papervenjakob/localmc.pdf), §§2.3–2.4, pp. 3–6.
- [Muro–Tonks–Witte] `F`. Muro, `A`. Tonks and `M`. Witte, *On determinant functors and `K`-theory*, Publ. Mat. 59 (2015); [arXiv:1006.5399](https://arxiv.org/abs/1006.5399), (Definition 1.5.1, pp. 17–18; Theorem 1.5.4, p. 19; Theorem 1.6.3, p. 23; arXiv:1006.5399v2).
- [Witte] `M`. Witte, *On a noncommutative Iwasawa main conjecture for varieties over finite fields*, `J`. Eur. Math. Soc. 16 (2014); [arXiv:1004.2481v2](https://arxiv.org/abs/1004.2481) (Definition 3.1, Propositions 3.2 and 3.7, pp. 6–8).
- [CPT II] `T`. Chinburg, `G`. Pappas and `M`. `J`. Taylor, *`K₁` of a `p`-adic group ring II. The determinantal kernel `SK₁*`, [arXiv:1303.5337v3](https://arxiv.org/abs/1303.5337) (Theorems 1.2, 1.5, 1.6, 2.4, Lemmas 2.1–2.2, Proposition 2.3, Proposition 4.2, Theorems 4.3–4.4, Corollary 5.4, Theorem 5.1). Part `I: *K₁` of a `p`-adic group ring `I`. The determinantal image*, `J`. Algebra 326 (2011), 74–112; [arXiv:0904.2563v1](https://arxiv.org/abs/0904.2563) (Propositions 5.1–5.2, p. 27, Theorem 5.4, p. 28; Theorem 6.2 and Proposition 6.3, used through part II, Theorem 5.1).
- `[Witte, Unit L-functions] M`. Witte, *Unit `L`-functions for étale sheaves of modules over noncommutative rings*, `J`. Théor. Nombres Bordeaux 28 (2016), 89–113; [Numdam](https://www.numdam.org/article/JTNB_2016__28_1_89_0.pdf) (§2, p. 92: restatement of Fukaya–Kato Proposition 1.5.1).
- [Nekovář] `J`. Nekovář, *Selmer complexes*, Astérisque 310 (2006); [Numdam](https://www.numdam.org/item/AST_2006__310__R1_0), printed pagination (11.1.3–11.1.4, 11.2.8–11.2.9, Theorem 11.3.9, Proposition 8.10.1, 12.5.6, Lemma 12.5.7).
- [Platonov–Rapinchuk–Rapinchuk] `V`. Platonov, `A`. Rapinchuk and `I`. Rapinchuk, *Algebraic Groups and Number Theory*, vol. `I, 2`nd edition, Cambridge (2023) (§1.4.3, p. 33, and Theorem 1.23, p. 34).
- [Deligne (constantes)] `P`. Deligne, *Les constantes des équations fonctionnelles des fonctions `L*`, in *Modular Functions of One Variable II*, LNM 349 (1973), 501–597 (§5, (5.2)–(5.4), p. 548).
- [Venjakob (comparison)] `O`. Venjakob, *On the work of Ritter and Weiss in comparison with Kakde's approach*, workshop notes, author PDF.

**Fukaya–Kato, Brumer, Oliver.** The original text of Fukaya–Kato is not freely available and is not used as a locator. Its Propositions 1.3.7, 1.5.1, 1.5.3, 1.6.5 and 3.3.5 are cited through their restatements by Burns–Venjakob (§2.2, pp. 6–7; §6.1, p. 28) and Kakde (§2.2; §2.3, p. 11; §4.1, p. 18; §4.3, p. 25), and the statements this roadmap needs are its own targets. Accessible proofs: `chLocalized_bijective` (§2.9, step 5, via Muro–Tonks–Witte and Neeman–Ranicki); `orePerfectLocalization` (§2.9); `iwasawaComplex_perfect_withPTorsion` (§4.5, step 3, the argument of Fukaya–Kato 1.6.5 as stated by Witte); `localEpsilon_deRham` and `localEpsilon_finiteTrivialization` (§7.15, from Deligne's local constants and Bloch–Kato's local properties as restated by Nekovář). Brumer's theorem is proved in §0.11 (`brumer_gldim`) from Ribes–Zalesskii, Serre's theorem and minimal resolutions. The filtered global-dimension bound is proved in §0.5. The finite-cohomology and height comparisons of §§7.16–7.17 are located in Nekovář's *Selmer complexes*. The finite Whitehead inputs are proved in §3.11 without Oliver's book: Wall's theorem that `SK₁` is a finite `p`-group (`sk1_pGroup`), `sk1_vanish_abelianSylow` and `dressWall_induction` follow from the Witt–Berman identities of ClassicalArithmeticCompletion §7.63, Dress's Mackey-formula argument, and Chinburg–Pappas–Taylor (II, Theorem 1.5, Lemmas 2.1–2.2, Proposition 2.3, §4 and Corollary 5.4; `I`, Propositions 5.1–5.2), with Swan's isomorphism `G₀^{ℤ_p}(ℤ_p[Δ]) ≅ G₀(ℚ_p[Δ])` taken from Curtis–Reiner as restated there. `K′₁` and `SK₁` of Iwasawa algebras are defined through Artin determinants at finite level, so the `J`-adic continuity assertion (Fukaya–Kato Proposition 1.5.1, restated by Kakde and by Witte) is retained as an explicit bijectivity hypothesis in `sk1_eq_limit_of_continuity` and the `K₁`-level clause of §6.5; the `K′₁` main-conjecture proof is independent of it. Chinburg–Pappas–Taylor prove the finite-level `p`-adic case. The DDMS Chapter 4 criterion is cited through Ardakov–Brown §2.3, pp. 3–4. Oliver's book is cited only through the theorem numbers Kakde and Chinburg–Pappas–Taylor quote.

Works cited only through the sources above: `A`. Brumer, *Pseudocompact algebras, profinite groups and class formations*, `J`. Algebra 4 (1966), 442–470; `P`. Deligne, *Le déterminant de la cohomologie*, Contemp. Math. 67 (1987); `T`. Nakayama and `Y`. Matsushima, *Über die multiplikative Gruppe einer `p`-adischen Divisionsalgebra*, Proc. Imp. Acad. Tokyo 19 (1943); `J`. `D`. Dixon, `M`. `P`. `F`. du Sautoy, `A`. Mann and `D`. Segal, *Analytic pro-`p` groups*, 2nd edition (1999); `T`. Fukaya and `K`. Kato, *A formulation of conjectures on `p`-adic zeta functions in noncommutative Iwasawa theory*, Proc. St. Petersburg Math. Soc. XII (2006); `R`. Oliver, *Whitehead groups of finite groups*, LMS Lecture Note Series 132 (1988); `C`. `W`. Curtis and `I`. Reiner, *Methods of Representation Theory* `I`, Wiley (1981), (38.42), (39.10) and Exercise 39.5 (Swan's theorem); `J`.-`P`. Serre, *Linear representations of finite groups*, GTM 42; `J`. Tate, *Les conjectures de Stark sur les fonctions `L d'`Artin en `s = 0*`, Progress in Math. 47 (1984); `A`. Wiles, *The Iwasawa conjecture for totally real fields*, `Ann`. of Math. 131 (1990).


Roadmaps used: ProfiniteProPGroups Layer 9; ProfiniteArithmetic (lower `p`-series and `p`-adic powers); ProfiniteCohomology Layers 5–12; PadicMeasuresIwasawaAlgebras §§1.7, 3.1–3.3, 4.2, 4.6, 5.1–5.2; ClassicalArithmeticCompletion Layer 7 and its local-constant contract; ClassFieldTheory Layers 5, 10–13; DerivedModuleAlgebra §§0.2, 1.1.1, 1.`T`.1, 1.`E`.0; RepresentationTheory`/`InductionRestriction Layers 5–6 and RepresentationTheory`/`SemisimpleAlgebras; §F.0; GeneralAlgebraicKTheory §§4–8, 10.6; IntegralHeckeAndGaloisDeterminants Layer 0; SmoothRepresentationsOfLocalGroups SR.5.2; PadicPeriodRings §§1.5, 4.1–4.3; the finite-Hecke/Artin and Dedekind comparisons in Exact supplier contracts.
