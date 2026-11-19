<!--tauceti-status:v1 {"roadmap":"QuantumEnvelopingAlgebras","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"signed Laurent quantum Lucas theorem, signed Vandermonde, Laurent Gaussian symmetry, KacMoody realization comparison","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"action over the roadmap's U_v, simplicity of degree-n parts, v = 1 comparison, integral monomial lattices and root-of-unity sequences","state":"partial"}],"readme_sha":"00b2ddce8ce1096100bce32d1b9e27387316a7986209f34a3449c4221841af32","roadmap":"QuantumEnvelopingAlgebras","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: QuantumEnvelopingAlgebras

This file documents the status of the QuantumEnvelopingAlgebras roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the bottom of the roadmap has been built so far. Layer 0 is well advanced: the full-lattice Cartan datum, field-valued quantum integers and factorials, and Laurent Gaussian binomials with signed upper argument are all in place. The signed Laurent form of the quantum Lucas theorem is still missing. The generic Drinfeld–Jimbo algebra of Layer 1, and everything that builds on it, has not begun.

### Named results

- **The genericity criterion**: all quantum factorials `[n]_q!` are nonzero exactly when `q` is nonzero and not a root of unity. This is the standing hypothesis of Layers 1–2 ([`forall_quantumFactorial_ne_zero_iff`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Factorial.html#TauCeti.forall_quantumFactorial_ne_zero_iff)).
- **Quantum factorials at a root of unity**: if `q²` is a primitive `ℓ`-th root of unity, then `[n]_q! ≠ 0` exactly when `n < ℓ`. This governs which divided powers survive specialization ([`quantumFactorial_ne_zero_iff_lt`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Factorial.html#TauCeti.quantumFactorial_ne_zero_iff_lt)).
- **The quantum Lucas theorem, field-valued**: at a root of unity, a quantum binomial `[n₁ℓ + n₀ choose k₁ℓ + k₀]_q` reduces to a sign times `[n₀ choose k₀]_q` times the ordinary binomial `(n₁ choose k₁)`. This is proved for natural-number arguments only, as `TauCeti.quantumBinomial_mul_add_mul_add`.
- **The divided-power `q`-binomial theorem**: if `yx = q²xy` and `[n]_q! ≠ 0`, then `(x + y)^(n)` expands as a sum of products of divided powers with powers of `q` as coefficients ([`inv_quantumFactorial_smul_add_pow`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Factorial.html#TauCeti.inv_quantumFactorial_smul_add_pow)).
- **Quantum Vandermonde convolution**: in the symmetric normalization, for natural-number arguments ([`quantumBinomial_add_left_eq`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Vandermonde.html#TauCeti.quantumBinomial_add_left_eq)).

### Notable definitions and infrastructure

- **The signed Laurent Gaussian** [`signedLaurentQuantumBinomial`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Laurent/Binomial.html#TauCeti.signedLaurentQuantumBinomial): `[m choose r]_v` in `ℤ[v, v⁻¹]` for every integer `m`. It specializes at `v = 1` to `Ring.choose`, and is the object the integral and root-of-unity layers evaluate.
- **The Laurent quantum factorial** [`laurentQuantumFactorial`](https://taucetiproject.org/docs/TauCeti/QuantumGroups/QuantumInteger/Factorial.html#TauCeti.laurentQuantumFactorial): `[n]_v!` over `ℤ[v, v⁻¹]`. It specializes to the field-valued factorial wherever `q − q⁻¹ ≠ 0`, and to `n!` at `v = 1`, which links the integral and field-valued theories.
- **The Cartan datum on full lattices** (`TauCeti.CartanDatum`): it keeps the full coweight lattice `Y`, including central and isogeny directions. It comes with reflections, the symmetrized toral directions `dᵢhᵢ`, braid lengths and morphisms of data, and it is the input Layer 1 needs.

### Roadmap coverage

Layer 0 is partial. Several of its milestones are proved: the datum with its reflections and braid lengths; quantum integers and the factorial nonvanishing criterion (0.2); and the symmetric and signed Laurent Gaussians with their Pascal rules, vanishing and specialization at `1` (0.3). Still open in Layer 0 are the signed Laurent quantum Lucas theorem, the signed Vandermonde identity, the comparison with KacMoody realizations and the Coxeter-group statement. Layer 8 is partial in a weak sense. The quantum plane is a module algebra over the complex rank-one `U_q(sl₂)` of QuantumGroups Q8, not over this roadmap's `U_v`. The degree-`n` simplicity statement, the `v = 1` comparison and the whole integral part (8.2) are absent. Layers 1–7 are untouched: there is no generic Drinfeld–Jimbo algebra, no braid operators, no integral form, no quantum Frobenius map and no root-of-unity module theory.

## The frontier

- **Signed quantum Lucas theorem**: lift the existing field-valued, natural-argument Lucas theorem to the Laurent Gaussians at a root of unity, then extend it to negative upper arguments using the reflection formula and `Ring.choose_neg`. The reflection formula is already proved as `signedLaurentQuantumBinomial_neg_succ`.
- **Remaining Layer 0 identities**: the symmetry of the Laurent Gaussians and their invariance under `v ↦ v⁻¹`; the factorial product identity in `ℤ[v, v⁻¹]`; and the Vandermonde identity for all integer `m, m′`.
- **The generic Drinfeld–Jimbo algebra (Layer 1.1–1.2)**: build the `RingQuot` presentation over a field with generic `q` on the full `Y`, with its coproduct, counit and antipode. The datum and the genericity criterion it needs are now in place.
- **Quantum plane over `U_v`**: once Layer 1 has a rank-one case, transport the existing module-algebra structure to it and prove that the degree-`n` part is simple.
