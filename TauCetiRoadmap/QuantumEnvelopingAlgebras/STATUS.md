<!--tauceti-status:v1 {"roadmap":"QuantumEnvelopingAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the comparison with KacMoody realizations and the Coxeter-group statement for the reflections","state":"partial"},{"id":"Layer 1","remaining":"the coproduct r, the quotient f = T/J, the braided antipode, Serre elements in J, then the presentation, Hopf structure and 1.1-1.5","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"action over the roadmap's U_v, simplicity of degree-n parts, the v = 1 comparison, integral monomial lattices and root-of-unity sequences","state":"partial"}],"readme_sha":"72e3cc4a57890f877f3be96d0bf83d3519985654d9538757a217b2ac99fdcb50","roadmap":"QuantumEnvelopingAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: QuantumEnvelopingAlgebras

This file documents the status of the QuantumEnvelopingAlgebras roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done apart from two comparison statements: the Laurent Gaussians, including the signed quantum Lucas theorem and the signed Vandermonde identity, are in place. Layer 1 has begun with Lusztig's bilinear form and its radical on the free algebra, but there is still no algebra `f` and no Drinfeld–Jimbo algebra. Layers 2–7 have not begun, and Layer 8 exists only over the rank-one `U_q(sl₂)` of QuantumGroups.

### Named results

- **The quantum Lucas theorem for signed Laurent Gaussians** — when `ζ²` is a primitive `l`-th root of unity, `[m₁l + m₀ choose r₁l + r₀]_ζ` is a sign times `[m₀ choose r₀]_ζ` times `binom(m₁, r₁)`, for every integer `m₁`. This is the formula Layers 5–8 use for toral eigenvalues ([`laurentEval_signedLaurentQuantumBinomial_mul_add_mul_add`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Laurent/Lucas.html#TauCeti.laurentEval_signedLaurentQuantumBinomial_mul_add_mul_add)).
- **The signed quantum Vandermonde convolution** — `[m + n choose r] = Σ v^(na − mb) [m choose a][n choose b]` in `ℤ[v, v⁻¹]`, for all integers `m, n` ([`signedLaurentQuantumBinomial_add_left_eq`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Laurent/Vandermonde.html#TauCeti.signedLaurentQuantumBinomial_add_left_eq)).
- **The genericity criterion** — all quantum factorials `[n]_q!` are nonzero exactly when `q` is nonzero and not a root of unity, which is the standing hypothesis of Layers 1–2 ([`forall_quantumFactorial_ne_zero_iff`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Factorial.html#TauCeti.forall_quantumFactorial_ne_zero_iff)).
- **Quantum factorials at a root of unity** — if `q²` is a primitive `ℓ`-th root of unity, then `[n]_q! ≠ 0` exactly when `n < ℓ`, which decides which divided powers survive specialization ([`quantumFactorial_ne_zero_iff_lt`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Factorial.html#TauCeti.quantumFactorial_ne_zero_iff_lt)).
- **The kernel of the skew derivatives** — for symmetric `χ`, an element of the free algebra is killed modulo the radical by every left skew derivative exactly when it is congruent to its constant term. This is the basic tool for showing that an element of `f` vanishes ([`forall_freeRemove_mem_halfRadical_iff`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/HalfAlgebra/Pairing.html#TauCeti.forall_freeRemove_mem_halfRadical_iff)).

### Notable definitions and infrastructure

- **Lusztig's bilinear form and its radical** — [`freePairing`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/HalfAlgebra/Pairing.html#TauCeti.freePairing) is the unique form with `B(1, z) = ε(z)` and `B(θᵢy, z) = B(y, Lᵢz)`. Its radical [`halfRadical`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/HalfAlgebra/Pairing.html#TauCeti.halfRadical) is, for symmetric `χ`, a two-sided ideal stable under the skew derivatives, the torus and word reversal. These are exactly the properties needed for `f = T/J` to carry its structure.
- **The skew derivatives** — [`freeRemove`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/HalfAlgebra/SkewDerivative.html#TauCeti.freeRemove) and [`freeRemoveRight`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/HalfAlgebra/SkewDerivative.html#TauCeti.freeRemoveRight), exchanged by word reversal, commuting for symmetric `χ`, and homogeneous for the diagonal scalings. They are the operators in the commutator formula `[Eᵢ, x⁻]` of 1.1.
- **The signed Laurent Gaussian** [`signedLaurentQuantumBinomial`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Laurent/Binomial.html#TauCeti.signedLaurentQuantumBinomial) — `[m choose r]_v` in `ℤ[v, v⁻¹]` for every integer `m`. It specializes at `v = 1` to `Ring.choose`, and it is the object the integral and root-of-unity layers evaluate.

### Roadmap coverage

Layer 0 is partial, though only two comparison statements are missing. The Cartan datum, with its reflections, braid lengths and morphisms; field-valued quantum integers with the factorial criteria; and the whole of §0.3 are proved. Section 0.3 includes symmetry, `v ↦ v⁻¹` invariance, both Pascal rules, the factorial product, the signed Vandermonde identity, the signed quantum Lucas theorem and root-of-unity vanishing. What remains is the comparison with KacMoody realizations, and the statement that the reflections generate a Coxeter group with the given braid lengths; this report does not establish the latter. Layer 1 is partial: §1.0 has the form, its radical and its stability properties, but not the coproduct `r`, the quotient `f`, the braided antipode or the Serre elements, and §§1.1–1.5 are untouched. Layers 2–7 are untouched. Layer 8 stays partial in a weak sense. The quantum plane is a module algebra over the complex rank-one `U_q(sl₂)`, not over this roadmap's `U_v`, and §8.2 is absent.

## The frontier

- **The algebra `f` (§1.0)** — form the quotient `T/J` and descend the grading, pairing and torus action. Build the braided coproduct `r : T → T ⊗_χ T` and show `J` is a coideal. Prove that the divided-power Serre elements lie in `J`. The ideal-theoretic input is now in place.
- **The generic Drinfeld–Jimbo algebra (§§1.1–1.2)** — the `RingQuot` presentation on the full `Y`, with coproduct, counit and antipode. It needs `f`.
- **Layer 0 comparisons** — a `CartanDatum` from a KacMoody realization, and the Coxeter-group statement for the reflections, both consumed from KacMoody Layers 0 and 2.
- **Quantum plane over `U_v`** — once Layer 1 has a rank-one case, transport the existing module-algebra structure to it and prove that the degree-`n` part is simple.
